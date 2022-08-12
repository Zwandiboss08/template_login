import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:template_login/logout_screen.dart';
import 'controller/login controller/login_contorller.dart';

void main() {
  runApp(
    GetMaterialApp(
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
                              onChanged: (valueBaru) {
                                controller.handleRemeberme(valueBaru);
                              }),
                          Text(
                            'Remember Me',
                            style: TextStyle(fontSize: 11),
                          )
                        ],
                      ),
                      Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton(
                            child: const Text('Login'),
                            onPressed: () {
                              if (controller.isAllPass) Get.to(LogoutPage());
                            },
                          )),
                    ],
                  ),
                )),
              ),
            ),
          ]),
        ));
  }
}
