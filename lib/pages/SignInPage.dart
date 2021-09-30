import 'package:firebase_app_web/Service/Auth_Service.dart';
import 'package:firebase_app_web/pages/SignUpPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/gestures.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:firebase_app_web/pages/SignUpPage.dart';

import 'HomePage.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  bool circular = false;
  AuthClass authClass = AuthClass();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isHidden = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          color: Colors.blue,
          height: 700,
          width: 1000,
          child: Form(
            key: _formKey,
            child: Stack(children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                height: 700.0,
                width: 600.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.white,
                      Colors.white,
                    ],
                  ),
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: Form(
                  child: Container(
                    padding: EdgeInsets.all(100),
                    child: Column(children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: Text(
                            'LOGIN',
                            style: TextStyle(fontWeight: FontWeight.bold,),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            contentPadding:
                            const EdgeInsets.symmetric(horizontal: 40.0),
                            labelText: "Email",
                            border: OutlineInputBorder(),
                          ),
                          validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Enter a valid email'
                              : null,
                          ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _pwdController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 40.0),
                          labelText: "Password",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value.length < 8) {
                            return 'Enter atleast 8 characters';
                          }
                          return null;
                        },

                      ),
                      SizedBox(
                        height: 40,
                      ),
                      RaisedButton.icon(
                        onPressed: () async{

                            try {
                              firebase_auth.UserCredential userCredential =
                                  await firebaseAuth.signInWithEmailAndPassword(
                                  email: _emailController.text, password: _pwdController.text);
                              print(userCredential.user.email);
                              setState(() {
                                circular = false;
                              });
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (builder) => HomePage()),
                                      (route) => false);
                            } catch (e) {
                              final snackbar = SnackBar(content: Text(e.toString()));
                              ScaffoldMessenger.of(context).showSnackBar(snackbar);
                              setState(() {
                                circular = false;
                              });
                            }

                        },
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(30.0))),
                        label: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        textColor: Colors.white,
                        splashColor: Colors.red,
                        color: Colors.lightBlue,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          height: 1.0,
                          width: 130.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      ButtonBar(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SignInButton(
                            Buttons.Google,
                            text: "Sign up with Google",
                            onPressed: () {
                              authClass.googleSignIn(context);
                            },
                          ),
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Not yet registered?? ',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Register!! ',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpPage()));
                                  },
                                style: TextStyle(
                                  color: Colors.blue,
                                )),
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
  }