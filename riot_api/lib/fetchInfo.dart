import 'package:http/http.dart'as http;
import 'dart:convert';
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