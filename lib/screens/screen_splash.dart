import 'package:covid_app/reusbalewidgets/cutom_row.dart';
import 'package:covid_app/screens/screen_all_countries.dart';
import 'package:covid_app/services/overoll_status_services.dart';
import 'package:flutter/material.dart';

import 'package:pie_chart/pie_chart.dart';

class Screenhome extends StatefulWidget {
  const Screenhome({super.key});

  @override
  State<Screenhome> createState() => _ScreenhomeState();
}

class _ScreenhomeState extends State<Screenhome> {
  List<Color> colors = [Colors.blue, Colors.green, Colors.red];
  @override
  Widget build(BuildContext context) {
    OverollStatusServices _services = OverollStatusServices();
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Covid-19 Data"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FutureBuilder(
                future: _services.getOverollStatus(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: const CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PieChart(
                            colorList: colors,
                            chartValuesOptions: const ChartValuesOptions(
                                showChartValuesInPercentage: true),
                            animationDuration: Duration(seconds: 2),
                            chartType: ChartType.ring,
                            chartRadius: 150,
                            legendOptions: const LegendOptions(
                                legendPosition: LegendPosition.left),
                            dataMap: {
                              "Total Cases": snapshot.data!.cases!.toDouble(),
                              "Recovere": snapshot.data!.recovered!.toDouble(),
                              "Total Deaths": snapshot.data!.deaths!.toDouble()
                            },
                          ),
                          CustomRow(
                              data: "Total Cases",
                              data2: snapshot.data!.cases.toString()),
                          CustomRow(
                              data: "Recovered",
                              data2: snapshot.data!.recovered.toString()),
                          CustomRow(
                              data: "Total Deaths",
                              data2: snapshot.data!.deaths.toString()),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () => Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      ScreenAllCountries(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var begin = Offset(0.00, 1.0);
                                    var end = Offset.zero;
                                    var tween = Tween(begin: begin, end: end)
                                        .animate(animation);

                                    return SlideTransition(
                                      position: tween,
                                      child: child,
                                    );
                                  },
                                )),
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Center(child: Text("Countries List")),
                            ),
                          )
                        ],
                      );
                    } else {
                      return Center(
                        child: Text("Error${snapshot.error}"),
                      );
                    }
                  }
                },
              ))),
    );
  }
}
