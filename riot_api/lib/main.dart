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
    return Scaffold(
      appBar: AppBar(
        title: Text('라이엇 일병 구하기'),
        actions: [
          IconButton(
            onPressed: () {},
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

Future<Info> fetchInfo() async {
  final response = await http.get(Uri.parse(
      'https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/%EC%9C%A0%EC%B0%AC%ED%99%8D?api_key=RGAPI-39d9ecc4-47cc-4c46-aba1-5ba3fcf7214d'));
  if (response.statusCode == 200){
    return Info.fromjson(json.decode(response.body));
  } else {
    throw Exception('실패');
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
