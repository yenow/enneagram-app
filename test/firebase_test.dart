
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enneagram/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  createData();
}

void createData() {
  // var userReference = FirebaseDatabase().reference().child("User");
  // userReference.child("userKey1").set({
  //
  // })

  String code = const Uuid().v1();
  final usercol = FirebaseFirestore.instance.collection("FirstDemo").doc(code); // code는 문서 이름
  usercol.set({
    "name":"윤신영",
    "description" :"설명"
  });
}