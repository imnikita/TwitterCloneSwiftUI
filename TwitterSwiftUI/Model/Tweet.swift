//
//  Tweet.swift
//  TwitterSwiftUI
//
//  Created by Nikita Popov on 21.07.2021.
//

import Firebase

struct Tweet: Identifiable {
    let id: String
    let userName: String
    let profileImageUrl: String
    let fullName: String
    let caption: String
    let likes: Int
    let uid: String
    let timestamp: Timestamp
    
    init(dictionary: [String : Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.userName = dictionary["userName"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.caption = dictionary["caption"] as? String ?? ""
        self.fullName = dictionary["fullName"] as? String ?? ""
        self.likes = dictionary["likes"] as? Int ?? 0
        self.uid = dictionary["uid"] as? String ?? ""
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
    }
}
