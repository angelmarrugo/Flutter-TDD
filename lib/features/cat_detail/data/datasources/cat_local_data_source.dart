import '/features/cat_detail/data/models/cat_dto.dart';

/// Contracts
abstract class CatLocalDataSource {
  /// Gets the cached List<CatDTO> which was gotten the last time
  /// had an internet connection
  ///
  /// Throws [NoLocalDataException] if no cached data is present
  Future<List<CatDTO>> getCats();

  /// Saved in local storage data of cats
  Future<void> cacheCats(List<CatDTO> cats);
}
