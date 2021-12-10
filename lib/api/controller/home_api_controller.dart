import 'dart:convert';

import 'package:shopper_project2/api/api_helper.dart';
import 'package:http/http.dart' as http;
import 'package:shopper_project2/api/api_setting.dart';
import 'package:shopper_project2/models/category.dart';
import 'package:shopper_project2/models/faq.dart';
import 'package:shopper_project2/models/home_response.dart';
class HomeApiController with ApiHelper{
  Future<HomeResponse?> showHome() async {
    var url = Uri.parse(ApiSetting.home);
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      return HomeResponse.fromJson(jsonDecode(response.body)['data']);
    }
    return null;
  }
  Future<List<Category>> getCategories() async {
    var url = Uri.parse(ApiSetting.categories);
    var response = await http.get(url);
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      print(response.statusCode.toString());
      var categoriesJsonArray = jsonDecode(response.body)['list'] as List;

      return categoriesJsonArray
          .map((jsonObject) => Category.fromJson(jsonObject))
          .toList();



    }
    return [];
  }
  Future<List<FAQL>> getFaq() async {
    var url = Uri.parse(ApiSetting.faq);
    var response = await http.get(url);
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      print(response.statusCode.toString());
      var faqJsonArray = jsonDecode(response.body)['list'] as List;

      return faqJsonArray
          .map((jsonObject) => FAQL.fromJson(jsonObject))
          .toList();



    }
    return [];
  }

}