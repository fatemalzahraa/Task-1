

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_1/auth/auth.dart';


class LoginScreen extends StatefulWidget {
  final AuthNotifier authNotifier;
  const LoginScreen({super.key, required this.authNotifier});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Login Screen'),
          SizedBox(height: 20),
          Form(child: Column(
            children: [
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              TextFormField(
                controller: password,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if(email.text.isEmpty || password.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill in all fields')),
                    );
                    return;
                  }
                  if (email.text == 'fatema@example.com' && password.text == '12341234') {
                    widget.authNotifier.login();
                  }
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid email or password')),
                    );
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),)

        ],

      )
        
      
    );
  }
}