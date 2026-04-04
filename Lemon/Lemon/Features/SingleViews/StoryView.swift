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
                StoryAuthorView(user: story.author)
            }
            VStack(alignment: .trailing,
                   spacing: 8) {
                Spacer()
                ShareButton(item: .init(id: story.id,
                                        type: .story,
                                        text: story.title))
                HStack {
                    Images.quoute
                        .resizable()
                        .frame(width: 32, height: 24)
                    Spacer()
                }
                Text(story.title)
                    .font(AppTypography.mediumApp())
                    .lineLimit(6)
                Text(story.storyline)
                    .font(AppTypography.regularApp())
                    .lineLimit(2)
                    .foregroundStyle(Color.black)
                Text("Read story...")
                    .font(AppTypography.medium(size: 12))
                    .foregroundStyle(Color.fourth)
                    .padding(8)
                    .background(
                        Capsule()
                            .fill(Color.third)
                    )
                Spacer()
                HStack {
                    Text(story.date.appString)
                        .font(AppTypography.medium14())
                        .foregroundStyle(Color.black)
                }
                LikeAndSaveView(story: story)
                    .padding(.bottom, 48)
                    .padding(.leading, 16)
            }
            .multilineTextAlignment(.trailing)
        }
        .padding()
    }
}

#Preview {
    StoryView(story: Story(id: 0,
                           title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                           storyline: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                           date: Date(),
                           likes: 900,
                           comments: 1000,
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
                                        stories: 20,
                                        followers: 200,
                                        following: 200,
                                        passions: [Passion(id: 0,
                                                           name: "Writing"),
                                                   Passion(id: 1,
                                                           name: "Painting"),
                                                   Passion(id: 2,
                                                           name: "Singing")])))
}
