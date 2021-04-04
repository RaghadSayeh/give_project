import 'package:flutter/material.dart';
import 'TrackDetails.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'SellType.dart';
import 'GoodsTrackDtl.dart';
import 'GoodsTrackDtlList.dart';
//import 'package:expandable/expandable.dart';
import 'package:expansion_card/expansion_card.dart';

class GoodsTrackDetails extends StatefulWidget {
  _GoodsTrackDetailsState createState() => _GoodsTrackDetailsState();
}

class _GoodsTrackDetailsState extends State<GoodsTrackDetails> {
  @override
  void initState() {
    super.initState();
    getTrackDetails();
  }

  Future<void> getTrackDetails() async {
    GoodsTrackDtlList.tdl = new List();
    var url = 'https://relative-limp.000webhostapp.com/getTrackDetails.php';
    print("getHistory api:");
    print(TrackDetails.resId);
    print(TrackDetails.orderdte);
    print(TrackDetails.goodsname);
    var response = await http.post(url, body: {
      "sellername": sellType.seller_id,
      "responsibleid": TrackDetails.resId,
      "orderdte": TrackDetails.orderdte,
      "goodsname": TrackDetails.goodsname
    });

    print("status code is");
    print(response.statusCode);
    print(json.decode(response.body));

    final res = json.decode(response.body);

    if (res == 'Failed to get goodsDetails track') {
      print("Failed to get goodsDetails track");
      //  showAlertDialog(context);
    } else {
      print(" get goodsDetails track successfully");

      List<dynamic> jsonObj = res;
      for (int i = 0; i < jsonObj.length; i++) {
        Map<String, dynamic> doclist = jsonObj[i];
        String goodsid = doclist['goodsid'];
        String goodsquan = doclist['goodsquan'];
        String goodsprice = doclist['goodsprice'];

        GoodsTrackDtl gd = new GoodsTrackDtl();
        gd.goodsid = goodsid;
        gd.goodsprice = goodsquan;
        gd.goodsquan = goodsprice;

        print("the goodstrackdetails is:");
        print(gd.goodsid);
        print(gd.goodsprice);
        print(gd.goodsquan);

        GoodsTrackDtlList.tdl.add(gd);
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.chevron_left,
                          ),
                          onPressed: () {
                            TrackDetails.resId = "";
                            TrackDetails.orderdte = "";
                            TrackDetails.goodsname = "";
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Hero(
                          tag: '2',
                          child: Image.asset(
                            TrackDetails.img, //assets/images/115.jpg
                            width: MediaQuery.of(context).size.width * 0.7,
                            //  fit: BoxFit.fill,
                          )),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.0),
                    topRight: Radius.circular(35.0),
                  ),
                ),
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(TrackDetails.givername,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal)),
                        Text(
                          "  : اسم المتبرع ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text(
                        TrackDetails.orderdte,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                      Text(" :تاريخ الطلب ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal)),
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text(
                        TrackDetails.finalprice,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                      Text(
                        " : المبلغ النهائي ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                    ]),
                    Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Text(
                              "التفاصيل",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10.0),
                          ],
                        )),
                    Container(
                        width: double.infinity,
                        //width: 40,
                        //height: 50,
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: new Text(
                                  "رقم السلعة",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Container(
                                child: new Text(
                                  "كمية السلعة",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Container(
                                child: new Text(
                                  "سعر السلعة",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              //    SizedBox(
                              //    width: 10,
                              //)
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                for (var i in GoodsTrackDtlList.tdl)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      // SizedBox(width: 2),
                                      Container(
                                        //    width: 60,
                                        child: Text(
                                          i.goodsid,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      Container(
//width: 60,
                                          child: Text(
                                        i.goodsprice,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal),
                                      )),
                                      Container(
                                          //   width: 60,
                                          child: Text(
                                        i.goodsquan,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal),
                                      ))
                                    ],
                                  )
                              ],
                            ),
                          ),
                          // ListView.builder(
                          //     shrinkWrap: true,
                          //     scrollDirection: Axis.vertical,
                          //     itemCount: GoodsTrackDtlList.tdl.length,
                          //     itemBuilder: (BuildContext context, int index) =>
                          //         new Text(
                          //           GoodsTrackDtlList.tdl[index].goodsprice,
                          //           style: TextStyle(
                          //               fontSize: 20,
                          //               fontWeight: FontWeight.w100),
                          //         ))
                          // Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       ListView.builder(
                          //           shrinkWrap: true,
                          //           scrollDirection: Axis.horizontal,
                          //           itemCount: GoodsTrackDtlList.tdl.length,
                          //           itemBuilder:
                          //               (BuildContext context, int index) =>
                          //                   new Text(GoodsTrackDtlList
                          //                       .tdl[index].goodsprice))
                          //     ])
                        ])
                        // ),
                        )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
