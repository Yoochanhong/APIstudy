import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class Picture {
  String id;
  String author;

  Picture(this.id, this.author);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List data = [];

  int page = 1; //초기 페이지
  int limit = 20; //한번에 가져올 사진들

  feachData() async {
    var response = await http.get(
        Uri.parse('https://picsum.photos/v2/list?page=$page&limit=$limit'));
    if (response.statusCode == 200) {
      String jsonString = response.body;
      print(jsonString);
      List pictures = jsonDecode(jsonString);
      for (int i = 0; i < pictures.length; i++) {
        var picture = pictures[i];
        Picture pictureToAdd = Picture(picture["id"], picture["author"]);
        print(pictureToAdd.author);
        setState(() {
          data.add(pictureToAdd);
          page++; //같은 이름이 중복되서 나오는걸 방지하기 위해 다음 페이지로 넘김
        });
      }
    } else {
      print('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP & JSON Tutorial'),
        actions: [
          IconButton(
              onPressed: () {
                feachData();
              },
              icon: Icon(Icons.refresh)),
        ],
      ),
      body: ListView.builder(
          itemCount: data.length,

          ///리스트뷰의 길이는 data배열의 길이만큼
          itemBuilder: (context, index) {
            Picture picture = data[index];
            return Card(
              child: Text(picture.author),
            ); //author 출력
          }),
    );
  }
}
