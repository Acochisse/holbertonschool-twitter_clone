// 
// Requirements for the signin screen:
// Initiate _emailController inside the initState() method
// Initiate _passwordController inside the initState() method
// Dispose of _emailController inside the dispose() method
// Dispose of _passwordController inside the dispose() method
// The screen should be scrollable if needed
// Make sure to use the already created custom widgets while passing the right params
// Leave the onPressed functions empty for now
import 'package:flutter/material.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  State<SignIn> createState() => SignInState();
}

class SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _emailController;
    _passwordController;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
              'Sign In',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
            CustomFlatButton(
              label: 'Sign In',
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            CustomFlatButton(
              label: 'Sign Up',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: SignIn(),
    ),
  );
}