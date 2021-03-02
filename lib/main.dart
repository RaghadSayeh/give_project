import 'package:flutter/material.dart';
import 'LoginORSignup.dart';
import 'package:flutter/services.dart';

void main() {
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //   .then((_) {
  runApp(new MyApp());
  // });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          hintColor: Colors.cyan[200],
          primaryColor: Colors.cyan[300],
          canvasColor: Colors.transparent),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => new LoginORSignup()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan[300],
      // decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomRight,
      //         colors: [Colors.cyan[200], Colors.tealAccent[400]])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            child: Image.asset(
              "assets/images/logo.png",
            ),
          ),
        ),
      ),
    );
  }
}
