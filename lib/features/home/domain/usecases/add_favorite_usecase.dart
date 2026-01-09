import 'package:injectable/injectable.dart';
import 'package:take_home_task/config/base_response/base_response.dart';
import 'package:take_home_task/features/home/domain/repositories/home_repo_contract.dart';

@injectable
class AddFavoriteUseCase {
  final HomeRepoContract _repository;

  AddFavoriteUseCase(this._repository);

  Future<BaseResponse<bool>> call(String cityName) async {
    return await _repository.addFavorite(cityName);
  }
}
