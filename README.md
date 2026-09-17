🔴 API Data Fetcher with Local Cache
Flutter Assignment 8
A Flutter application that fetches data from a public REST API,
displays it using FutureBuilder, and caches the latest successful
result using SharedPreferences.
📌 1. Project Overview
API Data Fetcher is a Flutter project created for Assignment 8.
The main purpose of this project is to understand API integration
and local data caching in a Flutter application.

The application connects to the JSONPlaceholder REST API.

It sends an HTTP GET request to the /posts endpoint.

The response is received in JSON format.

The JSON data is converted into Dart model objects.

The data is displayed on a clean black and red dashboard.

The application uses FutureBuilder to handle asynchronous data.

The latest successful result is stored locally.

SharedPreferences is used for local storage.

If the API is unavailable, cached data can be displayed.

This gives the application a simple offline fallback.

🎯 2. Assignment Objective
The objective of this assignment is to build a Flutter application
that can communicate with a public REST API.
The application should fetch data from the API.

The fetched data should be displayed using FutureBuilder.

The latest successful result should be stored locally.

SharedPreferences should be used for the local cache.

The application should handle loading and error states.

The application should provide a refresh option.

The final interface should be simple, readable, and responsive.

✨ 3. Main Features
🌐 Public REST API integration
⚡ Asynchronous data handling
🔄 Refresh API data
💾 Local caching
📦 SharedPreferences storage
📴 Cached data fallback
⚠️ Error handling
🔃 Pull-to-refresh
🎨 Black and red dashboard
📱 Responsive layout
🧩 Dart model for API data
🔐 Simple and organized data flow
🌐 4. REST API Used
This project uses JSONPlaceholder.
JSONPlaceholder is a free REST API useful for testing and learning.

The API endpoint used in this project is:

https://jsonplaceholder.typicode.com/posts
API Information
API Name: JSONPlaceholder
Endpoint: /posts
Method: GET
Response Type: JSON
Available Posts: 100
Main Fields: userId, id, title, body
🔎 5. Sample API Response
A post returned by the API contains information like:
{
  "userId": 1,
  "id": 1,
  "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body": "quia et suscipit suscipit recusandae consequuntur expedita et cum"
}
The response contains multiple post objects.
The application converts these JSON objects into Dart objects.

🧠 6. Basic Application Flow
┌───────────────┐
│  Open Flutter │
│      App      │
└───────┬───────┘
        ↓
┌───────────────┐
│ fetchPosts()  │
└───────┬───────┘
        ↓
┌───────────────┐
│ HTTP GET      │
│ REST API      │
└───────┬───────┘
        ↓
┌───────────────┐
│ JSON Response │
└───────┬───────┘
        ↓
┌───────────────┐
│ Post Model    │
└───────┬───────┘
        ↓
┌───────────────┐
│ FutureBuilder │
└───────┬───────┘
        ↓
┌───────────────┐
│ Display Posts │
└───────────────┘
⚡ 7. FutureBuilder
FutureBuilder is used to manage the asynchronous API request.
The API request takes some time to complete.

FutureBuilder allows the UI to react to different states.

The main states are:

              FutureBuilder
                   │
        ┌──────────┼──────────┐
        ↓          ↓          ↓
     Waiting     Success     Error
        │          │          │
        ↓          ↓          ↓
     Loading     Display    Check Cache
                  Data          │
                                ↓
                         Cached Data?
                           /                                Yes        No
                          ↓          ↓
                       Display     Error
                        Cache       Screen
⏳ 8. Loading State
While the API request is running, the application shows a loading state.
This prevents the user from seeing an empty screen.

The loading indicator tells the user that data is being fetched.

✅ 9. Success State
When the API responds successfully:
The response is checked.
JSON is decoded.
Post objects are created.
The posts are displayed.
The result is saved to local storage.
The dashboard shows LIVE status.
❌ 10. Error State
If the API request fails, the application does not immediately stop.
It checks SharedPreferences for previously saved data.

If cached data exists, it is displayed.

If there is no cached data, an error screen is shown.

A retry action is available to try the API request again.

💾 11. Local Cache
The application uses SharedPreferences for caching.
The cache stores the latest successful result.

The post objects are converted into JSON strings before storage.

This is necessary because SharedPreferences stores simple values.

The stored strings can later be decoded back into Post objects.

🔄 12. Cache Flow Diagram
                 API REQUEST
                      │
              ┌───────┴───────┐
              │               │
           SUCCESS           FAILED
              │               │
              ↓               ↓
       Save API Result    Check Cache
              │               │
              ↓          ┌────┴────┐
        Display LIVE     │         │
           Data        Found     Not Found
                         │         │
                         ↓         ↓
                    Display     Show Error
                    CACHED        Screen
                     Data
🟢 13. LIVE Data
LIVE means the data currently displayed was received successfully
from the REST API.
The application saves this successful result for future use.

