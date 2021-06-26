import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
            backgroundColor: Colors.blue[200], title: const Text('Register')),
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
                    child: Text('Sign up'),
                    style: TextButton.styleFrom(primary: Colors.green[100]),
                    onPressed: () async {
                      print(email);
                      print(password);
                    })
              ],
            ),
          ),
        ));
  }
}
