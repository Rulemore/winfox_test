import 'package:injectable/injectable.dart';
import 'package:winfox/core/services/network_service.dart';
import 'package:winfox/domain/jokes/models/joke_model.dart';

@injectable
class JokesRepository {
  final NetworkService networkService;
  JokesRepository(this.networkService);

  Future<List<JokeModel>> getJokes() async {
    final response = await networkService.get<List<Object>?>('/joke');
    final jokes = (response.data as List<dynamic>).map((e) => JokeModel.fromJson(e as Map<String, Object>)).toList();
    return jokes;
  }

  Future<JokeModel> getJokeById(int id) async {
    final response = await networkService.get<Object?>('/joke/$id');
    return JokeModel.fromJson(response.data as Map<String, Object>);
  }
}
