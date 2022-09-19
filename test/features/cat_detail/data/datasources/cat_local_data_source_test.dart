import 'dart:convert';

import 'package:app_cats/core/error/exception.dart';
import 'package:app_cats/core/shared/constants/constants_storage.dart';
import 'package:app_cats/features/cat_detail/data/datasources/cat_local_data_source.dart';
import 'package:app_cats/features/cat_detail/data/models/cat_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../fixtures/fixture_reader.dart';
import 'cat_local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late CatLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource =
        CatLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group('getCats', () {
    final mapJson = json.decode(fixture('cats_cached.json'));
    List<CatDTO> tCatsDTO = [];
    for (var item in mapJson) {
      tCatsDTO.add(CatDTO.fromJson(item));
    }

    test(
        'should return List of CatsDTO from Shared preferences when there is one in the cache',
        () async {
      // Arrange
      when(mockSharedPreferences.getString(any))
          .thenAnswer((realInvocation) => fixture('cats_cached.json'));
      // Act
      final result = await dataSource.getCats();
      // Assert
      verify(mockSharedPreferences.getString(CACHED_CATS));
      expect(result, equals(tCatsDTO));
    });

    test('should throw a CacheException when there is not a cached value', () {
      // Arrange
      when(mockSharedPreferences.getString(any)).thenAnswer((_) => null);
      // Act
      final call = dataSource.getCats;
      // Assert
      expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
    });
  });
}
