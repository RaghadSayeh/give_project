import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'NotificationPage.dart';
import 'SettingsPage.dart';
import 'LoginORSignup.dart';
import 'HomePageSeller.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'SellType.dart';

class AddNewGood extends StatefulWidget {
  _AddNewGoodState createState() => _AddNewGoodState();
}

class _AddNewGoodState extends State<AddNewGood> {
  File _image;

  TextEditingController quantityCont = TextEditingController();
  TextEditingController nameCont = TextEditingController();
  TextEditingController priceCont = TextEditingController();

  String base64Image = "";

  @override
  void initState() {
    super.initState();
  }

  void _showPicker(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'اختر المكان الذي تريد تحميل الصورة منه',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.justify,
            textDirection: TextDirection.rtl,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "إلغاء",
                textAlign: TextAlign.justify,
                textDirection: TextDirection.ltr,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                "الكاميرا",
              ),
              onPressed: () {
                _imgFromCamera();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                "المعرض",
                textAlign: TextAlign.justify,
                textDirection: TextDirection.ltr,
              ),
              onPressed: () {
                _imgFromGallery();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      print("image from camera");
      _image = image;
      print(_image);
      print(_image.uri);
      print(_image.path);
    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      print("image from gallery");
      _image = image;
    });
  }

  showAlertDialog(BuildContext context) {
    // set up the button
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
        "تمت الاضافة بنجاح",
        textAlign: TextAlign.justify,
        textDirection: TextDirection.rtl,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text("تمت إضافة السلعة الجديدة إلى قائمة سلعك بنجاح"),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void addNewItem(String quantity, String name, String price) async {
    //we need price and quantity in the future for goods detail page
    print("add new item api");
    var url = 'https://relative-limp.000webhostapp.com/addNewGoods.php';

    List<int> imageBytes = _image.readAsBytesSync();
    base64Image = base64Encode(imageBytes);
    print(base64Image.length);
    print(base64Image);
    print(name);

    var response = await http.post(url, body: {
      "username": sellType.seller_id,
      "pic": base64Image,
      "goodsname": name
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: new Text(
          "إضافة سلعة جديدة",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 32,
            ),
            Container(
                child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5.0, left: 14, bottom: 5.0),
                  width: MediaQuery.of(context).size.width * .47,
                  child: GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: _image != null
                          ? Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Image.file(
                                _image,
                                width: 100,
                                height: 100,
                                fit: BoxFit.fitHeight,
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              width: 100,
                              height: 100,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.grey[800],
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                    //flex: 2,
                    child: Container(
                  width: MediaQuery.of(context).size.width * .5,
                  margin: EdgeInsets.only(right: 14.0, top: 5.0, bottom: 5.0),
                  child: new Text(
                    "صورة السلعة الجديدة:",
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 18),
                  ),
                )),
              ],
            )),
            SizedBox(
              height: 7,
            ),
            Container(
                child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5.0, left: 14, bottom: 5.0),
                  width: MediaQuery.of(context).size.width * .47,
                  // child: GestureDetector(
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: TextFormField(
                        controller: quantityCont,
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                        ),
                      )),
                  //   ),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                    //flex: 2,
                    child: Container(
                  width: MediaQuery.of(context).size.width * .5,
                  margin: EdgeInsets.only(right: 14.0, top: 5.0, bottom: 5.0),
                  child: new Text(
                    "كمية السلعة الجديدة:",
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 18),
                  ),
                )),
              ],
            )),
            SizedBox(
              height: 7,
            ),
            Container(
                child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5.0, left: 14, bottom: 5.0),
                  width: MediaQuery.of(context).size.width * .47,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: TextFormField(
                          controller: priceCont,
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                    //flex: 2,
                    child: Container(
                  width: MediaQuery.of(context).size.width * .5,
                  margin: EdgeInsets.only(right: 14.0, top: 5.0, bottom: 5.0),
                  child: new Text(
                    "سعر السلعة الجديدة :",
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 18),
                  ),
                )),
              ],
            )),
            SizedBox(
              height: 7,
            ),
            Container(
                child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5.0, left: 14, bottom: 5.0),
                  width: MediaQuery.of(context).size.width * .47,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: TextFormField(
                          controller: nameCont,
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                    //flex: 2,
                    child: Container(
                  width: MediaQuery.of(context).size.width * .5,
                  margin: EdgeInsets.only(right: 14.0, top: 5.0, bottom: 5.0),
                  child: new Text(
                    "اسم السلعة الجديدة :",
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 18),
                  ),
                )),
              ],
            )),
            SizedBox(
              height: 40,
            ),
            Container(
                //height: 170,
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 55,
                  child: RaisedButton(
                    highlightElevation: 0.0,
                    // splashColor: splashColor,
                    //  highlightColor: highlightColor,
                    elevation: 0.0,
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0)),
                    child: Text(
                      "إضافة",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    onPressed: () {
                      addNewItem(
                          quantityCont.text, nameCont.text, priceCont.text);
                    },
                  ),
                )
              ],
            ))
          ],
        ),
      ),
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
