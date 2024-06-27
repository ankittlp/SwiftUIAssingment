//
//  AssignmentDetail.swift
//  SwiftUIKSSAssignment
//
//  Created by Ankit Nigam on 26/06/24.
//

import SwiftUI

struct AssignmentDetail: View {
    
    let assignment: Assignment
    var body: some View {
        VStack(content: {
            Text(assignment.title)
            Text(assignment.description)
                .multilineTextAlignment(.leading)
                .lineLimit(5)
        })
        
    }
}

#Preview {
    AssignmentDetail(assignment: Assignment(id: UUID().uuidString, title: "Assignment 1", description: "This is the first assignment", dueDate: Date(), isCompleted: false))
}
