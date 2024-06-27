//
//  ContentView.swift
//  SwiftUIKSSAssignment
//
//  Created by Ankit Nigam on 15/06/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.loginViewModel) var loginViewModel: LoginViewModel
    var body: some View {
        
        if loginViewModel.isLoggedIn {
            NavigationStack {
                AssignmentListView()
                    .navigationTitle("Assignments")
                    .navigationBarTitleDisplayMode(.large)
            }
            
            
        } else {
            LoginView()
        }
    
    }
}

#Preview {
    ContentView().environment(LoginViewModel())
}
