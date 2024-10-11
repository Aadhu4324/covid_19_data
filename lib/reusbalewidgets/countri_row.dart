import 'package:flutter/material.dart';

class CountriRow extends StatelessWidget {
  final String flagUrl;
  final String countryName;
  final VoidCallback onTap;
  const CountriRow(
      {super.key,
      required this.flagUrl,
      required this.countryName,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 80,
                      height: 50,
                      child: Image.network(
                        flagUrl,
                        fit: BoxFit.fill,
                      )),
                  Text(countryName)
                ],
              ),
              Divider()
            ],
          ),
        ),
      ),
    );
  }
}
