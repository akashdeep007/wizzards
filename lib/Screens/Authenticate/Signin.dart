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
    return loading ? Loading() : Scaffold(
        body : Form(
          key: _formKey,
      child: Container (
        padding: EdgeInsets.only(left: 20, right: 20, top: 60),
        child : Column(
        children: <Widget>[
          Row ( mainAxisAlignment : MainAxisAlignment.spaceBetween, children: <Widget>[
            RaisedButton(
              child: Text("SignUp"),
              onPressed: (){
                  widget.toggleView();
              },
            ),
            Container (padding: EdgeInsets.only(left: 30, right: 30), child : Text("SignIn", style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),)),
            RaisedButton(
              child: Text("SignIn"),
              onPressed: () async {
                if (_formKey.currentState.validate()){
                  setState(() =>  loading = true);
                  dynamic result = _auth.signInWithEmailAndPassword(email, password);
                  if (result == null) {
                    setState(() {
                      loading = false;
                      error = "Enter Valid Email";
                    });
                  }
                }

              },
            ),
          ],),
          SizedBox(height: 60,),
          TextFormField(
            validator: (val) => val.isEmpty ? 'Enter an Email' : null,
            decoration: InputDecoration(labelText: "Enter your Email"),
            onChanged: (txt) {
              email = txt;
            },
          ),
          SizedBox(height: 40,),
          TextFormField(
            validator: (val) => val.isEmpty ? 'Enter an Email' : null,
            obscureText: true,
            decoration: InputDecoration(labelText: "Enter your Password"),
            onChanged: (txt) {
              password = txt;
            },
          ),
          SizedBox(height: 40,),
          Text(error , style: TextStyle(color: Colors.red),),
        ],
      ),),
    ));
  }
}
