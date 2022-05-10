import 'package:flutter/material.dart';
import 'package:untitled/widgets/cliper_widget.dart';
import 'package:untitled/widgets/gradient_button.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool hideConfirmPassword = true;
  bool hidePassword = true;
  bool oldPassword = true;
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
                    'Change',
                    softWrap: true,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Password',
                    softWrap: true,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                      enableSuggestions: false,
                      autocorrect: false,
                      obscureText: hidePassword,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Old Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              oldPassword = !(oldPassword);
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye),
                        ),
                      )),
                  const SizedBox(height: 20),
                  TextField(
                      enableSuggestions: false,
                      autocorrect: false,
                      obscureText: hidePassword,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'New Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword = !(hidePassword);
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye),
                        ),
                      )),
                  const SizedBox(height: 20),
                  TextField(
                      enableSuggestions: false,
                      autocorrect: false,
                      obscureText: hideConfirmPassword,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Confirm New Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hideConfirmPassword = !(hideConfirmPassword);
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye),
                        ),
                      )),
                  const SizedBox(height: 40),
                  GradientButton(fun: () {}, text: 'Confirm'),
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
