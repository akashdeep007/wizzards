import 'package:flutter/material.dart';
import 'package:wizzards/Services/auth.dart';
import 'package:wizzards/Shared/Loading.dart';
class Register extends StatefulWidget {
  final Function toggleView;
Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    String name = '';
    String email = '';
    String password = '';
    String food = '';
    String error = '';
    final AuthService _auth = AuthService();
    final _formKey = GlobalKey<FormState>();
    return loading? Loading() :
    Scaffold(
        body : Form(
          key: _formKey,
          child: Container (
            padding: EdgeInsets.only(left: 20, right: 20, top: 60),
            child : Column(
              children: <Widget>[

                Row ( mainAxisAlignment : MainAxisAlignment.spaceBetween, children: <Widget>[
                  RaisedButton(
                    child: Text("SignIn"),
                    onPressed: (){
                      widget.toggleView();
                    },
                  ),
                  Container (padding: EdgeInsets.only(left: 30, right: 30), child : Text("SignUp", style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),)),
                  RaisedButton(
                    child: Text("SignUp"),
                    onPressed: () async {
                      if (_formKey.currentState.validate()){
                        setState(() =>  loading = true);
                          dynamic result = await _auth.registerWithEmailAndPassword(
                              name, email, password, food);
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
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(labelText: "Enter your Name"),
                  onChanged: (txt) {
                    name = txt;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                  decoration: InputDecoration(labelText: "Enter your Email"),
                  onChanged: (txt) {
                    email = txt;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  validator: (val) => val.length < 6 ? 'Password should be 6+ characters' : null,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Enter your Password"),
                  onChanged: (txt) {
                    password = txt;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                  decoration: InputDecoration(labelText: "Veg/NonVeg"),
                  onChanged: (txt) {
                    food = txt;
                  },
                ),
                Text(error , style: TextStyle(color: Colors.red),),

              ],
            ),),
        ));
  }
}

