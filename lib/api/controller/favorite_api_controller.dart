import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shopper_project2/api/api_helper.dart';
import 'package:shopper_project2/api/api_setting.dart';
import 'package:shopper_project2/models/product.dart';
import 'package:http/http.dart' as http;

class FavoriteProductApiController with ApiHelper{
  Future<List<Product>> showFavorite()async{
    var url = Uri.parse(ApiSetting.favoriteProducts);
    var response = await http.get(url , headers: headers);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body)['list'] as List;
      return jsonResponse.map((obj) => Product.fromJson(obj)).toList();
    }
    return [];
  }


        
  Future<bool> changeFavorite (BuildContext context , {required int id }) async{
    var url = Uri.parse(ApiSetting.favoriteProducts);
    var response = await http.post(url, body: {'product_id':id.toString()}, headers: headers);
    if (response.statusCode == 200) {
      var message = jsonDecode(response.body)['message'];
      showSnackBar(
        context,
        message: message,
      );
      return true;
    } else if (response.statusCode == 400) {
      var message = jsonDecode(response.body)['message'];
      showSnackBar(
        context,
        message: message,
        error: true,
      );
    } else {
      showSnackBar(
        context,
        message: 'Something went wrong, please try again!',
        error: true,
      );
    }
    return false;

  }
}