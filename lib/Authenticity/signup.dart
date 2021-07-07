import 'package:flutter/material.dart';
import 'package:policy_voter/Authentication/auth.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  final AuthenticateService _auth = AuthenticateService();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
            backgroundColor: Colors.blue[200], title: const Text('Register')),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                //Form Field for Email
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) => val!.isEmpty ? 'Enter an Email' : null,
                  decoration: InputDecoration(labelText: 'Enter your email'),
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                //Form Field for Password
                SizedBox(height: 20.0),
                TextFormField(
                    validator: (val) => val!.length < 6
                        ? 'Password must be atleast 6 Characters long'
                        : null,
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
                      if (_formKey.currentState!.validate()) {
                        dynamic result =
                            await _auth.registerAccount(email, password);
                        if (result == null) {
                          setState(() => error = 'Invalid Account Creation');
                        }
                      }
                    }),
                SizedBox(height: 12),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 12.0),
                )
              ],
            ),
          ),
        ));
  }
}
