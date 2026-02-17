import 'package:flutter/material.dart';

class ColumnExample extends StatelessWidget {
  const ColumnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,  // Ocupa todo el ancho disponible
      color: const Color.fromARGB(255, 226, 7, 255),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text('Hola, soy Dídac'),
          Text('Tengo 21 años'),
          Text('Me gusta flutter'),
        ],
      ),
    );
  }
}
