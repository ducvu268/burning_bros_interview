import 'package:burning_bros_interview/core/constants/constants.dart';
import 'package:hive/hive.dart';

abstract class TModel {
  @HiveField(ConstantsApp.maxHiveFieldId)
  final int id;

  const TModel({required this.id});

  Map<String, dynamic> toJson();
}
