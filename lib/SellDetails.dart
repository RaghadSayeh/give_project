import 'package:flutter/material.dart';
import 'LoginORSignup.dart';
import 'SellType.dart';
import 'NotificationPage.dart';
import 'SettingsPage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'GoodsData.dart';
import 'GoodsList.dart';
import 'GoodsSellList.dart';
import 'SellData.dart';
import 'HomePageSeller.dart';
import 'SellType.dart';
import 'dart:io';
import 'addnewGoodDetails.dart';

class SellDetails extends StatefulWidget {
  @override
  SellDetailsState createState() => SellDetailsState();
}

class SellDetailsState extends State<SellDetails> {
  String newprice = "";
  String newquan = "";
  String newexplan = "";

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
        print("length is");
        print(picnum.length);

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

  Future<void> _editform(BuildContext context, String pic, int index) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: new Container(
              width: 260.0,
              height: 230.0,
              decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                color: Theme.of(context).primaryColor,
                borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
              ),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // dialog top
                  new Expanded(
                    child:
                        //    new Row(
                        //    children: <Widget>[
                        new Container(
                      // padding: new EdgeInsets.all(10.0),
                      decoration: new BoxDecoration(
                        color: Colors.white,
                      ),
                      child: new Text(
                        'يمكنك تعديل السعر, الكمية, الوصف أو جميعها',

                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          // fontFamily: 'helvetica_neue_light',
                        ),
                        textAlign: TextAlign.right,
                        // textDirection: TextDirection.rtl
                      ),
                    ),
                    //  ],
                    // ),
                  ),
                  new Expanded(
                    child: new Container(
                      decoration: new BoxDecoration(
                        color: Colors.white,
                      ),
                      child: new TextField(
                        autofocus: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          // fontFamily: 'helvetica_neue_light',
                        ),
                        textAlign: TextAlign.right,
                        //  textDecoration:TextDecoration.right
                        decoration: InputDecoration(hintText: "الكمية الجديدة"),
                        onChanged: (item) {
                          newquan = item;
                        },
                      ),
                    ),
                  ),
                  new Expanded(
                    child: new Container(
                      decoration: new BoxDecoration(
                        color: Colors.white,
                      ),
                      child: new TextField(
                        autofocus: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          // fontFamily: 'helvetica_neue_light',
                        ),
                        textAlign: TextAlign.right,
                        //  textDecoration:TextDecoration.right
                        decoration: InputDecoration(hintText: "السعر الجديد"),
                        onChanged: (item) {
                          newprice = item;
                        },
                      ),
                    ),
                  ),
                  new Expanded(
                    child: new Container(
                      decoration: new BoxDecoration(
                        color: Colors.white,
                      ),
                      child: new TextField(
                        autofocus: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          // fontFamily: 'helvetica_neue_light',
                        ),
                        textAlign: TextAlign.right,
                        //  textDecoration:TextDecoration.right
                        decoration: InputDecoration(hintText: "الوصف الجديد"),
                        onChanged: (item) {
                          newexplan = item;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    editGood(newexplan, newprice, newquan, pic, index);
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

  void editGood(String explanation, String price, String quantity,
      String picnum, int index) async {
    var url = 'https://relative-limp.000webhostapp.com/changeGoodsInfo.php';
    print("the data is");

    var response = await http.post(url, body: {
      "userid": sellType.seller_id,
      "goodsname": sellType.goodsName,
      "price": price == "" ? GoodsSellList.list[index].price : price,
      "quantity":
          quantity == "" ? GoodsSellList.list[index].quantity : quantity,
      "explanation": explanation == ""
          ? GoodsSellList.list[index].explanation
          : explanation,
      "picnum": picnum
    });

    print("status code is");
    print(response.statusCode);
    print(json.decode(response.body));

    final res = json.decode(response.body);

    if (res == 'Update goodsinfo successfully') {
      print("Update goodsinfo successfully");
      // showAlertDialog(context);
      //if update done successfully then must refresh the goods in order to take new update
      getMainGoods();
    } else {
      //  showAlertDialog(context);  must be for failed edit
    }
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text(
        "تم",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "نجاح التحديث",
        textAlign: TextAlign.justify,
        textDirection: TextDirection.rtl,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text("تم تحديث معلومات السلعة بنجاح"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void deleteitem(String picnum) async {
    var url = 'https://relative-limp.000webhostapp.com/deleteselldetail.php';
    print("the data is");

    var response = await http.post(url, body: {
      "userid": sellType.seller_id,
      "goodsname": sellType.goodsName,
      "picnum": picnum
    });

    print("status code is");
    print(response.statusCode);
    print(json.decode(response.body));

    final res = json.decode(response.body);

    if (res == 'delete details successfully') {
      print("Update goodsinfo successfully");
      // showAlertDialog(context);
      //if update done successfully then must refresh the goods in order to take new update
      getMainGoods();
    } else {
      //  showAlertDialog(context);  must be for failed edit
    }
  }

  Future<void> askfordelete(BuildContext context, String pic) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: new Text(
              'هل أنت متأكد من أنك تريد حذف هذه السلعة؟؟؟',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
              textAlign: TextAlign.right,
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    deleteitem(pic);
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
          return Card(
              shape: RoundedRectangleBorder(
                side: new BorderSide(color: Colors.cyan[300], width: 1.0),
                borderRadius: BorderRadius.circular(30.0),
              ),
              //   color: Colors.pink,
              elevation: 10,
              clipBehavior: Clip.antiAlias,
              child: Column(children: <Widget>[
                // SizedBox(
                //   height: 20,
                // ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: new ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      child: GoodsSellList.list[index].picnum.length < 8
                          ? Image.asset(
                              "assets/images/" +
                                  GoodsSellList.list[index].picnum +
                                  ".png",
                              fit: BoxFit.cover,
                            )
                          : Image.memory(
                              base64Decode(GoodsSellList.list[index].picnum),
                              fit: BoxFit.cover,
                            ),
                    )),
                Container(
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 0.0, top: 0, bottom: 0),
                      child: GestureDetector(
                        onTap: () async {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                          margin: EdgeInsets.only(
                                              right: 10, bottom: 5),
                                          child: new Text(
                                            GoodsSellList.list[index].price,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Container(
                                          margin: EdgeInsets.only(
                                              right: 10, bottom: 5),
                                          child: Text(
                                            " :السعر  ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                  // margin: const EdgeInsets.only(
                                  //   right: 5.0,
                                  // ),
                                  //padding: const EdgeInsets.all(9.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      // SizedBox(
                                      //   width: 20,
                                      // ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              right: 10, bottom: 5),
                                          //flex: 2,
                                          child: new Text(
                                            GoodsSellList.list[index].quantity,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: 10, bottom: 5),
                                        child: Text(
                                          " : الكمية  ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // padding: const EdgeInsets.all(9.0),
                                  // margin: const EdgeInsets.only(
                                  //   right: 5.0,
                                  // ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                          margin: EdgeInsets.only(
                                              right: 10, bottom: 5),
                                          child: new Text(
                                            GoodsSellList
                                                .list[index].explanation,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Container(
                                          margin: EdgeInsets.only(
                                              right: 10, bottom: 5),
                                          child: Text(
                                            " : وصف المنتج ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    //   padding:
                                    //     const EdgeInsets.only(top: 3, bottom: 3),
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                            //   padding:
                                            //     EdgeInsets.only(top: 4, bottom: 4),
                                            child: GestureDetector(
                                          onTap: () {
                                            print(
                                                "delete sell details successfully");
                                            askfordelete(
                                                context,
                                                GoodsSellList
                                                    .list[index].picnum);
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.pink,
                                          ),
                                        )),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                            //  padding:
                                            //    EdgeInsets.only(top: 4, bottom: 4),
                                            child: GestureDetector(
                                          onTap: () async {
                                            print("edit api");
                                            await _editform(
                                                context,
                                                GoodsSellList
                                                    .list[index].picnum,
                                                index);
                                          },
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.pink,
                                          ),
                                        )),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      )),
                  margin: EdgeInsets.only(top: 8, left: 10, right: 10),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                // ButtonBar(
                //   alignment: MainAxisAlignment.start,
                //   children: [
                //     FlatButton(
                //       onPressed: () {
                //         // Perform some action
                //       },
                //       child: Icon(Icons.edit),
                //     ),
                //     FlatButton(
                //       onPressed: () {
                //         // Perform some action
                //       },
                //       child: const Text('ACTION 2'),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.grey,
                  width: widthsize,
                  height: 1.0,
                  margin: EdgeInsets.only(left: 0.0),
                ),
              ]));
        });
  }

  File _image;
  String base64Image = "";
  void addNewItem(
      String quantity, String name, String price, String explanation) async {
    //we need price and quantity in the future for goods detail page
    print("add new item api");
    var url = 'https://relative-limp.000webhostapp.com/addNewDetailsSell.php';

    List<int> imageBytes = _image.readAsBytesSync();
    base64Image = base64Encode(imageBytes);
    print(base64Image.length);
    print(base64Image);
    print(name);

    var response = await http.post(url, body: {
      "userid": sellType.seller_id,
      "picnum": base64Image,
      "goodsname": sellType.goodsName,
      "price": price,
      "quantity": quantity,
      "explanation": explanation
    });

    print("status code is");
    print(response.statusCode);
    print(json.decode(response.body));

    final res = json.decode(response.body);

    if (res == 'New goods added Successfully') {
      print("new ggods added successfully");
      showAlertDialog(context);
    } else {
      print("failed to add new goods");
    }
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
        leading: GestureDetector(
          onTap: () {
            //addnewGoodDetails
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new addnewGoodDetails()));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      body: _buildList(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
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
