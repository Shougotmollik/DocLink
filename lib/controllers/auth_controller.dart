import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doclink/routes/route_names.dart';
import 'package:doclink/services/database.dart';
import 'package:doclink/services/shared_pref.dart';
import 'package:doclink/utils/ui_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var regiLoading = false.obs;
  var loginLoading = false.obs;

  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  final TextEditingController nameTEController = TextEditingController();
  final TextEditingController mobileTEController = TextEditingController();

  // Registration method using firebase
  Future<void> userRegistration({
    required String name,
    required String email,
    required String password,
    required String mobile,
  }) async {
    try {
      regiLoading.value = true;
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      //   User user Id
      final id = userCredential.user?.uid;

      // save user session locally
      SharedPreferenceHelper().saveUserId(id!);
      SharedPreferenceHelper().saveUserName(name);
      SharedPreferenceHelper().saveUserEmail(email);
      SharedPreferenceHelper().saveUserImage(
        'https://cdn-icons-png.flaticon.com/512/149/149071.png',
      );
      // add into FireStore DB
      Map<String, dynamic> userInfoMap = {
        "id": id,
        "Name": name,
        "Email": email,
        "Mobile": mobile,
        'Image': 'https://cdn-icons-png.flaticon.com/512/149/149071.png',
      };
      DatabaseMethods().addUserDetails(userInfoMap, id);
      regiLoading.value = false;
      Get.offAllNamed(RouteNames.mainNavBarScreen);
      showSnackBar('Success', 'Registered Successfully');
    } on FirebaseAuthException catch (e) {
      regiLoading.value = false;
      if (e.code == 'email-already-in-use') {
        showSnackBar('Failed', 'Email already exists', isError: true);
      } else if (e.code == 'weak-password') {
        showSnackBar('Failed', 'Password is too weak', isError: true);
      } else if (e.code == 'network-request-failed') {
        showSnackBar(
          'Failed',
          'Please Your check internet connection',
          isError: true,
        );
      }
    }
  }

  // Login methods with firebase
  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    try {
      loginLoading.value = true;
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      final id = userCredential.user?.uid;
      // Fetch data from FireStore
      var userDocs = await FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .get();
      if (userDocs.exists) {
        var userData = userDocs.data()!;
        //   Save session locally
        SharedPreferenceHelper().saveUserId(id!);
        SharedPreferenceHelper().saveUserEmail(email);
        SharedPreferenceHelper().saveUserName(userData['Name']);
      }

      loginLoading.value = false;
      showSnackBar('Success', 'Sign in successfully');
      Get.offAllNamed(RouteNames.mainNavBarScreen);
    } on FirebaseAuthException catch (e) {
      loginLoading.value = false;
      if (e.code == 'user-not-found') {
        showSnackBar('Failed!', 'user not exists', isError: true);
      } else if (e.code == 'invalid-email') {
        showSnackBar('Failed!', 'email is incorrect', isError: true);
      } else if (e.code == 'wrong-password') {
        showSnackBar('Failed!', 'password is incorrect', isError: true);
      } else if (e.code == 'network-request-failed') {
        showSnackBar(
          'Failed',
          'Please Your check internet connection',
          isError: true,
        );
      } else {
        showSnackBar('Failed!', 'Invalid email and password', isError: true);
      }
    }
  }

  @override
  void dispose() {
    emailTEController.dispose();
    passwordTEController.dispose();
    nameTEController.dispose();
    mobileTEController.dispose();
    super.dispose();
  }
}
