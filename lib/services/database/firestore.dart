import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //Get collection of orders
  final CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  //Save order to db
  Future<void> saveOrderToDatabase(String receipt) async {
    await orders.add({
      'Date': DateTime.now(),
      'Order': receipt,
    });
  }
}