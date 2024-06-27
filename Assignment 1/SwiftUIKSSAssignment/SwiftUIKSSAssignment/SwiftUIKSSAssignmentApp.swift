//
//  SwiftUIKSSAssignmentApp.swift
//  SwiftUIKSSAssignment
//
//  Created by Ankit Nigam on 15/06/24.
//

import SwiftUI

@main
struct SwiftUIKSSAssignmentApp: App {
    @State var loginViewModel = LoginViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.loginViewModel, loginViewModel)
        }
    }
}


