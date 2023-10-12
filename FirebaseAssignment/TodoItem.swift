//
//  TodoItem.swift
//  FirebaseAssignment
//
//  Created by Noah Sadir on 10/12/23.
//

import Foundation

// DO NOT EDIT THIS
// Representation of a Todo Item
// - Can be initialized
// - Can be initialized from a dictionary (presumably one from Firebase)
// - Can be converted back into dictionary (for uploading to Firebase)
struct TodoItem: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let creationDate: Date
    
    // Use this when converting Firebase dictionary to TodoItem
    init (id: String, dict: [String: Any]) {
        self.id = id
        self.title = dict["title"] as? String ?? "Error"
        self.description = dict["description"] as? String ?? "Error"
        self.creationDate = dict["creationDate"] as? Date ?? Date()
    }
    
    // Use this when creating new item
    init (title: String, description: String) {
        self.id = ""
        self.title = title
        self.description = description
        self.creationDate = Date()
    }
    
    // Don't worry about this. Used for adding to local list
    init (id: String, title: String, description: String) {
        self.id = id
        self.title = title
        self.description = description
        self.creationDate = Date()
    }
    
    // Use this when converting item to dictionary for uploading to firebase
    func encodeWithoutID() -> [String: Any] {
        var dict: [String: Any] = [String: Any]()
        dict["title"] = self.title
        dict["description"] = self.description
        dict["creationDate"] = self.creationDate
        return dict
    }
}
