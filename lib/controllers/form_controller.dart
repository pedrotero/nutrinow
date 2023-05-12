import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  final CollectionReference forms =
      FirebaseFirestore.instance.collection('products');

  List<Map<String, dynamic>> currentMeals = [];
  Future<void> create(
      animo, comentarios, comidas, estres, fecha, idUser) async {
    await forms.add({animo, comentarios, comidas, estres, fecha, idUser});
  }

  Future<void> delete(String productId) async {
    await forms.doc(productId).delete();

    // Show a snackbar
  }
}
