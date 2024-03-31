
import 'dart:async';

import 'package:endpoint/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Remote{
  FutureOr<List<Welcome>?>getPosts()async
  {
var client =http.Client();
var uri =Uri.parse('https://jsonplaceholder.typicode.com/todos');
var response = await client.get(uri);
if(response.statusCode==200){
var json =response.body;
return welcomeFromJson(json);

}

  }

}