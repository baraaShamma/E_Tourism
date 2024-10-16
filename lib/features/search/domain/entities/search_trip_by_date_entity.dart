class SearchTripByDateEntity {
  final int id;
  final int touristProgramId;
  final String busType;
  final Guide guide;
  final String price;
  final int maxCapacity;
  final String tripDate;
  final List<String> images;

  SearchTripByDateEntity({
    required this.id,
    required this.touristProgramId,
    required this.busType,
    required this.guide,
    required this.price,
    required this.maxCapacity,
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
