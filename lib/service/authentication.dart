import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pim/core/constants.dart';
import 'package:pim/home_page.dart';
import 'package:pim/model/user_model.dart';
import 'package:pim/screens/sign_in_screen.dart';

class AuthServices {
  //Create instances

  FirebaseFirestore database = FirebaseFirestore.instance;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController loginemail = TextEditingController();
  TextEditingController loginpassword = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final TextEditingController textEditingController = TextEditingController();

  // Google Sign-In
  googleSignIn(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await auth.signInWithCredential(credential);

        // Check if the user already exists in the database
        DocumentSnapshot userSnapshot = await database
            .collection('users')
            .doc(auth.currentUser?.email)
            .collection('logincredential')
            .doc(auth.currentUser?.email)
            .get();
        if (!userSnapshot.exists) {
          // Add the user's data to the database if it doesn't exist
          await adduserdata(
            UserModel(
              email: auth.currentUser?.email ?? '',
              name: auth.currentUser?.displayName ?? '',
              id: auth.currentUser?.uid ?? '',
            ),
          );
        }
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Homepage()));
      }
    } catch (e) {}
  }

  // Function to fetch user details
  Future<Map<String, dynamic>?> getUserDetails() async {
    final auth = FirebaseAuth.instance;
    final database = FirebaseFirestore.instance;

    try {
      DocumentSnapshot userSnapshot = await database
          .collection('users')
          .doc(auth.currentUser?.email)
          .collection('logincredential')
          .doc(auth.currentUser?.email)
          .get();

      if (userSnapshot.exists) {
        return userSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user details: $e');
      }
    }
    return null; // Return null if no user details found
  }

  signuUp(BuildContext context) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      await adduserdata(UserModel(
        email: email.text,
        name: name.text,
        id: auth.currentUser?.uid,
      ));
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Homepage()));
    } catch (e) {}
  }

  logout(BuildContext context) async {
    try {
      await auth.signOut();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SignInPage()));
    } catch (e) {}
  }

  //Sign in user
  signIn(BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: loginemail.text.trim(),
        password: loginpassword.text.trim(),
      );
      loginemail.clear();
      loginpassword.clear();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Homepage()));
    } catch (e) {
      debugPrint('Something issue when login tym $e');
    }
  }

  //Add user to firabase
  adduserdata(UserModel userModel) async {
    try {
      await database
          .collection('users')
          .doc(auth.currentUser?.email)
          .collection('logincredential')
          .add(userModel.toMap());
    } catch (e) {}
  }
}
