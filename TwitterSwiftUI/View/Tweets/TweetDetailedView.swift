//
//  TweetDetailedView.swift
//  TwitterSwiftUI
//
//  Created by Nikita Popov on 21.07.2021.
//

import SwiftUI
import Kingfisher

struct TweetDetailedView: View {
    // MARK: - Properties
    let tweet: Tweet
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                KFImage(URL(string: tweet.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(tweet.fullName)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("@\(tweet.userName)")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
            } //HStack
            
            Text(tweet.caption)
                .font(.system(size: 22))
            
            Text("7:22 PM • 05/01/2020")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            Divider()
            
            HStack(spacing: 12) {
                HStack(spacing: 4){
                    Text("0")
                        .font(.system(size: 14, weight: .semibold))
                    Text("Retweets")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                }
                
                HStack(spacing: 4) {
                    Text("\(tweet.likes)")
                        .font(.system(size: 14, weight: .semibold))
                    Text("Likes")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            } // Retweetes and Likes
            
            Divider()
            
            TweetActionButtonView(tweet: tweet)
            
            Spacer()
            
        } //Main VStack
        .padding()
    }
}

//struct TweetDetailedView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetDetailedView()
//    }
//}
