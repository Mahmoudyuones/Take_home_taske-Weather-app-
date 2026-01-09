import 'package:injectable/injectable.dart';
import 'package:take_home_task/config/base_response/base_response.dart';
import 'package:take_home_task/features/home/domain/repositories/home_repo_contract.dart';

@injectable
class GetFavoritesUseCase {
  final HomeRepoContract _repository;

  GetFavoritesUseCase(this._repository);

  Future<BaseResponse<List<String>>> call() async {
    return await _repository.getFavoriteCities();
  }
}
