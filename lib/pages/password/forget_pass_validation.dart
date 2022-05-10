import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/widgets/cliper_widget.dart';
import 'package:untitled/widgets/gradient_button.dart';

import 'new_password_page.dart';

class ForgetPasswordValidation extends StatelessWidget {
  const ForgetPasswordValidation({Key? key}) : super(key: key);

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
                      hintText: 'Enter Validation Number',
                    ),
                  ),
                  const SizedBox(height: 40),
                  GradientButton(
                      fun: () {
                        Get.to(() => const NewPassword());
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
