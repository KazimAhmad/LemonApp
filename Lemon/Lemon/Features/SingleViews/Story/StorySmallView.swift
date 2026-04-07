//
//  StorySmallView.swift
//  Lemon
//
//  Created by Kazim Ahmad on 30/03/2026.
//

import SwiftUI

struct StorySmallView: View {
    let story: Story
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(story.author.name())
                .font(AppTypography.bold18())
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 8.0)
                        .fill(Color.second)
                        .offset(x: -48)
                        .padding(.trailing, -66)
                )
            VStack(alignment: .leading) {
                Images.quoute
                    .resizable()
                    .frame(width: 18, height: 14)
                Text(story.title)
                    .font(AppTypography.mediumApp())
                Text(story.storyline)
                    .font(AppTypography.regularApp())
                    .lineLimit(3)
                    .foregroundStyle(Color.black)
                HStack {
                    Spacer()
                    Text("Read story...")
                        .font(AppTypography.medium(size: 12))
                        .foregroundStyle(Color.fourth)
                        .padding(8)
                        .background(
                            Capsule()
                                .fill(Color.third)
                        )
                }
            }
            .onTapGesture {
                print("read more")
            }
            LikeAndSaveView(story: story)
            Text(story.date.appString)
                .font(AppTypography.medium14())
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16.0)
                .fill(Color.accent)
        )
        .padding()
    }
}

#Preview {
    StorySmallView(story: Story(id: 0,
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
