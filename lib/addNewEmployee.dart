import 'package:flutter/material.dart';
import 'ResponsibleNotification.dart';
import 'ResponsibleSettings.dart';
import 'home2.dart';
import 'HomePageResponsible.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';


class addNewEmployee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _addNewEmployeeState();
  }
}

class _addNewEmployeeState extends State<addNewEmployee> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(199,246,245,1.0),
       appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.pink,
          title: new Text(
            "إضافة عامل جديد",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      body: Container(
        height:MediaQuery.of(context).size.height*.9,
          padding: EdgeInsets.fromLTRB(30, 100, 30, 50),
          child:
         Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: RoundedDiagonalPathClipper(),
                    child: Container(
                      height: 550,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        color: Colors.white,
                      ),
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //SizedBox(height: 90.0,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextField(
                            textAlign: TextAlign.right,

                            cursorColor: Color.fromRGBO(10,145,171,1.0),
                            style: TextStyle( color: Color.fromRGBO(10,145,171,1.0)),
                            decoration: InputDecoration(
                                hintText: "اسم العامل",
                                hintStyle: TextStyle(color: Color.fromRGBO(10,145,171,1.0)),
                                border: InputBorder.none,
                               // icon: Icon(Icons.email, color: Color.fromRGBO(10,145,171,1.0),)
                            ),
                          ),
                        ),
                        Container(child: Divider(color: Color.fromRGBO(10,145,171,1.0),), padding: EdgeInsets.only(left: 20.0,right: 20.0, bottom: 10.0),),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextField(
                               textAlign: TextAlign.right,
                              cursorColor: Color.fromRGBO(10,145,171,1.0),
                              style: TextStyle(color: Color.fromRGBO(10,145,171,1.0)),
                              decoration: InputDecoration(
                                  hintText: "المدينة",
                                  hintStyle: TextStyle(color: Color.fromRGBO(10,145,171,1.0)),
                                  border: InputBorder.none,
                                //  icon: Icon(Icons.lock, color: Color.fromRGBO(10,145,171,1.0),)
                              ),
                            )
                        ),
                        Container(child: Divider(color: Color.fromRGBO(10,145,171,1.0),), padding: EdgeInsets.only(left: 20.0,right: 20.0, bottom: 10.0),),
                       Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextField(
                               textAlign: TextAlign.right,
                              cursorColor: Color.fromRGBO(10,145,171,1.0),
                              style: TextStyle(color: Color.fromRGBO(10,145,171,1.0)),
                              decoration: InputDecoration(
                                  hintText: "رقم الهاتف",
                                  hintStyle: TextStyle(color: Color.fromRGBO(10,145,171,1.0)),
                                  border: InputBorder.none,
                                 // icon: Icon(Icons., color: Color.fromRGBO(10,145,171,1.0),)
                              ),
                            )
                        ),
                                                Container(child: Divider(color: Color.fromRGBO(10,145,171,1.0),), padding: EdgeInsets.only(left: 20.0,right: 20.0, bottom: 10.0),),

                         Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextField(
                               textAlign: TextAlign.right,
                              cursorColor: Color.fromRGBO(10,145,171,1.0),
                              style: TextStyle(color: Color.fromRGBO(10,145,171,1.0)),
                              decoration: InputDecoration(
                                  hintText: "الدراسة",
                                  hintStyle: TextStyle(color: Color.fromRGBO(10,145,171,1.0)),
                                  border: InputBorder.none,
                                 // icon: Icon(Icons., color: Color.fromRGBO(10,145,171,1.0),)
                              ),
                            )
                        ),
                                              Container(child: Divider(color: Color.fromRGBO(10,145,171,1.0),), padding: EdgeInsets.only(left: 20.0,right: 20.0, bottom: 10.0),),

                         Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextField(
                               textAlign: TextAlign.right,
                              cursorColor: Color.fromRGBO(10,145,171,1.0),
                              style: TextStyle(color: Color.fromRGBO(10,145,171,1.0)),
                              decoration: InputDecoration(
                                  hintText: "سنوات الخبرة",
                                  hintStyle: TextStyle(color: Color.fromRGBO(10,145,171,1.0)),
                                  border: InputBorder.none,
                                 // icon: Icon(Icons., color: Color.fromRGBO(10,145,171,1.0),)
                              ),
                            )
                        ),
                       // SizedBox(height: 10.0,),
                      ],
                    ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Color.fromRGBO(10,145,171,1.0),
                        child: Icon(Icons.camera_alt),
                      ),
                    ],
                  ),
                  Container(
                    height: 530,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        onPressed: (){},
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                        child: Text("إضافة", style: TextStyle(color: Colors.white)),
                        color: Color.fromRGBO(10,145,171,1.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
        //  ],
        //),
         // ),
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
