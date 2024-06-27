//
//  AddAssignmentView.swift
//  SwiftUIKSSAssignment
//
//  Created by Ankit Nigam on 26/06/24.
//

import SwiftUI

struct AddAssignmentView: View {
    @Bindable var assignmentViewModel: AssignmentViewModel
    @State private var title: String = ""
    @State private var description: String = ""
    @Binding var isPresented: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Enter Assignment Details:")
            TextField("Title", text: $title)
                .textFieldStyle(.roundedBorder)
            TextEditor(text: $description)
                .border(.foreground)
                .cornerRadius(3.0)
                .frame(height:300, alignment: .leading)
                .foregroundColor(Color(UIColor(white: 0.8, alpha: 0.8)))
                .padding([.bottom])
            HStack {
                Spacer()
                Button("Add Assignment") {
                    assignmentViewModel.addAssignment(assignment: Assignment(id: UUID().uuidString, title: title, description: description, dueDate: Date(), isCompleted: false))
                    isPresented = false
                }
                .buttonStyle(.borderedProminent)
                .tint(.black)
                Spacer()
            }
        }.padding()
    }
}

#Preview {
    AddAssignmentView(assignmentViewModel: AssignmentViewModel(), isPresented: .constant(false))
}
