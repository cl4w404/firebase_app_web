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
import 'package:firebase_app_web/pages/wave.dart';
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
      resizeToAvoidBottomInset: false,
      body:  Form(
          key: _formKey,
          child: Stack(children: <Widget>[

            Center(
              child: Container(
               color: Colors.white,
                padding: EdgeInsets.all(0),
                child: Column(children: <Widget>[
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
                    'LOGIN',
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
                          const EdgeInsets.symmetric(horizontal: 50.0),
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
                    obscureText: _isHidden,
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
                    height: 20,
                  ),
                  RaisedButton.icon(
                    onPressed: () async {
                      try {
                        firebase_auth.UserCredential userCredential =
                            await firebaseAuth.signInWithEmailAndPassword(
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
                    color: Colors.amber,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 1.0,
                      width: 200.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                                        builder: (context) => SignUpPage()));
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
                      height: 160,
                      color: Colors.amber,
                    ),
                  ),
            ],),

          ),),
          ],),
        ),

    );
  }
}
