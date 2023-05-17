import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrinow/controllers/auth_controller.dart';
import 'package:nutrinow/controllers/form_controller.dart';
import 'package:nutrinow/pages/home.dart';
import 'package:provider/provider.dart';

class StartWidget extends StatefulWidget {
  const StartWidget({Key? key}) : super(key: key);

  @override
  _StartWidgetState createState() => _StartWidgetState();
}

class _StartWidgetState extends State<StartWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final AuthenticationController authenticationController = Get.find();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  Future<void> handleLogin() async {
    try {
      await authenticationController.login(email.text, password.text);
    } catch (error) {
      // handle error
      if (error is String) {
        // handle user not found or wrong password error
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Error"),
            content: Text(error),
            actions: [
              FloatingActionButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Continue"),
              ),
            ],
          ),
        );
      } else {
        // handle other types of errors
        print(error.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(),
              ),
            ),
            const Align(
              alignment: AlignmentDirectional(0, 0),
              child: Text(
                'NutriNow',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Divider(
              thickness: 1,
              indent: 30,
              endIndent: 30,
              color: Theme.of(context).colorScheme.primary,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(30, 15, 30, 7),
              child: TextFormField(
                controller: email,
                autofocus: true,
                obscureText: false,
                decoration: const InputDecoration(
                  hintText: 'E-mail',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: password,
                autofocus: true,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Contraseña',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.primary)),
                  onPressed: () {
                    handleLogin();
                  },
                  child: Text("Inicia Sesión",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onPrimary))),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.onPrimaryContainer)),
                  onPressed: () {
                    Navigator.pushNamed(context, "/register");
                  },
                  child: Text("Regístrate",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onPrimary))),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
