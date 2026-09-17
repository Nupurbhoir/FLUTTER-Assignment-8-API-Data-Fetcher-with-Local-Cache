🔴 API Data Fetcher with Local Cache
Flutter Assignment 8
A Flutter application that fetches data from a public REST API, displays it using FutureBuilder, and caches the latest successful result using SharedPreferences.
📌 1. Project Overview
API Data Fetcher is a Flutter project created for Assignment 8.
The main purpose of this project is to understand API integration in Flutter.
The application connects to the JSONPlaceholder REST API.
It sends an HTTP GET request to the posts endpoint.
The API response is received in JSON format.
The JSON response is converted into Dart model objects.
The application displays the fetched posts in a dashboard.
FutureBuilder is used to manage the asynchronous API request.
SharedPreferences is used to store the latest successful result.
If the API request fails, the application checks the local cache.
This provides a simple offline fallback for previously fetched data.
🎯 2. Assignment Objective
The objective is to build a Flutter application that communicates with a public REST API.
The application should fetch data from the API.
The fetched data should be displayed using FutureBuilder.
The latest successful result should be stored locally.
SharedPreferences should be used for local caching.
The application should handle loading and error states.
A refresh option should also be available.
✨ 3. Features
🌐 Public REST API integration
⚡ Asynchronous API handling
🔄 Refresh API data
💾 Local caching
📦 SharedPreferences storage
📴 Cached data fallback
⚠️ Error handling
🔃 Pull-to-refresh
🎨 Black and red dashboard UI
📱 Responsive Flutter layout
🧩 Dart model for API data
🌐 4. REST API Used
API: JSONPlaceholder
Method: GET
Endpoint: /posts
Response: JSON
Available Records: 100 Posts
Fields: userId, id, title, body
https://jsonplaceholder.typicode.com/posts
🔎 5. Sample API Response
{
  "userId": 1,
  "id": 1,
  "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body": "quia et suscipit suscipit recusandae consequuntur expedita et cum"
}
The API returns multiple post objects.
Each object contains userId, id, title, and body.
The application converts these JSON objects into Dart Post objects.
🧠 6. Basic Application Flow

Open Flutter App
       ↓
fetchPosts()
       ↓
HTTP GET
       ↓
REST API
       ↓
JSON Response
       ↓
Post Model
       ↓
FutureBuilder
       ↓
Display Posts

⚡ 7. FutureBuilder
FutureBuilder is used to manage the asynchronous API request.
The API request takes some time to complete.
FutureBuilder allows the interface to react to the current request state.
The main states are waiting, success, and error.

                 FutureBuilder
                      │
          ┌───────────┼───────────┐
          ↓           ↓           ↓
       Waiting      Success      Error
          │           │           │
          ↓           ↓           ↓
       Loading     Display     Check Cache
                    Data           │
                                   ↓
                            Cached Data?
                              /                                   Yes        No
                             ↓          ↓
                         Show Cache   Show Error

⏳ 8. Loading State
While the API request is running, a loading indicator is displayed.
This tells the user that the application is fetching data.
It also prevents the screen from appearing empty during the request.
✅ 9. Success State
When the API returns successfully, the response is processed.
The JSON data is decoded.
Post objects are created.
The posts are displayed on the dashboard.
The successful result is saved locally.
The application can show LIVE status for the current API result.
❌ 10. Error State
If the API request fails, the application checks SharedPreferences.
If cached posts are available, they are displayed.
If there is no cached data, an error screen is shown.
A retry option allows the user to attempt the API request again.
💾 11. Local Cache
SharedPreferences is used as the local cache.
The latest successful result is stored locally.
Post objects are converted into JSON strings before storage.
The stored strings can be decoded later.
This provides a simple cache for the assignment.
🔄 12. Cache Flow Diagram

