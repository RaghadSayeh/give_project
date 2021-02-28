import 'package:flutter/material.dart';
import 'LoginPage.dart';

class LoginORSignup extends StatefulWidget {
  LoginORSignupState createState() => LoginORSignupState();
}

class LoginORSignupState extends State<LoginORSignup> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.cyan[200], Colors.tealAccent[400]]),
        ),
        // color: Color.alphaBlend(Colors.cyan[200], Colors.tealAccent[400]),
        // margin: EdgeInsets.all(6.0),
        padding: EdgeInsets.all(6.0),
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 120,
            height: 130,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset("assets/images/background_logo.jpg"),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
            child: Center(
              child: new Text(
                "أهلا بك مجددا في عطاء",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 100.0,
          ),
          Container(
            width: 240,
            height: 70,
            child: RaisedButton(
              onPressed: () {
                print("إنشاء حساب");
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: BorderSide(
                      color: Color.alphaBlend(
                          Colors.cyan[200], Colors.tealAccent[400]))),
              color: Colors.white,
              child: new Text(
                "إنشاء حساب",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.alphaBlend(
                        Colors.cyan[200], Colors.tealAccent[400]),
                    fontSize: 19.0),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
              width: 200,
              height: 80,
              //  color: Colors.cyan[200],
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new LoginPage()));
                  },
                  child: Center(
                    child: new Text(
                      "هل لديك حساب مسبقا",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: Colors.white),
                    ),
                  ))),
        ])),
      ),
    );
  }
}
