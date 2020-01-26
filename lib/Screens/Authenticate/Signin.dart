import 'package:flutter/material.dart';
import 'package:wizzards/Services/auth.dart';
import 'package:wizzards/Shared/Loading.dart';

class Signin extends StatefulWidget {
  final Function toggleView;
  Signin({this.toggleView});

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool loading = false;

  @override
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    String error = '';
    final AuthService _auth = AuthService();
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(201, 145, 87, 1),
              title: Text(
                "Sign In",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        fontWeight: FontWeight.w800),
                  ),
                  onPressed: () {
                    widget.toggleView();
                  },
                ),
              ],
            ),
            backgroundColor: Colors.amber[50],
            body: Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 60),
                child: ListView(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextFormField(
                          validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                          decoration: InputDecoration(labelText: "Email : "),
                          onChanged: (txt) {
                            email = txt;
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                          obscureText: true,
                          decoration: InputDecoration(labelText: "Password : "),
                          onChanged: (txt) {
                            password = txt;
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red),
                        ),
                        RaisedButton(
                          color: Color.fromRGBO(201, 145, 87, 1),
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w800),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  loading = false;
                                  error = "Enter Valid Email";
                                });
                              }
                            }
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
