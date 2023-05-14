import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

// este controlador esconde los detalles de la implementación de firebase
class AuthenticationController extends GetxController {
  final databaseReference = FirebaseDatabase.instance.ref();

  User? user = FirebaseAuth.instance.currentUser;

  // método usado para logearse en la aplicación
  Future<User?> login(email, password) async {
    try {
      var userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.error("User not found");
      } else if (e.code == 'wrong-password') {
        return Future.error("Email or password incorrect");
      } else {
        return Future.error("Empty fields or bad format");
      }
    }
  }

  // método usado para crear un usuario
  Future<void> signup(email, password, display) async {
    try {
      // primero creamos el usuario en el sistema de autenticación de firebase
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      user = FirebaseAuth.instance.currentUser!;
      user?.updateDisplayName(display);
      // después creamos el usuario en la base de datos de tiempo real usando el
      // userController
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return Future.error("The email is taken");
      } else {
        return Future.error("Empty fields or bad format");
      }
    }
  }

  // método usado para hacer el signOut
  logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      return Future.error("Logout error");
    }
  }

  String userEmail() {
    // String email = FirebaseAuth.instance.currentUser!.email ?? "a@a.com";
    String email = user?.email ?? "";
    return email;
  }

  String getUid() {
    // String uid = FirebaseAuth.instance.currentUser!.uid;
    String uid = user?.uid ?? "";
    return uid;
  }
}
