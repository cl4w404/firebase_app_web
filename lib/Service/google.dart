import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

String name;
String imageUrl;
String uid;
String userEmail;

//Future<String> signInWithGoogle() async {
  // Initialize Firebase
  //await Firebase.initializeApp();
  
  //final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
 // final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
  
  //final AuthCredential credential = GoogleAuthProvider.credential(
   // accessToken: googleSignInAuthentication.accessToken,
    //idToken: googleSignInAuthentication.idToken,
 //);
  
  //final UserCredential userCredential = await _auth.signInWithCredential(credential);
  //final User user = userCredential.user;
  
  //if (user != null) {
    // Checking if email and name is null
    //assert(user.uid != null);
    //assert(user.email != null);
    //assert(user.displayName != null);
    //assert(user.photoURL != null);
  
   //uid = user.uid;
    //name = user.displayName;
    //userEmail = user.email;
    //imageUrl = user.photoURL;
  
   // assert(!user.isAnonymous);
   // assert(await user.getIdToken() != null);
  
   // final User currentUser = _auth.currentUser;
    //assert(user.uid == currentUser.uid);
  
    //SharedPreferences prefs = await SharedPreferences.getInstance();
   //prefs.setBool('auth', true);
  
    //return 'Google sign in successful, User UID: ${user.uid}';
 // }
  
  //return null;
//}