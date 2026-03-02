import 'package:flutter/material.dart';

class CobaCoba extends StatefulWidget {
  const CobaCoba({super.key});

  @override
  State<CobaCoba> createState() => _CobaCobaState();
}

class _CobaCobaState extends State<CobaCoba> {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Column(
        children: [
          TextFormField(
            controller: emailController,
          )
        ],
      ),
    );
  }
}