import 'package:flutter/material.dart';

void main(){
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
       appBar: AppBar(
        title: const Text('Ummh Development Lab'),
        backgroundColor:Colors.blueGrey ,
       ), 
       body: const Center(
        child: Text(
          'Hello , Flutter!!',
          style: TextStyle(fontSize: 24),
        ),
       ),
      ),
    );
  }
}