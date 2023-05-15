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

  @override
  void initState() {
    super.initState();
    setState(() {});
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: formController.formscoll.map((e) {
                  return Material(
                    color: Theme.of(context).colorScheme.background,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "- ${e["comentarios"]}",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                  "Fecha: ${e["fecha"].toDate().toString().substring(0, 19)}"),
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/verform");
                              },
                              icon: Icon(
                                Icons.chevron_right,
                                color: Theme.of(context).colorScheme.primary,
                              ))
                        ],
                      ),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
