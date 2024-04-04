// ignore_for_file: prefer_const_constructors

import 'package:bus_topology/firebase_options.dart';
import 'package:bus_topology/starting/login/sighup/flashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    title: 'JiveZen',
    home: Flashscreen(),
  ));
}
