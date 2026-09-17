import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const ApiDataFetcherApp());
}

class ApiDataFetcherApp extends StatelessWidget {
  const ApiDataFetcherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API Data Fetcher',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF0B0B0B),
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE50914),
          brightness: Brightness.dark,
        ),
      ),
      home: const PostsScreen(),
    );
  }
}

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late Future<List<Post>> postsFuture;
  bool showingCache = false;

  @override
  void initState() {
    super.initState();
    postsFuture = fetchPosts();
  }

  Future<List<Post>> fetchPosts() async {
    const url = 'https://jsonplaceholder.typicode.com/posts';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        // Display first 10 posts for a cleaner UI.
        final posts = data
            .take(10)
            .map((item) => Post.fromJson(item))
            .toList();

        await savePosts(posts);

        if (mounted) {
          setState(() {
            showingCache = false;
          });
        }

        return posts;
      }

      throw Exception('API request failed');
    } catch (error) {
      final cachedPosts = await loadCachedPosts();

      if (cachedPosts.isNotEmpty) {
        if (mounted) {
          setState(() {
            showingCache = true;
          });
        }

        return cachedPosts;
      }

      throw Exception(
        'Unable to fetch data and no cached data is available.',
      );
    }
  }

  Future<void> savePosts(List<Post> posts) async {
    final prefs = await SharedPreferences.getInstance();

    final encodedData = posts
        .map((post) => jsonEncode(post.toJson()))
        .toList();

    await prefs.setStringList('cached_posts', encodedData);
  }

  Future<List<Post>> loadCachedPosts() async {
    final prefs = await SharedPreferences.getInstance();

    final cachedData = prefs.getStringList('cached_posts');

    if (cachedData == null || cachedData.isEmpty) {
      return [];
    }

    return cachedData
        .map((item) => Post.fromJson(jsonDecode(item)))
        .toList();
  }

  void refreshData() {
    setState(() {
      showingCache = false;
      postsFuture = fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0B0B),
        surfaceTintColor: Colors.transparent,
        titleSpacing: 18,
        title: Row(
          children: [
            Container(
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                color: const Color(0xFFE50914),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.code_rounded,
                color: Colors.white,
                size: 21,
              ),
            ),
            const SizedBox(width: 11),
            const Text(
              'API Data Fetcher',
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: refreshData,
            tooltip: 'Refresh',
            icon: const Icon(
              Icons.refresh_rounded,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: FutureBuilder<List<Post>>(
        future: postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingView();
          }

          if (snapshot.hasError) {
            return ErrorView(
              onRetry: refreshData,
            );
          }

          final posts = snapshot.data ?? [];

          return RefreshIndicator(
            color: const Color(0xFFE50914),
            backgroundColor: const Color(0xFF151515),
            onRefresh: () async {
              refreshData();
              await postsFuture;
            },
            child: ListView(
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 30),
              children: [
                const HeaderSection(),
                const SizedBox(height: 18),

                ApiStatusCard(
                  showingCache: showingCache,
                ),

                const SizedBox(height: 18),

                const Text(
                  'API Information',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 12),

                const ApiDetailsCard(),

                const SizedBox(height: 22),

                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Posts',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      'Showing ${posts.length} of 100',
                      style: const TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                ...posts.map(
                  (post) => PostCard(post: post),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF151515),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFF292929),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.api_rounded,
                color: Color(0xFFE50914),
                size: 25,
              ),
              SizedBox(width: 10),
              Text(
                'REST API Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 9),
          Text(
            'Fetch, display and locally cache API data using Flutter.',
            style: TextStyle(
              color: Color(0xFFAAAAAA),
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class ApiStatusCard extends StatelessWidget {
  final bool showingCache;

  const ApiStatusCard({
    super.key,
    required this.showingCache,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = showingCache
        ? const Color(0xFFFF9800)
        : const Color(0xFF4CAF50);

    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: const Color(0xFF151515),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF292929),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: const Color(0xFFE50914).withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              showingCache
                  ? Icons.storage_rounded
                  : Icons.cloud_done_rounded,
              color: const Color(0xFFE50914),
            ),
          ),
          const SizedBox(width: 13),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  showingCache
                      ? 'Cached Data'
                      : 'Live API Data',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  showingCache
                      ? 'Last successful result loaded locally'
                      : 'Data successfully fetched from API',
                  style: const TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: statusColor.withOpacity(0.35),
              ),
            ),
            child: Text(
              showingCache ? 'CACHED' : 'LIVE',
              style: TextStyle(
                color: statusColor,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ApiDetailsCard extends StatelessWidget {
  const ApiDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: const Color(0xFF151515),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF292929),
        ),
      ),
      child: Column(
        children: [
          const DetailRow(
            icon: Icons.link_rounded,
            title: 'API',
            value: 'JSONPlaceholder',
          ),
          const Divider(
            color: Color(0xFF292929),
            height: 22,
          ),
          const DetailRow(
            icon: Icons.http_rounded,
            title: 'Method',
            value: 'GET',
          ),
          const Divider(
            color: Color(0xFF292929),
            height: 22,
          ),
          const DetailRow(
            icon: Icons.route_rounded,
            title: 'Endpoint',
            value: '/posts',
          ),
          const Divider(
            color: Color(0xFF292929),
            height: 22,
          ),
          const DetailRow(
            icon: Icons.data_object_rounded,
            title: 'Response',
            value: 'JSON',
          ),
          const Divider(
            color: Color(0xFF292929),
            height: 22,
          ),
          const DetailRow(
            icon: Icons.format_list_numbered_rounded,
            title: 'Available Records',
            value: '100 Posts',
          ),
          const Divider(
            color: Color(0xFF292929),
            height: 22,
          ),
          const DetailRow(
            icon: Icons.storage_rounded,
            title: 'Local Storage',
            value: 'SharedPreferences',
          ),
        ],
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const DetailRow({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 19,
          color: const Color(0xFFE50914),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF999999),
              fontSize: 13,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF151515),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF292929),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFE50914),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Text(
              '${post.id}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 7),

                Text(
                  post.body,
                  style: const TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 12.5,
                    height: 1.45,
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    const Icon(
                      Icons.person_outline_rounded,
                      size: 14,
                      color: Color(0xFFE50914),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'User ID: ${post.userId}',
                      style: const TextStyle(
                        color: Color(0xFF777777),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            color: Color(0xFFE50914),
          ),
          SizedBox(height: 16),
          Text(
            'Fetching data from API...',
            style: TextStyle(
              color: Color(0xFF999999),
            ),
          ),
        ],
      ),
    );
  }
}

class ErrorView extends StatelessWidget {
  final VoidCallback onRetry;

  const ErrorView({
    super.key,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.cloud_off_rounded,
              size: 58,
              color: Color(0xFFE50914),
            ),
            const SizedBox(height: 16),
            const Text(
              'Unable to load data',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'The API could not be reached and no cached result was found.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF888888),
                height: 1.4,
              ),
            ),
            const SizedBox(height: 18),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Try Again'),
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFE50914),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}