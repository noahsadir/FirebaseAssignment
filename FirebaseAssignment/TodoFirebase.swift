//
//  TodoFirebase.swift
//  FirebaseAssignment
//
//  Created by Noah Sadir on 10/12/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

let collection: String = "todoItems" // this is collection in the DB which contains todo items!

class TodoFirebase {
    
    // Fetch todo list items from Firebase
    // TODO:
    // - Create an empty TodoItem array
    // - Get the collection reference which points to the
    //   collection name specified at the top of this file
    // - Perform a query to get the documents in the collection
    //   HINT 1: How do we handle errors?
    //   HINT 2: Do we need to wait for the documents? If so, what keyword do we use?
    // - For each document in the query, create a TodoItem and append to the list
    //   HINT 1: How do we convert a dictionary into a TodoItem (check TodoItem file)
    //   HINT 2: Where do we find the ID of a document?
    // - Return the TodoItem list
    static func getItems() async -> [TodoItem]? {
        print("** Not implemented yet ** TodoFirebase.getItems")
        // YOUR CODE HERE
        return []
    }
    
    // Add an item to firebase
    // TODO:
    // - Get the collection reference which points to the
    //   collection name specified at the top of this file
    // - Given a collection, add a document (with a unique ID)
    //   which conforms to the schema outlined in the readme.
    //   HINT: Look at the TodoItem file
    static func addItem(item: TodoItem) {
        print("** Not implemented yet ** TodoFirebase.addItem")
        // YOUR CODE HERE
    }
}
