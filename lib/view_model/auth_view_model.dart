

import 'package:ecommerce/view/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController{

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String? email,password,name;

  // this user is come from firebase
  Rx<User>? user;
  // Rx<User> _user = Rx<User>();
  // String get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // _user.bindStream(_auth.authStateChanges());

  }

  void googleSignInMethod() async{
    final GoogleSignInAccount? googleUser =  await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication googleSignInAuthentication = await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _firebaseAuth.signInWithCredential(credential).then((user){
      Get.offAll(Home());
    });
  }


  // void facebookSignInMethod() async {
  //   final LoginResult result = await FacebookAuth.instance.login();
  //
  //   final FacebookAuthCredential facebookAuthCredential =
  //   FacebookAuthProvider.credential(result.token);
  //
  //   await _auth.signInWithCredential(facebookAuthCredential).then((user) {
  //     saveUser(user);
  //   });
  // }


  void signInWithEmailAndPassword() async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email??" ", password: password??" ");
      Get.offAll(Home());
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: Colors.black87,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }


}