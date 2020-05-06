import 'package:flutter/material.dart';
import 'package:kraal/models/user.dart';
import 'package:kraal/screens/Wrapper.dart';
import 'package:kraal/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("in MyApp");
    return StreamProvider<User>.value(
      value: FirebaseAuthService().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
        
        home: Wrapper(),
      ),
    );
  }
}
