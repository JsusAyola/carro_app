import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/car_model.dart';

class CarService {
  final String baseUrl = 'https://67f7d1812466325443eadd17.mockapi.io/carros';

  Future<List<CarModel>> fetchAllCars() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => CarModel.fromJson(item)).toList();
    } else {
      throw Exception('Error al obtener los carros');
    }
  }

  Future<CarModel> fetchCarById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      return CarModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Carro no encontrado');
    }
  }
}
