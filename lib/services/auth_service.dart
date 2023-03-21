import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:zartek_machine_test/view/screens/home_screen/home_screen.dart';

class AuthClass {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth authInstance = FirebaseAuth.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //For Google SignIN
  Future<void> googleSignIn({required BuildContext context}) async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);

        try {
          UserCredential userCredential =
              await authInstance.signInWithCredential(credential);
          // storeTokenAndData(userCredential: userCredential);
          Get.off(HomeScreen());
        } catch (e) {
          //error while sigin in firebase
        }
      } else {
        //show error snackbar
      }
    } catch (e) {}
  }

  //For SignOut
  Future signOut() async {
    //authentication for signout in firebase

    //check if the user is signed in?
    // if (_auth.currentUser != null) {
    //   //the signed in user account
    //   User user = _auth.currentUser!;

    //   //check the providerID to determine how the user signed in
    //   if (user.providerData[0].providerId == 'google.com') {
    //     await FirebaseAuth.instance.signOut();
    //     await _googleSignIn.signOut();
    //   } else {
    //     await FirebaseAuth.instance.signOut();
    //   }
    // }
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  //verify phone number
  Future<void> verifyPhoneNumber(
      String phoneNumber, BuildContext context, Function setData) async {
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      showSnackBar(context, "Verification Completed");
    };
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException exception) {
      showSnackBar(context, exception.toString());
    };
    PhoneCodeSent codeSent =
        (String verificationID, [int? forceResnedingtoken]) {
      showSnackBar(context, "Verification Code sent on the phone number");
      setData(verificationID);
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationID) {
      // showSnackBar(context, "Time out");
    };
    try {
      await _auth.verifyPhoneNumber(
          timeout: Duration(seconds: 60),
          phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      // showSnackBar(context, e.toString());
    }
  }

  //for phone
  Future<void> signInwithPhoneNumber(
      String verificationId, String smsCode, BuildContext context) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      // storeTokenAndData(userCredential: userCredential);
      Get.to(HomeScreen());

      log("logged in");
    } catch (e) {
      log("Some error");
    }
  }

  //snackbar
  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
