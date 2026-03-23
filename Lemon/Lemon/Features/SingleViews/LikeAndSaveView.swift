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
    
    var body: some View {
        HStack {
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
            
            Button {
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
        }
    }
}
