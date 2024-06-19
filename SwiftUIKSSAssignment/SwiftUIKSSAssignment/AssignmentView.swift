//
//  AssignmentView.swift
//  SwiftUIKSSAssignment
//
//  Created by Ankit Nigam on 15/06/24.
//

import SwiftUI

struct AssignmentView: View {
    @Environment(LoginViewModel.self) var loginViewModel: LoginViewModel
    var body: some View {
        List(0..<10) { number in
            NavigationLink(value: number) {
                
                Text("Assignment \(number)")
            }.navigationDestination(for: Int.self) { index in
                Text("Item \(index)")
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Logout") {
                    loginViewModel.isLoggedIn = false
                }
            }
        })
    }
}

#Preview {
    AssignmentView().environment(LoginViewModel())
}
