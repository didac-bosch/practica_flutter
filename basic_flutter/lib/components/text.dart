import 'package:flutter/material.dart';

class TextExample extends StatelessWidget {
  const TextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Spacer(),
        Text('Texto básico'),
        Text('Texto con estilo', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Texto con estilo', style: TextStyle(fontSize: 20)),
        Text('Texto con estilo', style: TextStyle(fontStyle: FontStyle.italic)),
        Text(
          'Texto con estilo',
          style: TextStyle(
            fontSize: 25,
            color: Colors.red,
            backgroundColor: Colors.yellow,
          ),
        ),
        Text(
          'Decorator',
          style: TextStyle(
            fontSize: 20,
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
        ),
        Text(
          'Espaciado entre letras',
          style: TextStyle(fontSize: 20, letterSpacing: 5),
        ),
        Text('TEXTO LARGO TEXTO LARGO TEXTO LARGO TEXTO LARGO TEXTO LARGO TEXTO LARGO TEXTO LARGO TEXTO LARGO  TEXTO LARGO', 
        maxLines: 2, 
        overflow: TextOverflow.ellipsis),     //para indicar que hay mas
        Spacer(),
      ],
    );
  }
}
