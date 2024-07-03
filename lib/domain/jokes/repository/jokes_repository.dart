import 'package:injectable/injectable.dart';
import 'package:winfox/core/services/network_service.dart';
import 'package:winfox/domain/jokes/models/joke_model.dart';

@injectable
class JokesRepository {
  final NetworkService networkService;
  JokesRepository(this.networkService);

  Future<List<JokeModel>> getJokes() async {
    final response = await networkService.get('/joke');
    final jokes = (response.data as List<dynamic>).map((e) => JokeModel.fromJson(e as Map<String, dynamic>)).toList();
    return jokes;
  }
}
