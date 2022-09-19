import 'dart:convert';

import 'package:app_cats/core/error/exception.dart';
import 'package:app_cats/core/shared/constants/constants_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

/// Implementation of contract
class CatLocalDataSourceImpl implements CatLocalDataSource {
  /// Constructor
  CatLocalDataSourceImpl({required this.sharedPreferences});

  /// Instance of [SharedPreferences]
  final SharedPreferences sharedPreferences;

  @override
  Future<List<CatDTO>> getCats() {
    final jsonString = sharedPreferences.getString(CACHED_CATS);
    List<CatDTO> catsDTO = [];
    if (jsonString != null) {
      final jsonMap = json.decode(jsonString);
      for (var item in jsonMap) {
        catsDTO.add(CatDTO.fromJson(item));
      }
    } else {
      throw CacheException();
    }

    return Future.value(catsDTO);
  }

  @override
  Future<void> cacheCats(List<CatDTO> cats) {
    // TODO: implement cacheCats
    throw UnimplementedError();
  }
}
