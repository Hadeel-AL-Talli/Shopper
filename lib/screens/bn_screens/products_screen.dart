import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopper_project2/api/controller/home_api_controller.dart';
import 'package:shopper_project2/models/category.dart';
import 'package:shopper_project2/models/product.dart';
import 'package:shopper_project2/models/sub_category.dart';
import 'package:shopper_project2/screens/product_details_screen.dart';
import 'package:shopper_project2/widget/category_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late Future<List<Product>> _future;

  List<Product> _products = <Product>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = HomeApiController().getProducts(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products' , style: TextStyle(color: Colors.black , fontFamily: 'Poppins'),),
          elevation: 0,
          backgroundColor: Colors.white,
          leading:IconButton(icon: Icon(Icons.arrow_back_ios ,color: Colors.black,), onPressed: (){
            Navigator.pop(context);
          },)

      ),
      body: FutureBuilder<List<Product>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            _products = snapshot.data ?? [];
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              itemCount: _products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    //navigate to sub category
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(product: _products[index])));
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundImage:
                              NetworkImage(_products[index].imageUrl),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          _products[index].nameEn,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.warning, size: 80),
                Center(
                  child: Text(
                    'No Data !',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