The dashboard uses a LIVE indicator to make the data source clear.

🟠 14. CACHED Data
CACHED means the API request was not successful.
The application then uses the last successful result stored locally.

The cached result allows the user to continue viewing previously
loaded information.

🔁 15. Complete Data Flow
User
 │
 ↓
Flutter UI
 │
 ↓
fetchPosts()
 │
 ↓
HTTP GET
 │
 ↓
JSONPlaceholder
 │
 ↓
JSON Response
 │
 ↓
jsonDecode()
 │
 ↓
Post.fromJson()
 │
 ↓
List<Post>
 │
 ↓
FutureBuilder
 │
 ↓
Display Posts
 │
 ↓
SharedPreferences
 │
 ↓
Local Cache
🧩 16. Post Model
The project uses a Post model to represent API data.
The model contains four main properties:

userId
id
title
body
The fromJson() method converts API JSON into a Post object.
The toJson() method converts a Post object into JSON.

This keeps the API data organized inside the Flutter application.

🛠️ 17. Technologies Used
Flutter
Flutter is used to build the application interface.
Dart
Dart is used as the programming language.
HTTP Package
The HTTP package is used to send GET requests.
SharedPreferences
SharedPreferences is used for local caching.
JSONPlaceholder
JSONPlaceholder provides the public REST API.
FutureBuilder
FutureBuilder handles asynchronous API states.
RefreshIndicator
RefreshIndicator provides pull-to-refresh functionality.
📦 18. Dependencies
The project uses the following important packages:
dependencies:
  flutter:
    sdk: flutter
  http:
  shared_preferences:
The packages are installed using Flutter commands.
flutter pub add http
flutter pub add shared_preferences
🎨 19. UI Design
The application uses a black and red theme.
The design is inspired by a simple developer dashboard.

The main background is dark.

Cards use a slightly lighter dark shade.

Red is used for important actions and indicators.

White is used for primary text.

Grey is used for secondary information.

The design keeps the interface readable and focused.

🎨 20. Color Palette
Background      #0B0B0B
Cards           #151515
Primary Red     #E50914
Secondary Red   #FF3B3B
Main Text       White
Secondary Text  #999999
Borders         #292929
🖥️ 21. Dashboard Sections
The dashboard contains the following sections:
Application title
Dashboard subtitle
LIVE/CACHED status
API Information card
API name
HTTP method
Endpoint
Response type
Available records
Local storage
Posts section
Refresh action
📊 22. API Information Display
The dashboard shows:
API
JSONPlaceholder

METHOD
GET

ENDPOINT
/posts

RESPONSE
JSON

AVAILABLE RECORDS
100 Posts

LOCAL STORAGE
SharedPreferences
The API provides 100 posts.
For a cleaner interface, the application displays the first 10 posts.

The dashboard still shows that 100 posts are available from the API.

🔄 23. Refresh Function
The refresh button starts a new API request.
The user can request the latest data without restarting the app.

The project also supports pull-to-refresh.

Pull-to-refresh is implemented using RefreshIndicator.

🧪 24. Testing
The application was tested for the main assignment requirements.
Test 1 — Launch Application
Expected result:
The dashboard should open successfully.

Status:

✅ Passed

Test 2 — API Request
Expected result:
Posts should be fetched from JSONPlaceholder.

Status:

✅ Passed

Test 3 — JSON Parsing
Expected result:
API data should be converted into Post objects.

Status:

✅ Passed

Test 4 — FutureBuilder
Expected result:
Loading and success states should be handled.

Status:

✅ Passed

Test 5 — Local Cache
Expected result:
Successful API data should be saved locally.

Status:

✅ Passed

Test 6 — Cache Fallback
Expected result:
Cached data should appear if the API request fails.

Status:

✅ Passed

Test 7 — Refresh
Expected result:
A new API request should be made.

Status:

✅ Passed

Test 8 — Error Handling
Expected result:
An error and retry option should appear when no API
and no cached data are available.

Status:

✅ Passed

🛡️ 25. Error Handling Flow
API Request
     │
     ↓
Response Received?
     │
 ┌───┴────┐
Yes       No
 │         │
 ↓         ↓
Success  Load Cache
 │         │
 ↓      ┌──┴───┐
Save    │      │
Cache  Yes     No
 │      │       │
 ↓      ↓       ↓
LIVE  CACHED  ERROR
📂 26. Project Structure
assignment_8/
│
├── android/
├── ios/
├── linux/
├── macos/
├── web/
├── windows/
│
├── lib/
│   └── main.dart
│
├── test/
│
├── .gitignore
├── analysis_options.yaml
├── pubspec.lock
├── pubspec.yaml
└── README.md
📄 27. Main File
The main application code is inside:
lib/main.dart
The file contains:
App configuration
PostsScreen
API request logic
Cache functions
Refresh logic
FutureBuilder
Loading UI
Error UI
API information cards
Post cards
Post model
🚀 28. Getting Started
Prerequisites
Install Flutter before running the project.
Check Flutter installation:

