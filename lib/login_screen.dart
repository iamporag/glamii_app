import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                customTextField(),
                SizedBox(
                  height: 20,
                ),
                customTextField(),
                const Text('Login'),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class customTextField extends StatelessWidget {
  const customTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Email',
        border: OutlineInputBorder(),
      ),
    );
  }
}
