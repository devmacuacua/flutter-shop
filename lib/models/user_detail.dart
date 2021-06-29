import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserDetail {

   UserDetail({
     required this.email,
     required this.password,
     required this.name,
     required this.confirmPassword,
     required this.id});

   UserDetail.fromDocument(DocumentSnapshot document){
     name = document.data()!.data['name'] as String;
     email = document.data['email'] as String;

     Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
     return Text("Full Name: ${data['full_name']} ${data['last_name']}");

   }

    String id;
    String name;
    String email;
    String password;

    String confirmPassword;

    DocumentReference get firestoreRef => FirebaseFirestore.instance.doc('users/$id');

    Future<void> saveData()async{
      await firestoreRef.set(toMap());
    }


    Map<String, dynamic> toMap(){
      return {
        'name' : name,
        'email' : email
      };
    }

}