// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  runApp(MyApp());

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.collection('users2').add({'full_name': "Francisco Macuacua",  'company': "Free Dev", 'age': 34   });

//add new document data
   FirebaseFirestore.instance.collection('orders').add(
      {
        'price': 199.99,
        'user': "Francisco Macuacua"
      }
  );

   //alter to given state
  FirebaseFirestore.instance.collection('orders').doc('nome_personalizado').set(
      {
        'price': 67.99,
        'user': "Francisco Macuacua JR"
      }
  );

  //Update only given valueattribute
  FirebaseFirestore.instance.collection('orders').doc('nome_personalizado').update(
      {
        'price': 66.99,
        'user': "Francisco Macuacua JR"
      }
  );

  //facilitando a nomenclatura
  FirebaseFirestore.instance.doc('orders/nome_personalizado').update(
      {
        'price': 77.77,
        'user': "Francisco Macuacua JR"
      }
  );

  //Listar dados na colecao
  DocumentSnapshot doc = await FirebaseFirestore.instance.collection('orders').doc('nome_personalizado').get();
  print(doc.data());
}





class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Container()
    );
  }
}

