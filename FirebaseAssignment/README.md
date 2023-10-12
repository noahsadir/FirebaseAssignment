# iOS Club - Firebase Assignment

If you are NOT cloning this project, then go to Appendix

## Instructions

### Step 0: View existing implementation

The code we've provided is a local todo list app.

Try adding an item. You'll notice that new items get added to the
"Items you created" section.

In this assignment, you'll use Firebase to put your todo items in the cloud!

### Step 1: Connect view model to TodoFirebase

To separate view logic from backend stuff, we have a separate `TodoFirebase`
class which ContentViewModel should call.

### Step 2: Get items from database

### Step 3: Add items from database

## Appendix

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

Add the following files to your project
- `ContentView` (replace your existing ContentView)
- `ContentViewModel`
- `TodoFirebase`
- `TodoItem`
