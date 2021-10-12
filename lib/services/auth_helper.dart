import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flut/screens/home.dart';
import 'package:flutter_flut/screens/signin.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthentificationHelper {
  final BuildContext context;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthentificationHelper(this.context);

  Future<void> showSnackBar(String message) async {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), duration: Duration(seconds: 2)));
  }

  void loading() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => SimpleDialog(
              backgroundColor: Colors.transparent,
              children: [
                Center(
                  child: CircularProgressIndicator(),
                )
              ],
            ));
  }

  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    loading();
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await showSnackBar("Votre compte a été bien créé");
      Get.off(() => Home());
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        showSnackBar("Mot de passe facile a deviner");
      } else if (e.code == "email-already-in-use") {
        showSnackBar("Adresse email déjà en cours d'utilisation");
      } else if (e.code == "invalid-email") {
        showSnackBar("Adresse email invalide");
      }
      Get.back();
    } on SocketException catch (_) {
      showSnackBar("Veuillez vous connecter à internet");
      Get.back();
    } catch (e) {
      showSnackBar("Erreur inconnue ... Veuillez réessayer !");
      Get.back();
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    loading();
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.off(() => Home());
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-disabled") {
        showSnackBar("Votre compte est désactivé, contactez admin");
      } else if (e.code == "user-not-found") {
        showSnackBar("Compte inexistant");
      } else if (e.code == 'invalid-email') {
        showSnackBar("Email invalide");
      } else if (e.code == 'wrong-password') {
        showSnackBar("Mot de passe incorrect");
      }
      Get.back();
    } on SocketException catch (_) {
      showSnackBar("Veuillez vous connecter à internet");
      Get.back();
    } catch (e) {
      showSnackBar("Erreur inconnue...Veuillez réessayer !");
      Get.back();
    }
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    loading();
    Future.wait([_googleSignIn.signOut(), _firebaseAuth.signOut()]);
    Get.offAll(() => SignIn());
  }
}
