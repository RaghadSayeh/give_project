import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ResponsibleNotification.dart';
import 'ResponsibleSettings.dart';
import 'home2.dart';
import 'HomePageResponsible.dart';


class ResponsibleContact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ResponsibleContactState();
  }
}

class _ResponsibleContactState extends State<ResponsibleContact> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.cyan[300], Colors.cyan[300]],
                  ),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(90))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.person,
                      size: 90,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 32, right: 32),
                      child: Text(
                        'تواصل معنا',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 62),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 50,
                    padding:
                        EdgeInsets.only(top: 6, left: 16, right: 16, bottom: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // icon: Icon(
                        //   Icons.person,
                        //   color: Colors.cyan[300],
                        // ),
                        hintText: 'ما هي مشكلتك',
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 50,
                    margin: EdgeInsets.only(top: 32),
                    padding:
                        EdgeInsets.only(top: 6, left: 16, right: 16, bottom: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextField(
                      obscureText: true,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // icon: Icon(
                        //   Icons.vpn_key,
                        //   color: Colors.cyan[300],
                        // ),
                        hintText:
                            'الرجاء توضيح المشكلة بالتفصيل وسيتم الرد في أسرع وقت',
                      ),
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(top: 16, right: 32),
                  //     child: Text(
                  //       'Forgot Password ?',
                  //       style: TextStyle(color: Colors.grey),
                  //     ),
                  //   ),
                  // ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      // Navigator.pushNamed(context, '/');
                    },
                    child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.cyan[300],
                              Colors.cyan[300],
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Center(
                        child: Text(
                          'إرسال',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
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
    );
  }
}
