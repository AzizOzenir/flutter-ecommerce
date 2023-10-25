/* import 'package:ecommerce/pages/Login/widgets/CustomButton.dart';
import 'package:ecommerce/pages/Login/widgets/CustomTextField.dart';
import 'package:ecommerce/pages/Login/widgets/SquareTile.dart';
import 'package:ecommerce/service/auth.dart'; */
import 'package:commerce/Controllers/Controllers.dart';
import 'package:commerce/Services/AuthServices.dart';
import 'package:commerce/pages/Login/widgets/CustomButton.dart';
import 'package:commerce/pages/Login/widgets/CustomTextField.dart';
import 'package:commerce/pages/Login/widgets/SquareTile.dart';
import 'package:provider/provider.dart';

import '../../exports.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBody(),
    );
  }
}

final emailController = TextEditingController();
final passwordController = TextEditingController();
final passwordController2 = TextEditingController();

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Controllers controller = Provider.of(context);
    print("login rendered");
    return SafeArea(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                //logo
                Image.asset(
                  "assets/amazon.png",
                  width: size.width * 0.9,
                ),

                const SizedBox(height: 10),

                Text(
                  'Welcome back you\'ve been missed',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 25),

                //username
                CustomTextField(
                  controller: emailController,
                  hintText: 'Username or email',
                  obscureText: false,
                ),

                const SizedBox(height: 15),
                //password
                CustomTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 15),
                controller.isRegister
                    ? CustomTextField(
                        controller: passwordController2,
                        hintText: 'Password',
                        obscureText: true,
                      )
                    : Container(),
                controller.isRegister ? SizedBox(height: 15) : Container(),
                CustomButton(
                  onTap: () {
                    controller.isRegister
                        ? AuthServices().register(emailController.text,
                            passwordController.text, passwordController2.text)
                        : AuthServices()
                            .signin(emailController, passwordController);
                  },
                  text: 'Sign In',
                ), //forgot passowrd

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Forgot your login details? ',
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 12),
                      ),
                      Text(
                        'Get help logging in.',
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                          'OR',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                //google + apple button

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                      onTap: () {
                        AuthServices().googleSignin();
                      },
                      image: 'assets/google.png',
                      height: 70,
                    ),

                    SizedBox(width: 20),
                    // apple buttom
                    SquareTile(
                      onTap: () {
                        AuthServices().signinAnonymously();
                      },
                      image: 'assets/facebook.png',
                      height: 70,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),

                // not a memeber ? register now

                GestureDetector(
                  onTap: () {
                    controller.setRegister();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member? ',
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                      GestureDetector(
                        onTap: null,
                        child: Text(
                          'Register now',
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
