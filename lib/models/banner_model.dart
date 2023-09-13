class BannerModel {
  BannerModel({required this.id, required this.image});

  final String id;
  final String image;

  BannerModel.fromJson(Map<String, Object?> json)
      : this(
          id: json['title']! as String,
          image: json['image']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'title': id,
      'image': image,
    };
  }
}
