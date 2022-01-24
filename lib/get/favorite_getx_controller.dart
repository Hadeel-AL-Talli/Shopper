import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopper_project2/api/controller/favorite_api_controller.dart';
import 'package:shopper_project2/models/product.dart';

class FavoriteGetXController extends GetxController{
  RxList<Product> favoriteProducts =<Product>[].obs;
  bool loading = false ;
  final FavoriteProductApiController _favoriteproductApiController = FavoriteProductApiController();
  static FavoriteGetXController get to =>Get.find();
  @override
  void onInit() {
    //
    // TODO: implement onInit
    super.onInit();
  }
  Future<void> getFavorite()async{
    loading = true;
    favoriteProducts.value = await _favoriteproductApiController.showFavorite();
    loading= false;
    update();
  }

Future<bool> updateFavorite ({required BuildContext context , required Product product }) async {
  bool status = await _favoriteproductApiController.changeFavorite(
      context, id: product.id);
  if (status) {
    if (!product.isFavorite) {
      print('Add');
      product.isFavorite = true;
      favoriteProducts.add(product);
    }

    else {
      print('Removed');
      favoriteProducts.removeWhere((element) => element.id == product.id);
    }
  }
  return status;
}


  bool isFavorite(int productId) {
    int index = favoriteProducts.indexWhere((element) => element.id == productId);
    return index != -1;
  }


  Future<bool> addToFavorite (BuildContext context , {required int id , required Product product })async {
    bool deleted = await FavoriteProductApiController().changeFavorite(context, id: id);
    if(deleted){
      int index = favoriteProducts.indexWhere((element) => element.id == id);

      if(index == -1){
        favoriteProducts.add(product);
        product.isFavorite = true;
      }

      if(index != -1){
        favoriteProducts!.removeAt(index);
        product.isFavorite = false;

      }

    }
    return deleted;
  }

  Color changeFavoriteColor({required bool isFavorite}){
    Color color = isFavorite? Colors.red : Colors.grey.shade200;
    return color;
  }
}