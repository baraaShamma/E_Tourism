class guidesModel {
  final int id;
  final String fName;
  final String lName;
  final String email;
  final String mobile;


  guidesModel({
    required this.id,
    required this.fName,
    required this.lName,
    required this.email,
    required this.mobile,

  });

  factory guidesModel.fromJson(Map<String, dynamic> json) {
    return guidesModel(
      id: json['id'],
      fName: json['fName'],
      lName: json['lName'],
      email: json['email'],
      mobile: json['mobile'],
    );
  }
}
