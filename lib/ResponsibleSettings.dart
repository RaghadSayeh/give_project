import 'package:flutter/material.dart';
import 'ResponActivitiesList.dart';
import 'HomePageResponsible.dart';
import 'home2.dart';
import 'ResponsibleNotification.dart';

class ResponsibleSettings extends StatefulWidget {
  ResponsibleSettingsState createState() => ResponsibleSettingsState();
}

class ResponsibleSettingsState extends State<ResponsibleSettings> {
  @override
  void initState() {
    super.initState();
  }

  List<String> settings = [
    'إضافة يتيم جديد',
    'نشاطات الأيتام',
    'متابعة طلبات المتبرعين',
    'مشاكل الميتم',
    'طلب تبرع جديد',
    'إضافة عامل جديد',
    'تعديل معلومات الميتم',
    'أرشيف طلبات الميتم',
    'تواصل معنا'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
            "صفحة الاعدادات",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
            padding: EdgeInsets.only(top: 10),
            color: Colors.grey[100],
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(9, (index) {
                return GestureDetector(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  margin: EdgeInsets.fromLTRB(10, 2, 10, 5),
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 0, 5, 0),
                        child: SizedBox(
                          height: 65,
                          child: GestureDetector(
                            onTap: () async {},
                            child: Container(
                                //  color:Colors.pink,
                                width: MediaQuery.of(context).size.width,
                                child: new ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    child: Icon(Icons.add,
                                        color: Colors.pink, size: 20))),
                          ),
                        ),
                        //              Container(
                        //   margin: EdgeInsets.all(20),
                        //   padding: EdgeInsets.all(10),
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(100),
                        //       border: Border.all(width: 2, color: Colors.white)),
                        //   child: Icon(
                        //     Icons.cancel,
                        //     color: Colors.white,
                        //   ),
                        // )
                      ),

                      //  ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding:
                                EdgeInsets.only(left: 10.0, top: 5, bottom: 5),
                            child: Text(
                              settings[index],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                //  fontFamily: "palfont",
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 150,
                                height: 55,
                                child: RaisedButton(
                                  highlightElevation: 0.0,
                                  elevation: 0.0,
                                  color: Theme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(15.0)),
                                  child: Text(
                                    "إضافة",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ));
              }),
            )),
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
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new HomePageRes()))
                  : value == 1
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  new ResponsibleNotification()))
                      : value == 2
                          ? null
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
        ));
  }
}
