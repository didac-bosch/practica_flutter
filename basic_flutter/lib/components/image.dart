import 'package:flutter/material.dart';

class ImageExample extends StatelessWidget {
  const ImageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8vpf8o-86RZrNLL3EZ_2Y3hDkS2wEtASjzg&s'),
          
          //Image.asset('assets/images/Photo on 4-3-25 at 18.25.jpg',height: 200)
      
        ],
      ),
    );
  }
}
