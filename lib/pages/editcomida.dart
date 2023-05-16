import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrinow/controllers/form_controller.dart';
import 'package:provider/provider.dart';

class EditComidaWidget extends StatefulWidget {
  const EditComidaWidget({Key? key}) : super(key: key);

  @override
  _EditComidaWidgetState createState() => _EditComidaWidgetState();
}

class _EditComidaWidgetState extends State<EditComidaWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  FormController formcon = Get.find();
  TextEditingController nombre = TextEditingController();
  TextEditingController fecha = TextEditingController();
  TextEditingController comentarios = TextEditingController();
  double calif = 3;
  @override
  void initState() {
    super.initState();
    if (formcon.editando) {
      nombre.text = formcon.meal["nombre"];
      fecha.text = formcon.meal["fecha"];
      comentarios.text = formcon.meal["comentarios"];
      calif = formcon.meal["calif"];
    }
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    Text(
                      'Nombre:',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.surface),
                    ),
                    TextFormField(
                      style: TextStyle(fontWeight: FontWeight.w500),
                      controller: nombre,
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
                    Divider(
                        color: Theme.of(context).colorScheme.primary,
                        height: 4),
                    TextFormField(
                      style: TextStyle(fontWeight: FontWeight.w500),
                      controller: fecha,
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
                      onTap: () async {
                        await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((value) {
                          if (value != null) {
                            fecha.text = value.format(context);
                          } else {
                            fecha.text = TimeOfDay.now().format(context);
                          }
                        });
                      },
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Text(
                        'Califica tu estado de ánimo durante la comida:',
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: RatingBar.builder(
                        onRatingUpdate: (newValue) =>
                            setState(() => calif = newValue),
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        direction: Axis.horizontal,
                        initialRating: calif,
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
                        controller: comentarios,
                        autofocus: true,
                        obscureText: false,
                        decoration: const InputDecoration(
                          hintText:
                              'Deja tus comentarios sobre esta comida aquí',
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
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.primary)),
                  onPressed: () {
                    if (formcon.editando) {
                      formcon.currentMeals[formcon.meal["i"]] = {
                        "nombre": nombre.text,
                        "fecha": fecha.text,
                        "comentarios": comentarios.text,
                        "calif": calif
                      };
                    } else {
                      formcon.currentMeals.add({
                        "nombre": nombre.text,
                        "fecha": fecha.text,
                        "comentarios": comentarios.text,
                        "calif": calif
                      });
                    }
                    formcon.editando = false;
                    formcon.meal = {};
                    print(formcon.currentMeals);
                    setState(() {});
                    Navigator.pop(context, true);
                  },
                  child: Text(
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                      formcon.editando ? "Guardar cambios" : "Guardar comida")),
            ),
          ],
        ),
      ),
    );
  }
}
