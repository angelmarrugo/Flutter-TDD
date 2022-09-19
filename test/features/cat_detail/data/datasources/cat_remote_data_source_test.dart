import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:http/http.dart' as http;
import 'cat_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late CatRemoteDataSourceImpl dataSource;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    dataSource = CatRemoteDataSourceImpl(client: mockClient);
  });
}
