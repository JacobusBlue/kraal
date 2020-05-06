import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kraal/models/user.dart';


class FirebaseAuthService {

  final FirebaseAuth  _auth = FirebaseAuth.instance;

  //CREATE USER OBJECT
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid, displayName: user.displayName, phoneNumber: user.phoneNumber, isAnonymous: user.isAnonymous, email: user.email,) : null;
  }
  // EVERY TIME USER SIGN IN OR OU THIS CHANGES
  Stream<User> get user {
    return _auth.onAuthStateChanged
      //.map(_userFromFirebaseUser);
      .map(_userFromFirebaseUser);
  }

  //signin with anaon
  Future signInAnon() async {  //<FirebaseUser> 
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser  user = result.user;

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  } 

  //sign in with email and password

  //registar email and password

  //sign in with google

  Future signInGoogle() async {
    try {
      final GoogleSignIn _googleSignIn  = GoogleSignIn();
      final FirebaseAuth _auth = FirebaseAuth.instance;

      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();

      // Step 2
      GoogleSignInAuthentication googleAuth = await googleSignInAccount.authentication;
    
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
    
      FirebaseUser user = (await _auth.signInWithCredential(credential)).user;

      // AuthResult result = await _auth.signInWithGoogle();
      // FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
    }
  }

  //Sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}