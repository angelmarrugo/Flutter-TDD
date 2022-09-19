import '/core/error/failures.dart';
import '/features/cat_detail/domain/entities/cat.dart';

import 'package:dartz/dartz.dart';

/// Repository contract ~ get list of cats
abstract class CatRepository {
  Future<Either<Failure, List<Cat>>> getCats();
  Future<Either<Failure, List<Cat>>> searchCat(String breed);
}
