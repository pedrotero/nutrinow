import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';

class FormController extends GetxController {
  final CollectionReference formsref =
      FirebaseFirestore.instance.collection('forms');
  final AuthenticationController authenticationController = Get.find();
  List<Map<String, dynamic>> currentMeals = [];
  Map<String, dynamic> meal = {};
  Map<String, dynamic> mealview = {};
  List<Map<String, dynamic>> formscoll = [];
  Map<String, dynamic> formview = {};
  List<Map<String, dynamic>> lastseven = [];
  bool editando = false;
  Future<void> create(
      animo, comentarios, comidas, estres, fecha, idUser) async {
    await formsref.add({
      "animo": animo,
      "comentarios": comentarios,
      "comidas": comidas,
      "estres": estres,
      "fecha": fecha,
      "idUser": idUser
    });
    print("form added");
  }

  Future<void> get() async {
    await formsref
        .where("idUser", isEqualTo: authenticationController.getUid())
        .get()
        .then((querySnapshot) {
      print("Successfully completed");
      formscoll.clear();

      for (var docSnapshot in querySnapshot.docs) {
        formscoll.add(docSnapshot.data() as Map<String, dynamic>);
        print('${docSnapshot.id} => ${docSnapshot.data()}');
      }
      lastseven.clear();
      lastseven.addAll(formscoll);
      lastseven.sort((a, b) => b["fecha"].compareTo(a["fecha"]));
      int maxLength = lastseven.length < 7 ? lastseven.length : 7;
      lastseven = lastseven.sublist(0, maxLength);
      print("$lastseven se supone que b,a");
    });
  }

  Future<void> delete(String productId) async {
    await formsref.doc(productId).delete();

    // Show a snackbar
  }
}
