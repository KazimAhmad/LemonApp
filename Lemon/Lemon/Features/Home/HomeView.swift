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
            AppHeaderView()
            HStack {
                Text("Recent Stories")
                    .font(AppTypography.mediumApp())
                Spacer()
                Button {
                    viewModel.toggleStoryType()
                } label: {
                    ForEach(viewModel.storyViewTypes, id: \.self) { type in
                        type.image
                            .resizable()
                            .frame(width: type.size.width,
                                   height: type.size.height)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top)

            VStack {
                switch viewModel.viewState {
                case .loading:
                    LoadingView()
                        .padding()
                case .info:
                    if viewModel.storyViewTypes.first == .page(true) {
                        ZStack {
                            backgroundSheetsView()
                            storiesPageView()
                        }
                    } else {
                        storiesListView()
                    }
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
    
    private func storiesPageView() -> some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.stories, id: \.id) { story in
                    StoryView(story: story)
                        .containerRelativeFrame(.vertical, count: 1, span: 1, spacing: 0, alignment: .center)
                }
                LoadMoreView()
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
    
    private func storiesListView() -> some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.stories, id: \.id) { story in
                    StorySmallView(story: story)
                }
                LoadMoreView()
            }
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
