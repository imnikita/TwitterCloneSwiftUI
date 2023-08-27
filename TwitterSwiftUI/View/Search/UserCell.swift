//
//  UserCell.swift
//  TwitterSwiftUI
//
//  Created by Nikita Popov on 19.07.2021.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    // MARK: - Properties
    let user: User
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: 10) {
            KFImage(URL(string:user.profileImageUrl))
                .resizable()
                .frame(width: 56, height: 56)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.userName)
                    .font(.system(size: 14, weight: .semibold))
                
                Text(user.fullName)
                    .font(.system(size: 14))
            }
            .foregroundColor(.black)
        }
    }
}

//struct UserCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UserCell()
//    }
//}
