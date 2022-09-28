import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:riot_api/InfoClass.dart';

Future<Info> fetchInfo() async {
  final response = await http.get(Uri.parse(
      'https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/%EC%9C%A0%EC%B0%AC%ED%99%8D?api_key=RGAPI-b335729b-b50b-40ea-8322-0d588863e6f8'));
  if (response.statusCode == 200) {
    print(json.decode(response.body));
    return Info.fromjson(json.decode(response.body));
  } else {
    throw Exception('실패');
  }
}

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
  void initState() {
    super.initState();
    info = fetchInfo();
  }

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
            future: info,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.data!.name!),
                    Text("Level:"+ snapshot.data!.summonerLevel!.toString()),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}