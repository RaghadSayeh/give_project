import 'package:flutter/material.dart';
import 'NotificationPage.dart';
import 'SettingsPage.dart';
import 'LoginORSignup.dart';
import 'HomePageSeller.dart';

class GiverOrders extends StatefulWidget {
  _GiverOrdersState createState() => _GiverOrdersState();
}

class _GiverOrdersState extends State<GiverOrders> {
  @override
  void initState() {
    super.initState();
  }

//completed and cancelled orders
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: new Text(
          "طلبات المتبرعين",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        onTap: (value) async {
          value == 0
              ? Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new HomePageSeller()))
              : value == 1
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new NotificationPage()))
                  : value == 2
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new SettingsPage()))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new LoginORSignup()));
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
    );
  }
}
