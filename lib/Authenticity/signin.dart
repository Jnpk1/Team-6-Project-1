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
  //To hold the email and passwaord inputs
  String email = "";
  String password = "";
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
            child: Column(
              children: <Widget>[
                //Form Field for Email
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Enter your email'),
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                //Form Field for Password
                SizedBox(height: 20.0),
                TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Enter your password'),
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
                      print(email);
                      print(password);
                    }),
                ElevatedButton(
                    child: Text('Sign in Anon'),
                    style: TextButton.styleFrom(primary: Colors.green[100]),
                    onPressed: () async {
                      dynamic result = await _auth.anonSign();
                      if (result == null) {
                        print("error signing in");
                      } else {
                        print("signed in");
                        print(result);
                      }
                    })
              ],
            ),
          ),
        ));
  }
}
