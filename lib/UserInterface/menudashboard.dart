import 'package:flutter/material.dart';
final Color backgroundColor = Color(0xFF4A4A58);

class MenuDashboard extends StatefulWidget{
  @override
  _MenuDashboardState createState() => _MenuDashboardState();
}

class _MenuDashboardState extends State<MenuDashboard> with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth ;
  double screenHeight;
  final Duration duration = const Duration(milliseconds: 300);

  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<Offset> _slideAnimation;
  Animation<double> _menuScaleAnimation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.6 ).animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1 ).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1,0) ,end:Offset(0,0)).animate(_controller);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
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
  return SlideTransition(
    position: _slideAnimation,
    child: ScaleTransition(
      scale: _menuScaleAnimation,
      child: Padding(
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
      ),
    ),
  );
  }

  Widget dashboard(context) {
  return AnimatedPositioned(
    duration: duration ,
    top: 0, ///isCollapsed ? 0 : 0.2 * screenHeight,
    bottom: 0, ///isCollapsed ? 0 : 0.2 * screenWidth,
    left: isCollapsed ? 0 : 0.6 * screenWidth,
    right: isCollapsed ? 0 : -0.4 * screenWidth,
    child: ScaleTransition(
      scale: _scaleAnimation,
      child: Material(
        animationDuration: duration,
        borderRadius: BorderRadius.all(Radius.circular(40)),
        elevation: 8,
        color: backgroundColor,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical ,
          physics: ClampingScrollPhysics(),
          child: Container(
            padding:const EdgeInsets.only(left: 16, right: 16, top:24) ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,

                    children: [

                InkWell(
                  child: Icon(Icons.menu , color: Colors.white),
                  onTap: (){
                  setState(() {
                    if (isCollapsed)
                      _controller.forward();
                    else
                      _controller.reverse();

                    isCollapsed = !isCollapsed;
                  });
                },
                ),
                  Text("Nagarro Romania", style: TextStyle(fontSize: 30, color: Colors.white)),
                  Icon(Icons.airplanemode_active , color: Colors.white),
               ]
                ),
                SizedBox(height: 50),
                Container(
                  height: 190,
                  child: PageView(
                    controller: PageController(viewportFraction: 1.1),
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        color: Colors.blueAccent,
                        width: 100,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        color: Colors.amber,
                        width: 100,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        color: Colors.redAccent,
                        width: 100,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text("Devices",style: TextStyle(fontSize: 22, color: Colors.cyan)),
                ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context,index) {
                  return ListTile(
                    title: Text("iMac",style: TextStyle(fontSize: 18, color: Colors.cyan)),
                    subtitle: Text("Apple",style: TextStyle(fontSize: 13, color: Colors.cyan)),
                    trailing: Text("Ownned", style: TextStyle(fontSize: 20, color: Colors.cyan)),
                  );
                }, separatorBuilder: (context,index){
                  return Divider(height: 16);
                }, itemCount: 10)

              ],

            ),
          ),
        ),
      ),
    ),
  );
  }
}