//
//  ContentView.swift
//  FirebaseAssignment
//
//  Created by Noah Sadir on 10/12/23.
//

import SwiftUI

// ** DO NOT EDIT THIS FILE **
// Code for to-do list UI
// Note that it doesn't directly interact with Firebase
// but rather it performs a call through the view model.
struct ContentView: View {
    
    // This is a custom object, so use @StateObject to update UI when children values change
    @StateObject var contentViewModel: ContentViewModel = ContentViewModel()
    
    // UI state control
    @State var isLoading: Bool = false
    @State var showAddItemDialog: Bool = false
    
    // New item values, declared as @State since they are modified by UI
    @State var newTodoItemTitle: String = ""
    @State var newTodoItemDescription: String = ""
    
    // Prevent ID conflicts with local items. Firebase items have unique IDs so no need to worry there.
    @State var localIDCounter: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Refresh", action: {
                    isLoading = true
                    print("Loading items...")
                    contentViewModel.loadItems(whenCompleted: { success in
                        isLoading = false
                        print("Successfully loaded items? \(success)")
                    })
                })
                
                Spacer()
                
                // Add an item to todo list
                Button("Add", action: {
                    showAddItemDialog = true
                })
                .alert("Add Item", isPresented: $showAddItemDialog) {
                    TextField("Title", text: $newTodoItemTitle)
                    TextField("Description", text: $newTodoItemDescription)
                    Button("Create", action: {
                        showAddItemDialog = false
                        localIDCounter += 1
                        
                        // add to local list
                        contentViewModel.localTodoItems.append(TodoItem(id: String(localIDCounter), title: newTodoItemTitle, description: newTodoItemDescription))
                        
                        // upload to firebase
                        // if implemented correctly, item should be shown in Firebase list
                        // upon refresh (in addition to local list)
                        contentViewModel.addItem(title: newTodoItemTitle, description: newTodoItemDescription)
                    })
                }
                Spacer()
            }
            
            List {
                Section(header: Text("Items in Firebase")) {
                    // iterate though items loaded from Firebase and add to list
                    ForEach(contentViewModel.firebaseTodoItems) { item in
                        TodoListItemView(title: item.title, description: item.description)
                    }
                }
                
                Section(header: Text("Items you created")) {
                    ForEach(contentViewModel.localTodoItems) { item in
                        TodoListItemView(title: item.title, description: item.description)
                    }
                }
            }
            .overlay(Group {
                if isLoading {
                    ProgressView()
                }
            })
        }
    }
}

// Minimize duplicated code by creating a dedicated list item view
// If you're familiar with React, this is essentially how you create
// a custom component.
struct TodoListItemView: View {
    let title: String
    let description: String
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(self.title)
                Spacer()
            }
            HStack {
                Text(self.description)
                    .font(Font.system(size: 10))
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
