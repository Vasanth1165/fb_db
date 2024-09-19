import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDB{
  final _ref = FirebaseFirestore.instance.collection("Users");

  Future addTodo(String taskType,String task) async{
    await _ref.doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("todo").add({
      'taskType': taskType,
      'task' : task,
      'addedDate' : DateTime.now()
    });
  }

  Stream<QuerySnapshot> getTodo(){
    return _ref.doc(FirebaseAuth.instance.currentUser!.uid).collection("todo").snapshots();
  }

  Future deleteTask(String docId) async{
    await _ref.doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('todo')
        .doc(docId)
        .delete();
  }


}