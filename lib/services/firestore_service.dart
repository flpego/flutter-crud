import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_crud/models/user_model.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<Map<String, dynamic>>> getUsers() async {
  CollectionReference users = db.collection('usuarios');

  QuerySnapshot querySnapshot = await users.get();

  final allUsers = querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

  return allUsers;
}

Future<void> saveUser(User user)async{
   CollectionReference users = db.collection('usuarios');

   await users.doc(user.id).set(user.toMap());
}