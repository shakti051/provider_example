import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_apitesting/model/all_specialisatio.dart';
import 'package:http/http.dart' as http;

class SpecialisationProvider extends ChangeNotifier{
  bool apiHit = false;
  bool get getAPiHit => apiHit;
  AllSpecialisation allSpecialisation;
  AllSpecialisation get yourSkills => allSpecialisation;
  
   toggleDone() {
    apiHit = true;
    notifyListeners();
  }

  Future<AllSpecialisation> getAllSpecilasation() async {
    final response = await http
        .get(Uri.parse("https://eduarno1.herokuapp.com/get_specialisations"));
    if (response.statusCode == 200) {
        allSpecialisation =
          AllSpecialisation.fromJson(json.decode(response.body));
          apiHit = true;
          
          for(int i=0 ; i<allSpecialisation.data.length;i++)
            print(allSpecialisation.data[i].specialisation);              
        notifyListeners();
      return allSpecialisation;
    } else {
      throw Exception('Failed to load specialisation');
    }
  } 
}