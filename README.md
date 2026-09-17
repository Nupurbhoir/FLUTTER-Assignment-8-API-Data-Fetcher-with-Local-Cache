<h1>🔴 API Data Fetcher with Local Cache</h1>
<h3>Flutter Assignment 8</h3>

<p><b>A Flutter application that fetches data from a public REST API, displays it using FutureBuilder, and caches the latest successful result using SharedPreferences.</b></p>

<hr>

<h2>📌 1. Project Overview</h2> <p>API Data Fetcher is a Flutter project created for Assignment 8.</p> <p>The main purpose of this project is to understand API integration in Flutter.</p> <p>The application connects to the JSONPlaceholder REST API.</p> <p>It sends an HTTP GET request to the posts endpoint.</p> <p>The API response is received in JSON format.</p> <p>The JSON response is converted into Dart model objects.</p> <p>The application displays the fetched posts in a dashboard.</p> <p>FutureBuilder is used to manage the asynchronous API request.</p> <p>SharedPreferences is used to store the latest successful result.</p> <p>If the API request fails, the application checks the local cache.</p> <p>This provides a simple offline fallback for previously fetched data.</p>

<h2>🎯 2. Assignment Objective</h2> <p>The objective is to build a Flutter application that communicates with a public REST API.</p> <p>The application should fetch data from the API.</p> <p>The fetched data should be displayed using FutureBuilder.</p> <p>The latest successful result should be stored locally.</p> <p>SharedPreferences should be used for local caching.</p> <p>The application should handle loading and error states.</p> <p>A refresh option should also be available.</p>

<h2>✨ 3. Features</h2> <ul> <li>🌐 Public REST API integration</li> <li>⚡ Asynchronous API handling</li> <li>🔄 Refresh API data</li> <li>💾 Local caching</li> <li>📦 SharedPreferences storage</li> <li>📴 Cached data fallback</li> <li>⚠️ Error handling</li> <li>🔃 Pull-to-refresh</li> <li>🎨 Black and red dashboard UI</li> <li>📱 Responsive Flutter layout</li> <li>🧩 Dart model for API data</li> </ul>

<h2>🌐 4. REST API Used</h2> <p><b>API:</b> JSONPlaceholder</p> <p><b>Method:</b> GET</p> <p><b>Endpoint:</b> /posts</p> <p><b>Response:</b> JSON</p> <p><b>Available Records:</b> 100 Posts</p> <p><b>Fields:</b> userId, id, title, body</p>

<pre>https://jsonplaceholder.typicode.com/posts</pre>

<h2>🔎 5. Sample API Response</h2> <pre>{ "userId": 1, "id": 1, "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", "body": "quia et suscipit suscipit recusandae consequuntur expedita et cum" }</pre>

<p>The API returns multiple post objects.</p> <p>Each object contains userId, id, title, and body.</p> <p>The application converts these JSON objects into Dart Post objects.</p>

<h2>🧠 6. Basic Application Flow</h2> <pre> Open Flutter App ↓ fetchPosts() ↓ HTTP GET ↓ REST API ↓ JSON Response ↓ Post Model ↓ FutureBuilder ↓ Display Posts </pre>

<h2>⚡ 7. FutureBuilder</h2> <p>FutureBuilder is used to manage the asynchronous API request.</p> <p>The API request takes some time to complete.</p> <p>FutureBuilder allows the interface to react to the current request state.</p> <p>The main states are waiting, success, and error.</p>

<pre> FutureBuilder │ ┌───────────┼───────────┐ ↓ ↓ ↓ Waiting Success Error │ │ │ ↓ ↓ ↓ Loading Display Check Cache Data │ ↓ Cached Data? / Yes No ↓ ↓ Show Cache Show Error </pre>

<h2>⏳ 8. Loading State</h2> <p>While the API request is running, a loading indicator is displayed.</p> <p>This tells the user that the application is fetching data.</p> <p>It also prevents the screen from appearing empty during the request.</p>

<h2>✅ 9. Success State</h2> <p>When the API returns successfully, the response is processed.</p> <p>The JSON data is decoded.</p> <p>Post objects are created.</p> <p>The posts are displayed on the dashboard.</p> <p>The successful result is saved locally.</p> <p>The application can show LIVE status for the current API result.</p>

