import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrinow/controllers/auth_controller.dart';
import 'package:nutrinow/controllers/form_controller.dart';

class FormListWidget extends StatefulWidget {
  const FormListWidget({Key? key}) : super(key: key);

  @override
  _FormListState createState() => _FormListState();
}

class _FormListState extends State<FormListWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  final AuthenticationController authenticationController = Get.find();
  final FormController formController = Get.find();
  List<Map<String, dynamic>> forms = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      forms.clear();
      formController.get();
      forms = formController.formscoll;
      forms.sort((a, b) => b["fecha"].compareTo(a["fecha"]));
    });
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Align(
          alignment: AlignmentDirectional(0, 0),
          child: Text(
            'Tus formularios',
          ),
        ),
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 5, 5),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: forms.map((e) {
                    return Material(
                      color: Theme.of(context).colorScheme.background,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () {
                            formController.formview = e;
                            print("voy a ver a $e");
                            Navigator.pushNamed(context, "/verform")
                                .then((value) {
                              setState(() {});
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Color(0xFF8FBC94),
                                width: 3,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Fecha: ${e["fecha"].toDate().toString().substring(0, 19)}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Icon(
                                  Icons.chevron_right,
                                  color: Theme.of(context).colorScheme.primary,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
