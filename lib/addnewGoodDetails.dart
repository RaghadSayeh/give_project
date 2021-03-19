import 'package:flutter/material.dart';
import 'Backgroundd.dart';
import 'SellType.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'SellDetails.dart';

class addnewGoodDetails extends StatefulWidget {
  _addnewGoodDetailsState createState() => _addnewGoodDetailsState();
}

class _addnewGoodDetailsState extends State<addnewGoodDetails> {
  TextEditingController priceCont = TextEditingController();
  TextEditingController quanCont = TextEditingController();
  TextEditingController explCont = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  File _image;
  String base64Image = "";
  void addNewItem(String quantity, String price, String explanation) async {
    //we need price and quantity in the future for goods detail page
    print("add new item api");
    var url = 'https://relative-limp.000webhostapp.com/addNewDetailsSell.php';

    List<int> imageBytes = _image.readAsBytesSync();
    base64Image = base64Encode(imageBytes);
    print(base64Image.length);
    print(base64Image);

    var response = await http.post(url, body: {
      "userid": sellType.seller_id,
      "picnum": base64Image,
      "goodsname": sellType.goodsName, //sellType.goodsName
      "price": price,
      "quantity": quantity,
      "explanation": explanation
    });

    print("status code is");
    print(response.statusCode);
    print(json.decode(response.body));

    final res = json.decode(response.body);

    if (res == 'New goodsdetails added Successfully') {
      print("new ggods added successfully");
      //  showAlertDialog(context);
    } else {
      print("failed to add new goods");
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
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
              //SellDetails
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new SellDetails()));
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Backgroundd(),
            Column(
              children: <Widget>[
                // Padding(
                //   padding: EdgeInsets.only(
                //       top: MediaQuery.of(context).size.height / 9.5),
                // ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: <Widget>[
                    ///holds email header and inputField
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 40, bottom: 30),
                          child: Container(
                            margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            // width: MediaQuery.of(context).size.width * .47,
                            width: MediaQuery.of(context).size.width - 40,
                            child: GestureDetector(
                              onTap: () {
                                _showPicker(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        bottomRight: Radius.circular(0.0))),
                                child: _image != null
                                    ? Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(30),
                                                bottomRight:
                                                    Radius.circular(0.0))),
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
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(30),
                                                bottomRight:
                                                    Radius.circular(0.0))),
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 40, bottom: 30),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 40,
                            child: Material(
                              elevation: 10,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0),
                                      topRight: Radius.circular(30.0))),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 40, right: 20, top: 10, bottom: 10),
                                child: TextField(
                                  controller: priceCont,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "السعر",
                                      hintStyle: TextStyle(
                                          color: Colors.black, fontSize: 14)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 40, bottom: 30),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 40,
                            child: Material(
                              elevation: 10,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0),
                                      topRight: Radius.circular(30.0))),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 40, right: 20, top: 10, bottom: 10),
                                child: TextField(
                                  controller: quanCont,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "الكمية",
                                      hintStyle: TextStyle(
                                          color: Colors.black, fontSize: 14)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 40, bottom: 30),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 40,
                            child: Material(
                              elevation: 10,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0.0),
                                      topRight: Radius.circular(30.0))),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 40, right: 20, top: 10, bottom: 10),
                                child: TextField(
                                  controller: explCont,
                                  textAlign: TextAlign.right,
                                  //  textDirection: TextDirection.rtl,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "وصف المنتج",
                                      hintStyle: TextStyle(
                                          color: Colors.black, fontSize: 14)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 40),
                          child:
                              //  Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   children: <Widget>[
                              Container(
                                  width: MediaQuery.of(context).size.width - 40,
                                  //   color: Colors.pink,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.pink,
                                      border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(30),
                                          bottomRight: Radius.circular(0.0))),
                                  child: GestureDetector(
                                    onTap: () {
                                      addNewItem(quanCont.text, priceCont.text,
                                          explCont.text);
                                    },
                                    child: new Text(
                                      "إضافة",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  )),
                          // ],
                          //  )
                        )
                        //  ],
                        //  ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                  ],
                )
              ],
            )
          ],
        ));
  }
}

Widget roundedRectButton(
    String title, List<Color> gradient, bool isEndIconVisible) {
  return Builder(builder: (BuildContext mContext) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Stack(
        alignment: Alignment(1.0, 0.0),
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(mContext).size.width / 1.7,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              gradient: LinearGradient(
                  colors: gradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
            padding: EdgeInsets.only(top: 16, bottom: 16),
          ),
          // Visibility(
          //   visible: isEndIconVisible,
          //   child: Padding(
          //       padding: EdgeInsets.only(right: 10),
          //       child: ImageIcon(
          //         AssetImage("assets/ic_forward.png"),
          //         size: 30,
          //         color: Colors.white,
          //       )),
          // ),
        ],
      ),
    );
  });
}

const List<Color> signInGradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];

const List<Color> signUpGradients = [
  Color(0xFFFF9945),
  Color(0xFFFc6076),
];
