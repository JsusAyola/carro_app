import 'package:flutter/material.dart';
import '../models/car_model.dart';
import '../services/car_service.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final TextEditingController _controller = TextEditingController();
  final CarService _carService = CarService();
  CarModel? scannedCar;
  String? error;

  void buscarCarro() async {
    setState(() {
      scannedCar = null;
      error = null;
    });

    try {
      final car = await _carService.fetchCarById(_controller.text.trim());
      setState(() => scannedCar = car);
    } catch (e) {
      setState(() => error = "Carro no encontrado con ese código");
    }
  }

  void reset() {
    setState(() {
      scannedCar = null;
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E9F8),
      appBar: AppBar(
        title: const Text('Escanear QR'),
        backgroundColor: Colors.blue[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: scannedCar == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Simula el escaneo ingresando el código del QR:'),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Código QR',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: buscarCarro,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[400],
                    ),
                    child: const Text('Buscar'),
                  ),
                  const SizedBox(height: 20),
                  if (error != null)
                    Text(
                      error!,
                      style: const TextStyle(color: Colors.red),
                    )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('¿Desea tomar el carro ${scannedCar!.placa}?'),
                  const SizedBox(height: 10),
                  Text('Conductor: ${scannedCar!.conductor}'),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: const Text('Sí'),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: reset,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text('No'),
                      ),
                    ],
                  )
                ],
              ),
      ),
    );
  }
}
