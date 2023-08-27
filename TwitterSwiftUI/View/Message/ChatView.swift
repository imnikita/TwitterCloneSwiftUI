//
//  ChatView.swift
//  TwitterSwiftUI
//
//  Created by Nikita Popov on 19.07.2021.
//

import SwiftUI

struct ChatView: View {
    // MARK: - Properties
    @State var messageText = ""
    let user: User
    @ObservedObject var viewModel: ChatViewModel
    
    init(user: User) {
        self.user = user
        viewModel = ChatViewModel(user: user)
    }
    
    
    // MARK: - Body
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.messages) { message in
                        MessageView(message: message)
                    }
                }
            } // ScrollView
            .padding(.top)
            
            
            MessageInputView(text: $messageText, action: sendMessage)
                .padding()
            
        } // MainVstack
        .navigationTitle(user.userName)
    }
    
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
    
}

//struct ChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatView()
//    }
//}


