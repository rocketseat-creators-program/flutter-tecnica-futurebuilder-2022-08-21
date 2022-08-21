import 'package:app/models/github_model.dart';
import 'package:dio/dio.dart';

class GithubRepository {
  final dio = Dio();

  Future<GithubModel> fetchGithub() async {
    try {
      final response = await dio.get('https://api.github.com/users/cachopaweb');
      final map = response.data as Map<String, dynamic>;
      return GithubModel.fromMap(map);
    } catch (e) {
      throw Exception(e);
    }
  }
}
