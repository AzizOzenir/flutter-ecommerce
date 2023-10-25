import 'package:commerce/Controllers/Controllers.dart';
import 'package:commerce/Pages/Home/HomePage.dart';
import 'package:commerce/Pages/Login/LoginPage.dart';
import 'package:commerce/Services/AuthServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../../exports.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("auth rendered");

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.grey.shade200,
       
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // user logged in
            if (snapshot.hasData) {
              print("auth function works home page");
              return HomePage();
            }
            //user not logged in
            else {
              print("auth function works login page");
              return LoginPage();
            }
          },
        ),
      ),
    );
  }
}
