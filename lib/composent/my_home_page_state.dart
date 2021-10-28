import 'package:electric_consome_monitor_home_page/composent/time_scale_type.dart';
import 'package:electric_consome_monitor_home_page/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TooltipBehavior _tooltipBehavior;
  late ZoomPanBehavior _zoomPanBehavior;
  late SelectionBehavior _selectionBehavior;
  late int indexData;
  late String graphTitle;

  @override
  void initState() {
    stateTileScaler[0] = true;
    indexData = 0;
    graphTitle = "Hour";
    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      zoomMode: ZoomMode.x,
      enablePanning: true,
    );
    _selectionBehavior = SelectionBehavior(
        enable: true, selectedColor: Colors.red, unselectedColor: Colors.grey);
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  late List<int> count =
      List<int>.generate(timeScalerSlectedString.length, (i) => i + 1);

  late bool stateHour = false,
      stateDay = false,
      stateWeek = false,
      stateMonth = false;
  void updateState(int i) {
    setState(() {
      for (var j = 0; j < stateTileScaler.length; j++) {
        stateTileScaler[j] = false;
      }
      stateTileScaler[i] = true;
      graphTitle = timeScalerSlectedString[i];
      indexData = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: kDefaultPadding * 2,
                right: kDefaultPadding,
                left: kDefaultPadding,
                bottom: kDefaultPadding),
            child: Container(
                alignment: Alignment.bottomLeft,
                height: size.height * 0.5,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 5),
                          blurRadius: 5.0,
                          color: Colors.white.withOpacity(0.23)),
                      BoxShadow(
                          offset: const Offset(0, -5),
                          blurRadius: 2.0,
                          color: Colors.white.withOpacity(0.23))
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    color: kBackgroundColor),
                child: Stack(
                  children: [
                    /*Positioned(
                      top: 0,
                      right: 0,
                      child: myPopMenu(),
                    ),*/

                    Positioned(
                      top: 0,
                      child: SizedBox(
                        width: size.width * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            for (var i in count)
                              GestureDetector(
                                onTap: () {
                                  updateState(i - 1);
                                },
                                child: TimeScaletype(
                                  state: stateTileScaler[i - 1],
                                  width: size.width *
                                      (1 / (stateTileScaler.length + 3)),
                                  size: size,
                                  positionRight: 0.0,
                                  timeScale: timeScalerSlectedString[i - 1],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        width: size.width * 0.85,
                        padding: const EdgeInsets.only(top: kDefaultPadding),
                        child: SfCartesianChart(
                            // Initialize category axis
                            primaryXAxis: CategoryAxis(
                                labelStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor),
                                title: AxisTitle(
                                    text: "Per $graphTitle",
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kPrimaryColor)),
                                axisLine: const AxisLine(
                                  color: Colors.black,
                                  width: 2,
                                )),
                            // Chart title
                            // title: ChartTitle(text: 'Half yearly sales analysis'),
                            // Enable legend
                            legend: Legend(),
                            primaryYAxis: NumericAxis(
                              labelStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor),
                              labelFormat: '{value} Kw.H',
                              axisLine: const AxisLine(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            // Enable tooltip
                            tooltipBehavior: _tooltipBehavior,
                            zoomPanBehavior: _zoomPanBehavior,
                            series: <
                                LineSeries<ConsomeElectricPowerData, String>>[
                              LineSeries<ConsomeElectricPowerData, String>(
                                  dataSource: data[indexData],
                                  //selectionBehavior: _selectionBehavior,
                                  xValueMapper:
                                      (ConsomeElectricPowerData sales, _) =>
                                          sales.time,
                                  yValueMapper:
                                      (ConsomeElectricPowerData sales, _) =>
                                          sales.consumerFate,
                                  width: 2,
                                  color: kPrimaryColor,
                                  name: 'Elecrec consome',
                                  markerSettings:
                                      const MarkerSettings(isVisible: true))
                            ]),
                      ),
                    )
                  ],
                )),
          ),
        ],
      )),
    );
  }
}

Widget myPopMenu() {
  return PopupMenuButton(
      color: kPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            alignment: Alignment.center,
            width: 180,
            height: 40,
            decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.more_vert),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("select time scale"),
                ),
              ],
            )),
      ),
      onSelected: (value) {},
      itemBuilder: (context) => [
            PopupMenuItem(
                value: 1,
                child: Row(
                  children: const <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                      //child: Icon(Icons.print),
                    ),
                    Text('Day')
                  ],
                )),
            PopupMenuItem(
                value: 2,
                child: Row(
                  children: const <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                      //child: Icon(Icons.share),
                    ),
                    Text('Week')
                  ],
                )),
            PopupMenuItem(
                value: 3,
                child: Row(
                  children: const <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                      //child: Icon(Icons.add_circle),
                    ),
                    Text('Month')
                  ],
                )),
          ]);
}
