import 'dart:convert';

import 'package:get/get.dart';
import 'package:shopper_project2/api/api_setting.dart';
import 'package:shopper_project2/models/city.dart';
import 'package:http/http.dart' as http;
class DropDownController extends GetxController{

   String? selectedValue;
   @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getcities();
  }


   final selected = "".obs;
  void setSelected(String value) {
    selected.value = value;

  }

  Future<List<City>> getcities () async{
     var url = Uri.parse(ApiSetting.cities);
     var response =await  http.get(url);
     if (response.statusCode == 200) {
       print(response.statusCode.toString());
       var citiesJsonArray = jsonDecode(response.body)['list'] as List;

       return citiesJsonArray
           .map((jsonObject) => City.fromJson(jsonObject))
           .toList();



     }
     return [];
  }


}