import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrinow/controllers/auth_controller.dart';
import 'package:nutrinow/controllers/form_controller.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  final AuthenticationController authenticationController = Get.find();
  final FormController formController = Get.find();
  String? userDisp;
  List<FlSpot> animoSpots = [];
  List<FlSpot> comidasSpots = [];
  List<FlSpot> horasSpots = [];
  SideTitles? bottomTitles;

  @override
  void initState() {
    super.initState();
    setState(() {
      userDisp = authenticationController.user?.displayName;
      getForms();
    });
  }

  Future<void> getForms() async {
    await formController.get();
    await getSpots();
    setState(() {
      bottomTitles = getBottomTitles();
    });
  }

  Future<void> getSpots() async {
    double i = 0;
    animoSpots = formController.lastseven.map((e) {
      return FlSpot(i++, e["animo"]);
    }).toList();
    i = 0;
    comidasSpots = formController.lastseven.map((e) {
      return FlSpot(i++, e["comidas"].length + 0.0);
    }).toList();
    i = 0;
    horasSpots = formController.lastseven.map((e) {
      return FlSpot(i++, (e["horas"] ?? 0) + 0.0);
    }).toList();
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    print(value);
    text = Text(
      "${formController.lastseven[value.toInt()]["fecha"].toDate().toString().substring(0, 10)}\n ${formController.lastseven[value.toInt()]["fecha"].toDate().toString().substring(11, 16)}",
      style: TextStyle(fontSize: 12),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 7,
      child: text,
    );
  }

  SideTitles getBottomTitles() => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              authenticationController.logout();
            },
            icon: const Icon(Icons.exit_to_app))
      ]),
      key: scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
              child: Text('Hola, $userDisp',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                      children: [
                        TextSpan(text: "Tu "),
                        TextSpan(
                            text: "ánimo",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary)),
                        TextSpan(text: ", "),
                        TextSpan(
                            text: "comidas",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary)),
                        TextSpan(text: ", "),
                        TextSpan(
                            text: "horas de sueño",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.error)),
                        TextSpan(text: " en tus últimos 7 reportes")
                      ])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Theme.of(context).colorScheme.surface,
                child: AspectRatio(
                  aspectRatio: 1.6,
                  child: LineChart(
                    LineChartData(
                      lineTouchData: LineTouchData(
                          touchTooltipData: LineTouchTooltipData(
                              tooltipBgColor:
                                  Theme.of(context).colorScheme.surface)),
                      titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: bottomTitles,
                          ),
                          topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false))),
                      minY: 0,
                      maxY: 5,
                      lineBarsData: [
                        LineChartBarData(
                          color: Theme.of(context).colorScheme.primary,
                          spots: animoSpots,
                          isCurved: false,
                        ),
                        LineChartBarData(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          spots: comidasSpots,
                          isCurved: false,
                        ),
                        LineChartBarData(
                          color: Theme.of(context).colorScheme.primary,
                          spots: animoSpots,
                          isCurved: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.primary)),
                  onPressed: () {
                    Navigator.pushNamed(context, "/formulario").then((value) {
                      setState(() {});
                    });
                  },
                  child: Text("Crear formulario",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onPrimary))),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        formController.get();
                      });

                      Navigator.pushNamed(context, "/formlist").then((value) {
                        setState(() {});
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.onPrimaryContainer)),
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
