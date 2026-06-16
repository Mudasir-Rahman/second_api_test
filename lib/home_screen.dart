// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:second_api_test/model/post_model.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late Future<PostModel> futurePosts;

//   @override
//   void initState() {
//     super.initState();
//     futurePosts = fetchData();
//   }

//   Future<PostModel> fetchData() async {
//     final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);

//       return PostModel.fromJson(data);
//     } else {
//       throw Exception('Failed to load posts');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Posts API')),
//       body: FutureBuilder<PostModel>(
//         future: futurePosts,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }

//           if (!snapshot.hasData ||
//               snapshot.data!.dataList == null ||
//               snapshot.data!.dataList!.isEmpty) {
//             return const Center(child: Text('No Data Found'));
//           }

//           final posts = snapshot.data!.dataList!;

//           return ListView.builder(
//             itemCount: posts.length,
//             itemBuilder: (context, index) {
//               final post = posts[index];

//               return Card(
//                 margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                 elevation: 3,
//                 child: Padding(
//                   padding: const EdgeInsets.all(12),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'User ID: ${post.userId}',
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),

//                       const SizedBox(height: 5),

//                       Text('Post ID: ${post.id}'),

//                       const SizedBox(height: 10),

//                       Text(
//                         post.title ?? '',
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),

//                       const SizedBox(height: 8),

//                       Text(post.body ?? ''),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
