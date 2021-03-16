import 'package:flutter/material.dart';
import 'clipper.dart';
import 'LoginORSignup.dart';
import 'SellType.dart';
import 'NotificationPage.dart';
import 'SettingsPage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'GoodsData.dart';
import 'GoodsList.dart';
import 'dart:typed_data';
import 'GoodsSellList.dart';
import 'SellData.dart';
import 'HomePageSeller.dart';

class SellDetails extends StatefulWidget {
  @override
  SellDetailsState createState() => SellDetailsState();
}

class SellDetailsState extends State<SellDetails> {
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

  Future getMainGoods() async {
    GoodsSellList.list = new List();
    var url = 'https://relative-limp.000webhostapp.com/getGoodsDetails.php';
    print("getGoodsDetails api:");

    var response = await http.post(url,
        body: {"userid": sellType.seller_id, "goodsname": sellType.goodsName});

    print("status code is");
    print(response.statusCode);
    print(json.decode(response.body));

    final res = json.decode(response.body);

    if (res == 'Failed to get goodsDetails') {
      print("Failed to get goodsDetails");
      //  showAlertDialog(context);
    } else {
      print("from getMainGoods details dta");

      List<dynamic> jsonObj = res;
      for (int i = 0; i < jsonObj.length; i++) {
        Map<String, dynamic> doclist = jsonObj[i];
        String price = doclist['price'];
        String quantity = doclist['quantity'];
        String explanation = doclist['explanation'];
        String picnum = doclist['picnum'];

        print(price);
        print(quantity);
        print(explanation);
        print(picnum);

        SellData gd = new SellData();
        gd.price = price;
        gd.quantity = quantity;
        gd.explanation = explanation;
        gd.picnum = picnum;

        GoodsSellList.list.add(gd);
      }
      setState(() {});
    }
  }

  void deleteitem() async {}

  void goToDetails() async {}

  @override
  void initState() {
    super.initState();
    print("test homepage");
    getMainGoods();
  }

  Widget _buildList() {
    var widthsize = MediaQuery.of(context).size.width;

    return ListView.builder(
        itemCount: GoodsSellList.list.length,
        itemBuilder: (context, index) {
          return Column(children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              width: 140,
              height: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    
                      image: AssetImage("assets/images/"+GoodsSellList.list[index].picnum+".png", ),
                      fit: BoxFit.cover,)),
              child: new Text(""),
            ),
            Container(
              child: Padding(
                  padding: const EdgeInsets.only(left: 0.0, top: 0, bottom: 0),
                  child: GestureDetector(
                    onTap: () async {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(9.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  // Container(
                                  //   width:
                                  //       MediaQuery.of(context).size.width * .3,
                                  //   child: Container(
                                  //     //  width: 160,
                                  //     //height: 150,
                                  //     decoration: BoxDecoration(
                                  //       border: Border.all(
                                  //         color: Theme.of(context).primaryColor,
                                  //       ),
                                  //       //borderRadius: BorderRadius.all(Radius.circular(50))
                                  //     ),
                                  //     margin: EdgeInsets.fromLTRB(10, 2, 10, 5),
                                  //     //  padding: EdgeInsets.all(2),
                                  //     child: Image(
                                  //       image: AssetImage('assets/33.png'),
                                  //       fit: BoxFit.fill,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(9.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      child: Text(
                                        "السعر: ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  // SizedBox(
                                  //   width: 20,
                                  // ),
                                  Expanded(
                                      child: new Text(
                                    GoodsSellList.list[index].price,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ))
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(9.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .3,
                                    child: Text(
                                      "الكمية: ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 20,
                                  // ),
                                  Expanded(
                                      //flex: 2,
                                      child: new Text(
                                   GoodsSellList.list[index].quantity,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ))
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(9.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      child: Text(
                                        "شرح بسيط: ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  // SizedBox(
                                  //   width: 20,
                                  // ),
                                  Expanded(
                                      child: new Text(
                                    GoodsSellList.list[index].explanation,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                padding: const EdgeInsets.all(0),
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        padding:
                                            EdgeInsets.only(top: 10, bottom: 5),
                                        child: GestureDetector(
                                          onTap: () {
                                            print(
                                                "Join meeting feature will be implemented later");
                                          },
                                          child: Icon(Icons.delete),
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        padding:
                                            EdgeInsets.only(top: 10, bottom: 5),
                                        child: GestureDetector(
                                          onTap: () {
                                            print(
                                                "Join meeting feature will be implemented later");
                                          },
                                          child: Icon(Icons.edit),
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        padding:
                                            EdgeInsets.only(top: 10, bottom: 5),
                                        child: GestureDetector(
                                          onTap: () {
                                            print(
                                                "Join meeting feature will be implemented later");
                                          },
                                          child: Icon(Icons.add_box),
                                        )),
                                  ],
                                )),
                          ],
                        ),

                        //       ]
                        //         )
                      ),
                    ),
                  )),
              margin: EdgeInsets.only(top: 8, left: 10, right: 10),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                // border: Border.all(color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.grey,
              width: widthsize,
              height: 1.0,
              margin: EdgeInsets.only(left: 0.0),
            ),
          ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: _buildList(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (value) async {
          value ==0 ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new HomePageSeller())) :value == 1
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
