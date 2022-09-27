import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_homepage_api/PostClass.dart';

Future<Post> fetchPost() async{
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
  if (response.statusCode == 200){
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('요청 실패');
  }
}