//
//  HomeView.swift
//  Lemon
//
//  Created by Kazim Ahmad on 21/03/2026.
//
import Combine
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView()
            ZStack {
                switch viewModel.viewState {
                case .loading:
                    LoadingView()
                        .padding()
                case .info:
                    backgroundSheetsView()
                    storiesView()
                case .empty:
                    LemonAlertView(config: AlertConfig(type: .empty))
                case .error(let error):
                    LemonAlertView(config: AlertConfig(message: error.localizedDescription))
                }
            }
            Spacer()
        }
        .ignoresSafeArea(edges: .top)
        .task {
            viewModel.getStories()
        }
    }
    
    private func headerView() -> some View {
        VStack {
            Spacer()
                .frame(height: 48)
            HStack(alignment: .bottom) {
                Image(Images.icon)
                    .resizable()
                    .frame(width: 60, height: 60)
                Text("Lemon")
                    .font(AppTypography.bold(size: 32))
                    .foregroundStyle(Color(uiColor: .systemBackground))
                Spacer()
            }
        }
        .padding()
        .background(
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0.0,
                                                      bottomLeading: 60.0,
                                                      bottomTrailing: 0.0,
                                                      topTrailing: 0.0))
            .fill(Color.second)
        )
    }
    
    private func storiesView() -> some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.stories, id: \.id) { story in
                    StoryView(story: story)
                        .containerRelativeFrame(.vertical, count: 1, span: 1, spacing: 0, alignment: .center)
                }
            }
            .scrollTargetLayout()
            .background(GeometryReader {
                Color.clear.preference(key: ViewOffsetKey.self,
                    value: -$0.frame(in: .named("scroll")).origin.y)
            })
            .onPreferenceChange(ViewOffsetKey.self) { viewModel.detector.send($0) }
        }
        .scrollTargetBehavior(.paging)
        .coordinateSpace(name: "scroll")
        .onReceive(viewModel.publisher) { _ in
            viewModel.animateSheets()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1,
                                          execute: {
                viewModel.unAnimateSheets()
            })
        }
    }
    
    private func backgroundSheetsView() -> some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(1...5, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.accent.opacity(Double(index) * 0.2))
                        .rotationEffect(Angle(degrees: Double(index) * -6))
                        .frame(width: geometry.size.width * 1.8,
                               height: geometry.size.height / 1.2)
                        .offset(y: viewModel.sheetsToAnimate[index] ? -16 : 0)
                        .animation(.easeInOut, value: viewModel.sheetsToAnimate[index])
                }
            }
            .offset(x: geometry.size.width / 3)
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}

struct StoryView: View {
    let story: Story
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.clear)
                AuthorView(user: story.author)
            }
            VStack(alignment: .trailing,
                   spacing: 8) {
                Text(story.title)
                    .font(AppTypography.mediumApp())
                    .lineLimit(6)
                Text(story.storyline)
                    .font(AppTypography.regularApp())
                    .lineLimit(2)
                Text("Read story...")
                    .font(AppTypography.regular12())
            }
            .multilineTextAlignment(.trailing)
            .foregroundStyle(Color.black)
        }
        .padding()
    }
}

struct AuthorView: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            DefaultUserPicture()
            Text(user.name)
                .font(AppTypography.bold18())
            Text(user.industry)
                .font(AppTypography.regularApp())
            VStack(alignment: .leading) {
                ForEach(user.passions, id: \.id) { passion in
                    Text(passion.name)
                        .font(AppTypography.medium(size: 12))
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.second)
                        )
                }
            }
        }
    }
}

struct DefaultUserPicture: View {
    let size: CGFloat = Constants.userPicSize
    var body: some View {
        ZStack {
            Images.user
                .resizable()
                .frame(width: size,
                       height: size)
        }
    }
}
