//
//  FeedView.swift
//  TwitterSwiftUI
//
//  Created by Nikita Popov on 16.07.2021.
//

import SwiftUI

struct FeedView: View {
    // MARK: - Properties
    @State var isShowingNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    ForEach(viewModel.tweets) { tweet in
                        NavigationLink(
                            destination: TweetDetailedView(tweet: tweet),
                            label: {
                                TweetCell(tweet: tweet)
                            })
                    }
                } // VStack
                .padding()
            } // ScrollView
            
            Button(action: {
                self.isShowingNewTweetView.toggle()
            }, label: {
                Image("tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $isShowingNewTweetView) {
                NewTweetsView(isPresented: $isShowingNewTweetView)
            }

        } // ZStack
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
