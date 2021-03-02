import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

class SignupTypes extends StatefulWidget {
  SignupTypesState createState() => SignupTypesState();
}

class SignupTypesState extends State<SignupTypes> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        // color: Colors.white,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.cyan[200], Colors.tealAccent[400]]),
        ),
        // padding: EdgeInsets.all(6.0),
        child: Container(
            margin: EdgeInsets.only(top: 90),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                width: 300,
                height: 200,
                // decoration: BoxDecoration(
                //   shape: BoxShape.circle,
                // ),
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              ),
              Container(
                child: Center(
                  child: new Text(
                    "يمكنك التسجيل مرة واحدة فقط",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                width: 250,
                height: 70,
                child: RaisedButton(
                  onPressed: () {
                    print("إنشاء حساب");
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    // side: BorderSide(
                    //     color: Color.alphaBlend(
                    //         Colors.cyan[200], Colors.tealAccent[400]))
                  ),
                  color: Colors.white,
                  child: new Text(
                    "حساب متبرع",
                    // gradient: LinearGradient(
                    //     colors: [Colors.cyan[200], Colors.tealAccent[400]]),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.tealAccent[400],
                        fontSize: 19.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: 250,
                height: 70,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.cyan[200], Colors.tealAccent[400]]),
                ),
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
                    "حساب بائع",
                    // gradient: LinearGradient(
                    //     colors: [Colors.cyan[200], Colors.tealAccent[400]]),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.tealAccent[400],
                        // color: Color.alphaBlend(
                        //     Colors.cyan[200], Colors.tealAccent[400]),
                        fontSize: 19.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: 250,
                height: 70,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.cyan[200], Colors.tealAccent[400]]),
                ),
                child: RaisedButton(
                  onPressed: () {
                    print("إنشاء حساب");
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    // side: BorderSide(
                    //     color: Color.alphaBlend(
                    //         Colors.cyan[200], Colors.tealAccent[400]))
                  ),
                  color: Colors.white,
                  child: new Text(
                    "حساب مسؤول دار الأيتام",
                    // gradient: LinearGradient(
                    //     colors: [Colors.cyan[200], Colors.tealAccent[400]]),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.tealAccent[400],
                        fontSize: 19.0),
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
