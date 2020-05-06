import 'package:flutter/material.dart';



class LivestockAppbar extends AppBar {
  final bool showSettings = false;
  LivestockAppbar({Key key, Widget title, bool centerTitle , BuildContext context, bool showSettings}) : 
  super(key: key,title: title, centerTitle: true, actions: <Widget>[
    
    IconButton(
      icon: Icon(Icons.settings), 
      onPressed: () {
        
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => settingsPage()),
        // ); 
      },
    ),
  ], 
  //backgroundColor: Colors.redAccent[400],
  backgroundColor: Colors.green[400]
  );
}

// Widget ReadMore(String heading, String data) {
//   return ExpandablePanel(

//       header: Text(heading,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20 )),
//       collapsed: Text(data, softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis, ),
//       expanded: Text(data, softWrap: true, ),
      
//     );
// }

Widget heading(String text){
  return Text(
    text,
    textAlign: TextAlign.left,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black87,
      fontSize: 30.0,
      
    ),
  );
}





 settings(BuildContext context) {
  
  return [
    // AppBar(
    //   centerTitle: true,
    //   elevation: 0.0,

    // )
    Text("Settings"),
    IconButton(
      icon: Icon(Icons.settings),
      onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => settingsPage()),
        // ); 
      },
    ),
  ];
}

