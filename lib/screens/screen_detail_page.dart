import 'package:covid_app/models/covid.dart';
import 'package:covid_app/reusbalewidgets/cutom_row.dart';
import 'package:flutter/material.dart';

class ScreenDetailPage extends StatelessWidget {
  final Covid countryData;
  const ScreenDetailPage({super.key, required this.countryData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 100,
                width: 200,
                child: Image.network(
                  countryData.countryInfo!.flag.toString(),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              countryData.country.toString(),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomRow(data: "Total Cases", data2: countryData.cases.toString()),
            CustomRow(
                data: "Recoverd", data2: countryData.recovered.toString()),
            CustomRow(data: "Deaths", data2: countryData.deaths.toString())
          ],
        ),
      ),
    );
  }
}
