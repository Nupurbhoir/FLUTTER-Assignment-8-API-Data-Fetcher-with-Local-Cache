🔴 API Data Fetcher with Local Cache

Flutter Assignment 8 — Fetch data from a public REST API, display it using FutureBuilder, and cache the last successful result using SharedPreferences.

A simple Flutter API dashboard built to understand how a mobile/web application communicates with an external REST API, handles asynchronous data, and keeps a local copy of the latest successful response.

📌 Project Overview

API Data Fetcher connects to the JSONPlaceholder REST API and retrieves post data using an HTTP GET request.

The application then:

REST API
   ↓
HTTP GET Request
   ↓
JSON Response
   ↓
Dart Model
   ↓
FutureBuilder
   ↓
Display Data
   ↓
SharedPreferences
   ↓
Local Cache

If the API is temporarily unavailable, the application checks the locally stored result and displays the cached data instead.

✨ Features

🌐 Fetch posts from a public REST API

⚡ Handle asynchronous requests with FutureBuilder

🔄 Refresh the latest API data

💾 Cache the last successful result

📦 Store cached data using SharedPreferences

📴 Display cached data when the API request fails

⚠️ Handle loading and error states

🔃 Pull-to-refresh support

🎨 Clean black and red dashboard UI

📱 Responsive Flutter layout

🧩 Convert JSON responses into Dart model objects

🎯 Assignment Requirements

Requirement

Implementation

Public REST API

JSONPlaceholder

API request

HTTP GET

Display API data

Post cards

Asynchronous handling

FutureBuilder

Local caching

SharedPreferences

Cache fallback

Shows last successful result

Error handling

Retry screen

Refresh

Refresh button + pull-to-refresh

🌐 API Used

This project uses JSONPlaceholder, a free fake REST API commonly used for testing and learning.

API Details

Property

Value

API

JSONPlaceholder

Method

GET

Endpoint

/posts

Response

JSON

Available posts

100

Fields

userId, id, title, body

Endpoint

https://jsonplaceholder.typicode.com/posts

The API response contains objects similar to:

{
  "userId": 1,
  "id": 1,
  "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body": "quia et suscipit suscipit recusandae consequuntur expedita et cum"
}

🖥️ Application Interface

The application uses a black and red developer-dashboard style theme.

Main Dashboard

The dashboard contains:

API status

Live/Cached indicator

API information

Endpoint details

Number of available records

Local storage information

Post list

Refresh action

Theme

Element

Color

Background

#0B0B0B

Cards

#151515

Primary Red

#E50914

Secondary Red

#FF3B3B

Main Text

White

Secondary Text

#999999

Borders

#292929

The red color is mainly used for actions, icons, post numbers, and important status elements.

📊 API Dashboard Information

The application displays the following technical information:

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

The API provides 100 posts. To keep the interface clean and easy to read, the application displays the first 10 posts on the dashboard.

⚙️ How the Application Works

Step 1 — Send API Request

The application sends an HTTP GET request:

final response = await http.get(
  Uri.parse('https://jsonplaceholder.typicode.com/posts'),
);

Step 2 — Check Response

The response status code is checked before processing the data.

if (response.statusCode == 200) {
  // Process API response
}

Step 3 — Decode JSON

The JSON response is converted into Dart data:

final List<dynamic> data = jsonDecode(response.body);

Step 4 — Convert to Model Objects

Each API item is converted into a Post object:

final posts = data
    .take(10)
    .map((item) => Post.fromJson(item))
    .toList();

Step 5 — Display Using FutureBuilder

FutureBuilder manages the asynchronous API operation.

Waiting
   ↓
Loading Indicator

Success
   ↓
Display Posts

Error
   ↓
Check Local Cache

⚡ FutureBuilder

FutureBuilder is used because an API request does not complete immediately.

The application handles three main states:

Loading

Fetching data from API...

A progress indicator is shown.

Success

The API data is displayed as post cards.

Error

If the request fails, the application checks whether cached data is available.

💾 Local Caching with SharedPreferences

After a successful API request, the latest displayed posts are saved locally.

The application uses:

SharedPreferences

to store the cached result.

The posts are converted into JSON strings before saving:

final encodedData = posts
    .map((post) => jsonEncode(post.toJson()))
    .toList();

await prefs.setStringList(
  'cached_posts',
  encodedData,
);

📴 Cache Fallback

The main purpose of the cache is to provide a fallback when the API cannot be reached.

             API Request
                  │
          ┌───────┴───────┐
          │               │
       Success           Failed
          │               │
          ↓               ↓
      Save Data       Check Cache
          │               │
          ↓          ┌────┴────┐
      Show LIVE      │         │
        Data       Found     Not Found
                     │         │
                     ↓         ↓
               Show CACHED   Show Error

LIVE

Means the current result was successfully received from the API.

CACHED

Means the API request failed, so the last successful result stored in SharedPreferences is being displayed.

🔄 Refresh Function

The refresh button starts a new API request.

The application also supports pull-to-refresh using:

RefreshIndicator

This allows the user to manually request the latest data without restarting the application.

🧱 Project Architecture

The project is kept in a simple structure so the code is easy to understand and maintain.

