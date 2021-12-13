import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopper_project2/api/controller/home_api_controller.dart';
import 'package:shopper_project2/models/faq.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  late Future<List<FAQL>> _future ;
  List<FAQL> _faq = <FAQL>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = HomeApiController().getFaq() as Future<List<FAQL>>;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.black,)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('FAQ' , style:TextStyle(fontFamily: 'Poppins' , fontWeight: FontWeight.bold, fontSize:18 , color: Colors.black)),),

      body: FutureBuilder<List<FAQL>>(
        future: _future,
        builder: (context, snapshot){
          if(snapshot.connectionState ==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          else if(snapshot.hasData && snapshot.data!.isNotEmpty){
            _faq = snapshot.data ??[];
            return ListView.builder(
                 itemCount: _faq.length,
                itemBuilder: (context , index){
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _faq[index].questionAr,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          _faq[index].answerEn,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  );
                });
          }
          else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [

                Icon(Icons.warning, size: 80),
                Center(child: Text('No Data !', style: TextStyle(fontFamily: 'Poppins' , fontSize: 22, fontWeight: FontWeight.bold),)),
              ],
            );
          }
        },
      ),
    );
  }
}
