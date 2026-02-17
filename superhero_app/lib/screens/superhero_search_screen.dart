import 'package:flutter/material.dart';
import 'package:superhero_app/data/model/superhero_detail_response.dart';
import 'package:superhero_app/data/model/superhero_response.dart';
import 'package:superhero_app/data/repository.dart';
import 'package:superhero_app/screens/superhero_detail_sceen.dart';

class SuperheroSearchScreen extends StatefulWidget {
  const SuperheroSearchScreen({super.key});

  @override
  State<SuperheroSearchScreen> createState() => _SuperheroSearchScreenState();
}

class _SuperheroSearchScreenState extends State<SuperheroSearchScreen> {
  Future<SuperheroResponse?>? _superheroInfo;
  final Repository _repository = Repository();
  bool _isTextEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SuperHeroSearch')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'BUSCA TU SUPERHEROE:',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                setState(() {
                  _isTextEmpty = text.isEmpty;
                  _superheroInfo = _repository.fetchSuperheroInfo(text);
                });
              },
            ),
          ),
          bodyList(_isTextEmpty),
        ],
      ),
    );
  }

  FutureBuilder<SuperheroResponse?> bodyList(bool isTextEmpty) {
    return FutureBuilder(
      future: _superheroInfo,
      builder: (contex, snapshot) {
        if (isTextEmpty) {
          return Center(child: Text("Introduce un nombre"));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('ERROR: ${snapshot.error}');
        } else if (snapshot.hasData) {
          var superheroList = snapshot.data?.result;
          return SizedBox(
            height:
                500, //ALTURA DEL RESULTADO, MODIFICAR A GUSTO, EXPANDED PARA TODO
            child: ListView.builder(
              itemCount:
                  superheroList?.length ?? 0, //el ??0 devuelve 0 si es null.
              itemBuilder: (contex, index) {
                if (superheroList != null) {
                  return itemSuperhero(superheroList[index]);
                } else {
                  return Text("error");
                }
              },
            ),
          );
        } else {
          return Text('NO HAY RESULTADOS');
        }
      },
    );
  }

  Padding itemSuperhero(SuperheroDetailResponse item) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 8),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SuperheroDetailSceen(superhero: item),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.red,
          ),
          child: Column(
            children: [
              ClipRRect(
                //widget para las imagenes
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  item.url,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  alignment: Alignment(0, -0.6),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
