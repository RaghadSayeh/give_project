import 'package:flutter/material.dart';

class ResActivities extends StatefulWidget {
  _ResActivitiesState createState() => _ResActivitiesState();
}

class _ResActivitiesState extends State<ResActivities> {
  int count = 10;
  final storyText = Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(
        "أنشطة الجمعية",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      )
    ],
  );
  final storyProfile = Expanded(
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 8,
      itemBuilder: (context, index) => Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            // color: Colors.black,
            width: 80.0,
            height: 120.0,
            decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/1.png"),
                )),
            //   margin: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
          index == 7
              ? Positioned(
                  right: 10.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    radius: 10.0,
                    child: Icon(
                      Icons.add,
                      size: 14.0,
                      color: Colors.white,
                    ),
                  ),
                )
              : Container()
        ],
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          storyText, //check above image for understanding
          storyProfile
        ],
      ),
    );
  }
}
