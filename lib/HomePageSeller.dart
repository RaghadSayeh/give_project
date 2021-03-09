import 'package:flutter/material.dart';
import 'clipper.dart';
import 'LoginORSignup.dart';
import 'SellType.dart';
import 'NotificationPage.dart';
import 'SettingsPage.dart';

class HomePageSeller extends StatefulWidget {
  @override
  HomePageSellerState createState() => HomePageSellerState();
}

class HomePageSellerState extends State<HomePageSeller> {
  List<String> images = [
    '111.jpg',
    '123.jpg',
    '108.jpg',
    '126.jpg',
    '120.jpg',
    '119.jpg',
    '121.jpg',
    '107.jpg'
  ];
  List<String> names = [
    'بجامات',
    'فساتين ',
    'بلايز بنات',
    'حجابات',
    'أحذية أطفال',
    'أحذية بنات',
    'أحذية أولاد',
    'بناطلين'
  ];

  List<String> images1 = [
    '77.jpg',
    '67.jpg',
    '64.jpg',
    '70.jpg',
    '71.jpg',
    '69.jpg',
    '73.jpg',
    '74.jpg',
  ];
  List<String> names1 = [
    'منظفات',
    'خضار',
    'فواكه',
    'دجاج',
    'لحوم',
    'معلبات',
    'تسالي',
    'أجبان وألبان',
  ];

  @override
  void initState() {
    super.initState();
    print("test homepage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: new Text(
          "الصفحة الرئيسية",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 10),
          color: Colors.white,
          child: sellType.sell_type == 'ملابس'
              ? GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(8, (index) {
                    return GestureDetector(
                        child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      margin: EdgeInsets.fromLTRB(10, 2, 10, 5),
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5.0, 0, 5, 0),
                            child: SizedBox(
                              height: 120,
                              child: GestureDetector(
                                onTap: () async {},
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: new ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      child: Image.asset(
                                        "assets/images/" + images[index],
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 10.0, top: 5),
                                child: Text(
                                  names[index],
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    //  fontFamily: "palfont",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: IconButton(
                                      icon: new Icon(Icons.person),
                                      color: Colors.white,
                                      onPressed: () async {
                                        print("person icon");
                                        setState(() {
                                          setState(() {});
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: IconButton(
                                      icon: new Icon(Icons.camera),
                                      color: Colors.white,
                                      onPressed: () async {},
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: IconButton(
                                      icon: new Icon(Icons.mail),
                                      color: Colors.white,
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ));
                  }),
                )
              : GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(8, (index) {
                    return GestureDetector(
                        child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      margin: EdgeInsets.fromLTRB(10, 2, 10, 5),
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5.0, 0, 5, 0),
                            child: SizedBox(
                              height: 120,
                              child: GestureDetector(
                                onTap: () async {},
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: new ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      child: Image.asset(
                                        "assets/images/" + images1[index],
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 10.0, top: 5),
                                child: Text(
                                  names1[index],
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    //  fontFamily: "palfont",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: IconButton(
                                      icon: new Icon(Icons.person),
                                      color: Colors.white,
                                      onPressed: () async {
                                        print("person icon");
                                        setState(() {
                                          setState(() {});
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: IconButton(
                                      icon: new Icon(Icons.camera),
                                      color: Colors.white,
                                      onPressed: () async {},
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: IconButton(
                                      icon: new Icon(Icons.mail),
                                      color: Colors.white,
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (value) async {
          value == 1
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
