// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/operator.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ddd"),
        ),
        body: Column(
          children: [
            Flexible(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("products").snapshots(),
                builder: (context, snapshot) {
                  return !snapshot.hasData
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot data = snapshot.data!.docs[index];
                            return Text(data['productName']);
                          },
                        );
                },
              ),
            ),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        uploadingData('productName', 'productPrice', 'imageUrl', true);
                      },
                      child: Text('Hello World!'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
