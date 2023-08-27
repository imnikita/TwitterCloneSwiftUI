//
//  User.swift
//  TwitterSwiftUI
//
//  Created by Nikita Popov on 20.07.2021.
//

import SwiftUI
import Firebase


struct User: Identifiable {
    let id: String
    let userName: String
    let profileImageUrl: String
    let fullName: String
    let email: String
    let isCurrentUser: Bool
    var stats: UserStats
    var isFollowed = false
    
    
    init(dictionary: [String : Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.userName = dictionary["userName"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.fullName = dictionary["fullName"] as? String ?? ""
        self.isCurrentUser = Auth.auth().currentUser?.uid == self.id
        self.stats = UserStats(followers: 0, following: 0)
    }
    
}

struct UserStats {
    let followers: Int
    let following: Int
}