assignment_8/
│
├── lib/
│   └── main.dart
│
├── test/
│
├── android/
├── ios/
├── linux/
├── macos/
├── web/
├── windows/
│
├── pubspec.yaml
├── pubspec.lock
├── analysis_options.yaml
├── .gitignore
└── README.md

The main application logic is currently contained in lib/main.dart.

📦 Packages Used

http

Used to communicate with the REST API.

http:

Purpose:

Send HTTP requests

Receive API responses

Check HTTP status codes

shared_preferences

Used for local caching.

shared_preferences:

Purpose:

Save the latest API result

Retrieve cached data

Provide a simple offline fallback

🚀 Getting Started

Prerequisites

Make sure Flutter is installed.

Check your Flutter setup:

flutter doctor

1. Clone the Repository

git clone 

Then enter the project folder:

cd assignment_8

2. Install Dependencies

flutter pub get

3. Run the Application

For Chrome:

flutter run -d chrome

For Android:

flutter run

🧪 Testing

The following features were tested during development:

Test Case

Expected Result

Status

Launch application

Dashboard opens

✅ Passed

API request

Posts are fetched

✅ Passed

JSON parsing

API data is converted correctly

✅ Passed

FutureBuilder loading

Loading indicator appears

✅ Passed

Post display

Post information is visible

✅ Passed

Refresh button

New API request is made

✅ Passed

Local cache

Successful result is stored

✅ Passed

Cached fallback

Previous data is displayed if API fails

✅ Passed

Error without cache

Error screen appears

✅ Passed

Retry button

API request can be attempted again

✅ Passed

Pull-to-refresh

Data refreshes

✅ Passed

🧠 What I Learned

This assignment helped me understand how API integration works in Flutter.

REST API

I learned how a Flutter application can communicate with an external REST API using an HTTP request.

JSON Parsing

I learned how to decode JSON data and convert it into Dart objects using a model class.

FutureBuilder

I understood how FutureBuilder can be used to display different UI states while an asynchronous operation is running.

SharedPreferences

I learned how to store small amounts of data locally using SharedPreferences and retrieve that data later.

Caching

The most useful part of the assignment was understanding the idea of a local cache. Instead of showing an empty screen whenever the API fails, the application can use the last successfully stored result.

Error Handling

I also learned that an API-based application should handle loading, success and failure instead of assuming that the network request will always work.

🛠️ Problems Faced

1. Flutter Project Directory

Initially, the Flutter project was created inside a nested folder. Because the terminal was opened in the outer folder, Flutter could not find pubspec.yaml.

I solved this by moving into the actual Flutter project directory before running Flutter package commands.

2. API Data Is Asynchronous

The API response does not arrive immediately. I used FutureBuilder to handle the waiting state and display the data after the request completed.

3. Storing API Data

SharedPreferences does not directly store custom Dart objects. I converted the Post objects into JSON strings before saving them and decoded them again when reading the cache.

4. API Failure

I added a fallback mechanism so that the application first checks the local cache when the API request fails.

🔑 Key Concepts Demonstrated

Flutter
   │
   ├── StatefulWidget
   ├── Future
   ├── FutureBuilder
   ├── HTTP GET
   ├── REST API
   ├── JSON
   ├── Model Class
   ├── SharedPreferences
   ├── Local Cache
   ├── Error Handling
   └── RefreshIndicator

📈 Data Flow

User Opens App
      ↓
fetchPosts()
      ↓
HTTP GET Request
      ↓
JSONPlaceholder
      ↓
JSON Response
      ↓
jsonDecode()
      ↓
Post Objects
      ↓
FutureBuilder
      ↓
Display First 10 Posts
      ↓
Save Result
      ↓
SharedPreferences

If the request fails:

API Failed
    ↓
Load SharedPreferences
    ↓
Cached Data Found?
   ↙          ↘
 YES           NO
  ↓             ↓
Show Cache    Error Screen

🔐 Note About the Cache

The cache stores the latest successfully fetched result used by the application.

It is intended as a simple local cache for this assignment and is not a replacement for a full database.

📚 Learning Outcome

After completing this project, I was able to:

Connect Flutter to a REST API

Make HTTP GET requests

Work with JSON responses

Create and use model classes

Handle asynchronous operations

Use FutureBuilder

Store data locally

Implement a simple cache

Handle API failures

Refresh API data

Build a clean dashboard interface

👩‍💻 Author

Nupur Bhoir

B.Tech Computer Science Engineering
ITM Skills University

🎓 Assignment Details

Assignment: 8
Topic: API Data Fetcher with Local Cache
Framework: Flutter
Language: Dart
API: JSONPlaceholder
Local Storage: SharedPreferences

📌 Original Assignment Requirement

Fetch data from a public REST API (e.g., JSONPlaceholder), display it with FutureBuilder, and cache the last result using SharedPreferences.

⭐ Project Summary

This project demonstrates a complete basic API workflow in Flutter:

Fetch → Parse → Display → Cache → Reuse

The application combines REST API integration, asynchronous UI handling and local storage in one practical Flutter project.# FLUTTER-Assignment-8-API-Data-Fetcher-with-Local-Cache
