import 'package:flutter/material.dart';
import 'package:kraal/models/reusables.dart';
import 'package:kraal/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:kraal/models/user.dart';


class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    final String Uid = user.uid ?? "?";
    final String Email = user.email ?? "?";
    final String DisplayName = user.displayName ?? "Unknown";
    final String PhoneNumber = user.phoneNumber ?? "NoNumber";
    final bool IsAnonymous = user.isAnonymous ?? "I dont know";
    
    return Scaffold(
      //backgroundColor: Colors.redAccent[100],
      appBar: LivestockAppbar(title: Text("User Info"),context: context,),

      body: SingleChildScrollView(
              child: Container(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              heading(DisplayName),
              Divider(
                thickness: 2.0,
              ),
              CircleAvatar(
                backgroundColor: Colors.red[200],
                child: Icon(Icons.person,size: 100,),
                radius: 80.0,
              ),
              Divider(),
              Row(children: <Widget>[
                Icon(Icons.email, size: 40.0,),
                SizedBox(width: 30.0,),
                Text(Email),
              ],),
              Divider(),
              Row(children: <Widget>[
                Icon(Icons.phone, size: 40.0,),
                SizedBox(width: 30.0,),
                Text(PhoneNumber),
              ],),
              Divider(),
              GestureDetector(
                onTap: () {
                  
                },
                child: Row(children: <Widget>[
                  Icon(Icons.add_location, size: 40.0,),
                  SizedBox(width: 30.0,),
                  Text("Please set your location"),
                  
                ],),
              ),
              SizedBox(height: 100.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red)),
                    color: Colors.white,
                    textColor: Colors.red,
                    padding: EdgeInsets.all(20.0),
                    onPressed: () {},
                    child: Text(
                      "Edit details".toUpperCase(),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red)),
                    onPressed: () {
                      FirebaseAuthService().signOut();
                    },
                    color: Colors.red,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(20.0),
                    child: Text("Log out".toUpperCase(),
                      style: TextStyle(fontSize: 14)),
                  ),
                ],   
              ),
              // Container(
              //   height: 200,
              //   width: 200,
              //   color: Colors.deepOrange,
              //   child: GoogleMap(
              //     mapType: MapType.hybrid,
              //     initialCameraPosition: CameraPosition(
              //       target: LatLng(1.0, 1.0),
              //       zoom: 10.011
              //     ),
              //     onMapCreated: (GoogleMapController controller) {
              //       //_controller = controller;
              //     },
                  
              //   ),
              // )
           

            ],
          ),
        ),
    ),
      ),
  );
  }
}