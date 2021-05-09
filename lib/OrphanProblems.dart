import 'package:flutter/material.dart';
import 'HomePageResponsible.dart';
import 'home2.dart';
import 'ResponsibleNotification.dart';

class OrphanProblems extends StatefulWidget {
  @override
  _OrphanProblemsState createState() => _OrphanProblemsState();
}

class _OrphanProblemsState extends State<OrphanProblems> {
  var selectedCard = 'مشكلة التعليم';

  //card title, info , unit
  List<String> probTitle = [
    'مشكلة التعليم',
    'نقص بعض الموارد البشرية',
    'التاهيل النفسي',
    'نقص الملابس الشتوية',
    'ضيق المساحات المخصصة'
  ];

  List<String> priority = [
    'بالغة الاهمية',
    'متوسطة الاهمية',
    'قليلة الاهمية',
  ];

  List<String> sinceDte = [
    '2019-02-21',
    '2020-03-01',
    '2018-09-22',
    '2020-10-30',
    '2017-05-23'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('مشاكل الميتم',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18.0,
                  color: Colors.white)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child:
              //   ListView(children: [
              Stack(children: [
            Container(
                height: MediaQuery.of(context).size.height - 82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent),
            Positioned(
                top: 95.0,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(55.0),
                          topRight: Radius.circular(55.0),
                        ),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height - 100.0,
                    width: MediaQuery.of(context).size.width)),
            Positioned(
                top: 25.0,
                left: (MediaQuery.of(context).size.width / 2) - 100.0,
                child: Hero(
                    tag: "Tag here",
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/images/problem1.jpg"),
                                fit: BoxFit.cover)),
                        height: 200.0,
                        width: 200.0))),
            Positioned(
                top: 250.0,
                left: 25.0, // changed
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center, //changed
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 125.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17.0),
                              color: Colors.cyan[300]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 25.0,
                                  width: 50.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      color: Colors.cyan[300]),
                                  child: Center(child: new Text("إضافة")),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      color: Colors.pink),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.cyan[300],
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30.0),
                    Container(
                        height: 320.0,
                        child: ListView.builder(
                            //    physics:
                            //      const AlwaysScrollableScrollPhysics(), // new
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: probTitle.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  _buildInfoCard(probTitle[index], priority[0],
                                      sinceDte[index]),
                                  SizedBox(width: 10.0),
                                ],
                              );
                              //
                            })),
                  ],
                ))
          ]),
          // ]
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

  Widget _buildInfoCard(String cardTitle, String info, String unit) {
    return InkWell(
        onTap: () {
          selectCard(cardTitle);
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color:
                  cardTitle == selectedCard ? Colors.cyan[300] : Colors.white,
              border: Border.all(
                  color: cardTitle == selectedCard
                      ? Colors.transparent
                      : Colors.grey.withOpacity(0.3),
                  style: BorderStyle.solid,
                  width: 0.75),
            ),
            height: 280.0,
            width: 170.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0, bottom: 8),
                    child: Text(cardTitle,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          color: Colors.black,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(info,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14.0,
                                color: cardTitle == selectedCard
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text(unit,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              color: cardTitle == selectedCard
                                  ? Colors.white
                                  : Colors.black,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.more_horiz,
                        size: 26,
                      ),
                      onPressed: () {},
                      color: Colors.pink,
                    ),
                  ),
                ])));
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}
