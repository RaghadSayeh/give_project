import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'HomePageSeller.dart';
import 'SellType.dart';

class LoginPage extends StatefulWidget {
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String logintype;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future getData(String username, String password, String logintype) async {
    var url = 'https://relative-limp.000webhostapp.com/get.php';
    print("the data is");

    if (logintype == 'بائع') {
      logintype = 'Seller';
    } else if (logintype == 'مسؤول دار أيتام') {
      logintype = 'Responsible';
    } else {
      logintype = 'Giver';
    }

    print(username);
    print(password);
    print(logintype);

    var response = await http.post(url, body: {
      "username": username,
      "password": password,
      "logintype": logintype
    });

    print("status code is");
    print(response.statusCode);
    print(json.decode(response.body));

    final res = json.decode(response.body);
    final ss = res['sellertype'];
    final city = res['city'];
    final otherinfo = res['otherinfo'];
    final phoneno = res['phoneno'];
    print(ss);
    print(city);
    print(otherinfo);
    print(phoneno);

    if (res == 'Login Failed') {
      print("must go to seller page");
      showAlertDialog(context);
    } else {
      sellType.sell_type = ss.toString();
      sellType.seller_id = username;
      sellType.seller_pass = password;
      sellType.city = city;
      sellType.otherinfo = otherinfo;
      sellType.phoneno = phoneno;

      print("from static dta");
      print(sellType.sell_type);

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => new HomePageSeller()));
    }
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
        "المعلومات غير صحيحة",
        textAlign: TextAlign.justify,
        textDirection: TextDirection.rtl,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text("الرجاء التأكد من المعلومات التي تم إدخالها"),
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

  //button widget
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

  void _loginUser() {
    // _usernameController.clear();
    // _passwordController.clear();
    getData(_usernameController.text.trim(), _passwordController.text.trim(),
        logintype);
  }

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          "تسجيل الدخول",
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
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 140,
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
                        padding: EdgeInsets.only(bottom: 15, top: 40),
                        child: _input(Icon(Icons.person), "اسم المستخدم",
                            _usernameController, false),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: _input(Icon(Icons.lock), "كلمة المرور",
                            _passwordController, true),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 15,
                        ),
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 60,
                          ),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 2.0,
                                  style: BorderStyle.solid,
                                  color: Theme.of(context).primaryColor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: new DropdownButton<String>(
                              value: logintype,
                              dropdownColor: Colors.white,
                              //         isExpanded: true,
                              items: <String>[
                                'متبرع',
                                'بائع',
                                'مسؤول دار أيتام'
                              ].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(
                                    value,
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 20.0),
                                  ),
                                );
                              }).toList(),
                              onChanged: (valueType) {
                                setState(() {
                                  logintype = valueType;
                                });
                                print("drop down list changed");
                                print(valueType);
                              },
                            ),
                          ),
                        ),
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
                          child: _button("دخول", Colors.white, primary, primary,
                              Colors.white, _loginUser),
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
            height: MediaQuery.of(context).size.height / 1.1,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
