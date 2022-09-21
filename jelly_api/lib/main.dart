import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

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
  void RestApi_Get() async {
    http.Response response = await http.get(
        Uri.encodeFull('http://echo.jsontest.com/restapi/get'),
        headers: {"Accept": "application/json"});
    Map<String, dynamic> responseBodyMap = jsonDecode(response.body);
    print(response.body);
    print(responseBodyMap["restapi"]);
    JsonObject jsonObject = JsonObject.fromJson(responseBody);
    print(JsonObject.restapi);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}

class JsonObject {
  final String? restapi;
  JsonObject({this.restapi});
  factory JsonObject.fromJson(Map<String, dynamic> json) {
    return JsonObject(restapi: json['restapi'] as String);
  }
}
