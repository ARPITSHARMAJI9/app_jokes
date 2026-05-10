import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ViewGetDataApi extends StatefulWidget {
  const ViewGetDataApi({super.key});

  @override
  State<ViewGetDataApi> createState() => _ViewGetDataApiState();
}

class _ViewGetDataApiState extends State<ViewGetDataApi> {


  Future<dynamic> fetchjokes()async{
    final response =
    await Dio().get(

      'https://official-joke-api.appspot.com/random_joke'
    );
    return response.data;
  }




  @override
  Widget build(BuildContext context) {
    var futurejokes= fetchjokes();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          setState(() {
              futurejokes=fetchjokes();
          });
        }, icon: Icon(Icons.more)),
        centerTitle: true,
        title: const Text('Get Data API'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(padding: const EdgeInsets.all(20),
       
       child: FutureBuilder<dynamic>(
  future: fetchjokes(),

  builder: (context, snapshot) {

    if(snapshot.hasData){
      final joke = snapshot.data;
      final String setup = joke['setup'];
      final String punchline = joke['punchline'];


  return 
      Column(
      
        children: [
      
          Text(setup, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Text(punchline, style: TextStyle(fontSize: 18),), 
        ],);
    
 

    }

    return Center(
      child: CircularProgressIndicator(),
    );
  },
),

      ),
      
    );
  }
}