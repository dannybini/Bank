import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/pages/account_page.dart';
import 'package:untitled/pages/password/forget_password_page.dart';
import 'package:untitled/widgets/cliper_widget.dart';
import 'package:untitled/widgets/gradient_button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Account',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                      enableSuggestions: false,
                      autocorrect: false,
                      obscureText: hidePassword,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword = !(hidePassword);
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye),
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Get.to(() => const ForgetPassword());
                        },
                        child: const Text(
                          'Forget',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  GradientButton(
                      fun: () {
                        Get.to(() => const AccountPage());
                      },
                      text: 'Sign in'),
                  const SizedBox(height: 40),
                  const Center(
                    child: Text(
                      'Sign in with finger print',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Center(
                      child: Icon(
                    Icons.fingerprint,
                    size: 80,
                  )),
                ],
              ),
            ),
            const CliperWidget()
          ],
        ),
      ),
    );
  }
}
