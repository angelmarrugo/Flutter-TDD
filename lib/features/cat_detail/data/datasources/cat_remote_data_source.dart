import 'package:app_cats/features/cat_detail/data/models/cat_DTO.dart';

/// Contracts
abstract class CatRemoteDataSource {
  /// Calls the https://api.thecatapi.com/v1/breeds endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<CatDTO>> getCats();

  /// Calls the local Storage
  Future<List<CatDTO>> searchCat(String breed);
}
