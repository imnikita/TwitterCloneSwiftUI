//
//  TwitterSwiftUIApp.swift
//  TwitterSwiftUI
//
//  Created by Nikita Popov on 16.07.2021.
//

import SwiftUI
import Firebase

@main
struct TwitterSwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
