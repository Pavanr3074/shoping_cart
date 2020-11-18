

import 'package:flutter/material.dart';
import 'package:shop/pages/home.dart';
import 'package:firebase_auth_ui/firebase_auth_ui.dart';
import 'package:firebase_auth_ui/providers.dart';

class loginpage extends StatefulWidget {
  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Log in'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 200,
            child: RaisedButton(
                child: Text('Login'),
                onPressed: () {
                  FirebaseAuthUi.instance()
                      .launchAuth(
                    [
                      AuthProvider.email(), // Login/Sign up with Email and password
                      AuthProvider.google(), // Login with Twitter
                      AuthProvider.phone(), // Login with Phone number
                    ],
                    tosUrl: "https://my-terms-url", // Optional
                    privacyPolicyUrl: "https://my-privacy-policy", // Optional,
                  )
                      .then((firebaseUser) {
                    Navigator.push(context, MaterialPageRoute(builder:
                        (context) => home()));
                  }
                  );
                }
            ),
          ),
        ));
  }
}











