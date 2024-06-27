//
//  AssignmentView.swift
//  SwiftUIKSSAssignment
//
//  Created by Ankit Nigam on 15/06/24.
//

import SwiftUI

struct AssignmentListView: View {
    @Environment(\.loginViewModel) var loginViewModel: LoginViewModel
    @State
    var assingmentViewModel = AssignmentViewModel()
    @AppStorage("assignments") var assignments: [Assignment] = []
    @State var presentAddAssignment = false
    init() {
        assingmentViewModel.assignments = assignments
    }
    var body: some View {
        List {
            ForEach(assignments.indices, id: \.self) { index in
                
                NavigationLink(value: assignments[index]) {
                    
                    Text(assignments[index].title)
                }
            }
        }.onChange(of: assingmentViewModel.assignments, { oldValue, newValue in
            assignments = newValue
        })
        .navigationDestination(for: Assignment.self) { assignment in
            AssignmentDetail(assignment: assignment)
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {

                Button {
                    presentAddAssignment.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                                Button("Logout") {
                                    loginViewModel.isLoggedIn = false
                                }
            }
        })
        .sheet(isPresented: $presentAddAssignment) {
            AddAssignmentView(assignmentViewModel: assingmentViewModel, isPresented: $presentAddAssignment)
        }
    }
}

#Preview {
    
    NavigationStack {
        AssignmentListView()
            .navigationTitle("Assignments")
            .navigationBarTitleDisplayMode(.large)
            .environment(LoginViewModel())
    }
    
}
