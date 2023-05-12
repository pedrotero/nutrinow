import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrinow/controllers/auth_controller.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  final AuthenticationController authenticationController = Get.find();
  String? userDisp;

  @override
  void initState() {
    userDisp = authenticationController.user?.displayName;
    print(userDisp);
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
              child: Text('Hola, $userDisp',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.primary)),
                  onPressed: () {
                    Navigator.pushNamed(context, "/formulario");
                  },
                  child: Text("Crear formulario",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onPrimary))),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: TextButton(
                    onPressed: () {
                      authenticationController.logout();
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.secondary)),
                    child: Text("Ver formularios",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onPrimary))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
