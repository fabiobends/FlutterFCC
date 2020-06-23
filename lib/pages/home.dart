import 'package:flutter/material.dart';
import 'package:hello_world/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:hello_world/card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// var myText = "Change my name";
// TextEditingController _nameController = TextEditingController();

class _HomePageState extends State<HomePage> {
  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    data = jsonDecode(res.body);
    print(data);
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text('My Awesome App')),
      body: data != null
          ? ListView.builder(
            itemBuilder: (context, index){
              return ListTile(
                title: Text(data[index]["title"]),
                subtitle: Text("ID: ${data[index]["id"]}"),
                leading: Image.network(data[index]["url"])
              );
            },
            itemCount: data.length,)
          : Center(child: CircularProgressIndicator()),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchData();
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
