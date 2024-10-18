class BussAdminEntity {
  final int id;
  final int bus_number;
  final String bus_type;
  final int seat_count;
  final int bus_status;

  BussAdminEntity({
    required this.id,
    required this.bus_number,
    required this.bus_type,
    required this.seat_count,
    required this.bus_status,
  });

  factory BussAdminEntity.fromModel(Map<String, dynamic> model) {
    return BussAdminEntity(
      id: model['id'],
      bus_number: model['bus_number'],
      bus_type: model['bus_type'],
      seat_count: model['seat_count'],
      bus_status: model['bus_status'],
    );
  }
}
