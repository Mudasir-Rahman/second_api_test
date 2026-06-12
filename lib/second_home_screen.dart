import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:second_api_test/model/secondApi.dart';

class SecondHomeScreen extends StatefulWidget {
  const SecondHomeScreen({super.key});

  @override
  State<SecondHomeScreen> createState() => _SecondHomeScreenState();
}

class _SecondHomeScreenState extends State<SecondHomeScreen> {
  late Future<SecondApi> secondApiData;
  void initState() {
    super.initState();
    secondApiData = fetchData();
  }

  Future<SecondApi> fetchData() async {
    final url = Uri.parse(
      'https://jsonplaceholder.typicode.com/comments?postId=1',
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = response.body;
      return SecondApi.fromJson(jsonDecode(data));
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Home Screen')),
      body: FutureBuilder<SecondApi>(
        future: secondApiData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData ||
              snapshot.data!.dataList == null ||
              snapshot.data!.dataList!.isEmpty) {
            return Center(child: Text('No Data Found'));
          }
          final posts = snapshot.data!.dataList!;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return ListTile(
                title: Text(post.name ?? 'No Name'),
                subtitle: Text(post.email ?? 'No Email'),
                isThreeLine: true,
                leading: CircleAvatar(child: Text(post.id.toString())),
                trailing: Icon(Icons.comment),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Comment Body'),
                      content: Text(post.body ?? 'No Body'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Close'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
