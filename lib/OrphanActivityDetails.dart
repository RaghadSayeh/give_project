import 'package:flutter/material.dart';
//import 'package:fruithero/detailsPage.dart';
import 'home2.dart';
import 'ResponsibleNotification.dart';
import 'ResponDataModification.dart';
import 'HomePageResponsible.dart';

class OrphanActivityDetails extends StatefulWidget {
  @override
  _OrphanActivityDetailsState createState() => _OrphanActivityDetailsState();
}

class _OrphanActivityDetailsState extends State<OrphanActivityDetails> {
  @override
  void initState() {
    super.initState();
    print("inside _OrphanActivityDetailsState");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF21BFBD),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.0),
            Padding(
              padding: EdgeInsets.only(top: 3, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('تفاصيل نشاطات الاطفال',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0)),
                  SizedBox(width: 10.0),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 245.0,
              margin: EdgeInsets.only(bottom: 35.0),
              padding: EdgeInsets.only(bottom: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(125.0),
                  bottomLeft: Radius.circular(155.0),
                ),
              ),
              child: ListView(
                primary: false,
                padding: EdgeInsets.only(left: 25.0, right: 20.0),
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 35.0),
                      child: Container(
                          height: MediaQuery.of(context).size.height - 350.0,
                          child: ListView(children: [
                            _buildFoodItem('assets/images/0.png', 'يوم الالوان',
                                '\$24.00'),
                            _buildFoodItem('assets/images/1.png',
                                'تعلم لغة جديدة', '\$22.00'),
                            _buildFoodItem('assets/images/2.png',
                                'يوم الطفل العالمي', '\$26.00'),
                            _buildFoodItem('assets/images/3.png',
                                'قراءة كتاب جديد', '\$24.00'),
                            _buildFoodItem('assets/images/4.png',
                                'ترفيه الاطفال', '\$29.00'),
                          ]))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 65.0,
                        width: 160.0,
                        padding: EdgeInsets.all(6.0),
                        margin: EdgeInsets.only(bottom: 20.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.pink),
                        child: Center(
                            child: Text('إضافة نشاط جديد',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: 15.0))),
                      )
                    ],
                  )
                ],
              ),
            ),
            // SizedBox(height: 40.0),
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

  Widget _buildFoodItem(String imgPath, String foodName, String price) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
            onTap: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => DetailsPage(heroTag: imgPath, foodName: foodName, foodPrice: price)
              // ));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.black,
                      onPressed: () {}),
                  SizedBox(width: 10.0),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(foodName,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold)),
                        Text(price,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15.0,
                                color: Colors.grey))
                      ])
                ])),
                Hero(
                    tag: imgPath,
                    child: Image(
                        image: AssetImage(imgPath),
                        fit: BoxFit.cover,
                        height: 75.0,
                        width: 75.0)),
              ],
            )));
  }
}
