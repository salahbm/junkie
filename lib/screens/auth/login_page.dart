import 'package:flutter/material.dart';
import 'package:junkie/components/buttons.dart';
import 'package:junkie/components/textfield.dart';
import 'package:junkie/screens/home/home.dart';

class LoginPage extends StatefulWidget {
  final void Function() onPressed;
  const LoginPage({super.key, required this.onPressed});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // Login Method
  void login() {
    //  fill up the form

    // if all fields are valid and authenticated
    // navigate to home page
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Home()));
  }

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
              const SizedBox(height: 25),
              Text('Food Delivery App',
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
                    const SizedBox(height: 45),
                    Buttons(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          login();
                        }
                      },
                      text: 'Login',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account?',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary)),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: GestureDetector(
                              onTap: widget.onPressed,
                              child: Text(
                                'Sign up',
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
