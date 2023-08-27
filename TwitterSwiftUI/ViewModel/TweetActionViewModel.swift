//
//  TweetActionViewModel.swift
//  TwitterSwiftUI
//
//  Created by Nikita Popov on 21.07.2021.
//

import SwiftUI
import Firebase

class TweetActionViewModel: ObservableObject {
    
    let tweet: Tweet
    @Published var didLike = false
    
    init(tweet: Tweet) {
        self.tweet = tweet
        checkIfUserLikedTweet()
    }
    
    func likeTweets() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let tweetLikesRef = COLLECTION_TWEETS.document(tweet.id).collection("tweet-likes")
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes")
        
        COLLECTION_TWEETS.document(tweet.id).updateData(["likes" : tweet.likes + 1])
        
        tweetLikesRef.document(uid).setData([:]) { _ in
            userLikesRef.document(self.tweet.id).setData([:]) { _ in
                self.didLike = true
            }
        }
    }
    
    func unlikeTweets() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let tweetLikesRef = COLLECTION_TWEETS.document(tweet.id).collection("tweet-likes")
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes")
        
        COLLECTION_TWEETS.document(tweet.id).updateData(["likes" : tweet.likes - 1])
        
        tweetLikesRef.document(uid).delete { _ in
            userLikesRef.document(self.tweet.id).delete { _ in
                self.didLike = false
            }
        }
        
    }
    
    func checkIfUserLikedTweet() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes").document(tweet.id)
        
        userLikesRef.getDocument { snapshot, _ in
            guard let didLike = snapshot?.exists else { return }
            self.didLike = didLike
        }
    }
    
}
