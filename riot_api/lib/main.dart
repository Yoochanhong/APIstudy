import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('라이엇 일병 구하기')),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$result'),
              IconButton(
                onPressed: () async {
                  var url =
                      'https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/%EC%9C%A0%EC%B0%AC%ED%99%8D?api_key=RGAPI-0ac3f716-2db1-4a98-a55a-aaed9f682e40';
                  var response = await http.get(Uri.parse(url));
                  setState(() {
                    result = response.body;
                  });
                  },
                icon: Icon(Icons.add_circle_outlined),
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
