import 'package:app/models/github_model.dart';
import 'package:app/repositories/github_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final repository = GithubRepository();

  HomePage({Key? key}) : super(key: key);

  Widget _buildSuccess(GithubModel model) {
    return Center(
      child: SizedBox(
        height: 300,
        width: 300,
        child: Column(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  model.avatarUrl,
                ),
              ),
            ),
            Text(
              model.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildError() {
    return const Center(
      child: Text(
        'Erro ao buscar dados!',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Técnica FutureBuilder'),
        centerTitle: true,
      ),
      body: FutureBuilder<GithubModel>(
        future: repository.fetchGithub(),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return _buildSuccess(snapshot.data!);
          }
          if (snapshot.hasError) {
            return _buildError();
          }
          return _buildLoading();
        },
      ),
    );
  }
}
