import 'package:flutter/material.dart';
import 'package:junkie/components/textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_open_rounded,
                  size: 100,
                  color: Theme.of(context).colorScheme.inversePrimary),
              SizedBox(height: 25),
              Text('Food Delivery App',
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.inversePrimary),
                  textAlign: TextAlign.center),
              SizedBox(height: 25),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Textfield(
                      controller: _usernameController,
                      hintText: 'Username',
                      obscureText: false,
                    ),
                    SizedBox(height: 15),
                    Textfield(
                      controller: _passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                    SizedBox(height: 45),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // TODO: Implement login logic
                          Navigator.pushNamed(context, '/home');
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
