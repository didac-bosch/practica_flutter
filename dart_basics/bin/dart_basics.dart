import 'dart:io';
import 'package:dart_basics/IceCream.dart';


//INLINE SUGGEST OFF PARA QUITAR AUTOCOMPLETADO!!!

void main(List<String> arguments) {
  // listExamples();
  // setExamples();
  // mapExamples();
  // listLoop();
  // setLoop();  
  // mapLoop(); 
  //exercise3();
  
  var chocolate = Icecream();
  chocolate.flavor = 'chocolate';

  var test = Icecream();
  test.charge();
  chocolate.charge();
}



/*
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
METODOS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

void simpleFunction(){
  print('Hola soy una función simple');
}

void inputFunction(int a, int b){
  int result = a + b;
  print('el resultado es: $result');
}
//Void es el tipo de retorno de la función. Si no devuelve nada, se pone void.
//para devolver el valor se pone el tipo de dato que se va a devolver (int, String, etc) y se usa return para devolver el valor.

int outputFunction (int a, int b){
  int a = 3;
  int b = 5;
  int result = a+ b;
  return result;
}

int completeFunction(int a, int b){
  return a + b;
}

void optionalFunction ({String name = 'Desconocido', int age = -1}){   // Parametros opcionales nombrados.  !!!IMPORTANTE USAR {} PARA PARAMETROS OPCIONALES NOMBRADOS!!!.  !!!IMPORTANTE USAR = PARA DAR VALORES POR DEFECTO!!!
  print('Hola $name, tienes $age años');
}
void optionalFunction2 (String name, {int age = -1}){  //Solo un parametro obligatorio.
  print('Hola $name, tienes $age años');
}

int completeFunction2(int a, int b) => a + b; // Funcion de una sola linea.  !!!IMPORTANTE USAR => PARA FUNCIONES DE UNA SOLA LINEA!!!.  !!!IMPORTANTE NO USAR {} EN FUNCIONES DE UNA SOLA LINEA!!!

/*
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ESTRUCTURAS DE DATOS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

//LISTAS - ARRAYS
void listExamples(){
  List<String> names = ['DIDAC', 'ANA', 'PEDRO'];  //SOLO STRINGS
  var names2 = ['DIDAC', 'ANA', 'PEDRO']; // Dart infiere el tipo de dato.  !!!IMPORTANTE USAR VAR PARA QUE DART INFIERE EL TIPO DE DATO!!!
  // print(names[0]); //elemento de la lista. empieza en 0.
  // print(names.last); //ultimo elemento de la lista. o print(names.first); //primer elemento de la lista.
  // print (names.length); //longitud de la lista.
  // print (names.length - 1); //indice del ultimo elemento de la lista.

  //REMPLAZAR
  names[2] = 'MARIA'; //cambiar un elemento de la lista.  
  //AGREGAR
  names.add('LUIS'); //agregar un elemento al final de la lista.
  names.addAll(names2); //agregar todos los elementos de otra lista al final de la lista.
  names.insert(1, 'CARLOS'); //agregar un elemento en una posición específica de la lista.
  //REMOVER
  names.remove('ANA'); //remover un elemento de la lista por su valor. (solo el primer elemento que coincida)
  names.removeAt(1); //remover un elemento de la lista por su indice.
  names.clear(); //remover todos los elementos de la lista.
}

//SETS - CONJUNTOS.    lista sin orden y sin elementos repetidos.
void setExamples(){
  Set<String> names = {'ALBERTO', 'PEPE'};   //con corchetes {}
    Set<String> names2 = {'ALBERTO'};   

  names.add('MARIA'); 
  names.add('ALBERTO'); //no se agrega porque ya existe en el set.
  names.remove('PEPE');
  names.clear();
  names.removeAll(names2);
  names.length;

  bool result = names.contains('ALBERTO'); //true si el set contiene el elemento, false si no lo contiene.
  if(names.contains('ALBERTO')){
    print('El set contiene a ALBERTO');
  } else {
    print('El set no contiene a ALBERTO');
  }

  print(names);

  List<String> newNames = ['DIDAC', 'ANA', 'PEDRO', 'DIDAC'];
  Set<String> uniqueNames = Set.from(newNames); //convierte Lista a set, eliminando los elementos repetidos.
  print(uniqueNames); // Imprime: {DIDAC, ANA, PEDRO}
}

//MAPS - DICCIONARIOS.   Colección de pares clave-valor.  Las claves son únicas.  se accede a los valores a través de las claves.
void mapExamples(){
  Map<String, int> people = {
    'DIDAC': 21,   //CLAVE: VALOR
    'ANA': 30,
    'PEDRO': 25
  };
  
  people['MARIA'] = 28; //agregar un nuevo par clave-valor al mapa.
  print(people);
  print(people['DIDAC']); //acceder al valor a través de la clave.

  people.addAll({'CARLOS': 35, 'LUIS': 40}); //agregar varios pares clave-valor al mapa.
  people['MARIO'] = 22; //agregar un nuevo par clave-valor al mapa.
  people.remove('ANA'); //remover un par clave-valor del mapa por su clave

  print(people.keys); //imprime las claves del mapa.
  print(people.values); //imprime los valores del mapa. 

  people.containsKey('PEDRO'); //true si el mapa contiene la clave, false si no la contiene.      //DEVUELVE BOOL
  people.containsValue(25); //true si el mapa contiene el valor, false si no

}


/*
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
BUCLES.     Algunas formas de iterar sobre las estructuras de datos. (MAS COMUNES)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

void listLoop(){
  List<int> numbers = [1, 2, 5, 8, 10, 3];

  for (var i = 0; i < numbers.length; i++) {        // AUTOCOMPLETADO: fori
    
    print(numbers[i]);
    if (numbers[i] > 3) {
      print('El numero ${numbers[i]} es mayor que 3');
    }
    
  }

  for (var element in numbers) {        // AUTOCOMPLETADO: for in
    print('con el for in tengo $element');
    
  }


  numbers.forEach((item){                         //LISTAS Y SETS MUY PARECIDOS, FUNCIONA IGUAL PARA AMBOS.
    print('el item es $item');
  });
  numbers.forEach(print); //otra forma de usar forEach, pasando la función print directamente como argumento.
}


void setLoop(){
  Set<int> numbers = {3, 6, 9, 12, 15, 5};

  for (var element in numbers) {        // AUTOCOMPLETADO: for in
    print('El set: $element');
    
  }
}

void mapLoop(){
  Map<String, int> numbers = {
    'one': 1,
    'two': 2,
    'three': 3,
    'four': 4
  };

  for (var element in numbers.entries){                    //entradas (todo), si quiero acceder a claves numbers.keys, si quiero acceder a valores numbers.values

  print('la clave es ${element.key} y el valor es ${element.value}');  
  }


  numbers.forEach((key, value) {                         //AHORA CON KEY Y VALUE, FUNCIONA SOLO PARA MAPAS.
    print('La clave es $key y el valor es $value');
  });
  
}  

void nullability(){              //Importante pq en la aplicación a veces llegan cosas nulas!!!!
  String? name = 'DIDAC';
  name = '';
  name = null;

  //String example2 = name!;     //Solo cuando no hay nulls, si SÍ hay un null revienta!!!
  String example3 = name ?? 'invitado';  //Si es null pone como defecto 'invitado'
  name ??= 'pepe';   //Si name es nulo, le pone PEPE, sino lo mantiene.   

  int? example = 123;
  example = null;

  Icecream test = Icecream();
}


/*
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
EJERCICIOS ESTRUCTURAS DE DATOS Y BUCLES
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

//EJERCICIO 1: LISTAS - suma de numeros pares en una lista.
void exercise1(){
  List<int> listaNumeros = [1,2,3,4,5,6,7,8];
  int sumaPares = 0;
  for (var element in listaNumeros) {
    if (element % 2 == 0) {
      sumaPares += element;
    }
  }
  print('la suma de números pares es: $sumaPares');
}

//EJERCICIO 2: SETS - FILTRAR PALABRAS UNICAS

void exercise2(){         //También se puede hacer con un add ya que los sets solo cogen elementos no repetidos.
  List<String> nombres = ['dart', 'flutter', 'dart', 'programacion', 'flutter'];
  Set<String> nombresUnicos = Set.from(nombres);
  print(nombresUnicos);
}


//EJERCICIO 3: MAPAS - CONTAR LA FRECUENCIA DE PALABRAS EN UN MAP

void exercise3 (){
  List<String> nombresRepetidos= ['dart', 'flutter', 'dart', 'programación','dart','flutter'];
  Map<String,int> nombreConContador = {};
  for (String element in nombresRepetidos) {
    if (nombreConContador.containsKey(element)){
      nombreConContador[element] = nombreConContador[element]! + 1;
    } else{
      nombreConContador[element] = 1;
    }
  };
  print(nombreConContador);
}







/*
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
BASES DE DART
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

/////// VARIABLES///////
void greetings(String name){
  var age = 21;
  print('hola $name');

}
void numbersExample(){
  int number = 5; 
  double decimalNum = 5.5;
  num age2 = 21.5; // num can hold both int and double values
}
void stringExample(){
   String name = 'DIDAC'; //uppercase S.
  String currentAge = '21 years old';
  String fullSentence1 = 'My name is $name and I am $currentAge.'; // String interpolation
  String fullSentence2 = 'My name is ' + name + ' and I am ' + currentAge + '.'; // $ indica variable
}
void booleanExample(){
  bool imHappy = true; // si/no
}
void dynamicExample(){
  //VARIABLES TIPO DINAMICO
  dynamic example = 'Hola soy un ejemplo';
  example = 123; // ahora es un entero
  example = true; // ahora es un booleano
}
void staticExample(){
  //VARIABLES TIPO FIJO
  final String fixedName = 'DIDAC'; // no se puede cambiar (es fija en el tiempo de ejecucion)
  const int fixedAge = 21; // no se puede cambiar (es fija en tiempo de compilacion) - solo cosas que vaya a meter a mano
}

////// CONTROL DE FLUJO //////
void conversions(){
   //CONVERSIONES
  String toNumberString = '123';
  int convertedNumber = int.parse(toNumberString); // convierte String a int.   !!!IMPORTANTE USA PARSE!!!
  print(convertedNumber);

  int toStringNumber = 456;
  String convertedString = toStringNumber.toString(); // convierte int a String
  print(convertedString);
}


//////OPERADORES///////
void operators(){
  //OPERADORES MATEMATICOS
  int a = 1;
  int b = 4;

  int result = a + b;
  //int result = a - b;
  //int result = a * b;
  //int result = a ~/ b;        // division entera
  //double result = a / b;      // division decimal
  //int result = a % b;         // modulo (resto de la division)

  a += b;     //suma variable b 
  a -= b;     //resta variable b
  a *= b;     //multiplica variable b ...

  a++;         //incrementa en 1
  a--;         //decrementa en 1
  print('resultado = ${a++}');  //post-incremento.   !!!USAR CORCHETE {}!!!
  print('resultado = $result');
}



////// EJERCICIOS VARIABLES Y OPERADORES /////
void example1(){
  //EJERCICIO 1: CALCULADORA DE EDAD
  // Escribe un programa que pida al usuario su año de nacimiento y calcule su edad actual.

  // Pasos a seguir:
  // 1. Pedir al usuario su año de nacimiento (leerlo como String).
  // 2. Convertir el año de nacimiento a un número entero.
  // 3. Calcular la edad actual restando el año de nacimiento al año actual (2025).
  // 4. Mostrar la edad calculada al usuario en un mensaje como: "Tienes X años".
  print('Introduce tu año de nacimiento:');
  String date = stdin.readLineSync()!;
  int currentYear = 2025;
  int dateInt = int.parse(date);
  int dateFinal = currentYear - dateInt;
  print('Tienes $dateFinal años');
}
void example2(){
  //EJERCICIO 2: CALCULADORA DE PROPINA
  // Escribe un programa que calcule la propina que debes dejar en un restaurante. El programa debe pedir al usuario el total de la cuenta y el porcentaje de propina que desea dejar, y luego mostrar el monto de la propina y el total a pagar.

  // Pasos a seguir:
  // 1. Pedir al usuario el total de la cuenta (leerlo como String).
  // 2. Convertir el total de la cuenta a un número decimal (double).
  // 3. Pedir al usuario el porcentaje de propina que desea dejar (leerlo como String).
  // 4. Convertir el porcentaje de propina a un número decimal (double) y dividirlo por 100 para obtener su valor en forma decimal.
  // 5. Calcular el monto de la propina multiplicando el total de la cuenta por el porcentaje de propina en forma decimal.
  // 6. Calcular el total a pagar sumando el total de la cuenta y el monto de la propina.
  // 7. Mostrar al usuario el monto de la propina y el total a pagar en un mensaje como: "La propina es X euros y el total a pagar es Y euros".
  double totalCuenta = 29.99;
  double propina = totalCuenta * 0.2;
  double totalConPropina = totalCuenta + propina;
  int numeroPersonas = 2;
  String cantidadFinalPorPersona = (totalConPropina / numeroPersonas).toStringAsFixed(2);
  print('Cada persona tiene que pagar: $cantidadFinalPorPersona euros'); //tambien se puede usar ${.toStringAsFixed(2)} en el print.
}


/////// CONTROL DE FLUJO //////
void ifElseExample(){

  int userAge = 21;
  if (userAge >= 18) {
    print('Eres mayor de edad.');
  } else {
    print('Eres menor de edad.');
  }
  // (userAge >=18) ? print('Eres mayor de edad.') : print('Eres menor de edad.');
}
void switchCaseExample(){
  int dayOfWeek = 3;
  switch (dayOfWeek) {
    case 1:
      print('Lunes');
      break;
    case 2:
      print('Martes');
      break;
    case 3:
      print('Miércoles');
      break;
    case 4:
      print('Jueves');
      break;
    case 5:
      print('Viernes');
      break;
    case 6:
      print('Sábado');
      break;
    case 7:
      print('Domingo');
      break;
    default:
      print('Número de día de la semana no válido');
  }
}

////// EJERCICIOS CONTROL DE FLUJO //////
void example3(){
//EJERCICIO 3:
  print('Introduce un numero positivo o negativo:');
  int numeroUsuario = int.parse(stdin.readLineSync()!);
  if (numeroUsuario >= 0) {
    print('El numero es positivo');
  } else {
    print('El numero es negativo');
  }
}
void example4(){
  //EJERCICIO 4: switch case
  print('Introduce un número ente entre 1 y 12:');
  int numeroMes = int.parse(stdin.readLineSync()!);
  switch (numeroMes) {
    case 1:
      print('Enero');
      break;
    case 2:
      print('Febrero');
      break;
    case 3:
      print('Marzo');
      break;
    case 4:
      print('Abril');
      break;
    case 5:
      print('Mayo');
      break;
    case 6:
      print('Junio');
      break;
    case 7:
      print('Julio');
      break;
    case 8:
      print('Agosto');
      break;
    case 9:
      print('Septiembre');
      break;
    case 10:
      print('Octubre');
      break;
    case 11:
      print('Noviembre');
      break;
    case 12:
      print('Diciembre');
      break;
    default:
      print('Número incorrecto');
  }
}