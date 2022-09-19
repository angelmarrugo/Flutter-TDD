import '/core/error/failures.dart';
import '/features/cat_detail/domain/entities/cat.dart';
import '/features/cat_detail/domain/repositories/cat_repository.dart';

import 'package:dartz/dartz.dart';

/// Use case for obtain all cats
class GetCats {
  /// Constructor
  GetCats(this.repository);

  /// Instance of repository
  final CatRepository repository;

  /// Function execute for use case
  Future<Either<Failure, List<Cat>>> execute() async =>
      await repository.getCats();
}