flutter doctor
📥 29. Clone the Repository
git clone https://github.com/Nupurbhoir/FLUTTER-Assignment-8-API-Data-Fetcher-with-Local-Cache.git
Open the project folder:
cd FLUTTER-Assignment-8-API-Data-Fetcher-with-Local-Cache
📦 30. Install Dependencies
Run:
flutter pub get
▶️ 31. Run the Application
For Chrome:
flutter run -d chrome
For Android:
flutter run
💻 32. Development Environment
The project was developed using:
VS Code
Flutter
Dart
Chrome for Flutter Web testing
Git and GitHub
🧠 33. Problems Faced
Problem 1 — Wrong Project Directory
Initially, Flutter package commands were executed from the outer
folder instead of the actual Flutter project root.
Solution
The terminal was moved into the folder containing pubspec.yaml.
Problem 2 — Asynchronous API Data
API data is not available immediately.
Solution
FutureBuilder was used to manage the asynchronous operation.
Problem 3 — Saving Custom Objects
SharedPreferences does not directly store custom Dart objects.
Solution
Post objects were converted into JSON strings before saving.
Problem 4 — API Failure
The API may fail because of a network problem.
Solution
The application loads the last successful result from cache.
📚 34. What I Learned
Through this assignment, I learned how to connect Flutter with a REST API.
I learned how to send HTTP GET requests.

I learned how to work with JSON responses.

I learned how to create Dart model classes.

I learned how FutureBuilder manages asynchronous data.

I learned how SharedPreferences stores local data.

I learned how caching can provide a simple offline fallback.

I learned how to handle loading and error states.

I learned how to implement refresh functionality.

I also improved my understanding of structuring a Flutter UI.

🔑 35. Key Concepts
REST API
   ↓
HTTP GET
   ↓
JSON
   ↓
Dart Model
   ↓
Future
   ↓
FutureBuilder
   ↓
Flutter UI
   ↓
SharedPreferences
   ↓
Local Cache
📈 36. Application Architecture
┌──────────────────────────────────┐
│            Flutter UI            │
│                                  │
│  Header • Status • API • Posts   │
└────────────────┬─────────────────┘
                 │
                 ↓
┌──────────────────────────────────┐
│          FutureBuilder           │
│                                  │
│    Loading • Success • Error     │
└───────────────┬──────────────────┘
                │
       ┌────────┴────────┐
       ↓                 ↓
┌──────────────┐  ┌────────────────┐
│ REST API     │  │ SharedPrefs    │
│ JSONPlaceholder│ │ Local Cache    │
└──────────────┘  └────────────────┘
🔗 37. GitHub Repository
The complete project is available on GitHub.
Repository:

https://github.com/Nupurbhoir/FLUTTER-Assignment-8-API-Data-Fetcher-with-Local-Cache

The repository contains the Flutter project files and README documentation.

👩‍💻 38. Author
Nupur Bhoir
B.Tech Computer Science Engineering

ITM Skills University

🎓 39. Assignment Details
Assignment: 8
Topic: API Data Fetcher with Local Cache

Framework: Flutter

Language: Dart

API: JSONPlaceholder

Storage: SharedPreferences

📌 40. Original Requirement
Fetch data from a public REST API, such as JSONPlaceholder,
display it with FutureBuilder, and cache the last result using
SharedPreferences.
⭐ 41. Final Project Summary
The project demonstrates a complete Flutter API workflow.
FETCH
  ↓
PARSE
  ↓
DISPLAY
  ↓
CACHE
  ↓
REUSE
The application successfully combines:
REST API integration
JSON parsing
FutureBuilder
SharedPreferences
Local caching
Error handling
Refresh functionality
Responsive UI
The project provides a practical introduction to connecting
Flutter applications with external APIs.
It also demonstrates how local caching can improve the user
experience when the network is temporarily unavailable.

🏁 42. Conclusion
API Data Fetcher successfully fulfills the requirements of
Flutter Assignment 8.
The application fetches post data from JSONPlaceholder.

The data is displayed using FutureBuilder.

The latest successful result is stored using SharedPreferences.

When the API fails, cached data can be displayed.

The project helped in understanding API integration,
asynchronous programming, local storage, caching, and
error handling in Flutter.

❤️ 43. Project Workflow
        USER OPENS APP
              │
              ↓
        FETCH API DATA
              │
              ↓
        PARSE JSON DATA
              │
              ↓
       CREATE POST OBJECTS
              │
              ↓
       DISPLAY USING FLUTTER
              │
              ↓
        SAVE LOCAL CACHE
              │
              ↓
       READY FOR NEXT REQUEST
🚀 Final Result
Fetch → Parse → Display → Cache → Reuse
This project represents the complete learning outcome of
Assignment 8.
