// create a stateful widget ForgetPassword with these attributes :

// _emailController: TextEditingController

// Requirements :

// Initiate _emailController inside the initState() method
// Dispose of _emailController inside the dispose() method
// Make sure to use the already created custom widgets while passing the right params
// The screen should be scrollable if needed
// Leave the onPressed functions empty for now

import 'package:flutter/material.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => ForgetPasswordState();
}
class ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            const SizedBox(height: 50),
            const Text(
              'Forget Password',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 20),
                const Text(
                  'Enter your email address below to receive password reset instructions',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
            const SizedBox(height: 20),
            CustomEntryField(
              hint: 'Enter your email',
              controller: _emailController,
            ),
            const SizedBox(height: 20),
            CustomFlatButton(
              label: 'Send',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: ForgetPassword(),
    ),
  );
}