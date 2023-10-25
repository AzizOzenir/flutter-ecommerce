import 'package:commerce/Controllers/Controllers.dart';

import 'package:commerce/firebase_options.dart';
import 'package:commerce/Pages/Auth/AuthPage.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import './exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("Materil App RUNNED");
    return ChangeNotifierProvider<Controllers>(
      create: (context) => Controllers(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthPage(),
      ),
    );
  }
}
