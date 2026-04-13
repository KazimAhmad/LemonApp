//
//  User.swift
//  Lemon
//
//  Created by Kazim Ahmad on 21/03/2026.
//

import SwiftUI

struct User: Codable {
    var id: Int
    var email: String
    var firstName: String
    var lastName: String
    var isLemon: Bool
    var image: String
    var industry: String
    var bio: String
    
    var stories: Int
    var followers: Int
    var following: Int
    
    var passions: [Passion]
    
    func passionAndCount() -> ([Passion], Int) {
        if passions.count > 0 {
            return ([passions[0]], passions.count - 1)
        }
        return ([], 0)
    }
    
    func imageURL() -> URL? {
        if !image.isEmpty {
            return URL(string: image)
        }
        return nil
    }
    
    func name() -> String {
        "\(firstName) \(lastName)"
    }    
}

struct SignUpObject {
    var email: String
    var password: String
    var confirmPassword: String
    var firstName: String
    var lastName: String
    var industry: String
    var bio: String
    var image: UIImage?
    var passions: [Passion]
    
    init(email: String = "",
         password: String = "",
         confirmPassword: String = "",
         firstName: String = "",
         lastName: String = "",
         industry: String = "",
         bio: String = "",
         image: UIImage? = nil,
         passions: [Passion] = []) {
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
        self.firstName = firstName
        self.lastName = lastName
        self.industry = industry
        self.bio = bio
        self.image = image
        self.passions = passions
    }
}

extension SignUpObject: Hashable {
    static func == (lhs: SignUpObject, rhs: SignUpObject) -> Bool {
        return lhs.email == rhs.email
    }
}
