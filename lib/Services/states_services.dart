import 'dart:convert';
import 'package:covid_19_app/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;
import '../Model/WorldStatesModel.dart';

class StatesServices {
  Future<WorldStatesModel>fetchWorldStatesRecord()async{
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    }else{
      throw Exception("Error");
    }
  }

  Future<List<dynamic>>fetchCountriesRecord() async{
    var data;
    final res = await http.get(Uri.parse(AppUrl.countriesList));
    if(res.statusCode == 200){
      data = jsonDecode(res.body);
      return data;
    }
    else{
      throw Exception("Error");
    }
  }
}