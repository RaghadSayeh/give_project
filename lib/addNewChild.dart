import 'package:flutter/material.dart';
import 'ResponsibleNotification.dart';
import 'ResponsibleSettings.dart';
import 'home2.dart';
import 'HomePageResponsible.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';


class addNewChild extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _addNewChildState();
  }
}

class _addNewChildState extends State<addNewChild> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      //  appBar: AppBar(
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.vertical(
      //         bottom: Radius.circular(30),
      //       ),
      //     ),
      //     automaticallyImplyLeading: false,
      //     centerTitle: true,
      //     backgroundColor: Colors.pink,
      //     title: new Text(
      //       "إضافة عامل جديد",
      //       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      //     ),
      //   ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                  clipper: WaveClipper2(),
                  child:Container(
                    child: Column(),
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.pink

                    ),
                  )
              ),
              ClipPath(
                clipper: WaveClipper3(),
                child: Container(
                  child: Column(   children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "إضافة الصورة هنا",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                  ],
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.cyan[300]
                  ),
                ),
              ),



            ],
          ),
          // SizedBox(
          //   height: 30,
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                onChanged: (String value) {},
                cursorColor: Color.fromRGBO(32,64,81,1.0),
                 textAlign:TextAlign.right,
                decoration: InputDecoration(
                  hintText: "الاسم الجديد",
                              hintStyle: TextStyle(color: Colors.white,fontWeight:FontWeight.bold),
                  // prefixIcon: Material(
                  //   elevation: 0,
                  //   borderRadius: BorderRadius.all(Radius.circular(30)),
                  //   // child: Icon(
                  //   //   Icons.email,
                  //   //   color:  Color.fromRGBO(32,64,81,1.0),
                  //   // ),
                  // ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 25,vertical: 13),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                textAlign:TextAlign.right,
                onChanged: (String value){},
                cursorColor:  Color.fromRGBO(32,64,81,1.0),
                decoration: InputDecoration(
                    hintText: "مكان العثور",
                                                  hintStyle: TextStyle(color: Colors.white,fontWeight:FontWeight.bold),

                    // prefixIcon: Material(
                    //   elevation: 0,
                    //   borderRadius: BorderRadius.all(Radius.circular(30)),
                    //   // child: Icon(
                    //   //   Icons.lock,
                    //   //   color:  Color.fromRGBO(32,64,81,1.0),
                    //   // ),
                    // ),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                textAlign:TextAlign.right,
                onChanged: (String value){},
                cursorColor:  Color.fromRGBO(32,64,81,1.0),
                decoration: InputDecoration(
                    hintText: "جنس اليتيم",
                                                  hintStyle: TextStyle(color: Colors.white,fontWeight:FontWeight.bold),

                    // prefixIcon: Material(
                    //   elevation: 0,
                    //   borderRadius: BorderRadius.all(Radius.circular(30)),
                    //   // child: Icon(
                    //   //   Icons.lock,
                    //   //   color:  Color.fromRGBO(32,64,81,1.0),
                    //   // ),
                    // ),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
           SizedBox(
            height: 15,
          ),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                textAlign:TextAlign.right,
                onChanged: (String value){},
                cursorColor:  Color.fromRGBO(32,64,81,1.0),
                decoration: InputDecoration(
                    hintText: "العمر",
                                                  hintStyle: TextStyle(color: Colors.white,fontWeight:FontWeight.bold),

                    // prefixIcon: Material(
                    //   elevation: 0,
                    //   borderRadius: BorderRadius.all(Radius.circular(30)),
                    //   // child: Icon(
                    //   //   Icons.lock,
                    //   //   color:  Color.fromRGBO(32,64,81,1.0),
                    //   // ),
                    // ),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                textAlign:TextAlign.right,
                onChanged: (String value){},
                cursorColor:  Color.fromRGBO(32,64,81,1.0),
                decoration: InputDecoration(
                    hintText: "معلومات أخرى",
                                                  hintStyle: TextStyle(color: Colors.white,fontWeight:FontWeight.bold),

                    // prefixIcon: Material(
                    //   elevation: 0,
                    //   borderRadius: BorderRadius.all(Radius.circular(30)),
                    //   // child: Icon(
                    //   //   Icons.lock,
                    //   //   color:  Color.fromRGBO(32,64,81,1.0),
                    //   // ),
                    // ),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color:  Colors.cyan[300],),
                child: FlatButton(
                  child: Text(
                    "إضافة يتيم جديد",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  onPressed: () {},
                ),
              )),
          SizedBox(height:5),
          // Center(
          //   child: Container(
          //     child: FlatButton(
          //       child: Text('Forgot Password', style: TextStyle(color: Color.fromRGBO(32,64,81,1.0), ),),
          //       textColor: Colors.white,
          //       onPressed: () {},
          //     ),
          //   ),     ),
          // SizedBox(height: 10,),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text("Don't have an Account ? ", style: TextStyle(color:Colors.black,fontSize: 12 ,fontWeight: FontWeight.normal),),
          //     Text("Sign Up ", style: TextStyle(color: Color.fromRGBO(32,64,81,1.0), fontWeight: FontWeight.w500,fontSize: 12, decoration: TextDecoration.underline )),
          //   ],
          // )
        ],
      ),

           bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
          child: BottomNavigationBar(
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
      // ),
    );
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.49, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
