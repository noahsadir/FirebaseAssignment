# iOS Club - Firebase Assignment

If you are NOT cloning this project, then go to Appendix

If you need a refresher on the concepts behind this assignment,
the following resources may be helpful:

- [Swift Docs - Concurrency](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/concurrency/)
- [Swift Docs - Tasks](https://developer.apple.com/documentation/swift/task)
- [Hacking With Swift - DispatchQueue](https://www.hackingwithswift.com/read/9/4/back-to-the-main-thread-dispatchqueuemain)
- [Firebase - Add/Get Firestore data](https://firebase.google.com/docs/firestore/query-data/get-data#swift)

## Instructions

### Step 0: View existing implementation

The code we've provided is a local todo list app.

Try adding an item. You'll notice that new items get added to the
"Items you created" section.

In this assignment, you'll use Firebase to put your todo items in the cloud!

### Step 1: Connect view model to TodoFirebase

To separate local app logic from network calls, we have a separate
`TodoFirebase` class which `ContentViewModel` should call.

Implement the following two methods in ContentViewModel:
- `loadItems`
- `addItem`

### Step 2: Get items from database

Now that the view model is connected to our backend helper, it's time to
actually implement the Firebase calls.

Implement the following method in TodoFirebase:
- `getItems`

Once you think you have a working solution, try running the app.

If your solution works, clicking the "Refresh" button should display
a couple items in the "Items in Firebase" section of the list.

### Step 3: Add items to database

_Important!_ If you're using the existing Firebase instance we provided,
please don't add items to the existing `todoItems` collection. Ask an
officer for a collection name that you can use.

Now that we can fetch items from the database, we need a way to add
new ones.

Implement the following method in TodoFirebase:
- `addItem`

If your solution works, you should still be able to add items to the
local list. But now if you click "Refresh", you'll notice that it
also shows up in your Firebase list!

### Next Steps

That's all! You've successfully made a cloud-based todo list app!

## Appendix: Creating project from scratch

Follow these steps if you want to do this assignment from scratch.

### Set up project in Firebase and download boilerplate

- Go to the Firebase Console: https://console.firebase.google.com
- Click on "Add Project"
- Give it a name (e.g. iOSClubAssignment)
- Click through all the default options

**Checkpoint 1**

By now, you should have created your project in Firebase.
Time to link your Xcode project with the app!

- In the dashboard for your newly created project, you should be greeted by
  a screen which says "Get started by adding Firebase to your app"
- Click on the "iOS" button. You should now be at the registration form
- Add the bundle ID and give it a nickname.

_Not sure what your bundle ID is?_

It's typically in the format `com.yourname.projectname`

To find it, go to the configuration file in your Xcode project and locate
the "Bundle identifier" field.

Once you register your app on firebase, continue following the steps to
link your Xcode project.

_Important!_ When adding the Firebase SDK, make sure to add the following:

- `FirebaseAnalytics`
- `FirebaseFirestore`

**Checkpoint 2**

By now, your Xcode project should be linked with your Firebase account.
Let's work on setting up the Firestore database.

- In the Firebase dashboard, navigate to "Cloud Firestore" and select
  "Create database"
- Create the database in "test mode" with the default location
- Add a new collection called `todoItems`
  - These will each contain documents with the following fields
  - `title` (string)
  - `description` (string)
  - `creationDate` (timestamp)
- Add a couple documents to `todoItems` with the schema above

**Checkpoint 3**

Now you've created a Firestore database with a collection named "todoItems"
All we need to do now is add the assignment boilerplate to your Xcode project

Add the following files from the repo into your project:

- `ContentView` (replace your existing ContentView)
- `ContentViewModel`
- `TodoFirebase`
- `TodoItem`
