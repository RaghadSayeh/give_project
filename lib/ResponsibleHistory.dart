import 'package:flutter/material.dart';
import 'dart:math';
import 'text_styles.dart';
import 'extention.dart';
import 'theme.dart';
import 'light_color.dart';
import 'dactor_model.dart';
import 'data.dart';
import 'HomePageResponsible.dart';
import 'home2.dart';
import 'ResponsibleNotification.dart';
import 'ResponsibleSettings.dart';
class ResponsibleHistory extends StatefulWidget {
  ResponsibleHistoryState createState() => ResponsibleHistoryState();
}

class ResponsibleHistoryState extends State<ResponsibleHistory> {
  List<DoctorModel> doctorDataList;
  @override
  void initState() {
    super.initState();
    doctorDataList = doctorMapList.map((x) => DoctorModel.fromJson(x)).toList();
    print("ResponsibleHistoryState called");
  }

  Widget _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.cyan[300],
      leading: Icon(
        Icons.arrow_back_ios,
        size: 25,
        color: Colors.white,
      ),
       title: Text('أرشيف الطلبات',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 21.0,
                  color: Colors.white)),
          centerTitle: true,
    );
  }

  Widget _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text("مرحبا بك مجددا", style: TextStyle(fontSize:17)),
        Text("دار أيتام فرع جنين", style: TextStyle(fontSize:20,color:Colors.white)),
      ],
    ).p16;
  }

  Widget _searchField() {
    return Container(
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(13)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: LightColor.grey.withOpacity(.3),
            blurRadius: 15,
            offset: Offset(5, 5),
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyles.body.subTitleColor,
          suffixIcon: SizedBox(
              width: 50,
              child: Icon(Icons.search, color: LightColor.purple)
                  .alignCenter
                  .ripple(() {}, borderRadius: BorderRadius.circular(13))),
        ),
      ),
    );
  }

  Widget _category() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("المضافة حديثا", style: TextStyles.title.bold),
              
            ],
          ),
        ),
        SizedBox(
          height: AppTheme.fullHeight(context) * .28,
          width: AppTheme.fullWidth(context),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _categoryCard("Chemist & Drugist", "350 + Stores",
                  color: Colors.pink, lightColor: Colors.pink),
              _categoryCard("Covid - 19 Specilist", "899 Doctors",
                  color: Colors.pink, lightColor: Colors.pink),
              _categoryCard("Cardiologists Specilist", "500 + Doctors",
                  color: Colors.pink, lightColor: Colors.pink)
            ],
          ),
        ),
      ],
    );
  }

  Widget _categoryCard(String title, String subtitle,
      {Color color, Color lightColor}) {
    TextStyle titleStyle = TextStyles.title.bold.white;
    TextStyle subtitleStyle = TextStyles.body.bold.white;
    if (AppTheme.fullWidth(context) < 392) {
      titleStyle = TextStyles.body.bold.white;
      subtitleStyle = TextStyles.bodySm.bold.white;
    }
    return AspectRatio(
      aspectRatio: 6 / 8,
      child: Container(
        height: 280,
        width: AppTheme.fullWidth(context) * .3,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 10,
              color: lightColor.withOpacity(.8),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -20,
                  left: -20,
                  child: CircleAvatar(
                    backgroundColor: lightColor,
                    radius: 60,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Flexible(
                      child: Text(title, style: titleStyle).hP8,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: Text(
                        subtitle,
                        style: subtitleStyle,
                      ).hP8,
                    ),
                  ],
                ).p16
              ],
            ),
          ),
        ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }

  Widget _doctorsList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("جميع الطلبات المنتهية", style: TextStyles.title.bold),
              IconButton(
                  icon: Icon(
                    Icons.sort,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {})
              // .p(12).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20))),
            ],
          )
          .hP16,
          getdoctorWidgetList()
        ],
      ),
    );
  }

  Widget getdoctorWidgetList() {
    return Column(
        //  children: [
        // ListView.builder(
        //     shrinkWrap: true,
        //     scrollDirection: Axis.horizontal,
        //     itemCount: 5,
        //     itemBuilder: (BuildContext context, int index) {
        //       return _doctorTile();
        //     })
        //  ],
        children: doctorDataList.map((x) {
      return _doctorTile();
    }).toList());
  }

  Widget _doctorTile() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 10,
            color: LightColor.grey.withOpacity(.2),
          ),
          BoxShadow(
            offset: Offset(-3, 0),
            blurRadius: 15,
            color: LightColor.grey.withOpacity(.1),
          )
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          
          leading:Icon(
            Icons.keyboard_arrow_left,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
          title: Text("testName", style: TextStyles.title.bold),
          subtitle: Text(
            "test type",
            style: TextStyles.bodySm.subTitleColor.bold,
          ),
          trailing: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: randomColor(),
              ),
              child: Image.asset(
                "assets/images/1.png",
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ).ripple(() {
        // Navigator.pushNamed(context, "/DetailPage", arguments: model);
      }, borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }

  Color randomColor() {
    var random = Random();
    final colorList = [
      Theme.of(context).primaryColor,
      LightColor.orange,
      LightColor.green,
      LightColor.grey,
      LightColor.lightOrange,
      LightColor.skyBlue,
      LightColor.titleTextColor,
      Colors.red,
      Colors.brown,
      LightColor.purpleExtraLight,
      LightColor.skyBlue,
    ];
    var color = colorList[random.nextInt(colorList.length)];
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.cyan[300],
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
              //  _header(),
               // _searchField(),
                _category(),
              ],
            ),
          ),
          _doctorsList()
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
        ),
    );
  }
}
