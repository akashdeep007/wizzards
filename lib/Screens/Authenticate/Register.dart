import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wizzards/Services/auth.dart';
import 'package:wizzards/Shared/Loading.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
class Register extends StatefulWidget {
  final Function toggleView;
Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _picked = "NonVeg";
  bool loading = false;
  bool veg = false;
  bool nonVeg = false;

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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                              name, email, password, _picked);
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
//                TextFormField(
//                  validator: (val) => val.isEmpty ? 'Enter an Email' : null,
//                  decoration: InputDecoration(labelText: "Veg/NonVeg"),
//                  onChanged: (txt) {
//                    food = txt;
//                  },
//                ),
              RadioButtonGroup(
                orientation: GroupedButtonsOrientation.HORIZONTAL,
                margin: const EdgeInsets.only(left: 20.0,),
                onSelected: (String selected) => setState((){
                  _picked = selected;
                  print(_picked);
                }),
                labels: <String>[
                  "Veg",
                  "NonVeg",
                ],
                picked: _picked,
                itemBuilder: (Radio rb, Text txt, int i){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      rb,
                      txt,
                    ],
                  );
                },
              ),]),
        )));
  }
}

