//
//  SearchBar.swift
//  TwitterSwiftUI
//
//  Created by Nikita Popov on 16.07.2021.
//

import SwiftUI

struct SearchBar: View {
    // MARK: - Properties
    @Binding var text: String
    
    // MARK: - Body
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, 5)
                )
        } // HStack
        .padding(.horizontal, 10)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search..."))
    }
}
