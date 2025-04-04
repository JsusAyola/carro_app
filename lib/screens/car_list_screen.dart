import 'package:flutter/material.dart';

class CarListScreen extends StatelessWidget {
  final List<Map<String, String>> cars = [
    {"placa": "C01", "conductor": "Juan"},
    {"placa": "C02", "conductor": "Pedro"},
    {"placa": "C03", "conductor": "Luis"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5E9F8), // Fondo suave
      appBar: AppBar(
        title: Text('Lista de Autos'),
        backgroundColor: Colors.blue[400],
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.directions_car, color: Colors.blue[400], size: 40),
                title: Text(
                  'Placa: ${cars[index]["placa"]}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Conductor: ${cars[index]["conductor"]}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
