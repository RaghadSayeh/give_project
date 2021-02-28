import 'package:flutter/material.dart';

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
      appBar: AppBar(
          backgroundColor: Colors.cyan[200],
          title: new Text(
            "إنشاء حساب أو دخول",
            // textAlign: TextAlign.left,
            textDirection: TextDirection.ltr,
          )),
      body: Container(
        margin: EdgeInsets.all(6.0),
        padding: EdgeInsets.all(6.0),
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 200,
            height: 80,
            child: RaisedButton(
              onPressed: () {
                print("إنشاء حساب");
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.tealAccent[400])),
              color: Colors.cyan[200],
              child: new Text(
                "إنشاء حساب",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18.0),
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
              child: RaisedButton(
                  onPressed: () {
                    print("تسجيل الدخول");
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.tealAccent[400])),
                  color: Colors.cyan[200],
                  child: new Text(
                    "تسجيل الدخول",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18.0),
                  ))),
        ])),
      ),
    );
  }
}
