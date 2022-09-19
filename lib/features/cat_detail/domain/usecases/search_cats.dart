import '/core/usecases/usecase.dart';
import 'package:equatable/equatable.dart';
import '/core/error/failures.dart';
import '/features/cat_detail/domain/entities/cat.dart';
import '/features/cat_detail/domain/repositories/cat_repository.dart';

import 'package:dartz/dartz.dart';

/// Use case for obtain all cats depending {breeds}
class SearchCats extends UseCase<List<Cat>, Params> {
  /// Constructor
  SearchCats(this.repository);

  /// Instance of repository
  final CatRepository repository;

  @override
  Future<Either<Failure, List<Cat>>> call(Params params) async =>
      await repository.searchCat(params.breed);
}

/// Parameters of case use
class Params extends Equatable {
  /// Constructor
  const Params({required this.breed});

  /// Name of cat
  final String breed;

  @override
  List<Object?> get props => [breed];
}
