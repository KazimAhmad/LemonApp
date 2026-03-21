//
//  StoryRepo.swift
//  Lemon
//
//  Created by Kazim Ahmad on 21/03/2026.
//

import Foundation

class StoryRepo {
    func getStories() -> [Story] {
        var stories: [Story] = []
        for index in 0..<10 {
            let story = Story(id: index,
                              title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                              storyline: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                              date: Date(),
                              author: User(id: index,
                                                                                                            email: "email@domain.com",
                                                                                                            name: "User \(index)",
                                                                                                            isLemon: true,
                                                                                                            image: "",
                                                                                                            industry: "Work \(index)",
                                                                                                            bio: "",
                                                                                                            passions: [Passion(id: 0,
                                                                                                                               name: "Writing"),
                                                                                                                       Passion(id: 1,
                                                                                                                               name: "Painting"),
                                                                                                                       Passion(id: 2,
                                                                                                                               name: "Singing")]))
            stories.append(story)
        }
        return stories
    }
}
