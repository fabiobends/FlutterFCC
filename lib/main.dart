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
      body: Container(
        height: 100,
        color: Colors.black87,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                // color: Colors.red,
                height: 100,
                width: 100,
                alignment: Alignment.center,
                color: Colors.green
              ),Container(
                padding: const EdgeInsets.all(10),
                // color: Colors.red,
                height: 100,
                width: 100,
                alignment: Alignment.center,
                color: Colors.white
              ),Container(
                padding: const EdgeInsets.all(10),
                // color: Colors.red,
                height: 100,
                width: 100,
                alignment: Alignment.center,
                color: Colors.red
              ),
            ],
          ),
      ),
    );
  }
}