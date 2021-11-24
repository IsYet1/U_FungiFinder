//
//  U_FungiFinderApp.swift
//  U_FungiFinder
//
//  Created by Don McKenzie on 11/24/21.
//

import SwiftUI
import Firebase

@main
struct U_FungiFinderApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
