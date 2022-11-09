import 'dart:convert';

class HomeModel {
  final String urlImage;

  HomeModel({required this.urlImage});

  Map<String, dynamic> toMap() {
    return {
      'urlImage': urlImage,
    };
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(urlImage: map['url'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory HomeModel.fromJson(String source) =>
      HomeModel.fromMap(json.decode(source));
}
