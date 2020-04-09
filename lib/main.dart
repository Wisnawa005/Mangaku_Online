import 'package:flutter/material.dart';
//import home 
import 'ui/home.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //judul
      debugShowCheckedModeBanner: false,
      title: 'Tambahkan Daftar Nama',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        ),
        //memanggil class Home() sebagai home dari Main.dart
        home: Home(),
    );
  }
} 