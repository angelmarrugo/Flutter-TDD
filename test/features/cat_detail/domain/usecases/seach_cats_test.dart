import 'package:app_cats/features/cat_detail/domain/entities/cat.dart';
import 'package:app_cats/features/cat_detail/domain/repositories/cat_repository.dart';
import 'package:app_cats/features/cat_detail/domain/usecases/search_cats.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'seach_cats_test.mocks.dart';

@GenerateMocks([CatRepository])
void main() {
  late SearchCats usecase;
  late MockCatRepository mockCatRepository;

  setUp(() {
    mockCatRepository = MockCatRepository();
    usecase = SearchCats(mockCatRepository);
  });

  const tName1 = 'Abyssinian';
  const tSearch = 'Abyssinian';
  final tCats = [
    const Cat(
      id: 'id',
      name: tName1,
      description: 'test',
      image: 'test',
      temperament: 'test',
      origin: 'test',
      adaptability: 1,
    ),
  ];

  test('should get list with item coincide with text to search', () async {
    // Arrange
    when(mockCatRepository.searchCat(tSearch))
        .thenAnswer((_) async => Right(tCats));
    // Act
    final result = await usecase(const Params(breed: tSearch));
    // Assert
    expect(result, Right(tCats));
    // Verify that the method has been called on the Repository
    verify(mockCatRepository.searchCat(tSearch));
    // Only the above method should be called and nothing more.
    verifyNoMoreInteractions(mockCatRepository);
  });
}
