import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:kakao_login/APIkey.dart';

void main() {
  KakaoContext.clientId = nativeAppKey;
  KakaoContext.javascriptClientId = javascriptKey;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KakaoLoginPage(),
    );
  }
}

class KakaoLoginPage extends StatefulWidget {
  const KakaoLoginPage({Key? key}) : super(key: key);

  @override
  State<KakaoLoginPage> createState() => _KakaoLoginPageState();
}

class _KakaoLoginPageState extends State<KakaoLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width - 100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 1.0,
          onPressed: () async{
            String authcode = await AuthCodeClient.instance.request();
            print(authcode);
          },
          color: Colors.yellow,
          child: Text(
            '카톡 로그인 버튼',
            style: TextStyle(fontSize: 15,
            color: Colors.black),
          ),
        ),
      ),
    );
  }
}
