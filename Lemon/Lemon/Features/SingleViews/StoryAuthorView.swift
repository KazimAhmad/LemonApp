//
//  StoryAuthorView.swift
//  Lemon
//
//  Created by Kazim Ahmad on 30/03/2026.
//

import SwiftUI

struct StoryAuthorView: View {
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
                        .frame(width: 18, height: 18)
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
    StoryAuthorView(user: User(id: 0,
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
                                                  name: "Singing")]))
}
