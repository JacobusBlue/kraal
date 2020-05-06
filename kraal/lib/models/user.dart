class User {

  final String uid;
  final String displayName;
  final String phoneNumber;
  final bool  isAnonymous;
  final String email;
  final List<String> addsPosted;
  final int posts = 0;
  final Function logout;
  
  User({this.uid , this.displayName, this.phoneNumber, this.isAnonymous, this.email, this.addsPosted, this.logout});

  
}