API REQUEST
     │
     ├── SUCCESS
     │      ↓
     │   Save Result
     │      ↓
     │   LIVE Data
     │
     └── FAILED
            ↓
        Check Cache
            │
       ┌────┴────┐
       ↓         ↓
     Found     Missing
       ↓         ↓
   CACHED     ERROR

🟢 13. LIVE Data
LIVE means the current result was received successfully from the API.
The successful result is also saved for future fallback use.
🟠 14. CACHED Data
CACHED means the API request was unsuccessful.
The application displays the latest successful result saved locally.
This makes the application more useful during temporary network problems.
🔁 15. Complete Data Flow

User
 ↓
Flutter UI
 ↓
fetchPosts()
 ↓
HTTP GET
 ↓
JSONPlaceholder
 ↓
JSON Response
 ↓
jsonDecode()
 ↓
Post.fromJson()
 ↓
List&lt;Post&gt;
 ↓
FutureBuilder
 ↓
Display Posts
 ↓
SharedPreferences
 ↓
Local Cache

🧩 16. Post Model
The Post model represents the data returned by the REST API.
It contains four main properties.
userId
id
title
body
fromJson() converts JSON data into a Post object.
toJson() converts a Post object into JSON.
🛠️ 17. Technologies Used
Flutter: Application framework.
Dart: Programming language.
http: REST API communication.
shared_preferences: Local storage.
JSONPlaceholder: Public REST API.
FutureBuilder: Asynchronous UI handling.
RefreshIndicator: Pull-to-refresh.
VS Code: Development environment.
📦 18. Dependencies

dependencies:
  flutter:
    sdk: flutter
  http:
  shared_preferences:

Packages can be installed with:

flutter pub add http
flutter pub add shared_preferences

🎨 19. UI Design
The application uses a black and red developer-dashboard theme.
The dark background keeps the interface clean.
Red is used for important actions and status indicators.
White is used for primary text.
Grey is used for secondary information.
🎨 20. Color Palette
Background: #0B0B0B
Cards: #151515
Primary Red: #E50914
Secondary Red: #FF3B3B
Main Text: White
Secondary Text: #999999
Borders: #292929
🖥️ 21. Dashboard Sections
Application title
Dashboard subtitle
LIVE/CACHED status
API information
HTTP method
Endpoint
Response type
Available records
Local storage information
Posts section
Refresh action
📊 22. API Information Display

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
The application displays the first 10 posts for a cleaner dashboard.
🔄 23. Refresh Function
The refresh button starts a new API request.
The user can request the latest data without restarting the application.
Pull-to-refresh is also supported using RefreshIndicator.
🧪 24. Testing
The main assignment requirements were tested during development.
Test 1 — Launch Application
Expected: Dashboard opens successfully.
Status: ✅ Passed
Test 2 — API Request
Expected: Posts are fetched from JSONPlaceholder.
Status: ✅ Passed
Test 3 — JSON Parsing
Expected: API data is converted into Post objects.
Status: ✅ Passed
Test 4 — FutureBuilder
Expected: Loading and success states are handled.
Status: ✅ Passed
Test 5 — Local Cache
Expected: Successful API data is stored locally.
Status: ✅ Passed
Test 6 — Cache Fallback
Expected: Cached data appears when the API request fails.
Status: ✅ Passed
Test 7 — Refresh
Expected: A new API request is made.
Status: ✅ Passed
Test 8 — Error Handling
Expected: Error and retry appear when no data is available.
Status: ✅ Passed
🛡️ 25. Error Handling Flow

API Request
     ↓
Response?
     │
 ├── Yes → Success → Save Cache → LIVE
 │
 └── No  → Load Cache
              │
              ├── Found → CACHED
              └── Missing → ERROR

📂 26. Project Structure

assignment_8/
├── lib/
│   └── main.dart
├── test/
├── android/
├── ios/
├── web/
├── macos/
├── linux/
├── windows/
├── pubspec.yaml
└── README.md

