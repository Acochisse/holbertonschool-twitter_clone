import 'package:twitter/widgets/entry_field.dart';

import 'package:flutter/material.dart';

class EntryFieldTest extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  EntryFieldTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomEntryField(
                hint: 'Enter your email',
                controller: _emailController,
              ),
              const SizedBox(height: 20),
              CustomEntryField(
                hint: 'Enter your password',
                controller: _passwordController,
                isPassword: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



void main() {
  runApp(
    MaterialApp(
      home: EntryFieldTest(),
    ),
  );
}