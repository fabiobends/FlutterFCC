import 'package:flutter/material.dart';
// import 'package:hello_world/drawer.dart';
import 'package:hello_world/pages/login_page.dart';
// import 'package:hello_world/widgets/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hello_world/utils/constants.dart';
// import 'package:hello_world/card.dart';

class HomePageFB extends StatelessWidget {

  Future fetchData() async {
    var url = "https://jsonplaceholder.typicode.com/photos";
    var res = await http.get(url);
    var data = jsonDecode(res.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('My Awesome App'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Constants.prefs.setBool("loggedIn", false);
                Navigator.pushReplacementNamed(context, LoginPage.route_name);
              },
            ),
          ],
        ),
        body: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: Text("Fetch something"),
                  );
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error"),
                    );
                  }
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(snapshot.data[index]["title"]),
                      subtitle: Text("ID: ${snapshot.data[index]["id"]}"),
                      leading: Image.network(snapshot.data[index]["url"]));
                },
                itemCount: snapshot.data.length,
              );
            }));
  }
}
