import 'package:flutter/material.dart';
import 'decoration_functions.dart';
import 'sign_in_app_bar.dart';
import 'palette.dart';
import 'title.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'HomePageSeller.dart';
import 'SellType.dart';
import 'HomePageResponsible.dart';
import 'UserDta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

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

  SharedPreferences sh;
  bool seen = false;

  @override
  void initState() {
    print("sign in page before loadData");
    super.initState();
    loadData();
  }

  void loadData() async {
    sh = await SharedPreferences.getInstance();
    seen = sh.getBool("seen") ?? false;

    if (seen) {
      print("do nothing initPlatformStateOneSignal called already");
    } else {
      initPlatformStateOneSignal();
    }
  }

  Future insertPush(String userid, String logintype) async {
    var url = 'https://relative-limp.000webhostapp.com/insertPush.php';
    print("the data is");
    print(onesignalUserId);
    print(logintype);
    print(userid);

    var response = await http.post(url, body: {
      "pushId": onesignalUserId,
      "logintype": logintype,
      "userid": userid
    });

    print("status code is");
    print(response.statusCode);
    print(json.decode(response.body));

    final res = json.decode(response.body);
    print(res);

    if (res == 'Failed to add pushid') {
      print("Failed to add pushid");
    } else {
      print("New pushid added Successfully");
    }
  }

  String onesignalUserId = null;

  Future<void> initPlatformStateOneSignal() async {
    sh = await SharedPreferences.getInstance();
    print("initPlatformState");
    if (!mounted) return;

    print("initPlatformState . . .");
    String _debugLabelString = "";

    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setRequiresUserPrivacyConsent(true);

    OneSignal.shared
        .setNotificationReceivedHandler((OSNotification notification) async {
      this.setState(() {
        _debugLabelString =
            "Received notification: \n${notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });

    var settings = {
      OSiOSSettings.autoPrompt: true,
      OSiOSSettings.promptBeforeOpeningPushUrl: true,
    };

    OneSignal.shared
        .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      print("SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}");
      setState(() {
        print("setSubscriptionObserver");
        onesignalUserId = changes.to.userId;
        UserData.checkpushidAppearance = onesignalUserId;
        print("before calling push");
      });
      String token = changes.to.pushToken;
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      print(
          "Opened notification main setNotificationOpenedHandler: \n${result.notification.jsonRepresentation().replaceAll("\\n", "\n")}");
      print("result.notification.payload.title :" +
          result.notification.payload.title);
      print(result.notification.payload.body);
    });

    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      print("PERMISSION STATE CHANGED: ${changes.jsonRepresentation()}");
    });

    OneSignal.shared.setEmailSubscriptionObserver(
        (OSEmailSubscriptionStateChanges changes) {
      print("EMAIL SUBSCRIPTION STATE CHANGED ${changes.jsonRepresentation()}");
    });

    // NOTE: Replace with your own app ID from https://www.onesignal.com
    await OneSignal.shared.init("7be2949d-bff6-410c-b373-eff0a99bf3ac",
        iOSSettings: settings); //onesignal_id must be changed

    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);

    // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    await OneSignal.shared
        .promptUserForPushNotificationPermission(fallbackToSettings: true);

    print("after setInFocusDisplayType");
    bool requiresConsent = await OneSignal.shared.requiresUserPrivacyConsent();
    print("requiresConsent :" + requiresConsent.toString());
    if (requiresConsent) {
      OneSignal.shared.consentGranted(true);
    }

    var status = await OneSignal.shared.getPermissionSubscriptionState();
    String token1 = null;
    //String onesignalUserId=null;
    print('status.permissionStatus.hasPrompted :' +
        status.permissionStatus.hasPrompted.toString());
    print(
        'status.permissionStatus.status == OSNotificationPermission.notDetermined :' +
            (status.permissionStatus.status ==
                    OSNotificationPermission.notDetermined)
                .toString());
    print('status.subscriptionStatus.subscribed :' +
        status.subscriptionStatus.subscribed.toString());

    if (status.permissionStatus.hasPrompted) {
      print("permissionStatus.hasPrompted");
    }
    // we know that the user was prompted for push permission

    if (status.permissionStatus.status ==
        OSNotificationPermission.notDetermined) {
      print("permissionStatus.notDetermined");
    }
    if (status.subscriptionStatus.subscribed) {
      // boolean telling you if the user is subscribed with OneSignal's backend
      // the user's ID with OneSignal
      onesignalUserId = status.subscriptionStatus.userId;

      // the user's APNS or FCM/GCM push token
      token1 = status.subscriptionStatus.pushToken;
      print("token : " + token1);
      print("onesignalUserId1 : " + onesignalUserId);
    }

    if (onesignalUserId == null) {
      print("Setting consent to true");
      OneSignal.shared.consentGranted(true);
      token1 = status.subscriptionStatus.pushToken;
      onesignalUserId = status.subscriptionStatus.userId;
    }
    print("the onesignalUserId id at the end of the fcn is");
    print(onesignalUserId);

    UserData.checkpushidAppearance = onesignalUserId;
    print("UserData.checkpushidAppearance is :");
    print(UserData.checkpushidAppearance);
  }

  Future getData(String username, String password) async {
    var url = 'https://relative-limp.000webhostapp.com/get.php';

    var response = await http.post(url, body: {
      "username": username,
      "password": password,
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
    final name = res['name'];

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
      sellType.name = name;
      print("from static dta");
      print(sellType.sell_type);
      print(sellType.seller_id);

      sh = await SharedPreferences.getInstance();
      seen = sh.getBool("seen") ?? false;

      if (seen) {
        print("do nothing the push id inserted already");
      } else {
        insertPush(sellType.seller_id, logintype);
        sh.setBool("seen", true);
      }

      if (logintype == 'Seller') {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new HomePageSeller()));
      } else if (logintype == 'Giver') {
        //this is for the giver part
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new HomePageRes()));
      }
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
