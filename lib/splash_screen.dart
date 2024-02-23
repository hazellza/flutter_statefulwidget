import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_statefulwidget/tab_menu.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds:3),(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const TabMenu()));
    });
  }

  @override
    Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color.fromRGBO(230, 228, 218, 1), // เปลี่ยนสีพื้นหลังเป็นสีฟ้า
    body: Center(
      child: Image.asset('assets/image/gametopup.jpg', // หรือ Image.network() ถ้าเป็น URL
        width: 300, // ปรับขนาดของรูปภาพตามที่ต้องการ
        height: 300,
      ),
    ),
  );
 }
}