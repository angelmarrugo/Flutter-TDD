import 'package:app_cats/features/cat_detail/data/models/cat_dto.dart';

/// Contracts
abstract class CatRemoteDataSource {
  /// Calls the https://api.thecatapi.com/v1/breeds endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<CatDTO>> getCats();
}
