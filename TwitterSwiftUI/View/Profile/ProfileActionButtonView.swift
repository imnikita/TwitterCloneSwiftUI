//
//  ProfileActionButtonView.swift
//  TwitterSwiftUI
//
//  Created by Nikita Popov on 19.07.2021.
//

import SwiftUI

struct ProfileActionButtonView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: ProfileViewModel
    
    // MARK: - Body
    var body: some View {
        VStack {
            if viewModel.user.isCurrentUser {
                Button(action: {
                    
                }, label: {
                    Text("Edit Profile")
                        .frame(width: 360, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                })
            } else {
                
                HStack {
                    Button(action: {
                        viewModel.user.isFollowed ? viewModel.unfollowUser() : viewModel.followUser()
                    }, label: {
                        Text(viewModel.user.isFollowed ? "Following" : "Follow")
                            .frame(width: 180, height: 40)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    })
                    
                    NavigationLink(
                        destination: ChatView(user: viewModel.user),
                        label: {
                            Text("Message")
                                .frame(width: 180, height: 40)
                                .background(Color.purple)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                        })
                    
                    Button(action: {
                        
                    }, label: {

                    })
                }

            }
        }
    }
}

//struct ProfileActionButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileActionButtonView(isCurrentUser: false)
//    }
//}
