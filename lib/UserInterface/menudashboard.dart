import 'package:flutter/material.dart';
final Color backgroundColor = Color(0xFF4A4A58);

class MenuDashboard extends StatefulWidget{
  @override
  _MenuDashboardState createState() => _MenuDashboardState();
}

class _MenuDashboardState extends State<MenuDashboard> {
  bool isCollapsed = true;
  double screenWidth ;
  double screenHeight;
  final Duration duration = const Duration(milliseconds: 600);
@override
Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  screenHeight = size.height;
  screenWidth = size.width;
  return Scaffold(
    backgroundColor: backgroundColor,
    body: Stack(
      children: <Widget>[
        menu(context),
      dashboard(context),
      //  dashboard(context),
      ],
    ),
  );

}

Widget menu(context) {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround ,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Text(
      "Menu" , style:  TextStyle(color: Colors.white,  fontSize:30 )
 ),
          SizedBox(height: 15),
          Icon(Icons.message,color: Colors.white),
          Text(
      "Messages" , style:  TextStyle(color: Colors.white,  fontSize:18 )
 ),
          SizedBox(height: 10),
          Icon(Icons.monetization_on,color: Colors.white),
          Text(
      "Funds" , style:  TextStyle(color: Colors.white,  fontSize:18 )
 ),
          SizedBox(height: 10),
          Icon(Icons.calendar_today,color: Colors.white),
          Text(
              "Hollyday" , style:  TextStyle(color: Colors.white,  fontSize:18 )
 ),
          SizedBox(height: 10),
          Icon(Icons.pan_tool,color: Colors.white),
          Text(
      "Team" , style:  TextStyle(color: Colors.white,  fontSize:18 )
 ),

            ],
         ),
    ),
  );
  }

  Widget dashboard(context) {
  return AnimatedPositioned(
    duration: duration ,
    top: isCollapsed ? 0 : 0.2 * screenHeight,
    bottom: isCollapsed ? 0 : 0.2 * screenWidth,
    left: isCollapsed ? 0 : 0.6 * screenWidth,
    right: isCollapsed ? 0 : -0.4 * screenWidth,
    child: Material(
      animationDuration: duration,
      borderRadius: BorderRadius.all(Radius.circular(40)),
      elevation: 8,
      color: backgroundColor,
      child: Container(
        padding:const EdgeInsets.only(left: 16, right: 16, top:24) ,
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,

                children: [

            InkWell(
              child: Icon(Icons.menu , color: Colors.white),
              onTap: (){
              setState(() {
                isCollapsed = !isCollapsed;
              });
            },
            ),
              Text("Hello Nagarrian", style: TextStyle(fontSize: 30, color: Colors.white)),
              Icon(Icons.airplanemode_active , color: Colors.white),
           ]
            ),
          ],

        ),
      ),
    ),
  );
  }
}