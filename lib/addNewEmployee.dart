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

class addNewEmployee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _addNewEmployeeState();
  }
}

class _addNewEmployeeState extends State<addNewEmployee> {
  String base64Image = "";
  File _image;

  TextEditingController emp_name = new TextEditingController();
  TextEditingController emp_city = new TextEditingController();
  TextEditingController emp_phoneno = new TextEditingController();
  TextEditingController emp_spec = new TextEditingController();
  TextEditingController emp_yoe = new TextEditingController();

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
  void initState() {
    super.initState();
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
      content: Text("تمت إضافة العامل الجديد إلى قائمة العاملين بالدار بنجاح"),
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

//`name`, `userid`, `city`, `phoneno`, `spec`, `yoe`, `image`
  void addNewEmployeeTo(String name, String city, String phoneno,
      String specialization, String yoexp) async {
    print("addNewEmployeeTo api");
    var url = 'https://relative-limp.000webhostapp.com/addNewEmployee.php';

    List<int> imageBytes = _image.readAsBytesSync();
    base64Image = base64Encode(imageBytes);
    print(base64Image);

    var response = await http.post(url, body: {
      "userid": sellType.seller_id,
      "name": name,
      "city": city,
      "phoneno": phoneno,
      "spec": specialization,
      "yoe": yoexp,
      "image": base64Image
    });

    print("status code is");
    print(response.statusCode);
    print(json.decode(response.body));

    final res = json.decode(response.body);

    if (res == 'New employee added Successfully') {
      print("New employee added Successfully");
      showAlertDialog(context);
    } else {
      print("failed to add new employee");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(199, 246, 245, 1.0),
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
            "إضافة عامل جديد",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height * .9,
          padding: EdgeInsets.fromLTRB(30, 100, 30, 50),
          child: Stack(
            children: <Widget>[
              ClipPath(
                clipper: RoundedDiagonalPathClipper(),
                child: Container(
                  height: 550,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //SizedBox(height: 90.0,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          controller: emp_name,
                          textAlign: TextAlign.right,
                          cursorColor: Color.fromRGBO(10, 145, 171, 1.0),
                          style: TextStyle(
                              color: Color.fromRGBO(10, 145, 171, 1.0)),
                          decoration: InputDecoration(
                            hintText: "اسم العامل",
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(10, 145, 171, 1.0)),
                            border: InputBorder.none,
                            // icon: Icon(Icons.email, color: Color.fromRGBO(10,145,171,1.0),)
                          ),
                        ),
                      ),
                      Container(
                        child: Divider(
                          color: Color.fromRGBO(10, 145, 171, 1.0),
                        ),
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 10.0),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextField(
                            controller: emp_city,
                            textAlign: TextAlign.right,
                            cursorColor: Color.fromRGBO(10, 145, 171, 1.0),
                            style: TextStyle(
                                color: Color.fromRGBO(10, 145, 171, 1.0)),
                            decoration: InputDecoration(
                              hintText: "المدينة",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(10, 145, 171, 1.0)),
                              border: InputBorder.none,
                              //  icon: Icon(Icons.lock, color: Color.fromRGBO(10,145,171,1.0),)
                            ),
                          )),
                      Container(
                        child: Divider(
                          color: Color.fromRGBO(10, 145, 171, 1.0),
                        ),
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 10.0),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextField(
                            controller: emp_phoneno,
                            textAlign: TextAlign.right,
                            cursorColor: Color.fromRGBO(10, 145, 171, 1.0),
                            style: TextStyle(
                                color: Color.fromRGBO(10, 145, 171, 1.0)),
                            decoration: InputDecoration(
                              hintText: "رقم الهاتف",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(10, 145, 171, 1.0)),
                              border: InputBorder.none,
                              // icon: Icon(Icons., color: Color.fromRGBO(10,145,171,1.0),)
                            ),
                          )),
                      Container(
                        child: Divider(
                          color: Color.fromRGBO(10, 145, 171, 1.0),
                        ),
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 10.0),
                      ),

                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextField(
                            controller: emp_spec,
                            textAlign: TextAlign.right,
                            cursorColor: Color.fromRGBO(10, 145, 171, 1.0),
                            style: TextStyle(
                                color: Color.fromRGBO(10, 145, 171, 1.0)),
                            decoration: InputDecoration(
                              hintText: "التخصص",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(10, 145, 171, 1.0)),
                              border: InputBorder.none,
                              // icon: Icon(Icons., color: Color.fromRGBO(10,145,171,1.0),)
                            ),
                          )),
                      Container(
                        child: Divider(
                          color: Color.fromRGBO(10, 145, 171, 1.0),
                        ),
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 10.0),
                      ),

                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextField(
                            controller: emp_yoe,
                            textAlign: TextAlign.right,
                            cursorColor: Color.fromRGBO(10, 145, 171, 1.0),
                            style: TextStyle(
                                color: Color.fromRGBO(10, 145, 171, 1.0)),
                            decoration: InputDecoration(
                              hintText: "سنوات الخبرة",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(10, 145, 171, 1.0)),
                              border: InputBorder.none,
                              // icon: Icon(Icons., color: Color.fromRGBO(10,145,171,1.0),)
                            ),
                          )),
                      // SizedBox(height: 10.0,),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Color.fromRGBO(10, 145, 171, 1.0),
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
                  ),
                ],
              ),
              Container(
                height: 530,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    onPressed: () {
                      addNewEmployeeTo(
                          emp_name.text.trim(),
                          emp_city.text.trim(),
                          emp_phoneno.text.trim(),
                          emp_spec.text.trim(),
                          emp_yoe.text.trim());
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    child: Text("إضافة", style: TextStyle(color: Colors.white)),
                    color: Color.fromRGBO(10, 145, 171, 1.0),
                  ),
                ),
              )
            ],
          ),
        ),
        //  ],
        //),
        // ),
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
