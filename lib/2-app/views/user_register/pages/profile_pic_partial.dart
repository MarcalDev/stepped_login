import 'package:flutter/material.dart';

class profile_pic_partial extends StatefulWidget {
  const profile_pic_partial({Key? key}) : super(key: key);

  @override
  State<profile_pic_partial> createState() => _profile_pic_partialState();
}

class _profile_pic_partialState extends State<profile_pic_partial> {
  @override
  Widget build(BuildContext context) {
     return Container(
      child: Center(
        child: Text(
            "Third"),
      ),
    );
  }
}
