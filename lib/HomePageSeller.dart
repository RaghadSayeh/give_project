import 'package:flutter/material.dart';
import 'clipper.dart';
import 'LoginORSignup.dart';

class HomePageSeller extends StatefulWidget {
  @override
  HomePageSellerState createState() => HomePageSellerState();
}

class HomePageSellerState extends State<HomePageSeller> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.white,
        //   ),
        //   iconSize: 20.0,
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        backgroundColor:Theme.of(context).primaryColor,
        title: new Text(
          "الصفحة الرئيسية",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 10),
          color: Colors.white,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(10, (index) {
              return GestureDetector(
                  child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                margin: EdgeInsets.fromLTRB(10, 2, 10, 5),
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 0, 5, 0),
                      child: SizedBox(
                        height: 120,
                        child: GestureDetector(
                          onTap: () async {},
                          child: Container(
                              child: new ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            child: Image.asset(
                              "assets/images/" + index.toString() + ".png",
                              fit: BoxFit.cover,
                            ),
                          )),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 10.0, top: 5),
                          child: Text(
                            "تفاح",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              //  fontFamily: "palfont",
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     border: Border(
                        //         bottom: BorderSide(
                        //             width: 2.0, color: Color(0xFFffffff))),
                        //   ),
                        // ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            // SizedBox(
                            //   width: 30,
                            //   height: 30,
                            //   child: Container(
                            //     //   padding: EdgeInsets.only(left: 10.0, top: 5),
                            //     child: Text(
                            //       "تفاح",
                            //       overflow: TextOverflow.ellipsis,
                            //       style: TextStyle(
                            //         //  fontFamily: "palfont",
                            //         fontWeight: FontWeight.w500,
                            //         fontSize: 12,
                            //         color: Colors.white,
                            //       ),
                            //     ),
                            //   ),
                            // ),

                            SizedBox(
                              width: 30,
                              height: 30,
                              child: IconButton(
                                icon: new Icon(Icons.person),
                                color: Colors.white,
                                onPressed: () async {
                                  print("person icon");
                                  setState(() {
                                    setState(() {});
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: IconButton(
                                icon: new Icon(Icons.camera),
                                color: Colors.white,
                                onPressed: () async {},
                              ),
                            ),
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: IconButton(
                                icon: new Icon(Icons.mail),
                                color: Colors.white,
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                          ],
                        ),


                        
                      ],
                    )
                  ],
                ),
              )
                  );
            }),
          )),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor:Colors.white,
            type: BottomNavigationBarType.fixed,
            
onTap: (value) async{
  // value == 0 ?   Navigator.pop(context)
  // :null;
  // value == 1 ? Navigator.pop(context)
  // :null;
  // value == 3 ? Navigator.pop(context)
  // :null;
  if( value == 3 ){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => new LoginORSignup()));
  }

},

    //  currentIndex: 0, // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.home),
           title: new Text('الرئيسية'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.settings),
           title: new Text('الاعدادات'),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person),
           title: Text('الملف الشخصي')
         ),
           BottomNavigationBarItem(
           icon: Icon(Icons.logout),
           title: Text('تسجيل الخروج')
         )
       ],
     ),
    );
  }
}
