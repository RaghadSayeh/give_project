import 'package:flutter/material.dart';
import 'ResponsibleNotification.dart';
import 'ResponsibleSettings.dart';
import 'home2.dart';
import 'HomePageResponsible.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'SellType.dart';

class addNewChild extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _addNewChildState();
  }
}

class _addNewChildState extends State<addNewChild> {
  String base64Image = "";
  File _image;

  TextEditingController orp_name = new TextEditingController();
  TextEditingController orp_foundplace = new TextEditingController();
  TextEditingController orp_gender = new TextEditingController();
  TextEditingController orp_age = new TextEditingController();
  TextEditingController orp_otherinfo = new TextEditingController();

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
      content: Text("تمت إضافة اليتيم الجديد إلى قائمة الايتام بنجاح"),
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

  void addnewOrphan(String name, String placewherefound, String gender,
      String age, String otherinfo) async {
    print("add new item api");
    var url = 'https://relative-limp.000webhostapp.com/addNewOrphan.php';

    List<int> imageBytes = _image.readAsBytesSync();
    base64Image = base64Encode(imageBytes);
    print(base64Image);

    print("addnewOrphan data:$name,$placewherefound,$gender,$age,$otherinfo");

    var response = await http.post(url, body: {
      "username": sellType.seller_id,
      "name": name,
      "age": age,
      "placefound": placewherefound,
      "gender": gender,
      "otherinfo": otherinfo,
      "image": base64Image
    });

    print("status code is");
    print(response.statusCode);
    print(json.decode(response.body));

    final res = json.decode(response.body);

    if (res == 'New orphan added Successfully') {
      print("New orphan added Successfully");
      showAlertDialog(context);
    } else {
      print("failed to add new orphan");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                    clipper: WaveClipper2(),
                    child: Container(
                      child: Column(),
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      decoration: BoxDecoration(color: Colors.pink),
                    )),
                ClipPath(
                  clipper: WaveClipper3(),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 50,
                          ),
                          onPressed: () {
                            _showPicker(context);
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "إضافة الصورة هنا",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 25),
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    decoration: BoxDecoration(color: Colors.cyan[300]),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextField(
                  controller: orp_name,
                  //     onChanged: (String value) {},
                  cursorColor: Color.fromRGBO(32, 64, 81, 1.0),
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: "الاسم الجديد",
                    hintStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextField(
                  controller: orp_foundplace,
                  textAlign: TextAlign.right,
                  //  onChanged: (String value) {},
                  cursorColor: Color.fromRGBO(32, 64, 81, 1.0),
                  decoration: InputDecoration(
                      hintText: "مكان العثور",
                      hintStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextField(
                  controller: orp_gender,
                  textAlign: TextAlign.right,
                  // onChanged: (String value) {},
                  cursorColor: Color.fromRGBO(32, 64, 81, 1.0),
                  decoration: InputDecoration(
                      hintText: "جنس اليتيم",
                      hintStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextField(
                  textAlign: TextAlign.right,
                  controller: orp_age,
                  // onChanged: (String value) {},
                  cursorColor: Color.fromRGBO(32, 64, 81, 1.0),
                  decoration: InputDecoration(
                      hintText: "العمر",
                      hintStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextField(
                  controller: orp_otherinfo,
                  textAlign: TextAlign.right,
                  // onChanged: (String value) {},
                  cursorColor: Color.fromRGBO(32, 64, 81, 1.0),
                  decoration: InputDecoration(
                      hintText: "معلومات أخرى",
                      hintStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Colors.cyan[300],
                  ),
                  child: FlatButton(
                    child: Text(
                      "إضافة يتيم جديد",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    onPressed: () {
                      addnewOrphan(
                          orp_name.text.trim(),
                          orp_foundplace.text.trim(),
                          orp_gender.text.trim(),
                          orp_age.text.trim(),
                          orp_otherinfo.text.trim());
                    },
                  ),
                )),
            SizedBox(height: 5),
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
        )
        // ),
        );
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.49, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
