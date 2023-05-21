import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrinow/controllers/auth_controller.dart';
import 'package:nutrinow/controllers/form_controller.dart';
import 'package:provider/provider.dart';

class FormularioWidget extends StatefulWidget {
  const FormularioWidget({Key? key}) : super(key: key);

  @override
  _FormularioWidgetState createState() => _FormularioWidgetState();
}

class _FormularioWidgetState extends State<FormularioWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  FormController formController = Get.find();
  AuthenticationController authController = Get.find();
  List<Map<String, dynamic>>? meals;
  double animo = 3;
  double estres = 0;
  TextEditingController horas = TextEditingController();
  TextEditingController comentarios = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));

    setState(() {
      meals = formController.currentMeals;
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
              'Formulario',
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Text(
                          'Califica tu estado de ánimo hoy:',
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: RatingBar.builder(
                          allowHalfRating: true,
                          onRatingUpdate: (newValue) =>
                              {setState(() => animo = newValue)},
                          itemBuilder: (context, index) => Icon(
                            Icons.star_rounded,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          direction: Axis.horizontal,
                          initialRating: 3,
                          unratedColor: const Color(0xFF9E9E9E),
                          itemCount: 5,
                          itemSize: 40,
                          glowColor: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Text(
                          'Cómo fue tu nivel de estrés o ansiedad hoy:',
                        ),
                      ),
                      SliderTheme(
                        data: const SliderThemeData(
                          showValueIndicator: ShowValueIndicator.always,
                        ),
                        child: Slider(
                          activeColor: Theme.of(context).colorScheme.primary,
                          min: 0,
                          max: 5,
                          value: estres + 0.0,
                          label: "$estres",
                          onChanged: (newValue) {
                            setState(() =>
                                estres = (newValue * 2).roundToDouble() / 2);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("¿Cuántas horas dormiste?"),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                              child: SizedBox(
                                width: 40,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: horas,
                                  keyboardType: TextInputType.number,
                                  maxLength: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Añadir Comida',
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 0, 0, 0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  Navigator.pushNamed(context, "/editcomida")
                                      .then((value) {
                                    setState(() {});
                                  });
                                },
                                child: const Icon(
                                  Icons.add_circle_outline,
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(60, 20, 60, 0),
                        child: SingleChildScrollView(
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: meals!.map((e) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        formController.editando = true;
                                        Map<String, dynamic> i = {
                                          "i": formController.currentMeals
                                              .indexOf(e)
                                        };
                                        e.addAll(i);
                                        formController.meal = e;
                                        setState(() {});

                                        Navigator.pushNamed(
                                                context, "/editcomida")
                                            .then((value) {
                                          setState(() {});
                                        });
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            e["nombre"],
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                          ),
                                          Icon(
                                            Icons.edit,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          formController.currentMeals.remove(e);
                                        });
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color:
                                            Theme.of(context).colorScheme.error,
                                      ),
                                    )
                                  ],
                                );
                              }).toList()),
                        ),
                      ),
                      const Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                          child: Text(
                            'Comentarios:',
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: TextFormField(
                          controller: comentarios,
                          obscureText: false,
                          decoration: const InputDecoration(
                            hintText: 'Deja tus comentarios sobre tu día...',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF0A6C19),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
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
                          maxLines: 6,
                          minLines: 3,
                          keyboardType: TextInputType.multiline,
                          //validator:
                          //_model.textControllerValidator.asValidator(context),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Theme.of(context).colorScheme.primary)),
                      onPressed: () {
                        formController.create(
                            animo,
                            comentarios.text,
                            formController.currentMeals,
                            estres,
                            DateTime.now(),
                            authController.getUid(),
                            (horas.text.isNotEmpty
                                ? int.tryParse(horas.text)
                                : 0));
                        formController.currentMeals = [];
                        Navigator.pop(context);
                      },
                      child: Text("Enviar formulario",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.onPrimary))),
                ),
              ],
            ),
          ),
        ));
  }
}
