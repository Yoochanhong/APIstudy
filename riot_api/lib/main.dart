import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    final future = getJsonData();
    return Scaffold(
      appBar: AppBar(
        title: Text('라이엇 일병 구하기'),
        actions: [
          IconButton(
            onPressed: () {
              getJsonData();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(''),
            ],
          ),
        ),
      ),
    );
  }
}

getJsonData() async {
  var url =
      'https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/%EC%9C%A0%EC%B0%AC%ED%99%8D?api_key=RGAPI-abed83b4-610e-4d8b-8932-761e8163a9c8';
  http.Response response = await http.get(Uri.parse(url));
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    String jsonData = response.body;
    var parsingData = jsonDecode(jsonData);
  }
}

class Info {
  String? name;
  int? level;

  Info({this.name, this.level});

  factory Info.fromjson(Map<dynamic, dynamic> json) {
    return Info(
      name: json['name'],
      level: json['level'],
    );
  }
}
