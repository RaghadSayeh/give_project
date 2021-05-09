import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'ResponsibleNotification.dart';
import 'ResponsibleSettings.dart';
import 'home2.dart';
import 'HomePageResponsible.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'SellType.dart';

class addNewDonate extends StatefulWidget {
  @override
  _addNewDonateState createState() => _addNewDonateState();
}

class _addNewDonateState extends State<addNewDonate> {
  String base64Image = "";
  File _image;

  TextEditingController problem = new TextEditingController();
  TextEditingController problem_exp = new TextEditingController();
  TextEditingController priority = new TextEditingController();
  TextEditingController otherinfo = new TextEditingController();

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
      content: Text("تمت إضافة طلبك إلى قائمة الاحتياجات بنجاح"),
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

  void addnewOrder(String problem, String explanation, String prioroty,
      String otherinfo) async {
    print("addnewOrder api");
    var url = 'https://relative-limp.000webhostapp.com/addIssueOrphanHouse.php';

    List<int> imageBytes = _image.readAsBytesSync();
    base64Image = base64Encode(imageBytes);
    print(base64Image);

    var response = await http.post(url, body: {
      "userid": sellType.seller_id,
      "problem": problem,
      "expl": explanation,
      "priority": prioroty,
      "otherinfo": otherinfo,
      "image": base64Image
    });

    print("status code is");
    print(response.statusCode);
    print(json.decode(response.body));

    final res = json.decode(response.body);

    if (res == 'New issue added Successfully') {
      print("New issue added Successfully");
      showAlertDialog(context);
    } else {
      print("failed to add new issue");
    }
  }

  @override
  Widget build(BuildContext context) {
    final _pos = MediaQuery.of(context).size.height / 4 + 20;
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 4 + 40,
                    color: Colors.cyan[300],
                  ),
                ),
                Positioned(
                  top: -20.0,
                  left: -40.0,
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.pink, shape: BoxShape.circle),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipPath(
                      clipper: WaveClipper1(),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 4 + 20,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.cyan[300], //fromRGBO(83, 157, 219, 1.0)
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 130),
                    child: Container(
                      height: 90,
                      width: 90,
                      child: IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 50,
                        ),
                        onPressed: () {
                          _showPicker(context);
                        },
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 3,
                            color:
                                Colors.cyan[300], //fromRGBO(82, 110, 208, 1.0)
                            style: BorderStyle.solid),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: Container(
                    color: Colors.white70,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: TextField(
                            controller: problem,
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: "المشكلة",
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                              // icon: Icon(
                              //   Icons.email,
                              //   color: Color.fromRGBO(82, 110, 208, 1.0),
                              // )
                            ),
                          ),
                        ),
                        Container(
                          child: Divider(
                            color: Color.fromRGBO(82, 110, 208, 1.0),
                          ),
                          padding: EdgeInsets.only(
                              left: 20.0, right: 20.0, bottom: 0.0),
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 0.0, 20, 0.0),
                            child: TextField(
                              controller: problem_exp,
                              textAlign: TextAlign.right,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "شرح عن المشكلة",
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                border: InputBorder.none,
                                // icon: Icon(
                                //   Icons.vpn_key,
                                //   color: Color.fromRGBO(82, 110, 208, 1.0),
                                // )
                              ),
                            )),
                        Container(
                          child:
                              Divider(color: Color.fromRGBO(82, 110, 208, 1.0)),
                          padding: EdgeInsets.only(
                              left: 20.0, right: 20.0, bottom: 0.0),
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 0.0, 20, 0.0),
                            child: TextField(
                              controller: priority,
                              textAlign: TextAlign.right,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "درجة الاهمية",
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                border: InputBorder.none,
                                // icon: Icon(
                                //   Icons.vpn_key,
                                //   color: Color.fromRGBO(82, 110, 208, 1.0),
                                // )
                              ),
                            )),
                        Container(
                          child: Divider(
                            color: Color.fromRGBO(82, 110, 208, 1.0),
                          ),
                          padding: EdgeInsets.only(
                              left: 20.0, right: 20.0, bottom: 0.0),
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 0.0, 20, 0.0),
                            child: TextField(
                              controller: otherinfo,
                              textAlign: TextAlign.right,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "معلومات أخرى",
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                border: InputBorder.none,
                              ),
                            )),
                        Container(
                          child: Divider(
                            color: Color.fromRGBO(82, 110, 208, 1.0),
                          ),
                          padding: EdgeInsets.only(
                              left: 20.0, right: 20.0, bottom: 0.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    left: (MediaQuery.of(context).size.width / 2) - 100,
                    top: 3 / 4 * (MediaQuery.of(context).size.height) - 25,
                    child: Container(
                      height: 50,
                      width: 200,
                      child: RaisedButton(
                        onPressed: () {
                          addnewOrder(
                              problem.text.trim(),
                              problem_exp.text.trim(),
                              priority.text.trim(),
                              otherinfo.text.trim());
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0)),
                        child: Text("إرسال",
                            style: TextStyle(color: Colors.white)),
                        color: Colors.pink,
                      ),
                    )),
                // Positioned(
                //   bottom: 40.0,
                //   right: -20.0,
                //   child: Container(
                //     height: 130,
                //     width: 130,
                //     decoration: BoxDecoration(
                //         color: Colors.pink, shape: BoxShape.circle),
                //   ),
                // )
              ],
            ),
          ],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
          child: BottomNavigationBar(
            // color:Colors.cyan[300],
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
        ));
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(0, 0);
    path.quadraticBezierTo(size.width / 4, 40, size.width / 2, 20);
    path.quadraticBezierTo(3 / 4 * size.width, 0.0, size.width, 10);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
