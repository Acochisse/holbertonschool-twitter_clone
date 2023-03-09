//  create a stateful widget SignUp with these attributes :

// _nameController : TextEditingController
// _emailController : TextEditingController
// _passwordController : TextEditingController
// _confirmController : TextEditingController
// _formKey : GlobalKey()
import 'package:flutter/material.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
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
              'Sign Up',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 20),
            CustomEntryField(
              hint: 'Enter your name',
              controller: _nameController,
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
            CustomEntryField(
              hint: 'Confirm your password',
              controller: _confirmController,
              isPassword: true,
            ),
            const SizedBox(height: 20),
            CustomFlatButton(
              label: 'Sign Up',
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            CustomFlatButton(
              label: 'Sign In',
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
      home: SignUp(),
    ),
  );
}