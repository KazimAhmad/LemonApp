//
//  ProfileViewModel.swift
//  Lemon
//
//  Created by Kazim Ahmad on 28/03/2026.
//

import Combine
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User?
    @Published var viewState: ViewState = .loading
    
    init() {
        getUser()
    }
    
    private func getUser() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            self.viewState = .info
            self.user = User(id: 0,
                             email: "email@domain.com",
                             firstName: "Kazim",
                             lastName: "Ahmad",
                             isLemon: true,
                             image: "https://picsum.photos/seed/picsum/200/300",
                             industry: "Work Industry",
                             bio: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                             stories: 200,
                             followers: 200,
                             following: 200,
                             passions: [Passion(id: 0,
                                                name: "Writing"),
                                        Passion(id: 1,
                                                name: "Painting"),
                                        Passion(id: 2,
                                                name: "Singing")])
        })
    }
}
