import 'package:flutter/material.dart';
import 'package:hello_world/pages/home.dart';
import 'package:hello_world/utils/constants.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static const String route_name = "/login";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final _usernamecontroller = TextEditingController();

  final _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "assets/bg.jpg",
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.7),
            colorBlendMode: BlendMode.darken,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                  child: Form(
                key: formKey,
                child: Center(
                    child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            controller: _usernamecontroller,
                            // validator: (s){},
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: "Enter email", labelText: "Username"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _passwordcontroller,
                            keyboardType: TextInputType.text,
                            // validator: (s){},
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "Enter password",
                                labelText: "Password"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RaisedButton(
                            onPressed: () {
                              Constants.prefs.setBool("loggedIn",true);
                              // formKey.currentState.validate();
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => HomePage()));
                              Navigator.pushReplacementNamed(context, HomePage.route_name);
                            },
                            child: Text("Sign in"),
                            color: Colors.orange,
                            textColor: Colors.white,
                          )
                        ]),
                  ),
                )),
              )),
            ),
          )
        ],
      ),
    );
  }
}
