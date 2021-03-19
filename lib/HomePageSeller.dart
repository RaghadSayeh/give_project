import 'package:flutter/material.dart';
import 'LoginORSignup.dart';
import 'SellType.dart';
import 'NotificationPage.dart';
import 'SettingsPage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'GoodsData.dart';
import 'GoodsList.dart';
import 'SellDetails.dart';

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

  Future getMainGoods() async {
    GoodsList.gl = new List();
    var url = 'https://relative-limp.000webhostapp.com/getMainGoods.php';
    print("getMainGoods api:");
    print(sellType.seller_id.toString());

    var response = await http.post(url, body: {"username": sellType.seller_id});

    print("status code is");
    print(response.statusCode);
    print(json.decode(response.body));

    final res = json.decode(response.body);

    if (res == 'Failed to get goods') {
      print("failed to get main goods");
      //  showAlertDialog(context);
    } else {
      print("from static dta");
      print(sellType.sell_type);

      List<dynamic> jsonObj = res;
      for (int i = 0; i < jsonObj.length; i++) {
        Map<String, dynamic> doclist = jsonObj[i];
        String goodsname = doclist['goodsname'];
        String pic = doclist['pic'];

        print(goodsname);
        print(pic);

        GoodsData gd = new GoodsData();
        gd.goodsname = goodsname;
        gd.pic = pic;

        print("length of pic");
        print(gd.pic.length);

        GoodsList.gl.add(gd);
      }
      setState(() {});
    }
  }

  void goToDetails(String goodsName) async {
    sellType.goodsName = goodsName;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => new SellDetails()));
  }

  @override
  void initState() {
    super.initState();
    print("test homepage");
    getMainGoods();
  }

  void deleteGoods(String picnum, String goodsname) async {
    var url = 'https://relative-limp.000webhostapp.com/deleteMainGoods.php';
    print("the data is");

    var response = await http.post(url, body: {
      "username": sellType.seller_id,
      "goodsname": goodsname,
      "pic": picnum
    });

    print("status code is");
    print(response.statusCode);
    print(json.decode(response.body));

    final res = json.decode(response.body);

    if (res == 'delete maingoods successfully') {
      print("Update goodsinfo successfully");
      // showAlertDialog(context);
      //if update done successfully then must refresh the goods in order to take new update
      getMainGoods();
    } else {
      //  showAlertDialog(context);  must be for failed edit
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: new Text(
          "الصفحة الرئيسية",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: GoodsList.gl.length == 0
          ? Center(
              child: new Text(
              "جاري التحميل",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ))
          : Container(
              padding: EdgeInsets.only(top: 10),
              color: Colors.white,
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(GoodsList.gl.length, (index) {
                  return GestureDetector(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    child: GoodsList.gl[index].pic.length < 8
                                        ? Image.asset(
                                            "assets/images/" +
                                                GoodsList.gl[index].pic
                                                    .toString() +
                                                '.jpg',
                                            fit: BoxFit.cover,
                                          )
                                        : Image.memory(
                                            base64Decode(
                                                GoodsList.gl[index].pic),
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
                                GoodsList.gl[index].goodsname,
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
                                    icon: new Icon(Icons.delete),
                                    color: Colors.white,
                                    onPressed: () async {
                                      deleteGoods(GoodsList.gl[index].pic,
                                          GoodsList.gl[index].goodsname);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: IconButton(
                                    icon: new Icon(Icons.more_vert),
                                    color: Colors.white,
                                    onPressed: () async {
                                      print("person icon");
                                      setState(() {
                                        goToDetails(
                                            GoodsList.gl[index].goodsname);
                                      });
                                    },
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
