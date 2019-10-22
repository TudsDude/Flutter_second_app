import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return Center(
      child: Container(
      alignment: Alignment.center,
      color: Colors.teal,
                 /* width: 192.0,
                   height: 96.0,
                   margin: EdgeInsets.all(15.0),*/
      /*width and height are ignored in flutter because of the Contaier layout Widget, we already use center; 
            //we should create a child for the container then we can position our text
          //I created a child, i named as Container then I renamed original Container to Center, i swithced the names.
        //Actually I don't want at the momment to declare the limits of the Container, so I will comment the Limits */
      
      
      child: Text("Nagarro", textDirection: TextDirection.ltr,
      style: TextStyle(
        fontSize: 36.0,
        color: Colors.white
      ) ,
      )
      )
    );
  }
  
}



/// Read The comments for a better Documentation. 