import 'package:flutter/material.dart';
import 'NotificationPage.dart';
import 'SettingsPage.dart';
import 'LoginORSignup.dart';
import 'HomePageSeller.dart';
import 'background.dart';

class GiverOrders extends StatefulWidget {
  @override
  _GiverOrdersState createState() => new _GiverOrdersState();
}

class _GiverOrdersState extends State<GiverOrders> {
  List<String> items = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8"
  ];

  List<String> images = [
    '124.jpg',
    '112.jpg',
    '125.jpg',
    '118.jpg',
    '178.jpg',
    '119.jpg',
    '113.jpg',
    '115.jpg'
  ];
  List<String> headers = [
    "تبرع دار أيتام جنين",
    "تبرع جمعية الاتحاد النسائي",
    "تبرع دار أيتام سلفيت",
    "تبرع ذوي الاحتياجات الخاصة",
    "تبرع دار أيتام نابلس",
    "تبرع دار أيتام طولكرم",
    "تبرع دار أيتام قلقيلية",
    "تبرع دار أيتام رام الله"
  ];

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    final headerList = new ListView.builder(
      itemBuilder: (context, index) {
        EdgeInsets padding = index == 0
            ? const EdgeInsets.only(
                left: 20.0, right: 10.0, top: 4.0, bottom: 30.0)
            : const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 4.0, bottom: 30.0);

        return new Padding(
          padding: padding,
          child: new InkWell(
            onTap: () {
              print('Card selected');
            },
            child: new Container(
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(10.0),
                color: Colors.lightGreen,
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ],
                image: new DecorationImage(
                  image: new ExactAssetImage(
                      'assets/images/' + index.toString() + '.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
              //                                    height: 200.0,
              width: 200.0,
              child: new Stack(
                children: <Widget>[
                  new Align(
                    alignment: Alignment.bottomCenter,
                    child: new Container(
                        decoration: new BoxDecoration(
                            color: const Color(0xFF273A48),
                            borderRadius: new BorderRadius.only(
                                bottomLeft: new Radius.circular(10.0),
                                bottomRight: new Radius.circular(10.0))),
                        height: 30.0,
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              '${items[index % items.length]}',
                              style: new TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
    );

    final body = new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: new Text(
          "أرشيف الطلبات",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: new Container(
        child: new Stack(
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.only(top: 10.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Expanded(
                      child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return new ListTile(
                              title: new Column(
                                children: <Widget>[
                                  new Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Container(
                                        height: 72.0,
                                        width: 72.0,
                                        decoration: new BoxDecoration(
                                            color: Colors.lightGreen,
                                            boxShadow: [
                                              new BoxShadow(
                                                  color: Colors.black
                                                      .withAlpha(70),
                                                  offset:
                                                      const Offset(2.0, 2.0),
                                                  blurRadius: 2.0)
                                            ],
                                            borderRadius: new BorderRadius.all(
                                                new Radius.circular(12.0)),
                                            image: new DecorationImage(
                                              image: new ExactAssetImage(
                                                'assets/images/' +
                                                    images[index],
                                              ),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      new SizedBox(
                                        width: 8.0,
                                      ),
                                      new Expanded(
                                          child: new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          new Text(
                                            headers[index].toString(),
                                            textAlign: TextAlign.justify,
                                            textDirection: TextDirection.rtl,
                                            style: new TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.black87,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          new Text(
                                            'هذا التبرع موجه من متبرع معين\nويذهب إلى دار أيتام حسب طلب المتبرع ويشمل نوع السلعة والسعر والكمية المتفق عليها لمزيد من التفاصيل يمكن الضغط هنا',
                                            style: new TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.normal),
                                          )
                                        ],
                                      )),
                                      // new Icon(
                                      //   Icons.delete,
                                      //   color: const Color(0xFF273A48),
                                      // )
                                    ],
                                  ),
                                  new Divider(),
                                ],
                              ),
                            );
                          }))
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        onTap: (value) async {
          value == 0
              ? Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new HomePageSeller()))
              : value == 1
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new NotificationPage()))
                  : value == 2
                      ? null
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new LoginORSignup()));
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
    );

    return new Container(
      decoration: new BoxDecoration(
        color: Colors.cyan[300],
      ),
      child: new Stack(
        children: <Widget>[
          new CustomPaint(
            size: new Size(_width, _height),
            painter: new Background(),
          ),
          body,
        ],
      ),
    );
  }
}
// class GiverOrders extends StatefulWidget {
//   _GiverOrdersState createState() => _GiverOrdersState();
// }

// class _GiverOrdersState extends State<GiverOrders> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         backgroundColor: Theme.of(context).primaryColor,
//         title: new Text(
//           "طلبات المتبرعين",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Container(
//         child: Column(
//           children: [],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         type: BottomNavigationBarType.fixed,
//         currentIndex: 2,
//         onTap: (value) async {
//           value == 0
//               ? Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => new HomePageSeller()))
//               : value == 1
//                   ? Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => new NotificationPage()))
//                   : value == 2
//                       ? Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => new SettingsPage()))
//                       : Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => new LoginORSignup()));
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: new Icon(Icons.home),
//             title: new Text('الرئيسية'),
//           ),
//           BottomNavigationBarItem(
//             icon: new Icon(Icons.notifications),
//             title: new Text('الاشعارات'),
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.settings), title: Text('الاعدادات')),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.logout), title: Text('تسجيل الخروج'))
//         ],
//       ),
//     );
//   }
// }
