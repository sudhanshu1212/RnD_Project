import 'package:final_project/screens/auth_screen2.dart';
import 'package:final_project/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final auth = FirebaseAuth.instance;
  String Email = "";
  String Password = "";
  bool isVisible = false;
  final formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void trySubmit(context) async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    var authResult;
    try {
      if (isValid) {
        formKey.currentState!.save();
        print(Email);
        print(Password);
        //print(Username);
        authResult = await auth
            .signInWithEmailAndPassword(email: Email, password: Password)
            .then((value) => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: ((context) => Main_screen()))));
      }
    } catch (err) {
      // print("jijiji");
      // print(err);
      var error = "an error occured please check your credintials";
      var snackbar = SnackBar(
        content: Text(error),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      //print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.deepPurple[50],
      body: Container(
        padding: EdgeInsets.all(25),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Image.asset(
                'assets/image5.png',
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.deepPurple[100],
                  hintStyle: TextStyle(color: Colors.black),
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: "Email",
                  hintText: "abc@gmail.com",
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.indigo[800],
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo, width: 0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo, width: 0)),
                ),
                validator: (val) {
                  if (!val!.contains('a') || val.isEmpty) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                onSaved: (String? val) {
                  Email = val!;
                },
                textInputAction: TextInputAction.done,
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                style: TextStyle(color: Colors.black),
                obscureText: isVisible,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.deepPurple[100],
                  hintStyle: TextStyle(color: Colors.black),
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: "Password",
                  hintText: "!@34567!",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo, width: 0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo, width: 0)),
                  suffixIcon: IconButton(
                    color: Colors.indigo[800],
                    icon: isVisible
                        ? Icon(
                            Icons.visibility,
                          )
                        : Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                  ),
                ),
                validator: (val) {
                  if (val!.length < 4 || val.isEmpty) {
                    return 'Enter a password with more then 4 characters';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                onSaved: (String? val) {
                  Password = val!;
                },
                textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50)),
                    onPressed: () {
                      trySubmit(context);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    )),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account ?",
                    style: TextStyle(fontSize: 15, color: Colors.deepPurple),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: ((context) => Auth2())));
                      },
                      child: Text("Sign up",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
