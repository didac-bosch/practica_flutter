import 'package:flutter/material.dart';
import 'package:superhero_app/data/model/superhero_detail_response.dart';

class SuperheroDetailSceen extends StatelessWidget {
  final SuperheroDetailResponse superhero;
  const SuperheroDetailSceen({super.key, required this.superhero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("superhero: ${superhero.name}")),
      body: Column(
        children: [
          Image.network(
            superhero.url,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment(0, -0.6),
          ),
          Text(
            superhero.name,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
          ),
          Text(
            superhero.fullName,
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          Text(
            superhero.powerstatsResponse.speed,
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          SizedBox(
            width: double.infinity,
            height: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (superhero.powerstatsResponse.power != null)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Container(
                        height: double.parse(
                          superhero.powerstatsResponse.power,
                        ),
                        width: 20,
                        color: Colors.red,
                      ),
                      Text("power"),
                    ],
                  ),
                if (superhero.powerstatsResponse.intelligence != null)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Container(
                        height: double.parse(
                          superhero.powerstatsResponse.intelligence,
                        ),
                        width: 20,
                        color: Colors.blue,
                      ),
                      Text("intelligence"),
                    ],
                  ),
                if (superhero.powerstatsResponse.strength != null)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: double.parse(
                          superhero.powerstatsResponse.strength,
                        ),
                        width: 20,
                        color: Colors.grey,
                      ),
                      Text("strength"),
                    ],
                  ),
                if (superhero.powerstatsResponse.speed != null)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Container(
                        height: double.parse(
                          superhero.powerstatsResponse.speed,
                        ),
                        width: 20,
                        color: Colors.green,
                      ),
                      Text("speed"),
                    ],
                  ),
                if (superhero.powerstatsResponse.durability != null)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Container(
                        height: double.parse(
                          superhero.powerstatsResponse.durability,
                        ),
                        width: 20,
                        color: Colors.deepOrange,
                      ),
                      Text("durability"),
                    ],
                  ),
                if (superhero.powerstatsResponse.combat != null)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Container(
                        height: double.parse(
                          superhero.powerstatsResponse.combat,
                        ),
                        width: 20,
                        color: Colors.black,
                      ),
                      Text("combat"),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
