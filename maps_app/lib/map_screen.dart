import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;

  final CameraPosition _initialPosition = const CameraPosition(
    target: LatLng(41.275365, 1.986308),
    zoom: 15,
  );

  final Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId("Pepito"),
      position: LatLng(41.275365, 1.986308),
      infoWindow: InfoWindow(title: "EETAC"),
    ),
  };

  void addMarker(LatLng latLng) async {
    TextEditingController textController = TextEditingController();

    String? title = await showDialog<String>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text("Añade un título"),
          content: TextField(
            controller: textController,
            decoration: const InputDecoration(hintText: "Restaurante..."),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, null),
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pop(dialogContext, textController.text),
              child: const Text("Guardar"),
            ),
          ],
        );
      },
    );

    if (title != null && title.isNotEmpty) {
      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId(latLng.toString()),
            position: latLng,
            infoWindow: InfoWindow(title: title),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MAPA")),
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        onMapCreated: (controller) {
          _controller = controller;
        },
        mapType: MapType.normal,
        markers: _markers,
        onTap: (latLng) => addMarker(latLng),
      ),
    );
  }
}
