import '/features/cat_detail/data/models/image_dto.dart';
import '/features/cat_detail/domain/entities/cat.dart';

/// Data Transfer Object of [Cat]
class CatDTO extends Cat {
  CatDTO({
    required String id,
    required String name,
    required String description,
    required ImageDTO image,
    required String temperament,
    required String origin,
    required num adaptability,
  }) : super(
            id: id,
            name: name,
            description: description,
            image: image.url,
            temperament: temperament,
            origin: origin,
            adaptability: adaptability);

  /// Convert to DTO
  factory CatDTO.fromJson(Map<String, dynamic> json) => CatDTO(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        image: ImageDTO.fromJson(json['image']),
        temperament: json['temperament'],
        origin: json['origin'],
        adaptability: json['adaptability'],
      );

  /// Convert to JSON
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'image': image,
        'temperament': temperament,
        'origin': origin,
        'adaptability': adaptability,
      };
}
