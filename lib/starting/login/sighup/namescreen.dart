// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:bus_topology/colorpage/colorpage.dart';
import 'package:bus_topology/mainschenes/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Namescreen extends StatefulWidget {
  const Namescreen({super.key});

  @override
  State<Namescreen> createState() => _NamescreenState();
}

class _NamescreenState extends State<Namescreen> {
  final globalkey = GlobalKey<FormState>();
  TextEditingController usernamecontrollar = TextEditingController();
  TextEditingController emailcontrollar = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  String? registrationofnewuser;
  textcontrolconvertintostring() async {
    String convertusername = usernamecontrollar.text.trim();
    String convrtemail = emailcontrollar.text.trim();
    String convrtpassword = passwordcontroller.text.trim();
    User? newuser = await registarationofnewuser(
        emailregistration: convrtemail,
        passwordregistration: convrtpassword,
        usernameragistration: convertusername);
  }

  Future<User?> registarationofnewuser(
      {String? usernameragistration,
      String? emailregistration,
      String? passwordregistration}) async {
    try {
      UserCredential userCredentialdata = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailregistration!, password: passwordregistration!);
      await userCredentialdata.user!
          .updateProfile(displayName: usernameragistration);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Center(
          child: Image.asset('images/weakimage.png'),
        );

        //to check used email or not
      } else if (e.code == 'E-mail already use') {
        Center(
          child: Image.asset('images/weakimage.png'),
        );
      }
    } catch (e) {}
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (globalkey.currentState!.validate()) {
            textcontrolconvertintostring();
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return Homescreen();
              },
            ));
          }
        },
        child: Icon(
          Icons.arrow_forward,
        ),
      ),
      backgroundColor: backgroundcolorpurple,
      appBar: AppBar(
        backgroundColor: colorpurple,
        leading: Icon(
          Icons.arrow_back,
          color: colorwhite,
        ),
      ),
      body: Form(
        key: globalkey,
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                "Create Your Account",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: colorwhite),
              ),
              TextFormField(
                controller: usernamecontrollar,
                style: TextStyle(color: colorwhite),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Username';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: colorwhite,
                      size: 20,
                    ),
                    hintText: 'Username',
                    hintStyle: TextStyle(color: colorwhite)),
              ),
              TextFormField(
                controller: emailcontrollar,
                style: TextStyle(color: colorwhite),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter E-mail';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail,
                      color: colorwhite,
                      size: 20,
                    ),
                    hintText: 'E-mail',
                    hintStyle: TextStyle(color: colorwhite)),
              ),
              TextFormField(
                controller: passwordcontroller,
                style: TextStyle(color: colorwhite),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: colorwhite,
                      size: 20,
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: colorwhite)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
