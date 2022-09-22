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
              Padding(
                padding: EdgeInsets.all(8),
              ),
              IconButton(
                onPressed: () {
                  getJsonData();
                },
                color: Colors.blue,
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

  Future <dynamic> getJsonData() async {
    var url =
        'https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/%EC%9C%A0%EC%B0%AC%ED%99%8D?api_key=RGAPI-e92d3fd9-a7b8-468c-81c3-637646c09962';
    http.Response response = await http.get(Uri.parse(url));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }