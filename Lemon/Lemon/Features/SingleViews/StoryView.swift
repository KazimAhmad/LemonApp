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
                    .font(AppTypography.regular12())
                Spacer()
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
                Text(user.name)
                    .font(AppTypography.bold18())
                if user.isLemon {
                    Images.checkMark
                        .resizable()
                        .frame(width: 10, height: 10)
                        .foregroundStyle(Color.accent)
                        .padding(6)
                        .background(
                            Circle()
                                .fill(.clear)
                                .stroke(Color.accent,
                                        lineWidth: 2)
                        )
                }
            }
            Text(user.industry)
                .font(AppTypography.regularApp())
            let passionAndMore = user.passionAndCount()
            ForEach(passionAndMore.0, id: \.id) { passion in
                HStack {
                    Text(passion.name)
                        .font(AppTypography.medium(size: 12))
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
                    .padding(.vertical, 4)
                    .padding(.horizontal, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.clear)
                            .stroke(Color.accent, lineWidth: 1)
                    )
            }
            .padding(.top, 8)
        }
    }
}
