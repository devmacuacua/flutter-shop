import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:store/helpers/firebase_errors.dart';
import 'package:store/models/user_detail.dart';

class UserManager extends ChangeNotifier {

  final FirebaseAuth auth = FirebaseAuth.instance;

  bool loading = false;

  Future<void> signIn({required UserDetail user, required Function onFail, required Function onSuccess}) async {
    setLoading(true);
      try {
        final UserCredential result = await auth.signInWithEmailAndPassword(
            email: user.email, password: user.password);

        //await Future.delayed(Duration(seconds: 3));

        //print(result.user!.uid);
        onSuccess();
      }
      on PlatformException catch (e){
        //print(getErrorString(e.code));
        onFail(getErrorString(e.code));
      }
      on FirebaseAuthException catch (e) {
         //print(getErrorString(e.code));
         onFail(getErrorString(e.code));
      }
      setLoading(false);
  }

  void setLoading(bool value){
    loading=value;
    notifyListeners();
  }

}