import 'package:shopper_project2/models/api_base_response.dart';
import 'package:shopper_project2/models/category.dart';
import 'package:shopper_project2/models/product.dart';
import 'package:shopper_project2/models/slider.dart';

class HomeResponse extends ApiBaseResponse {
 late List<Slider> slider;
late  List<Category> categories;
 late List<Product> latestProducts;
 late List<Product> famousProducts;



 HomeResponse.fromJson(Map<String, dynamic> json): super.fromJson(json) {
    if (json['slider'] != null) {
      slider =  <Slider>[];
      json['slider'].forEach((v) {
        slider.add( Slider.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories =  <Category>[];
      json['categories'].forEach((v) {
        categories.add( Category.fromJson(v));
      });
    }
    if (json['latest_products'] != null) {
      latestProducts = <Product>[];
      json['latest_products'].forEach((v) {
        latestProducts.add( Product.fromJson(v));
      });
    }
    if (json['famous_products'] != null) {
      famousProducts =  <Product>[];
      json['famous_products'].forEach((v) {
        famousProducts.add( Product.fromJson(v));
      });
    }
  }


}