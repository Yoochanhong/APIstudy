import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  void _callApi() async {
    var url = Uri.parse('https://raw.githubusercontent.com/dev-yakuza/users/master/api.json');
    var response = await http.get(url);
    
    print(response.statusCode);
    print(response.body);
    url = Uri.parse('https://reqbin.com/sample/post/json');
    response = await http.post(url, body: {
      'key': 'value',
    });
    
    print(response.statusCode);
    print(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('http Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _callApi,
          child: Text('Call api'),
        ),
      ),
    );
  }
}
