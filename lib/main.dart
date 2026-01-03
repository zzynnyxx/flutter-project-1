import 'package:flutter/material.dart';

void main(){
  runApp(const MyFirstApp());
}


class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       appBar: AppBar(
        title: const Text('Ummh Development  finished Lab'),
        backgroundColor:Colors.blueGrey ,
       ), 
       body: const Center(
        child: Text(
          'Hello , Flutter  lets get  started right now . But first what is the problem!!',
          style: TextStyle(fontSize: 24),
        ),
       ),
      ),
    );
  }
}