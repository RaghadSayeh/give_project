import 'package:flutter/material.dart';
import 'ResponActivitiesList.dart';
import 'HomePageResponsible.dart';
import 'home2.dart';
import 'ResponsibleNotification.dart';
import 'ResponDataModification.dart';
import 'ResponsibleContactus.dart';
import 'addNewEmployee.dart';
import 'addNewDonate.dart';
import 'addNewChild.dart';
import 'package:animated_background/animated_background.dart';
import 'dart:math' as math;
import 'package:polygon_clipper/polygon_clipper.dart';
import 'OrphanActivityDetails.dart';
import 'OrphanProblems.dart';
import 'ResponsibleHistory.dart';
import 'ResponsibleTrackOrders.dart';

class ResponsibleSettings extends StatefulWidget {
  ResponsibleSettingsState createState() => ResponsibleSettingsState();
}

class ResponsibleSettingsState extends State<ResponsibleSettings>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  List<String> settings = [
    'إضافة يتيم جديد',
    'تفاصيل نشاطات الأيتام',
    'متابعة طلبات المتبرعين',
    'مشاكل الميتم',
    'طلب تبرع جديد',
    'إضافة عامل جديد',
    'تعديل معلومات الميتم',
    'أرشيف طلبات الميتم',
    'تواصل معنا'
  ];
  ParticleOptions particleOptions = ParticleOptions(
    image: Image.asset('assets/images/star_stroke.png'),
    baseColor: Colors.blue,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    spawnMinSpeed: 30.0,
    spawnMaxSpeed: 70.0,
    spawnMinRadius: 7.0,
    spawnMaxRadius: 15.0,
    particleCount: 40,
  );

  var particlePaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0;
  Behaviour _behaviour;
  bool _showSettings = false;
  Behaviour _buildBehaviour() {
    // switch (_behaviourIndex) {
    //   case 0:
    //     return RandomParticleBehaviour(
    //       options: particleOptions,
    //       paint: particlePaint,
    //     );
    //   case 1:
    return RainParticleBehaviour(
      options: particleOptions,
      paint: particlePaint,
      enabled: _showSettings,
    );
    // case 2:
    //   return RectanglesBehaviour();
    // case 3:
    //   return RacingLinesBehaviour(
    //     direction: _lineDirection,
    //     numLines: _lineCount,
    //   );
    // case 4:
    //   return BubblesBehaviour(
    //     options: _bubbleOptions,
    //   );
    // case 5:
    //   return SpaceBehaviour();
    //   }

    //   return RandomParticleBehaviour(
    //     options: particleOptions,
    //     paint: particlePaint,
    //   );
    // }
  }

  final double topPolygonSize = 270;

  _buildTopPolygon() {
    return Positioned(
        top: -1 * (25 / 100 * topPolygonSize),
        right: -1 * (23 / 100 * topPolygonSize),
        child: Container(
            height: topPolygonSize,
            width: topPolygonSize,
            child: ClipPolygon(
                sides: 6,
                borderRadius: 10,
                child: Container(
                  color: Colors.pink,
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.pink,
          shape: CustomShapeBorder(),
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.vertical(
          //     bottom: Radius.circular(30),
          //   ),
          // ),
          automaticallyImplyLeading: false,
          centerTitle: true,

          title: new Text(
            "صفحة الاعدادات",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body:
            //  Stack(
            //    children: <Widget>[
            // _buildTopPolygon(),
            //   SingleChildScrollView(
            //   child:
            Container(
//                padding: EdgeInsets.only(top: 200, left: 40, right: 40),
                //     padding: EdgeInsets.only(top: 200, left: 40, right: 40),

                padding: EdgeInsets.only(top: 30),
                color: Colors.grey[100],
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(9, (index) {
                    return GestureDetector(
                        child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      margin: EdgeInsets.fromLTRB(10, 2, 10, 5),
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5.0, 0, 5, 0),
                            child: SizedBox(
                              height: 65,
                              child: GestureDetector(
                                onTap: () async {},
                                child: Container(
                                    //  color:Colors.pink,
                                    width: MediaQuery.of(context).size.width,
                                    child: new ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        child: Icon(Icons.add,
                                            color: Colors.pink, size: 20))),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  if (index == 0) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                new addNewChild()));
                                  } else if (index == 1) {
                                    //OrphanActivityDetails
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                new OrphanActivityDetails()));
                                  } else if (index == 2) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                new ResponsibelTrackOrders()));
                                  } else if (index == 3) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                new OrphanProblems()));
                                  } else if (index == 4) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                new addNewDonate()));
                                  } else if (index == 5) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                new addNewEmployee()));
                                  } else if (index == 6) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                new ResponDataModif()));
                                  } else if (index == 7) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                new ResponsibleHistory()));
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                new ResponsibleContact()));
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 10.0, top: 5, bottom: 5),
                                  child: Text(
                                    settings[index],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      //  fontFamily: "palfont",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 150,
                                    height: 55,
                                    child: RaisedButton(
                                      highlightElevation: 0.0,
                                      elevation: 0.0,
                                      color: Theme.of(context).primaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(15.0)),
                                      child: Text(
                                        "عرض",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ));
                  }),
                )),
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
                          ? null
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

