

import 'package:flutter/material.dart';

class SuccessView extends StatefulWidget {
  const SuccessView({super.key, required this.params});
  final Map<String, String> params;

  @override
  State<SuccessView> createState() => _SuccessViewState();
}

class _SuccessViewState extends State<SuccessView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text("Entered throught Deeplinking"),
            Row(
              children: [
               Text(widget.params.keys.toList().map((e) => "$e\n").toString().replaceAll(',', '').replaceAll('(', '').replaceAll(')', '')),
               Text(widget.params.values.toList().map((e) => "$e\n"). toString().replaceAll(',', '').replaceAll('(', '').replaceAll(')', '')),
              ],
            )
          ],
        ),
      ),
    );
  }
}