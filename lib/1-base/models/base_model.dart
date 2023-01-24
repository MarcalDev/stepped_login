import 'package:flutter/cupertino.dart';

abstract class BaseModel{
  late UniqueKey? id;
  late bool? isActive;
  late DateTime? realeseDate;

  BaseModel({this.id, this.isActive, this.realeseDate});
}