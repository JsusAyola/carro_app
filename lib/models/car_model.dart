class CarModel {
  final String id;
  final String placa;
  final String conductor;

  CarModel({
    required this.id,
    required this.placa,
    required this.conductor,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      placa: json['placa'],
      conductor: json['conductor'],
    );
  }
}
