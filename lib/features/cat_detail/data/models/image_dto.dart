/// Data Transfer Object Image
class ImageDTO {
  /// Constructor
  const ImageDTO({
    required this.id,
    required this.url,
  });

  /// Identify image
  final String id;

  /// Url of image
  final String url;

  /// Convert to DTO
  factory ImageDTO.fromJson(Map<String, dynamic> json) => ImageDTO(
        id: json['id'],
        url: json['url'],
      );

  /// Convert to JSON
  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
      };
}
