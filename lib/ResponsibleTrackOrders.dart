import 'package:flutter/material.dart';
import 'HomePageResponsible.dart';
import 'home2.dart';
import 'ResponsibleNotification.dart';
import 'ResponsibleSettings.dart';

class ResponsibelTrackOrders extends StatefulWidget {
  ResponsibelTrackOrdersState createState() => ResponsibelTrackOrdersState();
}

class ResponsibelTrackOrdersState extends State<ResponsibelTrackOrders> {
  @override
  void initState() {
    super.initState();
    print("ResponsibelTrackOrdersState called");
  }

  List<String> orders = [
    'محلات الريحاوي للالبسة',
    'عزام للاحذية',
    'العتبة للفرش المنزلي',
    'مكتبة الاتحاد',
    'سوق القدومي للزي المدرسي',
    'محلات الواحة الخضراء',
    'محلات السيد للالبسة'
  ];

  List<String> ordersDate = [
    '2021-04-29',
    '2021-04-04',
    '2021-03-14',
    '2021-05-01',
    '2021-04-01',
    '2021-02-02',
    '2021-02-28'
  ];

  Future<void> askforRecieve(
      BuildContext context, String pic, String name) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: new Text(
              'هل أنت متأكد من أنك قمت باستلام الطلب من قبل هذا البائع؟',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
              textAlign: TextAlign.right,
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    //this will update the order in database table
                    Navigator.pop(context);
                  },
                  child: Text("تم")),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("إلغاء")),
            ],
          );
        });
  }

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
          "متابعة طلبات المتبرعين",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(6.0),
          child: new Container(
              height: MediaQuery.of(context).size.height * 0.90,
              child: ListView.builder(
                itemCount: orders.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () async {},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                    child: Card(
                      color: Colors.white,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                                child: Row(
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.check_box_outline_blank_outlined,
                                      color: Colors.pink,
                                    ),
                                    onPressed: () {
                                      print(
                                          "this will be checked by Respon after recieve the order");
                                    }),
                                IconButton(
                                    icon: Icon(
                                      Icons.more_horiz,
                                      color: Colors.pink,
                                    ),
                                    onPressed: () {
                                      print("go for details about the order");
                                    }),
                              ],
                            )),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.62,
                              child: Column(
                                //    mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Container(
                                            child: new Text(
                                              orders[index],
                                              style: TextStyle(
                                                  fontFamily: 'NeoSansArabic',
                                                  fontSize: 20.0),
                                            ),
                                          ),
                                          SizedBox(height: 5.0),
                                          Container(
                                            child: new Text(
                                              ordersDate[index],
                                              style: TextStyle(
                                                  fontFamily: 'NeoSansArabic',
                                                  color: Colors.pink),
                                            ),
                                          ),
                                          SizedBox(height: 5.0),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                width: 12.0,
                                height: 95,
                                decoration: BoxDecoration(
                                    color: Colors.pink, //amberAccent
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10.0),
                                    ))),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ))),
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
                ? Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new HomePageRes()))
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
      ),
    );
  }
}
