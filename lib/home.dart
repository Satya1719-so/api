import 'package:endpoint/get.dart';
import 'package:endpoint/model.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
   List<Welcome>? posts;
  var isLoaded=false;
  @override
  void initState(){
    super.initState();
    getData();
  }
  getData()async{
  posts=(await Remote().getPosts())!;
  if(posts !=null){
    setState(() {
     isLoaded=true;
    });
  }


  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Visibility(
        child: ListView.builder(
          itemCount: posts!.length,
          itemBuilder: (context,index){
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                
              children: 
                [Container(
                  height: 50,
                  width: 50,
                  child: Center(child: Text(posts![index].id.toString())),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[300],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[ 
                   Text(posts![index].userId.toString()),

                      Text(posts![index].title,maxLines: 2,overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,),
                    ),
                    Text(posts![index].completed.toString()),
                    ]),
                ),
              ],
                      ),
            ));
        }
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ), 
    );
  }
}