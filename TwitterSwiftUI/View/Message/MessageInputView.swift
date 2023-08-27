//
//  MessageInputView.swift
//  TwitterSwiftUI
//
//  Created by Nikita Popov on 19.07.2021.
//

import SwiftUI

struct MessageInputView: View {
    // MARK: - Properties
    @Binding var text: String
    
    var action: () -> Void
    
    var body: some View {
        HStack {
            TextField("Message", text: $text)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
            
            Button(action: action, label: {
                Text("Send")
            })
        }
    }
}

//struct MessageInputView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageInputView(text: .constant("Message..."))
//    }
//}
