import 'package:equatable/equatable.dart';

/// Business object that contain all information about cat
class Cat extends Equatable {
  const Cat({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.temperament,
    required this.origin,
    required this.adaptability,
  });

  /// Identification of cat
  final String id;

  /// Breeds of cat
  final String name;

  /// Information basic about cat
  final String description;

  /// Image with format PNG, JPG of cat
  final String image;

  /// Attributes conduct of cat
  final String temperament;

  /// Code of country where cat is origin
  final String origin;

  /// Capacity adaptability
  final num adaptability;

  @override
  List<Object> get props => [
        id,
        name,
        description,
        image,
        temperament,
        origin,
        adaptability,
      ];
}
