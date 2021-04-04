import 'package:flutter/material.dart';
import 'NotificationPage.dart';
import 'SettingsPage.dart';
import 'LoginORSignup.dart';
import 'HomePageSeller.dart';
import 'package:http/http.dart' as http;
import 'GiverTrackList.dart';
import 'GiverTrackDta.dart';
import 'dart:convert';
import 'SellType.dart';
import 'GiverTrackList1.dart';
import 'GoodsTrackDetails.dart';
import 'TrackDetails.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'home2.dart';

class GiverOrdersTrack extends StatefulWidget {
  _GiverOrdersTrackState createState() => _GiverOrdersTrackState();
}

class _GiverOrdersTrackState extends State<GiverOrdersTrack> {
  @override
  void initState() {
    print("we are in giverorders track");
    getOrdersTrack();
    super.initState();
  }

  List<String> images = [
    'assets/images/115.jpg',
    'assets/images/119.jpg',
    '',
    '',
    '',
    '',
    '',
    ''
  ];

  Future<void> getOrdersTrack() async {
    GiverTrackList.gl = new List();
    GiverTrackList1.gl = new List();
    var url = 'https://relative-limp.000webhostapp.com/getGoodsTrack.php';
    print("getHistory api:");

    var response =
        await http.post(url, body: {"SellerName": sellType.seller_id});

    print("status code is");
    print(response.statusCode);
    print(json.decode(response.body));

    final res = json.decode(response.body);

    if (res == 'Failed to get goodstrack') {
      print("Failed to get goodstrack");
      //  showAlertDialog(context);
    } else {
      print("get goodstrack dta successfully");

      List<dynamic> jsonObj = res;
      for (int i = 0; i < jsonObj.length; i++) {
        Map<String, dynamic> doclist = jsonObj[i];
        String ResponsibleName = doclist['ResponsibleName'];
        String GiverName = doclist['GiverName'];
        String Status = doclist['Status'];
        String OrderDte = doclist['OrderDte'];
        String SellerSentDt = doclist['SellerSentDt'];
        String ResponsibleSentDt = doclist['ResponsibleSentDt'];
        String Goodsname = doclist['Goodsname'];
        String finalprice = doclist['finalprice'];
        String goodsid = doclist['goodsid'];
        String goodsprice = doclist['goodsprice'];
        String goodsquan = doclist['goodsquan'];
        String goodspic = doclist['goodspic'];

        GiverTrackDta gd = new GiverTrackDta();
        gd.ResponsibleName =
            ResponsibleName == null ? 'No name found' : ResponsibleName;
        gd.GiverName = GiverName == null ? 'No name found' : GiverName;
        gd.Status = Status;
        gd.OrderDte = OrderDte;
        gd.SellerSentDt =
            SellerSentDt == null ? 'Order In Progress' : SellerSentDt;
        gd.ResponsibleSentDt = ResponsibleSentDt == null
            ? 'RespOrder In Progress'
            : ResponsibleSentDt;
        gd.Goodsname = Goodsname;
        gd.finalprice = finalprice;
        if (gd.Status == 'Done') {
          GiverTrackList1.gl.add(gd);
        } else {
          GiverTrackList.gl.add(gd);
        }
      }
      setState(() {});
    }
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
        body: GiverTrackList.gl.length == 0 && GiverTrackList1.gl.length == 0
            ? Center(
                child: new Text("... جاري تحميل البيانات"),
              )
            : Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: ShowUpAnimation(
                      animationDuration: Duration(seconds: 2),
                      delayStart: Duration(seconds: 1),
                      child: Text(
                        'الطلبات التي تم تسليمها من البائع فقط',
                        key: Key('Slo Mo'),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    //  Text('الطلبات التي تم تسليمها من البائع فقط',
                    //     textAlign: TextAlign.right,
                    //     //  textDirection: TextDirection.rtl,
                    //     style: GoogleFonts.mcLaren(
                    //       fontSize: 18,
                    //       color: Colors.black,
                    //       shadows: [
                    //         Shadow(
                    //           blurRadius: 150.0,
                    //           color: Colors.black,
                    //           // offset: Offset(5.0, 5.0),
                    //         ),
                    //       ],
                    //     )
                    //     ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: GiverTrackList1.gl.length,
                      itemBuilder: (BuildContext context, int index) => Card(
                          color: Theme.of(context).primaryColor,
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32)),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.45,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 5, top: 15),
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  child: GiverTrackList1.gl[index].Goodsname ==
                                          'أحذية أطفال'
                                      ? Image.asset(
                                          "assets/images/115.jpg",
                                          fit: BoxFit.fill,
                                        )
                                      : GiverTrackList1.gl[index].Goodsname ==
                                              'أحذية بنات'
                                          ? Image.asset(
                                              "assets/images/119.jpg",
                                              fit: BoxFit.fill,
                                            )
                                          : GiverTrackList1
                                                      .gl[index].Goodsname ==
                                                  'فساتين'
                                              ? Image.asset(
                                                  "assets/images/123.jpg",
                                                  fit: BoxFit.fill,
                                                )
                                              : GiverTrackList1.gl[index]
                                                          .Goodsname ==
                                                      'بناطلين'
                                                  ? Image.asset(
                                                      "assets/images/178.jpg",
                                                      fit: BoxFit.fill,
                                                    )
                                                  : GiverTrackList1.gl[index]
                                                              .Goodsname ==
                                                          'حجابات'
                                                      ? Image.asset(
                                                          "assets/images/225.png",
                                                          fit: BoxFit.fill,
                                                        )
                                                      : GiverTrackList1
                                                                  .gl[index]
                                                                  .Goodsname ==
                                                              'أحذية أولاد'
                                                          ? Image.asset(
                                                              "assets/images/205.png",
                                                              fit: BoxFit.fill,
                                                            )
                                                          : GiverTrackList1
                                                                      .gl[index]
                                                                      .Goodsname ==
                                                                  'بجامات'
                                                              ? Image.asset(
                                                                  "assets/images/112.jpg",
                                                                  fit: BoxFit
                                                                      .fill,
                                                                )
                                                              : Image.asset(
                                                                  //طقم رسمي
                                                                  "assets/images/232.png",
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                    child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        print("go to details");
                                        TrackDetails.givername =
                                            GiverTrackList1.gl[index].GiverName;
                                        TrackDetails.orderdte =
                                            GiverTrackList1.gl[index].OrderDte;
                                        TrackDetails.resId = GiverTrackList1
                                            .gl[index].ResponsibleName;
                                        TrackDetails.goodsname =
                                            GiverTrackList1.gl[index].Goodsname;
                                        TrackDetails.finalprice =
                                            GiverTrackList1
                                                .gl[index].finalprice;
                                        TrackDetails.img = GiverTrackList1
                                                    .gl[index].Goodsname ==
                                                'أحذية أطفال'
                                            ? "assets/images/115.jpg"
                                            : GiverTrackList1
                                                        .gl[index].Goodsname ==
                                                    'أحذية بنات'
                                                ? "assets/images/119.jpg"
                                                : GiverTrackList1.gl[index]
                                                            .Goodsname ==
                                                        'فساتين'
                                                    ? "assets/images/123.jpg"
                                                    : GiverTrackList1.gl[index]
                                                                .Goodsname ==
                                                            'بناطلين'
                                                        ? "assets/images/178.jpg"
                                                        : GiverTrackList1
                                                                    .gl[index]
                                                                    .Goodsname ==
                                                                'حجابات'
                                                            ? "assets/images/225.png"
                                                            : GiverTrackList1
                                                                        .gl[
                                                                            index]
                                                                        .Goodsname ==
                                                                    'أحذية أولاد'
                                                                ? "assets/images/205.png"
                                                                : GiverTrackList1
                                                                            .gl[index]
                                                                            .Goodsname ==
                                                                        'بجامات'
                                                                    ? "assets/images/112.jpg"
                                                                    : "assets/images/232.png";

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    new GoodsTrackDetails()));
                                        //GoodsTrackDetails
                                      },
                                      child: Icon(Icons.arrow_forward),
                                    ),
                                    SizedBox(width: 20),
                                    new Text(
                                        GiverTrackList1
                                            .gl[index].ResponsibleName,
                                        //  textAlign:TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ))
                              ],
                            ),
                          )),
                      //  ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: ShowUpAnimation(
                      animationDuration: Duration(seconds: 2),
                      delayStart: Duration(seconds: 1),
                      child: Text(
                        'الطلبات التي لم تنتهي من كلا الجهتين',
                        key: Key('Slo Mo'),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(top: 10),
                        color: Colors.white,
                        child: GridView.count(
                          crossAxisCount: 2,
                          children:
                              List.generate(GiverTrackList.gl.length, (index) {
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
                                    padding:
                                        const EdgeInsets.fromLTRB(5.0, 0, 5, 0),
                                    child: SizedBox(
                                      height: 120,
                                      child: GestureDetector(
                                        onTap: () async {},
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: new ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0)),
                                              child: GiverTrackList.gl[index]
                                                          .Goodsname ==
                                                      'أحذية أطفال'
                                                  ? Image.asset(
                                                      "assets/images/115.jpg",
                                                      fit: BoxFit.fill,
                                                    )
                                                  : GiverTrackList.gl[index]
                                                              .Goodsname ==
                                                          'أحذية بنات'
                                                      ? Image.asset(
                                                          "assets/images/119.jpg",
                                                          fit: BoxFit.fill,
                                                        )
                                                      : GiverTrackList.gl[index]
                                                                  .Goodsname ==
                                                              'فساتين'
                                                          ? Image.asset(
                                                              "assets/images/123.jpg",
                                                              fit: BoxFit.fill,
                                                            )
                                                          : GiverTrackList
                                                                      .gl[index]
                                                                      .Goodsname ==
                                                                  'بناطلين'
                                                              ? Image.asset(
                                                                  "assets/images/178.jpg",
                                                                  fit: BoxFit
                                                                      .fill,
                                                                )
                                                              : GiverTrackList
                                                                          .gl[
                                                                              index]
                                                                          .Goodsname ==
                                                                      'حجابات'
                                                                  ? Image.asset(
                                                                      "assets/images/225.png",
                                                                      fit: BoxFit
                                                                          .fill,
                                                                    )
                                                                  : GiverTrackList.gl[index].Goodsname ==
                                                                          'أحذية أولاد'
                                                                      ? Image
                                                                          .asset(
                                                                          "assets/images/205.png",
                                                                          fit: BoxFit
                                                                              .fill,
                                                                        )
                                                                      : GiverTrackList.gl[index].Goodsname ==
                                                                              'بجامات'
                                                                          ? Image
                                                                              .asset(
                                                                              "assets/images/112.jpg",
                                                                              fit: BoxFit.fill,
                                                                            )
                                                                          : Image
                                                                              .asset(
                                                                              //طقم رسمي
                                                                              "assets/images/232.png",
                                                                              fit: BoxFit.fill,
                                                                            ),
                                            )),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    //    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(
                                            right: 10.0, top: 5),
                                        child: Text(
                                          GiverTrackList
                                              .gl[index].ResponsibleName,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            //  fontFamily: "palfont",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(
                                            width: 30,
                                            height: 25,
                                            child: IconButton(
                                              icon:
                                                  new Icon(Icons.arrow_forward),
                                              color: Colors.white,
                                              onPressed: () async {
                                                TrackDetails.givername =
                                                    GiverTrackList
                                                        .gl[index].GiverName;
                                                TrackDetails.orderdte =
                                                    GiverTrackList
                                                        .gl[index].OrderDte;
                                                TrackDetails.resId =
                                                    GiverTrackList.gl[index]
                                                        .ResponsibleName;
                                                TrackDetails.goodsname =
                                                    GiverTrackList
                                                        .gl[index].Goodsname;
                                                TrackDetails.finalprice =
                                                    GiverTrackList
                                                        .gl[index].finalprice;
                                                TrackDetails
                                                    .img = GiverTrackList
                                                            .gl[index]
                                                            .Goodsname ==
                                                        'أحذية أطفال'
                                                    ? "assets/images/115.jpg"
                                                    : GiverTrackList.gl[index]
                                                                .Goodsname ==
                                                            'أحذية بنات'
                                                        ? "assets/images/119.jpg"
                                                        : GiverTrackList
                                                                    .gl[index]
                                                                    .Goodsname ==
                                                                'فساتين'
                                                            ? "assets/images/123.jpg"
                                                            : GiverTrackList
                                                                        .gl[
                                                                            index]
                                                                        .Goodsname ==
                                                                    'بناطلين'
                                                                ? "assets/images/178.jpg"
                                                                : GiverTrackList
                                                                            .gl[
                                                                                index]
                                                                            .Goodsname ==
                                                                        'حجابات'
                                                                    ? "assets/images/225.png"
                                                                    : GiverTrackList.gl[index].Goodsname ==
                                                                            'أحذية أولاد'
                                                                        ? "assets/images/205.png"
                                                                        : GiverTrackList.gl[index].Goodsname ==
                                                                                'بجامات'
                                                                            ? "assets/images/112.jpg"
                                                                            : "assets/images/232.png";

                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            new GoodsTrackDetails()));
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
                  ),
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
                          builder: (context) => new HomePageSeller()))
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
