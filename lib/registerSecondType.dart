import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'LoginORSignup.dart';

class SecondTypeRegistration extends StatefulWidget {
  _SecondTypeRegistrationState createState() => _SecondTypeRegistrationState();
}

class _SecondTypeRegistrationState extends State<SecondTypeRegistration> {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
//  TextEditingController _housenameController = new TextEditingController();
  TextEditingController _cityController = new TextEditingController();
  //TextEditingController _phoneNoController = new TextEditingController();
  TextEditingController _mobileNoController = new TextEditingController();

  String _email;
  String _password;
  String _displayName;
  bool _obsecure = false;

  @override
  void initState() {
    super.initState();
  }

  Future registerNewGiver(
      String username, String password, String city, String mobileNo) async {
    var url = 'https://relative-limp.000webhostapp.com/db.php';
    print("the data is");

    print(username);
    print(password);
    print(city);
    print(mobileNo);

    var response = await http.post(url, body: {
      "username": username,
      "password": password,
      "city": city,
      "mobilenum": mobileNo
    });

    print("status code is");
    print(response.statusCode);
    print(json.decode(response.body));

    final res = json.decode(response.body);

    if (res == 'Registered Successfully') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => new LoginORSignup()));
    } else {
      showAlertDialog1(context);
    }
  }

  showAlertDialog1(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text(
        "تم",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        //  textAlign: TextAlign.justify,
        //  textDirection: TextDirection.ltr,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "خطأ في التسجيل",
        textAlign: TextAlign.justify,
        textDirection: TextDirection.rtl,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text("حدثت مشكلة أثناء عملية التسجيل الرجاء المحاولة مجددا"),
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

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text(
        "تم",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        //  textAlign: TextAlign.justify,
        //  textDirection: TextDirection.ltr,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "المعلومات غير مكتملة",
        textAlign: TextAlign.justify,
        textDirection: TextDirection.rtl,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text("الرجاء التأكد من إدخال جميع المعلومات المطلوبة"),
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

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          iconSize: 20.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: new Text(
          "حساب متبرع",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: new DecoratedBox(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
          child: Container(
            child: ListView(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              child: Align(
                                child: Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                            Positioned(
                              child: Container(
                                child: Text(
                                  "GIVE",
                                  style: TextStyle(
                                    fontSize: 65,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 12, top: 20),
                        child: Center(
                          child: new Text(
                            "الرجاء إدخال المعلومات المطلوبة باللغة الانجليزية",
                            style: TextStyle(color: primary),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 12, top: 20),
                        child: _input(Icon(Icons.person), "اسم المستخدم",
                            _usernameController, false),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(bottom: 12),
                      //   child: _input(Icon(Icons.location_city), "اسم الدار",
                      //       _housenameController, true),
                      // ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: _input(Icon(Icons.confirmation_num),
                            "رقم الهاتف المحمول", _mobileNoController, false),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(bottom: 12),
                      //   child: _input(Icon(Icons.confirmation_num),
                      //       "رقم هاتف الدار", _phoneNoController, true),
                      // ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: _input(Icon(Icons.location_city), "المدينة",
                            _cityController, false),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: _input(Icon(Icons.lock), "كلمة المرور",
                            _passwordController, true),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          child: _button("تسجيل", Colors.white, primary,
                              primary, Colors.white, _loginUser),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height, // 1.1,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  //input widget
  Widget _input(
      Icon icon, String hint, TextEditingController controller, bool obsecure) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: controller,
        obscureText: obsecure,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 3,
              ),
            ),
            suffixIcon: Padding(
              child: IconTheme(
                data: IconThemeData(color: Theme.of(context).primaryColor),
                child: icon,
              ),
              padding: EdgeInsets.only(left: 10, right: 30),
            )),
      ),
    );
  }

  void _loginUser() {
    if (_usernameController.text == '' ||
        _passwordController.text == '' ||
        _cityController.text == '' ||
        _mobileNoController.text == '') {
      showAlertDialog(context);
    } else {
      registerNewGiver(_usernameController.text, _passwordController.text,
          _cityController.text, _mobileNoController.text);
    }
  }

  Widget _button(String text, Color splashColor, Color highlightColor,
      Color fillColor, Color textColor, void function()) {
    return RaisedButton(
      highlightElevation: 0.0,
      splashColor: splashColor,
      highlightColor: highlightColor,
      elevation: 0.0,
      color: fillColor,
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: textColor, fontSize: 20),
      ),
      onPressed: () {
        function();
      },
    );
  }
}
