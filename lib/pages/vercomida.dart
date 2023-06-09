import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrinow/controllers/form_controller.dart';
import 'package:provider/provider.dart';

class VerComidaWidget extends StatefulWidget {
  const VerComidaWidget({Key? key}) : super(key: key);

  @override
  _VerComidaWidgetState createState() => _VerComidaWidgetState();
}

class _VerComidaWidgetState extends State<VerComidaWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  FormController formcon = Get.find();
  TextEditingController nombre = TextEditingController();
  TextEditingController fecha = TextEditingController();
  double animo = 0;
  Map<String, dynamic> meal = {};
  TextEditingController comentarios = TextEditingController();
  @override
  void initState() {
    super.initState();
    meal = formcon.mealview;
    animo = meal["calif"] ?? 2.5;
    nombre.text = meal["nombre"] ?? "";
    fecha.text = meal["fecha"] ?? "";
    comentarios.text = meal["comentarios"] ?? "";
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
        title: const Align(
          alignment: AlignmentDirectional(0, 0),
          child: Text(
            'Comida',
          ),
        ),
        actions: [],
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 15),
                      child: const Text(
                        'Nombre de la comida: ',
                      ),
                    ),
                    TextFormField(
                      controller: nombre,
                      autofocus: true,
                      enabled: false,
                      obscureText: false,
                      decoration: const InputDecoration(
                        hintText: 'Nombre de la comida',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 15),
                      child: const Text(
                        'Hora del día de la comida: ',
                      ),
                    ),
                    TextFormField(
                      controller: fecha,
                      enabled: false,
                      obscureText: false,
                      decoration: const InputDecoration(
                        hintText: 'Hora del día de la comida: ',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
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
                      keyboardType: TextInputType.datetime,
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                      child: Text(
                        'Tu estado de ánimo durante la comida:',
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: RatingBar.builder(
                        allowHalfRating: true,
                        onRatingUpdate: (newValue) =>
                            setState(() => animo = animo),
                        ignoreGestures: true,
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        direction: Axis.horizontal,
                        initialRating: formcon.mealview["calif"],
                        unratedColor: const Color(0xFF9E9E9E),
                        itemCount: 5,
                        itemSize: 40,
                        glowColor: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 30, 0, 0),
                        child: Text(
                          'Comentarios:',
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                      child: TextFormField(
                        //controller: _model.textController2,
                        autofocus: true,
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
            //   child: TextButton(
            //       style: ButtonStyle(
            //           backgroundColor: MaterialStatePropertyAll(
            //               Theme.of(context).colorScheme.primary)),
            //       onPressed: () {
            //         formcon.currentMeals
            //             .add({"nombre": nombre.text, "fecha": fecha.text});
            //         print(formcon.currentMeals);
            //         setState(() {});
            //         Navigator.pop(context);
            //       },
            //       child: const Text("Agregar Comida")),
            // ),
          ],
        ),
      ),
    );
  }
}
