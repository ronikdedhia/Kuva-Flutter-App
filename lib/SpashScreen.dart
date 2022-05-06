import 'package:flutter/material.dart';
import 'package:kuva/screen/login.dart';
import 'package:splashscreen/splashscreen.dart';

class SScreen extends StatefulWidget {
  @override
  _SScreenState createState() => _SScreenState();
}

class _SScreenState extends State<SScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      backgroundColor: Colors.black,
      image: Image.asset('images/kuva2.jpg'),
      loaderColor: Colors.white,
      photoSize: 100,
      navigateAfterSeconds: LoginPage(),
    );
  }
}
