//
//  CustomSecuredField.swift
//  TwitterSwiftUI
//
//  Created by Nikita Popov on 20.07.2021.
//

import SwiftUI

struct CustomSecuredField: View {
    // MARK: - Properties
    @Binding var text: String
    let placeholder: Text
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.87)))
                    .padding(.leading, 40)
            }
            
            HStack(spacing: 16) {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                SecureField("", text: $text)
            }
        }
    }
}

//struct CustomSecuredField_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomSecuredField()
//    }
//}
