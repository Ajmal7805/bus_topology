// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bus_topology/colorpage/colorpage.dart';
import 'package:bus_topology/starting/login/sighup/namescreen.dart';
import 'package:flutter/material.dart';

class Flashscreen extends StatelessWidget {
  const Flashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolorpurple,
      body: Container(
        margin: EdgeInsets.only(top: 50, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('images/backgroundremoved.png'),
            Container(
              margin: EdgeInsets.only(top: 20, right: 20, left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Simpliest',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'video call and',
                    style: TextStyle(
                        fontSize: 40,
                        color: colorwhite,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'messaging app',
                    style: TextStyle(
                        fontSize: 40,
                        color: colorwhite,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Namescreen();
                        },
                      ));
                    },
                    height: 45,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: colorwhite,
                    child: Text('Get Started'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a member?',
                        style: TextStyle(color: colorwhite),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Sigh in',
                            style: TextStyle(color: colorwhite),
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
