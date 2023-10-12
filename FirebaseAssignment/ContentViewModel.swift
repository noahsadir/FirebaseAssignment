//
//  ContentViewModel.swift
//  FirebaseAssignment
//
//  Created by Noah Sadir on 10/12/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var firebaseTodoItems: [TodoItem] = [] // @Published makes it globally accessible to other classes
    @Published var localTodoItems: [TodoItem] = [] // @Published makes it globally accessible to other classes
    
    // Make a call to Firebase to load items
    // TODO: Perform a call to TodoFirebase.getItems()
    // Things to consider:
    // - Is the function below sync or async? Is TodoFirebase.getItems() sync or async?
    // - How do we perform an async call within a synchronous function?
    // - Look at what TodoFirebase.getItems() returns. Can it be nil? How do we handle that?
    // - Do we need to wait for TodoFirebase.getItems()? What keyword do we use?
    // - Once we have items, what variable do we need to update?
    //   - When we update this variable, do we need to switch back to the main thread?
    // - How do we notify the UI that the async call is complete?
    func loadItems(whenCompleted: @escaping (_ success: Bool) -> Void) {
        print("** Not implemented yet ** ContentViewModel.loadItems")
        // YOUR CODE HERE
    }
    
    // Make a call to Firebase to add items
    // TODO: Perform a call to TodoFirebase.addItem(...)
    // HINT: You can probably do this in one line :)
    func addItem(title: String, description: String) {
        print("** Not implemented yet ** ContentViewModel.addItem")
        // YOUR CODE HERE
    }
    
}
