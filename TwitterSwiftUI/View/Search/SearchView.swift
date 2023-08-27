//
//  SearchView.swift
//  TwitterSwiftUI
//
//  Created by Nikita Popov on 16.07.2021.
//

import SwiftUI

struct SearchView: View {
    // MARK: - Properties
    @State var searchText = ""
    @ObservedObject var viewModel = SearchViewModel(config: .search)
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading) {
                ForEach(searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)) { user in
                    HStack{ Spacer() }
                    NavigationLink(
                        destination: LazyView(UserProfileView(user: user)),
                        label: {
                            UserCell(user: user)
                        })
                }
            }.padding(.leading)
        } //ScrollView
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
