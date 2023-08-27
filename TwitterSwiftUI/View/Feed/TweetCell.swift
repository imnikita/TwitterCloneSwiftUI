//
//  TweetCell.swift
//  TwitterSwiftUI
//
//  Created by Nikita Popov on 16.07.2021.
//

import SwiftUI
import Kingfisher

struct TweetCell: View {
    // MARK: - Properties
    let tweet: Tweet
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                KFImage(URL(string: tweet.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(tweet.fullName)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.black)
                        
                        Text("@\(tweet.userName) •")
                            .foregroundColor(.gray)
                        Text("2w")
                            .foregroundColor(.gray)
                    }
                    
                    Text(tweet.caption)
                        .foregroundColor(.black)
                    
                }
                
                
            } //Top level HStack
            .padding(.bottom)
            .padding(.trailing)
            
            TweetActionButtonView(tweet: tweet)
            
            Divider()
        } // VStack
        .padding(.leading, -2)
    }
}

//struct TweetCell_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetCell()
//    }
//}
