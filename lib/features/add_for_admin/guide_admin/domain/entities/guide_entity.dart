class GuidesAdminEntity {
  final int id;
  final String fName;
  final String lName;
  final String email;
  final String mobile;

  GuidesAdminEntity({
    required this.id,
    required this.fName,
    required this.lName,
    required this.email,
    required this.mobile,
  });

  factory GuidesAdminEntity.fromModel(Map<String, dynamic> model) {
    return GuidesAdminEntity(
      id: model['id'],
      fName: model['fName'],
      lName: model['lName'],
      email: model['email'],
      mobile: model['mobile'],
    );
  }
}
