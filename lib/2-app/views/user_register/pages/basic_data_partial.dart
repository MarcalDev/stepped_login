import 'package:flutter/material.dart';

class basic_data_partial extends StatefulWidget {
  const basic_data_partial({Key? key}) : super(key: key);

  @override
  State<basic_data_partial> createState() => _basic_data_partialState();
}

class _basic_data_partialState extends State<basic_data_partial> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
            "First"),
      ),
    );
  }
}
