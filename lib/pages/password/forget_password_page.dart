import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/pages/main_page.dart';
import 'package:untitled/pages/password/forget_pass_validation.dart';
import 'package:untitled/widgets/cliper_widget.dart';
import 'package:untitled/widgets/gradient_button.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              height: size.height * .7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  const Text(
                    'Forgot',
                    softWrap: true,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Password',
                    softWrap: true,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam in nulla at elit vestibulum euismod. Pellentesque tempor, tellus suscipit ullamcorper finibus, eros leo eleifend dolor, non placerat ',
                    style: TextStyle(fontSize: 14),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Email',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Get.to(() => const Login());
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  GradientButton(
                      fun: () {
                        Get.to(() => const ForgetPasswordValidation());
                      },
                      text: 'Next'),
                  const SizedBox(height: 40),
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
