import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Info>? info;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('라이엇 일병 구하기'),
        actions: [
          IconButton(
            onPressed: () {
              fetchInfo();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: FutureBuilder<Info>(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.name.toString());
              } else if (snapshot.hasError){
                return Text("에러일때");
              } else {
                return Text("로딩 화면");
              }
            },
          ),
        ),
      ),
    );
  }
}

Future<Info> fetchInfo() async {
  final response = await http.get(Uri.parse(
      'https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/%EC%9C%A0%EC%B0%AC%ED%99%8D?api_key=RGAPI-39d9ecc4-47cc-4c46-aba1-5ba3fcf7214d'));
  if (response.statusCode == 200) {
    print(json.decode(response.body));
    return Info.fromjson(json.decode(response.body));
  } else {
    throw Exception('실패');
  }
}

class Info {
  String name;
  int summonerLevel;

  Info({required this.name, required this.summonerLevel});

  factory Info.fromjson(Map<dynamic, dynamic> json) {
    return Info(
      name: json['name'],
      summonerLevel: json['summonerLevel'],
    );
  }
}