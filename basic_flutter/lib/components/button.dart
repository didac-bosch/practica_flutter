import 'package:flutter/material.dart';

class ButtonExample extends StatelessWidget {
  const ButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        ElevatedButton(                              //ELEVATED BUTTON
          onPressed: () {
            print('pulsado');
          },
          child: Text('soy un botón'),
          onLongPress: () {
            print('pulsadooooooo');
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.red),
          ),
        ),
        OutlinedButton(onPressed: null, child: Text('outlined')),                     //OUTLINED BUTTON
        TextButton(onPressed: null, child: Text('TextButton')),                       //TEXT BUTTON
        FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),               //FLOATING ACTION BUTTON
        IconButton(onPressed: null, icon: Icon(Icons.favorite)),                      //ICON BUTTON

        Spacer(),
      ],
    );
  }
}