<h2>❌ 10. Error State</h2> <p>If the API request fails, the application checks SharedPreferences.</p> <p>If cached posts are available, they are displayed.</p> <p>If there is no cached data, an error screen is shown.</p> <p>A retry option allows the user to attempt the API request again.</p>

<h2>💾 11. Local Cache</h2> <p>SharedPreferences is used as the local cache.</p> <p>The latest successful result is stored locally.</p> <p>Post objects are converted into JSON strings before storage.</p> <p>The stored strings can be decoded later.</p> <p>This provides a simple cache for the assignment.</p>

<h2>🔄 12. Cache Flow Diagram</h2> <pre> API REQUEST │ ├── SUCCESS │ ↓ │ Save Result │ ↓ │ LIVE Data │ └── FAILED ↓ Check Cache │ ┌────┴────┐ ↓ ↓ Found Missing ↓ ↓ CACHED ERROR </pre>

<h2>🟢 13. LIVE Data</h2> <p>LIVE means the current result was received successfully from the API.</p> <p>The successful result is also saved for future fallback use.</p>

<h2>🟠 14. CACHED Data</h2> <p>CACHED means the API request was unsuccessful.</p> <p>The application displays the latest successful result saved locally.</p> <p>This makes the application more useful during temporary network problems.</p>

<h2>🔁 15. Complete Data Flow</h2> <pre> User ↓ Flutter UI ↓ fetchPosts() ↓ HTTP GET ↓ JSONPlaceholder ↓ JSON Response ↓ jsonDecode() ↓ Post.fromJson() ↓ List&lt;Post&gt; ↓ FutureBuilder ↓ Display Posts ↓ SharedPreferences ↓ Local Cache </pre>

<h2>🧩 16. Post Model</h2> <p>The Post model represents the data returned by the REST API.</p> <p>It contains four main properties.</p> <ul> <li>userId</li> <li>id</li> <li>title</li> <li>body</li> </ul> <p><b>fromJson()</b> converts JSON data into a Post object.</p> <p><b>toJson()</b> converts a Post object into JSON.</p>

<h2>🛠️ 17. Technologies Used</h2> <ul> <li><b>Flutter:</b> Application framework.</li> <li><b>Dart:</b> Programming language.</li> <li><b>http:</b> REST API communication.</li> <li><b>shared_preferences:</b> Local storage.</li> <li><b>JSONPlaceholder:</b> Public REST API.</li> <li><b>FutureBuilder:</b> Asynchronous UI handling.</li> <li><b>RefreshIndicator:</b> Pull-to-refresh.</li> <li><b>VS Code:</b> Development environment.</li> </ul>

<h2>📦 18. Dependencies</h2> <pre> dependencies: flutter: sdk: flutter http: shared_preferences: </pre>

<p>Packages can be installed with:</p> <pre> flutter pub add http flutter pub add shared_preferences </pre>

<h2>🎨 19. UI Design</h2> <p>The application uses a black and red developer-dashboard theme.</p> <p>The dark background keeps the interface clean.</p> <p>Red is used for important actions and status indicators.</p> <p>White is used for primary text.</p> <p>Grey is used for secondary information.</p>

<h2>🎨 20. Color Palette</h2> <ul> <li><b>Background:</b> #0B0B0B</li> <li><b>Cards:</b> #151515</li> <li><b>Primary Red:</b> #E50914</li> <li><b>Secondary Red:</b> #FF3B3B</li> <li><b>Main Text:</b> White</li> <li><b>Secondary Text:</b> #999999</li> <li><b>Borders:</b> #292929</li> </ul>

<h2>🖥️ 21. Dashboard Sections</h2> <ul> <li>Application title</li> <li>Dashboard subtitle</li> <li>LIVE/CACHED status</li> <li>API information</li> <li>HTTP method</li> <li>Endpoint</li> <li>Response type</li> <li>Available records</li> <li>Local storage information</li> <li>Posts section</li> <li>Refresh action</li> </ul>

