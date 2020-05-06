import 'package:flutter/material.dart';
import 'package:kraal/models/user.dart';
import 'package:kraal/screens/authenticate.dart';
import 'package:kraal/screens/landingPage.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("In Wrapper");
    final user = Provider.of<User>(context);

    if (user == null) {
      
      return Authenticate();
    } else {
      //return Authenticate();
      //return publish();
      return landingPage();
      //return Home ();
    }
  }
  
}