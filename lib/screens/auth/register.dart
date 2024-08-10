import 'package:flutter/material.dart';
import 'package:junkie/components/buttons.dart';
import 'package:junkie/components/textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function() onPressed;
  const RegisterPage({super.key, required this.onPressed});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_add_alt_1_rounded,
                  size: 100,
                  color: Theme.of(context).colorScheme.inversePrimary),
              const SizedBox(height: 25),
              Text('Create Your Account',
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.inversePrimary),
                  textAlign: TextAlign.center),
              const SizedBox(height: 25),
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
                    const SizedBox(height: 15),
                    Textfield(
                      controller: _passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 15),
                    Textfield(
                      controller: _confirmPasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 45),
                    Buttons(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (_passwordController.text ==
                              _confirmPasswordController.text) {
                            // TODO: Implement registration logic
                            Navigator.pushNamed(context, '/home');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Passwords do not match!'),
                              ),
                            );
                          }
                        }
                      },
                      text: 'Sign Up',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary)),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: GestureDetector(
                              onTap: widget.onPressed,
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
