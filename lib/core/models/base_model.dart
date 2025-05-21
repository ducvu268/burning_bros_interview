abstract class TModel {
  final int id;

  const TModel({required this.id});

  Map<String, dynamic> toJson();
}
