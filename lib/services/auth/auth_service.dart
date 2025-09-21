import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../database/database_service.dart';

/*

AUTHENTICATION SERVICE

This handles everything to do with authentication in firebase

--------------------------------------------------------------------------------

- Login
- Register
- Logout
- Delete account ( required if you want to publish to app store )

*/

class AuthService {
  // get instance of the auth
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get current user & uid
  User? getCurrentUser() => _auth.currentUser;
  String getCurrentUid() => _auth.currentUser!.uid;

  // login -> email & pw
  Future<UserCredential> loginEmailPassword(String email, password) async {
    // attempt login
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    }

    // catch any errors..
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign up   register -> email & pw
  Future<UserCredential> registerEmailPassword(String email, password) async {
    // attempt to register new user
    try {
      // sign user in
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // save user in4 if it doesn't already exit
      _firestore.collection("User").doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': email,
        },
      );
      // save user in4 in as separate doc
      _firestore.collection("User").doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': email,
        },
      );
      return userCredential;
    }

    // catch any errors..
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  // delete account
  Future<void> deleteAccount() async {
    // get current uid
    User? user = getCurrentUser();

    if (user != null) {
      // delete user's data from firestore
      await DatabaseService().deleteUserInfoFromFirebase(user.uid);

      // delete the user's auth record
      await user.delete();
    }
  }
}
