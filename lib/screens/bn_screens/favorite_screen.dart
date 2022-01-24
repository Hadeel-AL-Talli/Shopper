import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopper_project2/api/controller/favorite_api_controller.dart';
import 'package:shopper_project2/models/product.dart';
import 'package:shopper_project2/widget/custom_button.dart';

import '../product_details_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  late Future<List<Product>> _future;
  List<Product> favorites = <Product>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = FavoriteProductApiController().showFavorite();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Product>>(
        future: _future,
        builder: (context , snapshot){
          if(snapshot.connectionState ==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if (snapshot.hasData && snapshot.data!.isNotEmpty){
            favorites = snapshot.data ?? [];
            
            return GridView.builder(
              itemCount: favorites.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2 , mainAxisSpacing: 10, crossAxisSpacing: 10 ), itemBuilder: (context , index){
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(
                              product: favorites[index],)));
                },

                child: SizedBox(
                  height: 350,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Image.network(
                      favorites[index].imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      height: 150,
                    ),

                  ),
                ),
              );
            });
          }else{
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Center(child: Text('Your Favorite is Empty ', style: TextStyle(fontFamily: 'Poppins' , fontSize: 22, fontWeight: FontWeight.bold),)),
            SizedBox(height: 10,),
          Center(child: CustomButton(onPress: (){
            Navigator.pushNamed(context, '/home_screen');
          }, text: 'Start Shopping', color: Colors.black))
            ],
          );
          }
        },
      )
    );
  }
}
