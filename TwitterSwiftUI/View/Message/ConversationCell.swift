//
//  ConversationCell.swift
//  TwitterSwiftUI
//
//  Created by Nikita Popov on 19.07.2021.
//

import SwiftUI
import Kingfisher

struct ConversationCell: View {
    // MARK: - Properties
    let message: Message
    
    // MARK: - Body
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                KFImage(URL(string: message.user.profileImageUrl))
                    .resizable()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(message.user.fullName)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text(message.text)
                        .font(.system(size: 14))
                        .lineLimit(2)
                }
                .foregroundColor(.black)
                .frame(height: 64)
                .padding(.trailing)
                
                Spacer()
            }
            .padding(.horizontal)
            Divider()
        } // Main VStack
    }
}

//struct ConversationCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ConversationCell()
//    }
//}
