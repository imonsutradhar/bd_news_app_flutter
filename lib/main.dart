import 'package:flutter/material.dart';
import 'home_page.dart'; // আমরা HomePage-কে আলাদা ফাইল থেকে ডাকব

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(), // অ্যাপ চালু হলে HomePage লোড হবে
  ));
}