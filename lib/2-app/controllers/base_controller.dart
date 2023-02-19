import 'package:flutter/material.dart';

class BaseController{
  late BuildContext context;

  openPopup(Widget popup) async{
    await showDialog(context: context, builder: (BuildContext context) {
      return popup;
    });
  }
}