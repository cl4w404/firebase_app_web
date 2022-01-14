import 'package:email_validator/email_validator.dart';
import 'package:firebase_app_web/Service/Auth_Service.dart';
import 'package:firebase_app_web/pages/HomePage.dart';
import 'package:firebase_app_web/pages/PhoneAuth.dart';
import 'package:firebase_app_web/pages/SignInPage.dart';
import 'package:firebase_app_web/pages/wave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/gestures.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Stack(children: <Widget>[
          Center(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(0),
              child: Column(
                children: <Widget>[
                  ClipPath(
                    clipper: WaveShape(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 160,
                      color: Colors.amber,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    'REGISTER',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  Container(
                    padding: EdgeInsets.all(80),
                    child: Column(children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        autofillHints: [AutofillHints.email],
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
                        obscureText: _isHidden,
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
                      const SizedBox(
                        height: 20,
                      ),
                      RaisedButton.icon(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        label: Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: Icon(
                          Icons.person_add,
                          color: Colors.white,
                        ),
                        textColor: Colors.white,
                        splashColor: Colors.red,
                        color: Colors.amber,
                        onPressed: () async {
                          final isValid = _formKey.currentState.validate();
                          setState(() {
                            circular = true;
                          });
                          try {
                            firebase_auth.UserCredential userCredential =
                                await firebaseAuth
                                    .createUserWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _pwdController.text);
                            print(userCredential.user.email);
                            setState(() {
                              circular = false;
                            });
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => HomePage()),
                                (route) => false);
                          } catch (e) {
                            final snackbar =
                                SnackBar(content: Text(e.toString()));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                            setState(() {
                              circular = false;
                            });
                          }
                        },
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
                        height: 20,
                      ),
                      ButtonBar(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SignInButton(
                            Buttons.Google,
                            text: "Sign up with Google",
                            onPressed: () {
                              authClass.googleSignIn(context);
                              print('googled');
                            },
                          ),
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'already a member??',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Login!! ',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignInPage()));
                                  },
                                style: TextStyle(
                                  color: Colors.amber,
                                )),
                          ],
                        ),
                      )
                    ]),
                  ),
                  ClipPath(
                    clipper: WaveShape1(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
