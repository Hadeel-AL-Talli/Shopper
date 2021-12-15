import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopper_project2/api/controller/home_api_controller.dart';
import 'package:shopper_project2/models/category.dart';
import 'package:shopper_project2/models/product.dart';
import 'package:shopper_project2/models/sub_category.dart';
import 'package:shopper_project2/screens/bn_screens/products_screen.dart';
import 'package:shopper_project2/widget/category_widget.dart';

class SubCategoriesScreen extends StatefulWidget {
  const SubCategoriesScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  _SubCategoriesScreenState createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  late Future<List<SubCategory>> _future;


  List<SubCategory> _subCategories = <SubCategory>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = HomeApiController().getSubCategories(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sub Category' , style: TextStyle(color: Colors.black , fontFamily: 'Poppins'),),
        elevation: 0,
        backgroundColor: Colors.white,
        leading:IconButton(icon: Icon(Icons.arrow_back_ios ,color: Colors.black,), onPressed: (){
          Navigator.pop(context);
        },)

      ),
      body: FutureBuilder<List<SubCategory>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            _subCategories = snapshot.data ?? [];
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              itemCount: _subCategories.length,
              // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 2,
              //   mainAxisSpacing: 10,
              //   crossAxisSpacing: 10,
              // ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsScreen(id: _subCategories[index].id)));
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 100,
                          backgroundImage:
                              NetworkImage(_subCategories[index].imageUrl),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          _subCategories[index].nameEn,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
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
