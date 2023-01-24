import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

abstract class BaseModel{
  late String? id;
  late bool? isActive;
  late String? realeseDate;

  BaseModel({this.id, this.isActive, this.realeseDate});
}