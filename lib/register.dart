import 'package:flutter/material.dart';
import 'package:give_project/sign_in.dart';
import 'decoration_functions.dart';
import 'sign_in_app_bar.dart';
import 'title.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'HomePageSeller.dart';
import 'SellType.dart';

class Register extends StatefulWidget {
  const Register({Key key, this.onSignInPressed}) : super(key: key);

  final VoidCallback onSignInPressed;
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _cityController = new TextEditingController();
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
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => new SignIn()));
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
    return Form(
      //SignInForm
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: LoginTitle(
                  title: 'إنشاء\nحساب',
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: TextFormField(
                        controller: _usernameController,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        decoration:
                            registerInputDecoration(hintText: 'اسم المستخدم')),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: TextFormField(
                      controller: _mobileNoController,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      decoration: registerInputDecoration(
                          hintText: 'رقم الهاتف المحمول'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: TextFormField(
                      controller: _cityController,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      decoration: registerInputDecoration(hintText: 'المدينة'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: TextFormField(
                      controller: _passwordController,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      decoration:
                          registerInputDecoration(hintText: 'كلمة المرور'),
                    ),
                  ),
                  SignUpBar(
                    label: ' إنشاء حساب متبرع',
                    isLoading: false, //isSubmitting
                    onPressed: () {
                      if (_usernameController.text == '' ||
                          _passwordController.text == '' ||
                          _cityController.text == '' ||
                          _mobileNoController.text == '') {
                        showAlertDialog(context);
                      } else {
                        registerNewGiver(
                            _usernameController.text,
                            _passwordController.text,
                            _cityController.text,
                            _mobileNoController.text);
                      }
                    },
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        widget.onSignInPressed?.call();
                      },
                      child: const Text(
                        'تسجيل دخول',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
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
