import 'package:cloud_firestore/cloud_firestore.dart';

class Service {
  Service();

  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<QuerySnapshot> getColletion(String colletion) async {
    QuerySnapshot res = await db.collection(colletion).get();
    return res;
  }

  Future<void> saveDocument(String colletion, Map<String, dynamic> data) async {
    await db.collection(colletion).add(data);
  }
}