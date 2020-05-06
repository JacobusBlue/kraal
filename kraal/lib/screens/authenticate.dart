import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:kraal/services/auth.dart';
//import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';



class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  final  FirebaseAuthService _auth = FirebaseAuthService();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var padding = 15.0;
    return Scaffold(
      backgroundColor: Colors.green[800],
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.white, Colors.green[400]]
              // colors: [Colors.green[600], Colors.brown[600]]   //opsie 1 (Petro)
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, 
                children: <Widget>[
                  // Text("Kraal", style: TextStyle(
                  //   fontSize: 90.0
                  // ),),
                  Container(
                    //color: Colors.blue,
                    height: 200,
                    width: 320,
                    child: Image.asset(
                      "resources/images/kraalHead.png", 
                      //color: Colors.green, //also cool !!
                      fit: BoxFit.fill,
                    )
                  ),
                  
                  SizedBox(height: 100.0,),
                  RaisedButton(
                    child: Text('Aign In Anonomusly'),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      dynamic result = await _auth.signInAnon();
                      if (result == null) { 
                        print('error sigining in');
                      } else {
                        print("Singed in !! : )");
                        isLoading = false;
                        //print(result.uid);
                      }
                    },
                  ),
                  SizedBox(height: padding),
                  GoogleSignInButton(
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      dynamic result = FirebaseAuthService().signInGoogle();
                      if (result == null) { 
                        print('error sigining in');
                      } else {
                        print("Singed in !! : )");
                        isLoading = false;
                        //print(result.uid);
                      }
                    },  // default: false
                  ),
                  
                  SizedBox(height: padding),
                  Stack(
                    //fit: StackFit.expand,
                    //alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        height: 200,
                        child: Image.asset(
                          "resources/images/bottomFence.png", 
                          fit: BoxFit.fill,
                        ),
                     ),
                    SizedBox(height: padding),
                    // FacebookSignInButton(onPressed: () {}),
                    // SizedBox(height: padding),
                    // TwitterSignInButton(onPressed: () {}),
                    ],
                  ),
                   
                  

               
                ],
              ),
            ),
          ),
        ),
      );
  }
}