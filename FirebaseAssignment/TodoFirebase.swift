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
        // ** SOLUTION BELOW ***
        
        var todoItemList: [TodoItem] = []
        
        // Point Firebase to the collection within our DB
        let db: Firestore = Firestore.firestore()
        let collection: CollectionReference = db.collection(collection)
        
        // Attempt to perform a query
        var query: QuerySnapshot?
        do {
            query = try await collection.getDocuments();
        } catch {
            return nil
        }
        
        // Query presumed to be success; load items
        for document in query?.documents ?? [] {
            let item: TodoItem = TodoItem(id: document.documentID, dict: document.data())
            todoItemList.append(item)
            print(item)
        }
        
        return todoItemList
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
        // ** SOLUTION BELOW ***
        
        let db: Firestore = Firestore.firestore()
        let collection: CollectionReference = db.collection(collection)
        
        collection.document().setData(item.encodeWithoutID())
    }
}
