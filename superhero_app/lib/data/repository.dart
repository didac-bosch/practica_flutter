import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:superhero_app/data/model/superhero_response.dart';

class Repository {
  Future<SuperheroResponse?> fetchSuperheroInfo(String name) async {
    final response = await http.get(
      Uri.parse(
        "https://superheroapi.com/api/09d1a8b50c7526b36ea12f9c9ea39f8b/search/$name",
      ),
    );
    if (response.statusCode == 200){
      var decodeJson = jsonDecode(response.body);
      SuperheroResponse superheroResponse = SuperheroResponse.fromJson(decodeJson);
      return superheroResponse;
    }
    else{
      return null;
    }
  }
}
