//
//  ImagePickerModifier.swift
//  TwitterSwiftUI
//
//  Created by Nikita Popov on 20.07.2021.
//

import SwiftUI

extension Image {
    
    func imagePickerModifier() -> some View {
        self
            .resizable()
            .renderingMode(.template)
            .foregroundColor(.white)
            .scaledToFill()
            .frame(width: 140, height: 140)
            .padding(.top, 88)
            .padding(.bottom, 16)
    }
}

