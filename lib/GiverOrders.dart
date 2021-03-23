import 'package:flutter/material.dart';
import 'NotificationPage.dart';
import 'SettingsPage.dart';
import 'LoginORSignup.dart';
import 'HomePageSeller.dart';
import 'background.dart';
import 'HistoryDataList.dart';
import 'HistotyData.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'SellType.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:slimy_card/slimy_card.dart';

class GiverOrders extends StatefulWidget {
  @override
  _GiverOrdersState createState() => new _GiverOrdersState();
}

class _GiverOrdersState extends State<GiverOrders> {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();

  List<String> items = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8"
  ];

  List<String> images = [
    '178.jpg',
    '112.jpg',
    '125.png',
    '118.jpg',
    '178.jpg',
    '119.jpg',
    '113.jpg',
    '115.jpg',
    '178.jpg',
    '112.jpg',
    '125.png',
    '118.jpg',
    '178.jpg',
    '119.jpg',
    '113.jpg',
    '115.jpg',
    '178.jpg',
    '112.jpg',
    '125.png',
    '118.jpg',
    '178.jpg',
    '119.jpg',
    '113.jpg',
    '115.jpg',
    '115.jpg',
  ];
  List<String> headers = [
    "تبرع دار أيتام جنين",
    "تبرع جمعية الاتحاد النسائي",
    "تبرع دار أيتام سلفيت",
    "تبرع ذوي الاحتياجات الخاصة",
    "تبرع دار أيتام نابلس",
    "تبرع دار أيتام طولكرم",
    "تبرع دار أيتام قلقيلية",
    "تبرع دار أيتام رام الله"
  ];

  Future<void> getHistory() async {
    HistoryDataList.hd = new List();
    var url = 'https://relative-limp.000webhostapp.com/getSellerHistory.php';
    print("getHistory api:");

    var response = await http.post(url, body: {"sellerid": sellType.seller_id});

    print("status code is");
    print(response.statusCode);
    print(json.decode(response.body));

    final res = json.decode(response.body);

    if (res == 'Failed to get seller history') {
      print("Failed to get seller history");
      //  showAlertDialog(context);
    } else {
      print("from getHistory details dta");

      List<dynamic> jsonObj = res;
      for (int i = 0; i < jsonObj.length; i++) {
        Map<String, dynamic> doclist = jsonObj[i];
        String giverid = doclist['giverid'];
        String responsiblename = doclist['responsiblename'];
        String finalprice = doclist['finalprice'];
        String orderdate = doclist['orderdate'];
        String orderrecievedseller = doclist['orderrecievedseller'];
        String orderrecievedrespon = doclist['orderrecievedrespon'];
        String goodsname = doclist['goodsname'];
        String goodsid = doclist['goodsid'];
        String goodsquan = doclist['goodsquan'];
        String goodsprice = doclist['goodsprice'];

        print(giverid);
        print(responsiblename);
        print(finalprice);
        print(orderdate);
        print(orderrecievedseller);
        print(goodsname);
        print(orderrecievedrespon);
        print(goodsid);
        print(goodsquan);
        print(goodsprice);

        HistoryData gd = new HistoryData();
        gd.giverid = giverid;
        gd.responsiblename = responsiblename;
        gd.finalprice = finalprice;
        gd.orderdate = orderdate;
        gd.orderrecievedseller = orderrecievedseller;
        gd.goodsname = goodsname;
        gd.goodsid = goodsid;
        gd.goodsquan = goodsquan;
        gd.goodsprice = goodsprice;

        HistoryDataList.hd.add(gd);
      }
      setState(() {});
    }
  }

  Widget bottomCardWidget(String y, String x, String z) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 3),
        Text(
          y,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 3),
        Text(
          x,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 3),
        Text(
          z,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget topCardWidget(
      String imagePath, String x, String y, String z, String n) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: AssetImage(imagePath)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Text(
          x,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(height: 15),
        Text(
          y,
          style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10),
        Text(
          z,
          style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10),
        Text(
          n,
          style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    getHistory();
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    final body = new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: new Text(
          "أرشيف الطلبات",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: ListView.builder(
          itemCount: HistoryDataList.hd.length,
          itemBuilder: (context, index) {
            return new Column(
              children: [
                SlimyCard(
                  color: Colors.cyan[300],
                  // In topCardWidget below, imagePath changes according to the
                  // status of the SlimyCard(snapshot.data).
                  topCardWidget: topCardWidget(
                      'assets/images/' + images[index],
                      HistoryDataList.hd[index].responsiblename,
                      HistoryDataList.hd[index].giverid,
                      HistoryDataList.hd[index].finalprice,
                      HistoryDataList.hd[index].orderdate),
                  bottomCardWidget: bottomCardWidget(
                      HistoryDataList.hd[index].goodsname,
                      HistoryDataList.hd[index].goodsprice,
                      HistoryDataList.hd[index].goodsquan),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            );
          }),
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

    return new Container(
      decoration: new BoxDecoration(
        color: Colors.pink,
      ),
      child: new Stack(
        children: <Widget>[
          new CustomPaint(
            size: new Size(_width, _height),
            painter: new Background(),
          ),
          body,
        ],
      ),
    );
  }
}
// class GiverOrders extends StatefulWidget {
//   _GiverOrdersState createState() => _GiverOrdersState();
// }

// class _GiverOrdersState extends State<GiverOrders> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         backgroundColor: Theme.of(context).primaryColor,
//         title: new Text(
//           "طلبات المتبرعين",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Container(
//         child: Column(
//           children: [],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         type: BottomNavigationBarType.fixed,
//         currentIndex: 2,
//         onTap: (value) async {
//           value == 0
//               ? Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => new HomePageSeller()))
//               : value == 1
//                   ? Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => new NotificationPage()))
//                   : value == 2
//                       ? Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => new SettingsPage()))
//                       : Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => new LoginORSignup()));
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: new Icon(Icons.home),
//             title: new Text('الرئيسية'),
//           ),
//           BottomNavigationBarItem(
//             icon: new Icon(Icons.notifications),
//             title: new Text('الاشعارات'),
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.settings), title: Text('الاعدادات')),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.logout), title: Text('تسجيل الخروج'))
//         ],
//       ),
//     );
//   }
// }
