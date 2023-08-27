//
//  SearchViewModel.swift
//  TwitterSwiftUI
//
//  Created by Nikita Popov on 20.07.2021.
//

import SwiftUI
import Firebase

enum SearchViewModelConfiguration {
    case search
    case newMessage
}

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    private let config: SearchViewModelConfiguration
    
    init(config: SearchViewModelConfiguration) {
        self.config = config
        fetchUsers(forConfig: config)
    }
    
    func fetchUsers(forConfig config: SearchViewModelConfiguration) {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let users = documents.map({User(dictionary: $0.data())})
            
            switch config {
            case .newMessage: self.users = users.filter({ !$0.isCurrentUser })
            case .search: self.users = users
            }
            
            
            
            print("DEBUG: \(self.users)")
        }
    }
    
    func filteredUsers(_ query: String) -> [User] {
        let lowercased = query.lowercased()
        return users.filter({ $0.fullName.lowercased().contains(lowercased) || $0.userName.lowercased().contains(lowercased) })
    }
    
}
