import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final url = 'https://jsonplaceholder.typicode.com/posts';

  void postApi() async {
    final response = await http.post(
      Uri.parse(url),
      body: {
        "title": "엄준식",
        "body": "준식엄",
        "userId": "1",
      },
    );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              postApi();
            },
            child: Text('Send post'),
          ),
        ),
      ),
    );
  }
}