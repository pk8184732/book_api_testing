
import 'dart:async';

import 'package:flutter/material.dart';

import 'book_view_screen.dart';

class BookSplashScreen extends StatefulWidget {
  const BookSplashScreen({super.key});

  @override
  State<BookSplashScreen> createState() => _BookSplashScreenState();
}

class _BookSplashScreenState extends State<BookSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const BookViewScreen(),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.white,
      body: Center(
        child: Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdaePswW5oA9FC6lusWp16rkGolueuQ6BRNQ&s"))
      ),
    );
  }
}
