import 'package:flutter/material.dart';
import 'decoration_functions.dart';
import 'sign_in_app_bar.dart';
import 'palette.dart';
import 'title.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'HomePageSeller.dart';
import 'SellType.dart';

class SignIn extends StatefulWidget {
  const SignIn({
    Key key,
    @required this.onRegisterClicked,
  }) : super(key: key);

  final VoidCallback onRegisterClicked;
  SignInState createState() => SignInState(onRegisterClicked);
}

class SignInState extends State<SignIn> {
  SignInState(final VoidCallback onRegisterClicked);
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future getData(String username, String password) async {
    //, String logintype
    var url = 'https://relative-limp.000webhostapp.com/get.php';
    print("the data is");

    // if (logintype == 'بائع') {
    //   logintype = 'Seller';
    // } else if (logintype == 'مسؤول دار أيتام') {
    //   logintype = 'Responsible';
    // } else {
    //   logintype = 'Giver';
    // }

    print(username);
    print(password);
    // print(logintype);

    var response = await http.post(url, body: {
      "username": username,
      "password": password,
      //  "logintype": logintype
    });

    print("status code is");
    print(response.statusCode);
    print(json.decode(response.body));

    final res = json.decode(response.body);
    final ss = res['sellertype'];
    final city = res['city'];
    final otherinfo = res['otherinfo'];
    final phoneno = res['phoneno'];
    final logintype = res['logintype'];
    print(ss);
    print(city);
    print(otherinfo);
    print(phoneno);
    print(logintype);

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

  @override
  Widget build(BuildContext context) {
    //  final isSubmitting = context.isSubmitting();
    return Form(
      //SignInForm
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            const Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: LoginTitle(
                  title: 'أهلا وسهلا\nمجددا ',
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: TextFormField(
                      controller: _usernameController,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.right,
                      decoration:
                          signInInputDecoration(hintText: 'اسم المستخدم'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: _passwordController,
                      textAlign: TextAlign.right,
                      obscureText: true,
                      decoration:
                          signInInputDecoration(hintText: 'كلمة المرور'),
                    ),
                  ),
                  SignInBar(
                    label: 'دخول',
                    isLoading: false, //isSubmitting
                    onPressed: () {
                      //  context.signInWithEmailAndPassword();
                      print("sign_in page");
                      getData(_usernameController.text.trim(),
                          _passwordController.text.trim()); //logintype
                    },
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        widget.onRegisterClicked?.call();
                      },
                      child: const Text(
                        'إنشاء حساب',
                        style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          color: Palette.lightBlue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//}
