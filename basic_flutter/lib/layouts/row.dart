import 'package:flutter/material.dart';

class RowExample extends StatelessWidget {
  const RowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(                            //refactor - wrap with padding
      padding: const EdgeInsets.only(top:86), 
      child: SizedBox(
        // width: double.infinity, 
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // mainAxisSize: MainAxisSize.max,
          children: [
            // Spacer(), // Agrega un espacio
            Text('Example 1'),
            Expanded(child: Text('Example 2')), //wrap with widget -expanded- para que ocupe el espacio disponible
            Text('Example 3'),
          ],
        ),
      ),
    );
  }
}