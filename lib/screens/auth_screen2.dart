import 'package:final_project/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth2 extends StatefulWidget {
  const Auth2({Key? key}) : super(key: key);

  @override
  State<Auth2> createState() => _Auth2State();
}

class _Auth2State extends State<Auth2> {
  final auth = FirebaseAuth.instance;
  String Email = "";
  String Password = "";
  String? Username = "";
  bool isVisible = false;
  final formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void trySubmit() async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    var authResult;

    try {
      if (isValid) {
        formKey.currentState!.save();
        print(Email);
        print(Password);
        print(Username);
        authResult = await auth.createUserWithEmailAndPassword(
            email: Email, password: Password);
        // .then((value) => Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: ((context) => Main_screen()))));
        await FirebaseFirestore.instance
            .collection('users')
            .doc(authResult.user.uid)
            .set({'username': Username, 'email': Email});
        print("hi  ${authResult.user.uid}");
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: ((context) => Main_screen())));
      }
    } catch (err) {
      // print("jijiji");
      print(err);
      var error = err;
      var snackbar = SnackBar(
        content: Text(error.toString()),
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
                'assets/image6.png',
                height: 350,
              ),
              SizedBox(
                height: 5,
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
                height: 20,
              ),
              TextFormField(
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.deepPurple[100],
                  hintStyle: TextStyle(color: Colors.black),
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: "Username",
                  hintText: "xyzabc",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo, width: 0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo, width: 0)),
                ),
                validator: (val) {
                  if (val!.length < 4 || val.isEmpty) {
                    return 'Enter a username with more then 4 characters';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                onSaved: (String? val) {
                  Username = val;
                },
                textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: 20,
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
                      //Main_screen();
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //     builder: ((context) => Main_screen())));
                      trySubmit();
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
