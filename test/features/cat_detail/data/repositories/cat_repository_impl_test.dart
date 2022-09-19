import 'package:app_cats/core/platform/network_info.dart';
import 'package:app_cats/features/cat_detail/data/datasources/cat_local_data_source.dart';
import 'package:app_cats/features/cat_detail/data/datasources/cat_remote_data_source.dart';
import 'package:app_cats/features/cat_detail/data/repositories/cat_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'cat_repository_impl_test.mocks.dart';

@GenerateMocks([CatRemoteDataSource, CatLocalDataSource, NetworkInfo])
void main() {
  late CatRepositoryImpl repository;
  late MockCatLocalDataSource mockLocalDataSource;
  late MockCatRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockCatRemoteDataSource();
    mockLocalDataSource = MockCatLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = CatRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });
}
