import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostApiScreen extends StatefulWidget {
  const PostApiScreen({super.key});

  @override
  State<PostApiScreen> createState() => _PostApiScreenState();
}

class _PostApiScreenState extends State<PostApiScreen> {
  late Future<PostApiScreen> postApiData;
  initState() {
    super.initState();
    postApiData = fetchData();
  }

  Future<PostApiScreen> fetchData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.post(
      url,
      body: {
        'title': 'flutter',
        'body': 'this is flutter post api',
        'userId': '1',
      },
    );
    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      debugPrint('Data posted successfully: $data');
      return PostApiScreen();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post API Screen')),
      body: ElevatedButton(
        onPressed: () {
          fetchData();
        },
        child: Text('Post Data'),
      ),
    );
  }
}
