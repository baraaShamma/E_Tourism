class MyTrip {
  final int id;
  final String name;
  final String description;
  final String busType;
  final Guide guide;
  final String tripDate;
  final List<String> images;

  MyTrip({
    required this.id,
    required this.name,
    required this.description,
    required this.busType,
    required this.guide,
    required this.tripDate,
    required this.images,
  });
}

class Guide {
  final String fName;
  final String lName;
  final String mobile;

  Guide({
    required this.fName,
    required this.lName,
    required this.mobile,
  });

  factory Guide.fromJson(Map<String, dynamic> json) {
    return Guide(
      fName: json['fName'],
      lName: json['lName'],
      mobile: json['mobile'],
    );
  }
}
