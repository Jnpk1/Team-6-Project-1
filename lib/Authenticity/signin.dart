import 'package:flutter/material.dart';
import 'package:policy_voter/Authentication/auth.dart';
import 'package:policy_voter/Authenticity/signup.dart';

class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  _signinState createState() => _signinState();
}

class _signinState extends State<signin> {
  final AuthenticateService _auth = AuthenticateService();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => signup()));
                },
                child: Text('Register'),
                style: TextButton.styleFrom(primary: Colors.white),
              )
            ],
            backgroundColor: Colors.blue[200],
            title: const Text('Sign-in Page')),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                //Form Field for Email
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Enter your email'),
                  validator: (val) => val!.isEmpty ? 'Enter an Email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                //Form Field for Password
                SizedBox(height: 20.0),
                TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Enter your password'),
                    validator: (val) => val!.length < 6
                        ? 'Password must be atleast 6 Characters long'
                        : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);
                    }),
                //Button for sign-in
                SizedBox(height: 20.0),
                ElevatedButton(
                    child: Text('Sign in'),
                    style: TextButton.styleFrom(primary: Colors.green[100]),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        dynamic result =
                            await _auth.signInAccount(email, password);
                        if (result == null) {
                          setState(() => error = 'Incorrect Email/Password');
                        }
                      }
                    }),
                SizedBox(height: 12),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 12.0),
                ),
              ],
            ),
          ),
        ));
  }
}
