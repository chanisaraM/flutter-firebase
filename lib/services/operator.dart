import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference users = FirebaseFirestore.instance.collection('products');

Future<void> uploadingData(
  String productName,
  String productPrice,
  String imageUrl,
  bool isFavourite,
) async {
  await users.add({
    'productName': productName,
    'productPrice': productPrice,
    'imageUrl': imageUrl,
    'isFavourite': isFavourite,
  });
  // FirebaseFirestore.instance.collection("products").set({
  //   'productName': productName,
  //   'productPrice': productPrice,
  //   'imageUrl': imageUrl,
  //   'isFavourite': isFavourite,
  // });
}

Future<void> deleteProduct(
  DocumentSnapshot doc,
) async {
  await FirebaseFirestore.instance.collection("products").doc(doc.id).delete();
}

Future<void> editProduct(
  bool isFavourite,
  String id,
) async {
  await FirebaseFirestore.instance.collection("products").doc(id).update({"isFavourite": !isFavourite});
}
