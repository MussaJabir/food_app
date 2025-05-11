import 'package:flutter/material.dart';
import '../components/custom_button.dart';
import '../components/custom_textfield.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void login() {
    /*
    // Fill the authentication logic here

     */
    // Navigate to the home page
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 4),

            // Message(app slogan)
            Text(
              'Food Delivery App',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 35),

            // Email Text Field
            CustomTextfield(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),

            const SizedBox(height: 16),

            // Password Text Field
            CustomTextfield(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),

            const SizedBox(height: 16),

            // Sign in button
            CustomButton(
              onTap: login,
              text: 'Sign In',
            ),
            const SizedBox(height: 25),

            // Not a member (Register link)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not a member?',
                  style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(width: 6,),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Register Now',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
