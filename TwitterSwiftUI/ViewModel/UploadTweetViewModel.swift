//
//  UploadTweetViewModel.swift
//  TwitterSwiftUI
//
//  Created by Nikita Popov on 21.07.2021.
//

import SwiftUI
import Firebase

class UploadTweetViewModel: ObservableObject {
    @Binding var isPresented: Bool
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    func uploadTweet(caption: String) {
        guard let user = AuthViewModel.shared.user else { return }
        let documentRef = COLLECTION_TWEETS.document()
        
        let data: [String : Any] = ["uid" : user.id,
                                    "caption" : caption,
                                    "fullName" : user.fullName,
                                    "timestamp" : Timestamp(date: Date()),
                                    "userName" : user.userName,
                                    "profileImageUrl" : user.profileImageUrl,
                                    "likes" : 0,
                                    "id" : documentRef.documentID]
        
        documentRef.setData(data) { _ in
            print("DEBUG: tweet is uploaded")
            self.isPresented = false
        }
        
    }
    
}
