//
//  NewTweetsView.swift
//  TwitterSwiftUI
//
//  Created by Nikita Popov on 19.07.2021.
//

import SwiftUI
import Kingfisher

struct NewTweetsView: View {
    // MARK: - Properties
    @Binding var isPresented: Bool
    @State var caption = ""
    @ObservedObject var viewModel: UploadTweetViewModel
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
        self.viewModel = UploadTweetViewModel(isPresented: isPresented)
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top) {
                    if let user = AuthViewModel.shared.user {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 64, height: 64)
                            .clipShape(Circle())
                    }
                    
                    TextArea("What is happening?", text: $caption)
                    
                    Spacer()
                } // HStack
                .padding(.horizontal)
                .navigationBarItems(leading: Button(action: {
                    self.isPresented.toggle()
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                }),
                
                trailing: Button(action: {
                    viewModel.uploadTweet(caption: caption)
                }, label: {
                    Text("Tweet")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }))
                Spacer()
            }
        } //NavigationView
    }
}

struct NewTweetsView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetsView(isPresented: .constant(true))
    }
}
