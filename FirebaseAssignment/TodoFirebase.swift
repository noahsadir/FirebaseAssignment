//
//  TodoFirebase.swift
//  FirebaseAssignment
//
//  Created by Noah Sadir on 10/12/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

// This is collection in the DB which contains todo items!
// Once you get to implementing addItem, make sure to change this
// to your designated collection if using our Firebase instance.
let collection: String = "todoItemsA"

class TodoFirebase {
    
    // STEP 2: Fetch todo list items from Firebase
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
        var arr: [TodoItem] = []
        let db = Firestore.firestore()
        
        let table = db.collection(collection)
        do {
            let snapshot  = try await table.getDocuments()
            for doc in snapshot.documents {
                arr.append(TodoItem(id: doc.documentID, dict: doc.data()))
            }
        } catch {
            return nil
        }
        
        return arr
    }
    
    // STEP 3: Add an item to firebase
    // TODO:
    // - Get the collection reference which points to the
    //   collection name specified at the top of this file
    // - Given a collection, add a document (with a unique ID)
    //   which conforms to the schema outlined in the readme.
    //   HINT: Look at the TodoItem file
    static func addItem(item: TodoItem) {
        print("** Not implemented yet ** TodoFirebase.addItem")
        // YOUR CODE HERE
        let db = Firestore.firestore()
        let table = db.collection(collection)
        table.addDocument(data: item.encodeWithoutID())
    }
}
