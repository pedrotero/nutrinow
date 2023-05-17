import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrinow/controllers/auth_controller.dart';
import 'package:nutrinow/controllers/form_controller.dart';
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
  final FormController formController = Get.find();
  String? userDisp;

  @override
  void initState() {
    super.initState();
    setState(() {
      userDisp = authenticationController.user?.displayName;
      formController.get();
    });
  }

  Future<void> buildChart() async {}
  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  Widget chartToRun() {
    LabelLayoutStrategy? xContainerLabelLayoutStrategy;
    ChartData chartData;
    ChartOptions chartOptions = const ChartOptions();
    // Example shows an explicit use of the DefaultIterativeLabelLayoutStrategy.
    // The xContainerLabelLayoutStrategy, if set to null or not set at all,
    //   defaults to DefaultIterativeLabelLayoutStrategy
    // Clients can also create their own LayoutStrategy.
    xContainerLabelLayoutStrategy = DefaultIterativeLabelLayoutStrategy(
      options: chartOptions,
    );
    chartData = ChartData(
      dataRows: const [
        [10.0, 20.0, 5.0, 30.0, 5.0, 20.0],
        [30.0, 60.0, 16.0, 100.0, 12.0, 120.0],
        [25.0, 40.0, 20.0, 80.0, 12.0, 90.0],
        [12.0, 30.0, 18.0, 40.0, 10.0, 30.0],
      ],
      xUserLabels: const ['Wolf', 'Deer', 'Owl', 'Mouse', 'Hawk', 'Vole'],
      dataRowsLegends: const [
        'Spring',
        'Summer',
        'Fall',
        'Winter',
      ],
      chartOptions: chartOptions,
    );
    // chartData.dataRowsDefaultColors(); // if not set, called in constructor
    var lineChartContainer = LineChartTopContainer(
      chartData: chartData,
      xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
    );

    var lineChart = LineChart(
      painter: LineChartPainter(
        lineChartContainer: lineChartContainer,
      ),
    );
    return lineChart;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              authenticationController.logout();
            },
            icon: Icon(Icons.exit_to_app))
      ]),
      key: scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            chartToRun(),
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
                      setState(() {
                        formController.get();
                      });

                      Navigator.pushNamed(context, "/formlist");
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
