import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrinow/controllers/auth_controller.dart';
import 'package:nutrinow/controllers/form_controller.dart';
import 'package:provider/provider.dart';

class VerFormWidget extends StatefulWidget {
  const VerFormWidget({Key? key}) : super(key: key);

  @override
  _VerFormWidgetState createState() => _VerFormWidgetState();
}

class _VerFormWidgetState extends State<VerFormWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  FormController formController = Get.find();
  late Map<String, dynamic> form;
  AuthenticationController authController = Get.find();
  List? meals;
  double animo = 3;
  double estres = 0;
  TextEditingController comentarios = TextEditingController();
  late DateTime fecha;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));

    setState(() {
      form = formController.formview;
      meals = form["comidas"];
      animo = form["animo"];
      estres = form["estres"];
      comentarios.text = form["comentarios"];
      fecha = form["fecha"].toDate();
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
            'Ver Formulario',
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Text(
                      'Fecha: ${fecha.toString().substring(0, 10)}',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Text(
                      'Tu estado de ánimo:',
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: RatingBar.builder(
                      allowHalfRating: true,
                      ignoreGestures: true,
                      onRatingUpdate: (newValue) =>
                          {setState(() => animo = animo)},
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
                      'Tu nivel de estrés:',
                    ),
                  ),
                  SliderTheme(
                    data: const SliderThemeData(
                      showValueIndicator: ShowValueIndicator.always,
                    ),
                    child: Slider(
                      activeColor: Theme.of(context).colorScheme.primary,
                      min: 0,
                      max: 10,
                      value: estres + 0.0,
                      label: "${estres}",
                      onChanged: (newValue) {
                        setState(() => estres = estres);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Tus Comidas"),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(40, 20, 0, 0),
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: meals!.map((e) {
                            return InkWell(
                              onTap: () {
                                formController.mealview = e;
                                Navigator.pushNamed(context, "/vercomida");
                              },
                              child: Row(
                                children: [
                                  Text(
                                    e["nombre"],
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  ),
                                  Icon(
                                    Icons.remove_red_eye_outlined,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  )
                                ],
                              ),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: TextFormField(
                      controller: comentarios,
                      obscureText: false, enabled: false,
                      decoration: const InputDecoration(
                        hintText: '',
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
            // Padding(
            //   padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
            //   child: TextButton(
            //       style: ButtonStyle(
            //           backgroundColor: MaterialStatePropertyAll(
            //               Theme.of(context).colorScheme.secondary)),
            //       onPressed: () {
            //         formController.create(
            //             animo,
            //             comentarios.text,
            //             formController.currentMeals,
            //             estres,
            //             DateTime.now(),
            //             authController.getUid());
            //         Navigator.pop(context);
            //       },
            //       child: Text("Enviar formulario",
            //           style: TextStyle(
            //               fontWeight: FontWeight.w400,
            //               fontSize: 20,
            //               color: Theme.of(context).colorScheme.onPrimary))),
            // ),
          ],
        ),
      ),
    );
  }
}
