class BussModel {
  final int id;
  final int bus_number;
  final String bus_type;
  final int seat_count;
  final int bus_status;

  BussModel({
    required this.id,
    required this.bus_number,
    required this.bus_type,
    required this.seat_count,
    required this.bus_status,
  });

  factory BussModel.fromJson(Map<String, dynamic> json) {
    return BussModel(
      id: json['id'],
      bus_number: json['bus_number'],
      bus_type: json['bus_type'],
      seat_count: json['seat_count'],
      bus_status: json['bus_status'],
    );
  }
}
