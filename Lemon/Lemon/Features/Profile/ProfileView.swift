//
//  ProfileView.swift
//  Lemon
//
//  Created by Kazim Ahmad on 28/03/2026.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel: ProfileViewModel
    
    init(viewmodel: ProfileViewModel) {
        _viewModel = StateObject(wrappedValue: viewmodel)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            AppHeaderView()
            ScrollView(showsIndicators: false) {
                switch viewModel.viewState {
                case .loading:
                    LoadingView()
                        .padding(.top, 48)
                case .info:
                    infoView()
                case .empty:
                    LemonAlertView(config: .init(type: .empty))
                case .error(let error):
                    LemonAlertView(config: .init(message: error.localizedDescription))

                }
                userStories()
                LazyVStack {
                    LoadMoreView()                    
                }
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea(edges: .top)
        .task {
            viewModel.getStories()
        }
    }
    
    private func infoView() -> some View {
        VStack(alignment: .leading) {
            userHeaderView()
        }
        .padding(.top)
    }
    
    private func userHeaderView() -> some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                if let imageURL = viewModel.user?.imageURL() {
                    AsyncImage(url: imageURL) { image in
                            image
                            .resizable()
                            .frame(width: Constants.userPicSizeExtraLarge,
                                   height: Constants.userPicSizeExtraLarge)
                    } placeholder: {
                        ProgressView()
                            .tint(Color.accent)
                            .frame(width: Constants.userPicSizeExtraLarge,
                                   height: Constants.userPicSizeExtraLarge)
                    }
                    .clipShape(
                        Circle()
                    )
                } else {
                    DefaultUserPicture(size: Constants.userPicSizeExtraLarge)
                }
                VStack(alignment: .leading) {
                    Text(viewModel.user?.name() ?? "")
                        .font(AppTypography.bold20())
                        .lineLimit(2)
                    Text(viewModel.user?.industry ?? "")
                        .font(AppTypography.regular(size: 18))
                    RoundedRectangle(cornerRadius: 2)
                        .frame(height: 1)
                        .foregroundStyle(Color.gray)
                    HStack {
                        view(for: viewModel.user?.stories.inString,
                             for: "Stories")
                        if viewModel.user?.isLemon ?? false {
                            Images.checkMark
                                .resizable()
                                .frame(width: 18, height: 18)
                                .foregroundStyle(Color.accent)
                        }

                    }
                    HStack {
                        view(for: viewModel.user?.followers.inString,
                             for: "Followers")
                        view(for: viewModel.user?.followers.inString,
                             for: "Following")
                    }
                }
                Spacer()
            }
            bioView()
        }
    }
    
    private func view(for number: String?, for text: String) -> some View {
        HStack {
            Text(number ?? "")
                .font(AppTypography.mediumApp())
            Text(text)
                .font(AppTypography.regularApp())
        }
    }
    
    private func bioView() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                VStack {
                    Circle()
                        .fill(Color.clear)
                        .stroke(Color.second, lineWidth: 2)
                        .frame(width: 8, height: 8)
                    Circle()
                        .fill(Color.clear)
                        .stroke(Color.second, lineWidth: 2)
                        .frame(width: 16, height: 16)
                        .offset(x: -8, y: -4)
                }
                .padding(.horizontal, 24)
                Spacer()
                ForEach(viewModel.user?.passions ?? [], id: \.id) { passion in
                    Text(passion.name)
                        .font(AppTypography.medium(size: 12))
                        .foregroundStyle(Color.white)
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.second)
                        )
                }
            }
            Text(viewModel.user?.bio ?? "")
                .font(AppTypography.regularApp())
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16.0)
                        .fill(Color.init(uiColor: .systemBackground))
                        .stroke(Color.second, lineWidth: 2)
                )
        }
    }
    
    private func userStories() -> some View {
        LazyVGrid(columns: [GridItem(.flexible(minimum: 100,
                                               maximum: 200),
                                     spacing: 8,
                                     alignment: .leading),
                            GridItem(.flexible(minimum: 100,
                                                                   maximum: 200),
                                                         spacing: 8,
                                                         alignment: .leading)]) {
            ForEach(viewModel.stories, id: \.id) { story in
                StoryCardView(story: story) {
                    
                }
            }
        }
    }
}

#Preview {
    ProfileView(viewmodel: ProfileViewModel())
}
