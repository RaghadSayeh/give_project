import 'package:flutter/material.dart';
import 'LoginORSignup.dart';
import 'package:flutter/services.dart';
import 'home2.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'testBg.dart';
import 'UserDta.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          hintColor: Colors.cyan[200],
          primaryColor: Colors.cyan[300],
          canvasColor: Colors.transparent),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  SharedPreferences sh;
  bool seen = false;

  @override
  void initState() {
    super.initState();
    // loadData();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => new AuthScreen()));
      });
    });
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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan[300],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            child: Image.asset(
              "assets/images/logo.png",
            ),
          ),
        ),
      ),
    );
  }
}
