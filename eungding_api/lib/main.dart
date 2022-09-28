import 'dart:convert';
import 'package:http/http.dart' as http;


void main() async{
  String url = 'https://eunjin3786.pythonanywhere.com/question/all/'; ///사이트가 닫혀서 api 통신 불가
  var response = await http.get(Uri.parse(url)); //url 가져오기
  var statusCode = response.statusCode; //statuscode
  var responseHeaders = response.headers; // 헤더
  String responseBody = utf8.decode(response.bodyBytes); ///한글이 깨질때
  
  print("statusCode: $statusCode");
  print("responseHeaders: $responseHeaders");
  print("responseBody: $responseBody");
  List<dynamic> list = jsonDecode(responseBody);
  print(list);
  print(list[0]['id']);
  print(list[0]['title']);
}