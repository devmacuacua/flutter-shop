import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:store/helpers/firebase_errors.dart';
import 'package:store/models/user_detail.dart';

class UserManager extends ChangeNotifier {

  UserManager(){
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  User? user;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> signIn({required UserDetail user, required Function onFail, required Function onSuccess}) async {
    loading = true;
      try {
        final UserCredential result = await auth.signInWithEmailAndPassword(
            email: user.email, password: user.password);

        //await Future.delayed(Duration(seconds: 3));

        this.user=result.user!;

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
    loading = false;
  }

  Future<void> signUp({required UserDetail user, required Function onFail, required Function onSuccess}) async{
        loading = true;
        try {
          final UserCredential result = await auth.createUserWithEmailAndPassword(
              email: user.email, password: user.password);

          //this.user=result.user!;
          user.id = result.user!.uid;

          await user.saveData();
          onSuccess();

        } on PlatformException catch(e){
          onFail(getErrorString(e.code));
        }

        loading = true;
    }



  set loading(bool value){
    _loading=value;
    notifyListeners();
  }

  Future<void> _loadCurrentUser() async{
     User? currentUser = auth.currentUser;
    if(currentUser !=null){
         final  DocumentSnapshot docUser = await firestore.collection('users').doc(currentUser.uid).get();

         docUser

    }
    notifyListeners();
  }


}