import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String data;
  final String data2;
  const CustomRow({super.key, required this.data, required this.data2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data,
              style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            Text(
              data2,
              style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            )
          ],
        ),
        const Divider(
          height: 20,
          color: Colors.black,
        )
      ],
    );
  }
}
