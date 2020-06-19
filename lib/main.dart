import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    )
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Awesome App')
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          // color: Colors.red,
          height: 100,
          width: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.red
              ]
            ),
            boxShadow:[ 
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10
              )
            ]
          ),
          child: Text("Hi flutter duh",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          )
        ),
      )
    );
  }
}