<h2>📊 22. API Information Display</h2> <pre> API JSONPlaceholder

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
</pre>

<p>The API provides 100 posts.</p> <p>The application displays the first 10 posts for a cleaner dashboard.</p>

<h2>🔄 23. Refresh Function</h2> <p>The refresh button starts a new API request.</p> <p>The user can request the latest data without restarting the application.</p> <p>Pull-to-refresh is also supported using RefreshIndicator.</p>

<h2>🧪 24. Testing</h2> <p>The main assignment requirements were tested during development.</p>

<h3>Test 1 — Launch Application</h3> <p>Expected: Dashboard opens successfully.</p> <p>Status: ✅ Passed</p>

<h3>Test 2 — API Request</h3> <p>Expected: Posts are fetched from JSONPlaceholder.</p> <p>Status: ✅ Passed</p>

<h3>Test 3 — JSON Parsing</h3> <p>Expected: API data is converted into Post objects.</p> <p>Status: ✅ Passed</p>

<h3>Test 4 — FutureBuilder</h3> <p>Expected: Loading and success states are handled.</p> <p>Status: ✅ Passed</p>

<h3>Test 5 — Local Cache</h3> <p>Expected: Successful API data is stored locally.</p> <p>Status: ✅ Passed</p>

<h3>Test 6 — Cache Fallback</h3> <p>Expected: Cached data appears when the API request fails.</p> <p>Status: ✅ Passed</p>

<h3>Test 7 — Refresh</h3> <p>Expected: A new API request is made.</p> <p>Status: ✅ Passed</p>

<h3>Test 8 — Error Handling</h3> <p>Expected: Error and retry appear when no data is available.</p> <p>Status: ✅ Passed</p>

<h2>🛡️ 25. Error Handling Flow</h2> <pre> API Request ↓ Response? │ ├── Yes → Success → Save Cache → LIVE │ └── No → Load Cache │ ├── Found → CACHED └── Missing → ERROR </pre>

<h2>📂 26. Project Structure</h2> <pre> assignment_8/ ├── lib/ │ └── main.dart ├── test/ ├── android/ ├── ios/ ├── web/ ├── macos/ ├── linux/ ├── windows/ ├── pubspec.yaml └── README.md </pre>

<h2>📄 27. Main File</h2> <p>The main application code is inside <b>lib/main.dart</b>.</p> <p>It contains the application configuration.</p> <p>It contains the PostsScreen widget.</p> <p>It contains API request logic.</p> <p>It contains cache functions.</p> <p>It contains refresh logic.</p> <p>It contains FutureBuilder.</p> <p>It contains loading and error views.</p> <p>It contains API information cards.</p> <p>It contains post cards.</p> <p>It contains the Post model.</p>

<h2>🚀 28. Getting Started</h2> <p>Make sure Flutter is installed before running the project.</p> <pre>flutter doctor</pre>

<h2>📥 29. Clone Repository</h2> <pre>git clone https://github.com/Nupurbhoir/FLUTTER-Assignment-8-API-Data-Fetcher-with-Local-Cache.git</pre> <pre>cd FLUTTER-Assignment-8-API-Data-Fetcher-with-Local-Cache</pre>

<h2>📦 30. Install Dependencies</h2> <pre>flutter pub get</pre>

<h2>▶️ 31. Run Application</h2> <p>For Chrome:</p> <pre>flutter run -d chrome</pre> <p>For Android:</p> <pre>flutter run</pre>

<h2>💻 32. Development Environment</h2> <ul> <li>VS Code</li> <li>Flutter</li> <li>Dart</li> <li>Chrome</li> <li>Git</li> <li>GitHub</li> </ul>

<h2>🧠 33. Problems Faced</h2> <h3>Problem 1 — Wrong Project Directory</h3> <p>The Flutter package command was initially executed from the outer folder.</p> <p>The actual Flutter project root contains pubspec.yaml.</p> <h3>Solution</h3> <p>The terminal was moved into the correct project directory.</p>

<h3>Problem 2 — Asynchronous API Data</h3> <p>API data does not arrive immediately.</p> <h3>Solution</h3> <p>FutureBuilder was used to manage the asynchronous operation.</p>

