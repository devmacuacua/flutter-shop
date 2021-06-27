import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:store/helpers/firebase_errors.dart';
import 'package:store/models/user_detail.dart';

class UserManager {

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn(UserDetail user) async {

      try {
        final UserCredential result = await auth.signInWithEmailAndPassword(
            email: user.email, password: user.password);
        print(result.user!.uid);
      }
      on PlatformException catch (e){
        print(getErrorString(e.code));
      }
      on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }else{
          print(getErrorString(e.code));
        }
      }

  }
}