class CurvePainter extends CustomPainter {
  // @override
  // void paint(Canvas canvas, Size size) {
  //   var paint = new Paint();
  //   paint.color = Colors.green[800];
  //   paint.style = PaintingStyle.fill;

  //   var path = new Path();
  //   path.lineTo(0, size.height * 0.3);

  //   path.quadraticBezierTo(size.width * 0.35, size.height * 0.4, size.width * 0.7, size.height * 0.21);
  //   path.quadraticBezierTo(size.width * 0.6, size.height * 0.19, size.width * 0.9, size.height * 0.15);
  //   path.quadraticBezierTo(size.width , size.height * 0.05, size.width * 0.6, 0);

  //   canvas.drawPath(path, paint);
  // }
  //
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.cyan[300]
      ..style = PaintingStyle.fill;

    final path = new Path()
      ..moveTo(size.width * .6, 0)
      ..quadraticBezierTo(
        size.width * .7,
        size.height * .08,
        size.width * .9,
        size.height * .05,
      )
      ..arcToPoint(
        Offset(
          size.width * .93,
          size.height * .15,
        ),
        radius: Radius.circular(size.height * .05),
        largeArc: true,
      )
      ..cubicTo(
        size.width * .6,
        size.height * .15,
        size.width * .5,
        size.height * .46,
        0,
        size.height * .3,
      )
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class RainParticleBehaviour extends RandomParticleBehaviour {
  static math.Random random = math.Random();

  bool enabled;

  RainParticleBehaviour({
    ParticleOptions options = const ParticleOptions(),
    Paint paint,
    this.enabled = true,
  })  : assert(options != null),
        super(options: options, paint: paint);

  @override
  void initPosition(Particle p) {
    p.cx = random.nextDouble() * size.width;
    if (p.cy == 0.0)
      p.cy = random.nextDouble() * size.height;
    else
      p.cy = random.nextDouble() * size.width * 0.2;
  }

  @override
  void initDirection(Particle p, double speed) {
    double dirX = (random.nextDouble() - 0.5);
    double dirY = random.nextDouble() * 0.5 + 0.5;
    double magSq = dirX * dirX + dirY * dirY;
    double mag = magSq <= 0 ? 1 : math.sqrt(magSq);

    p.dx = dirX / mag * speed;
    p.dy = dirY / mag * speed;
  }

  @override
  Widget builder(
      BuildContext context, BoxConstraints constraints, Widget child) {
    return GestureDetector(
      onPanUpdate: enabled
          ? (details) => _updateParticles(context, details.globalPosition)
          : null,
      onTapDown: enabled
          ? (details) => _updateParticles(context, details.globalPosition)
          : null,
      child: ConstrainedBox(
        // necessary to force gesture detector to cover screen
        constraints: BoxConstraints(
            minHeight: double.infinity, minWidth: double.infinity),
        child: super.builder(context, constraints, child),
      ),
    );
  }

  void _updateParticles(BuildContext context, Offset offsetGlobal) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var offset = renderBox.globalToLocal(offsetGlobal);
    particles.forEach((particle) {
      var delta = (Offset(particle.cx, particle.cy) - offset);
      if (delta.distanceSquared < 70 * 70) {
        var speed = particle.speed;
        var mag = delta.distance;
        speed *= (70 - mag) / 70.0 * 2.0 + 0.5;
        speed = math.max(
            options.spawnMinSpeed, math.min(options.spawnMaxSpeed, speed));
        particle.dx = delta.dx / mag * speed;
        particle.dy = delta.dy / mag * speed;
      }
    });
  }
}

class CustomShapeBorder extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    final double innerCircleRadius = 150.0;

    Path path = Path();
    path.lineTo(0, rect.height);
    path.quadraticBezierTo(rect.width / 2 - (innerCircleRadius / 2) - 30,
        rect.height + 15, rect.width / 2 - 75, rect.height + 50);
    path.cubicTo(
        rect.width / 2 - 40,
        rect.height + innerCircleRadius - 40,
        rect.width / 2 + 40,
        rect.height + innerCircleRadius - 40,
        rect.width / 2 + 75,
        rect.height + 50);
    path.quadraticBezierTo(rect.width / 2 + (innerCircleRadius / 2) + 30,
        rect.height + 15, rect.width, rect.height);
    path.lineTo(rect.width, 0.0);
    path.close();

    return path;
  }
}
