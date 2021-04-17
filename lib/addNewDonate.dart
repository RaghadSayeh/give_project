import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'ResponsibleNotification.dart';
import 'ResponsibleSettings.dart';
import 'home2.dart';
import 'HomePageResponsible.dart';

class addNewDonate extends StatefulWidget {
  @override
  _addNewDonateState createState() => _addNewDonateState();
}

class _addNewDonateState extends State<addNewDonate> {
  @override
  Widget build(BuildContext context) {
    final _pos = MediaQuery.of(context).size.height / 4 + 20;
    return Scaffold(
              backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height / 4 + 40,
                  color: Colors.cyan[300],//fromRGBO(83, 157, 219, 1.0)
                ),
              ),
              Positioned(
                top: -20.0,
                left: -40.0,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.pink, shape: BoxShape.circle),
                ),
              ),
              Positioned(
                bottom: 0.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipPath(
                    clipper: WaveClipper1(),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4 + 20,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.cyan[300],//fromRGBO(83, 157, 219, 1.0)
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 130),
                  child: Container(
                    height: 90,
                    width: 90,
                    child: Icon(
                      Icons.camera_alt,
                      size: 50.0,
                      color: Colors.pink,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 3,
                          color: Colors.cyan[300],//fromRGBO(82, 110, 208, 1.0)
                          style: BorderStyle.solid),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 250),
                child: Container(
                  color: Colors.white70,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: TextField(
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "المشكلة",
                            hintStyle: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),
                            border: InputBorder.none,
                            // icon: Icon(
                            //   Icons.email,
                            //   color: Color.fromRGBO(82, 110, 208, 1.0),
                            // )
                          ),
                        ),
                      ),
                      Container(
                        child: Divider(
                          color: Color.fromRGBO(82, 110, 208, 1.0),
                        ),
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 0.0),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20, 0.0),
                          child: TextField(
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: "شرح عن المشكلة",
                              hintStyle: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),
                              border: InputBorder.none,
                              // icon: Icon(
                              //   Icons.vpn_key,
                              //   color: Color.fromRGBO(82, 110, 208, 1.0),
                              // )
                            ),
                          )),
                      Container(
                        child:
                            Divider(color: Color.fromRGBO(82, 110, 208, 1.0)),
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 0.0),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20, 0.0),
                          child: TextField(
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: "درجة الاهمية",
                              hintStyle: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),
                              border: InputBorder.none,
                              // icon: Icon(
                              //   Icons.vpn_key,
                              //   color: Color.fromRGBO(82, 110, 208, 1.0),
                              // )
                            ),
                          )),
                      Container(
                        child: Divider(
                          color: Color.fromRGBO(82, 110, 208, 1.0),
                        ),
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 0.0),
                      ),
                       Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20, 0.0),
                          child: TextField(
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: "معلومات أخرى",
                              hintStyle: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),
                              border: InputBorder.none,
                              // icon: Icon(
                              //   Icons.vpn_key,
                              //   color: Color.fromRGBO(82, 110, 208, 1.0),
                              // )
                            ),
                          )),
                           Container(
                        child: Divider(
                          color: Color.fromRGBO(82, 110, 208, 1.0),
                        ),
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 0.0),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  left: (MediaQuery.of(context).size.width / 2) - 100,
                  top: 3 / 4 * (MediaQuery.of(context).size.height) - 25,
                  child: Container(
                    height: 50,
                    width: 200,
                    child: RaisedButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      child: Text("إرسال",
                          style: TextStyle(color: Colors.white)),
                      color: Colors.pink,
                    ),
                  )),
              // Positioned(
              //   bottom: 40.0,
              //   right: -20.0,
              //   child: Container(
              //     height: 130,
              //     width: 130,
              //     decoration: BoxDecoration(
              //         color: Colors.pink, shape: BoxShape.circle),
              //   ),
              // )
            ],
          ),
        ],
      ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
          child: BottomNavigationBar(
           // color:Colors.cyan[300],
            backgroundColor: Colors.pink,
            type: BottomNavigationBarType.fixed,
            currentIndex: 2,
            onTap: (value) async {
              value == 0
                  ?  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  new HomePageRes()))
                  : value == 1
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  new ResponsibleNotification()))
                      : value == 2
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      new ResponsibleSettings()))
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new AuthScreen()));
            },
            items: [
              BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                title: new Text('الرئيسية'),
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.notifications),
                title: new Text('الاشعارات'),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), title: Text('الاعدادات')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.logout), title: Text('تسجيل الخروج'))
            ],
          ),
        )
    );
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(0, 0);
    path.quadraticBezierTo(size.width / 4, 40, size.width / 2, 20);
    path.quadraticBezierTo(3 / 4 * size.width, 0.0, size.width, 10);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
