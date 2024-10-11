import 'package:covid_app/reusbalewidgets/countri_row.dart';
import 'package:covid_app/screens/screen_detail_page.dart';
import 'package:covid_app/services/covid_services.dart';
import 'package:flutter/material.dart';

class ScreenAllCountries extends StatefulWidget {
  const ScreenAllCountries({super.key});

  @override
  State<ScreenAllCountries> createState() => _ScreenAllCountriesState();
}

class _ScreenAllCountriesState extends State<ScreenAllCountries> {
  final _serachController = TextEditingController();
  final _services = CovidServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SearchBar(
              onChanged: (value) {
                setState(() {});
              },
              hintText: "Search By Country Name ",
              controller: _serachController,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder(
                future: _services.getAllCountriesData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            String countryName =
                                snapshot.data![index].country.toString();
                            if (_serachController.text.isEmpty) {
                              return CountriRow(
                                flagUrl: snapshot.data![index].countryInfo!.flag
                                    .toString(),
                                countryName: countryName,
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ScreenDetailPage(
                                        countryData: snapshot.data![index]),
                                  ),
                                ),
                              );
                            } else if (countryName.toLowerCase().contains(
                                _serachController.text.toLowerCase())) {
                              return CountriRow(
                                flagUrl: snapshot.data![index].countryInfo!.flag
                                    .toString(),
                                countryName: countryName,
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ScreenDetailPage(
                                        countryData: snapshot.data![index]),
                                  ),
                                ),
                              );
                            } else {
                              return Center(
                                child: Container(),
                              );
                            }
                          });
                    } else {
                      return Center(
                        child: Text("Error ${snapshot.error}"),
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
