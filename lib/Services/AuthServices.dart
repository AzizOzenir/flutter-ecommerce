import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  signin(TextEditingController emailController,
      TextEditingController passwordController) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }

  logout() async {
    FirebaseAuth.instance.signOut();
  }

register(String email,String password,String password2)async{
try {
  
  if (password == password2) {
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  } else {
    print("Passwords are not same");
  }
} catch (e) {
  print(e);
}
}

  

signinAnonymously() async {
  try {
    final userCredential = await FirebaseAuth.instance.signInAnonymously();
    print("Signed in with temporary account.");
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case "operation-not-allowed":
        print("Anonymous auth hasn't been enabled for this project.");
        break;
      default:
        print("Unknown error.");
    }
    print(e);
  }
}

  googleSignin() async {
    // Trigger the authentication flow
    
    // Once signed in, return the UserCredential

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final userCredential =  await FirebaseAuth.instance.signInWithCredential(credential);
    print("Signed in with temporary account.");
     print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
     
    print(userCredential.user);
  } catch (e) {
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    print(e);
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    }
  }
  }

