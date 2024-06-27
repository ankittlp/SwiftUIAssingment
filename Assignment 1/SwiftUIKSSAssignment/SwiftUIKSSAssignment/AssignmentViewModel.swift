//
//  AssignmentViewModel.swift
//  SwiftUIKSSAssignment
//
//  Created by Ankit Nigam on 26/06/24.
//

import Foundation
import Observation


struct Assignment: Codable, Identifiable, Hashable {
    var id: String
    var title: String
    var description: String
    var dueDate: Date
    var isCompleted: Bool
}

@Observable
class AssignmentViewModel {
    
    var assignments: [Assignment] = []
    
}


extension AssignmentViewModel {
    
    func addAssignment(assignment: Assignment) {
        assignments.append(assignment)
    }
    
    func removeAssignment(at index: Int) {
        assignments.remove(at: index)
    }
    
    func updateAssignment(at index: Int, with assignment: Assignment) {
        assignments[index] = assignment
    }
    
    func removeAssignment(assignment: Assignment) {
        if let index = assignments.firstIndex(where: { $0.id == assignment.id }) {
            assignments.remove(at: index)
        }
    }
}


extension AssignmentViewModel {
    
   static func fetchTestAssignments() -> [Assignment] {
        let assignment1 = Assignment(id: UUID().uuidString, title: "Assignment 1", description: "This is the first assignment", dueDate: Date(), isCompleted: false)
        let assignment2 = Assignment(id: UUID().uuidString, title: "Assignment 2", description: "This is the second assignment", dueDate: Date(), isCompleted: false)
        let assignment3 = Assignment(id: UUID().uuidString, title: "Assignment 3", description: "This is the third assignment", dueDate: Date(), isCompleted: false)
        let assignment4 = Assignment(id: UUID().uuidString, title: "Assignment 4", description: "This is the fourth assignment", dueDate: Date(), isCompleted: false)
        let assignment5 = Assignment(id: UUID().uuidString, title: "Assignment 5", description: "This is the fifth assignment", dueDate: Date(), isCompleted: false)
        
        return [assignment1, assignment2, assignment3, assignment4, assignment5]
    }
    
}


extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
