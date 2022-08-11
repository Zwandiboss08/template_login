import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'controller/login controller/login_contorller.dart';

void main() {
  runApp(
    MaterialApp(
      home: loginScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class loginScreen extends StatelessWidget {
  loginScreen({Key? key}) : super(key: key);
  var controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: Stack(children: [
            Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                        colors: GradientColors.confidentCloud))),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                    child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hello Again!',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text('Welcome back, you have been missed!'),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(Icons.email),
                              onPressed: () {},
                            ),
                            hintText: 'Email',
                            labelText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black))),
                        controller: controller.email_controller,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        obscureText: controller.isObscure.value,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                (controller.isObscure.value)
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                (controller.isObscure.value)
                                    ? controller.isObscure.value = false
                                    : controller.isObscure.value = true;
                              },
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black))),
                        controller: controller.password_controller,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Forgot Password?',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                              value: controller.isChecked.value,
                              onChanged: (context) {
                                controller.handleRemeberme(
                                    controller.isChecked.value);
                              }),
                          Text(
                            'Remember Me',
                            style: TextStyle(fontSize: 11),
                          )
                        ],
                      ),
                    ],
                  ),
                )),
              ),
            ),
          ]),
        ));
  }
}
