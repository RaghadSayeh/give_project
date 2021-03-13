import 'package:flutter/material.dart';
import 'package:give_project/ProfilePage.dart';
import 'LoginORSignup.dart';
import 'NotificationPage.dart';
import 'HomePageSeller.dart';
import 'addNewGood.dart';

class SettingsPage extends StatefulWidget {
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: new Text(
          "صفحة الاعدادات",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23),
        ),
      ),
      body: Container(
          margin: EdgeInsets.all(4.0),
          padding: EdgeInsets.all(4.0),
          child: ListView(
            children: <Widget>[
              ListTile(
                // trailing: ,
                trailing: Icon(Icons.track_changes),
                title: Text(
                  'متابعة طلبات المتبرعين',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.rtl,
                ),
              ),
              ListTile(
                trailing: Icon(Icons.add),
                title: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new AddNewGood()));
                  },
                  child: Text(
                    'إضافة سلعة جديدة',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
              ListTile(
                trailing: Icon(Icons.update),
                title: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new ProfilePage()));
                  },
                  child: Text(
                    'تعديل الملف الخاص',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
              ListTile(
                trailing: Icon(Icons.edit_attributes),
                title: Text(
                  'تفاصيل السلع',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.rtl,
                ),
              ),
              ListTile(
                trailing: Icon(Icons.contact_page),
                title: Text(
                  'تواصل معنا',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.rtl,
                ),
              ),
              ListTile(
                trailing: Icon(Icons.logout),
                title: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new LoginORSignup()));
                  },
                  child: Text(
                    'تسجيل الخروج',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ],
          )),
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
                      ? null
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
