//
//  LikeAndSaveView.swift
//  Lemon
//
//  Created by Kazim Ahmad on 23/03/2026.
//

import SwiftUI

struct LikeAndSaveView: View {
    @State var story: Story
    var didToggleLike: (Bool) -> Void = { _ in }
    var didToggleSave: (Bool) -> Void = { _ in }
    var didPressComments: (() -> Void)? = nil

    @State var animateLike: Bool = false
    @State var disableLike: Bool = false

    var body: some View {
        HStack {
            savedButton()
            commentsButton()
            likeButton()

        }
        .font(AppTypography.medium14())
        .foregroundStyle(Color.black)
    }
    
    private func savedButton() -> some View {
        VStack {
            Button {
                story.isSaved.toggle()
                didToggleSave(story.isSaved)
            } label: {
                story.isSaved ? Images.saved : Images.save
            }
            .padding(8)
            .background(
                Circle()
                    .fill(Color.clear)
                    .stroke(Color.black, lineWidth: 1)
            )
            Text(" ")
        }
    }
    
    private func commentsButton() -> some View {
        VStack {
            Button {
                didPressComments?()
            } label: {
                Images.comment
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 8)
            .background(
                Capsule()
                    .fill(Color.clear)
                    .stroke(Color.black, lineWidth: 1)
            )
            Text(story.comments.inStringWithoutZero)
        }
    }
    
    private func likeButton() -> some View {
        VStack {
            Button {
                withAnimation {
                    animateLike = true
                    disableLike = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                        animateLike = false
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        disableLike = false
                    }
                }
                story.likes += story.isLiked ? -1 : 1
                story.isLiked.toggle()
                didToggleLike(story.isLiked)
            } label: {
                story.isLiked ? Images.liked : Images.like

            }
            .padding(8)
            .background(
                Circle()
                    .fill(Color.clear)
                    .stroke(Color.black, lineWidth: 1)
            )
            .disabled(disableLike)
            .offset(y: animateLike ? 8 : 0)
            Text(story.likes.inStringWithoutZero)
                .font(animateLike ? AppTypography.medium(size: 1) : AppTypography.medium14())
        }
    }
}

#Preview {
    LikeAndSaveView(story: Story(id: 0,
                                 title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                                 storyline: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                                 date: Date(),
                                 likes: 9580,
                                 comments: 1690,
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
                                              stories: 200,
                                              followers: 200,
                                              following: 200,
                                              passions: [Passion(id: 0,
                                                                 name: "Writing"),
                                                         Passion(id: 1,
                                                                 name: "Painting"),
                                                         Passion(id: 2,
                                                                 name: "Singing")])),
                    didToggleLike: { _ in },
                    didToggleSave: { _ in })
}