📄 27. Main File
The main application code is inside lib/main.dart.
It contains the application configuration.
It contains the PostsScreen widget.
It contains API request logic.
It contains cache functions.
It contains refresh logic.
It contains FutureBuilder.
It contains loading and error views.
It contains API information cards.
It contains post cards.
It contains the Post model.
🚀 28. Getting Started
Make sure Flutter is installed before running the project.
flutter doctor
📥 29. Clone Repository
git clone https://github.com/Nupurbhoir/FLUTTER-Assignment-8-API-Data-Fetcher-with-Local-Cache.git
cd FLUTTER-Assignment-8-API-Data-Fetcher-with-Local-Cache
📦 30. Install Dependencies
flutter pub get
▶️ 31. Run Application
For Chrome:
flutter run -d chrome
For Android:
flutter run
💻 32. Development Environment
VS Code
Flutter
Dart
Chrome
Git
GitHub
🧠 33. Problems Faced
Problem 1 — Wrong Project Directory
The Flutter package command was initially executed from the outer folder.
The actual Flutter project root contains pubspec.yaml.
Solution
The terminal was moved into the correct project directory.
Problem 2 — Asynchronous API Data
API data does not arrive immediately.
Solution
FutureBuilder was used to manage the asynchronous operation.
Problem 3 — Saving Custom Objects
SharedPreferences does not directly store custom Dart objects.
Solution
Post objects were converted into JSON strings before storage.
Problem 4 — API Failure
The API can fail because of a temporary network problem.
Solution
The application loads the latest successful result from cache.
📚 34. What I Learned
I learned how Flutter communicates with a REST API.
I learned how to send HTTP GET requests.
I learned how to work with JSON responses.
I learned how to create Dart model classes.
I learned how FutureBuilder handles asynchronous operations.
I learned how SharedPreferences can store local data.
I learned how caching can provide a fallback during API failure.
I learned how to handle loading and error states.
I learned how to implement refresh functionality.
I also improved my understanding of structuring a Flutter dashboard.
🔑 35. Key Concepts

REST API
   ↓
HTTP GET
   ↓
JSON
   ↓
Dart Model
   ↓
FutureBuilder
   ↓
Flutter UI
   ↓
SharedPreferences
   ↓
Local Cache

📈 36. Application Architecture

Flutter UI
    ↓
FutureBuilder
    ↓
 ┌──┴──────────┐
 ↓             ↓
REST API   SharedPreferences
 ↓             ↓
JSON         Cache
 └─────┬───────┘
       ↓
    Display

🔗 37. GitHub Repository
The complete Flutter project is available on GitHub.
Repository:
https://github.com/Nupurbhoir/FLUTTER-Assignment-8-API-Data-Fetcher-with-Local-Cache
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
Fetch data from a public REST API, such as JSONPlaceholder, display it with FutureBuilder, and cache the last result using SharedPreferences.
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

The application combines REST API integration, JSON parsing, FutureBuilder, SharedPreferences, local caching, error handling, refresh functionality, and responsive UI.
🏁 42. Conclusion
API Data Fetcher successfully fulfills the requirements of Flutter Assignment 8.
The application fetches post data from JSONPlaceholder.
The data is displayed using FutureBuilder.
The latest successful result is stored using SharedPreferences.
When the API fails, cached data can be displayed.
This assignment provided practical experience with API integration, asynchronous programming, local storage, caching, and error handling.
❤️ 43. Final Workflow

USER OPENS APP
      ↓
FETCH API DATA
      ↓
PARSE JSON
      ↓
CREATE POST OBJECTS
      ↓
DISPLAY DATA
      ↓
SAVE LOCAL CACHE
      ↓
READY FOR NEXT REQUEST

🚀 Final Result
Fetch → Parse → Display → Cache → Reuse
This project represents the complete learning outcome of Assignment 8.
Made with Flutter ❤️ | Assignment 8 | Nupur Bhoir
