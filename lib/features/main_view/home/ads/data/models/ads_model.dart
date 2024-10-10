class Ad {
  final int id;
  final String imageUrl;

  Ad({
    required this.id,
    required this.imageUrl,
  });

  factory Ad.fromJson(Map<String, dynamic> json) {
    return Ad(
      id: json['id'],
      imageUrl: json['image_url'],
    );
  }
}
