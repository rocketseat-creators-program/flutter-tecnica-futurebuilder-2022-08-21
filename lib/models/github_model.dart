import 'dart:convert';

class GithubModel {
  final String name;
  final String avatarUrl;

  GithubModel({required this.name, required this.avatarUrl});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'avatar_url': avatarUrl,
    };
  }

  factory GithubModel.fromMap(Map<String, dynamic> map) {
    return GithubModel(
      name: map['name'] ?? '',
      avatarUrl: map['avatar_url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GithubModel.fromJson(String source) =>
      GithubModel.fromMap(json.decode(source));
}