<h3>Problem 3 — Saving Custom Objects</h3> <p>SharedPreferences does not directly store custom Dart objects.</p> <h3>Solution</h3> <p>Post objects were converted into JSON strings before storage.</p>

<h3>Problem 4 — API Failure</h3> <p>The API can fail because of a temporary network problem.</p> <h3>Solution</h3> <p>The application loads the latest successful result from cache.</p>

<h2>📚 34. What I Learned</h2> <p>I learned how Flutter communicates with a REST API.</p> <p>I learned how to send HTTP GET requests.</p> <p>I learned how to work with JSON responses.</p> <p>I learned how to create Dart model classes.</p> <p>I learned how FutureBuilder handles asynchronous operations.</p> <p>I learned how SharedPreferences can store local data.</p> <p>I learned how caching can provide a fallback during API failure.</p> <p>I learned how to handle loading and error states.</p> <p>I learned how to implement refresh functionality.</p> <p>I also improved my understanding of structuring a Flutter dashboard.</p>

<h2>🔑 35. Key Concepts</h2> <pre> REST API ↓ HTTP GET ↓ JSON ↓ Dart Model ↓ FutureBuilder ↓ Flutter UI ↓ SharedPreferences ↓ Local Cache </pre>

<h2>📈 36. Application Architecture</h2> <pre> Flutter UI ↓ FutureBuilder ↓ ┌──┴──────────┐ ↓ ↓ REST API SharedPreferences ↓ ↓ JSON Cache └─────┬───────┘ ↓ Display </pre>

<h2>🔗 37. GitHub Repository</h2> <p>The complete Flutter project is available on GitHub.</p> <p><b>Repository:</b></p> <p>https://github.com/Nupurbhoir/FLUTTER-Assignment-8-API-Data-Fetcher-with-Local-Cache</p>

<h2>👩‍💻 38. Author</h2> <p><b>Nupur Bhoir</b></p> <p>B.Tech Computer Science Engineering</p> <p>ITM Skills University</p>

<h2>🎓 39. Assignment Details</h2> <p><b>Assignment:</b> 8</p> <p><b>Topic:</b> API Data Fetcher with Local Cache</p> <p><b>Framework:</b> Flutter</p> <p><b>Language:</b> Dart</p> <p><b>API:</b> JSONPlaceholder</p> <p><b>Storage:</b> SharedPreferences</p>

<h2>📌 40. Original Requirement</h2> <blockquote>Fetch data from a public REST API, such as JSONPlaceholder, display it with FutureBuilder, and cache the last result using SharedPreferences.</blockquote>

<h2>⭐ 41. Final Project Summary</h2> <p>The project demonstrates a complete Flutter API workflow.</p> <pre> FETCH ↓ PARSE ↓ DISPLAY ↓ CACHE ↓ REUSE </pre> <p>The application combines REST API integration, JSON parsing, FutureBuilder, SharedPreferences, local caching, error handling, refresh functionality, and responsive UI.</p>

<h2>🏁 42. Conclusion</h2> <p>API Data Fetcher successfully fulfills the requirements of Flutter Assignment 8.</p> <p>The application fetches post data from JSONPlaceholder.</p> <p>The data is displayed using FutureBuilder.</p> <p>The latest successful result is stored using SharedPreferences.</p> <p>When the API fails, cached data can be displayed.</p> <p>This assignment provided practical experience with API integration, asynchronous programming, local storage, caching, and error handling.</p>

<h2>❤️ 43. Final Workflow</h2> <pre> USER OPENS APP ↓ FETCH API DATA ↓ PARSE JSON ↓ CREATE POST OBJECTS ↓ DISPLAY DATA ↓ SAVE LOCAL CACHE ↓ READY FOR NEXT REQUEST </pre>

<h2>🚀 Final Result</h2> <p><b>Fetch → Parse → Display → Cache → Reuse</b></p> <p>This project represents the complete learning outcome of Assignment 8.</p>

<hr>

<p align="center"><b>Made with Flutter ❤️ | Assignment 8 | Nupur Bhoir</b></p>
