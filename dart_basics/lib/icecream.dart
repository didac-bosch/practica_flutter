class Icecream{
  
  String flavor = 'Desconocido';
  bool sugarFree = false;
  double price = 4.99;
  String size = 'Medium';

  void charge(){
    print ('el precio de un helado de tamaño $size y sabor $flavor, es $price \$');     // \ para indicar que no es una variable
  }
}