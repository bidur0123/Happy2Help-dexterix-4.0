import 'package:flutter/material.dart';
import 'package:happy2help/components/already_have_an_account_acheck.dart';
import 'package:happy2help/constant/constants.dart';
import 'package:happy2help/controller/auth_controller/auth_controller.dart';
import '../../Login/login_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Form(
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  cursorColor: kPrimaryColor,
                  decoration: const InputDecoration(
                    hintText: "Your Anonymous Name",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.account_circle_sharp),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: kPrimaryColor,
                  decoration: const InputDecoration(
                    hintText: "Enter email",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.account_circle_sharp),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  child: TextFormField(
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      hintText: "Enter password",
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.lock),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    // Call the signUpUser method from AuthService with input from controllers
                    AuthService().signUpUser(
                      context: context,
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                      name: nameController.text.trim(),
                    );
                  },
                  child: const Text("Sign Up"),
                ),
                const SizedBox(height: defaultPadding),
                AlreadyHaveAnAccountCheck(
                  login: false,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          );
  }
}
