//
//  StoryView.swift
//  Lemon
//
//  Created by Kazim Ahmad on 21/03/2026.
//

import SwiftUI

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
                Spacer()
                ShareButton(item: .init(id: story.id,
                                        type: .story,
                                        text: story.title))
                Text(story.title)
                    .font(AppTypography.mediumApp())
                    .lineLimit(6)
                Text(story.storyline)
                    .font(AppTypography.regularApp())
                    .lineLimit(2)
                Text("Read story...")
                    .font(AppTypography.medium(size: 12))
                    .foregroundStyle(Color.accent)
                    .padding(8)
                    .background(
                        Capsule()
                            .fill(Color.black)
                    )
                Spacer()
                HStack {
                    Text(story.date.appString)
                        .font(AppTypography.regular14())
                }
                LikeAndSaveView(story: story)
                    .padding(.bottom, 48)
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
            if let imageURL = user.imageURL() {
                AsyncImage(url: imageURL) { image in
                        image
                        .resizable()
                        .frame(width: Constants.userPicSize,
                               height: Constants.userPicSize)
                } placeholder: {
                    ProgressView()
                        .tint(Color.accent)
                }
                .clipShape(
                    Circle()
                )
            } else {
                DefaultUserPicture()
            }
            HStack {
                Text(user.name())
                    .font(AppTypography.bold18())
                if user.isLemon {
                    Images.checkMark
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.accent)
                }
            }
            Text(user.industry)
                .font(AppTypography.regularApp())
            let passionAndMore = user.passionAndCount()
            ForEach(passionAndMore.0, id: \.id) { passion in
                HStack {
                    Text(passion.name)
                        .font(AppTypography.medium(size: 12))
                        .foregroundStyle(Color.white)
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.second)
                        )
                    if passionAndMore.1 > 0 {
                        Text("+ \(passionAndMore.1)")
                            .font(AppTypography.medium14())
                    }
                }
            }
            
            Button {
                //Follow
            } label: {
                Text("Follow")
                    .font(AppTypography.regularApp())
                    .foregroundStyle(Color.primary)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.clear)
                            .stroke(Color.accent, lineWidth: 2)
                    )
            }
            .padding(.top, 8)
        }
    }
}

#Preview {
    StoryView(story: Story(id: 0,
                           title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                           storyline: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                           date: Date(),
                           likesCount: 900,
                           commentsCount: 1000,
                           isLiked: false,
                           isSaved: false,
                           author: User(id: 0,
                                        email: "email@domain.com",
                                        firstName: "User \(0)",
                                        lastName: "User \(0)",
                                        isLemon: true,
                                        image: "",
                                        industry: "Work \(0)",
                                        bio: "",
                                        passions: [Passion(id: 0,
                                                           name: "Writing"),
                                                   Passion(id: 1,
                                                           name: "Painting"),
                                                   Passion(id: 2,
                                                           name: "Singing")])))
}
