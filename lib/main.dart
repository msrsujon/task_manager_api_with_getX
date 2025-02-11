import 'package:task_manager_api/screens/onbording/emailVerificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_api/screens/onbording/pinVerificationScreen.dart';
import 'package:task_manager_api/utility/utility.dart';
import 'screens/onbording/loginScreen.dart';
import 'screens/onbording/registrationScreen.dart';
import 'screens/onbording/setPasswordScreen.dart';
import 'screens/task/homeScreen.dart';
import 'component/newTaskList.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String? token = await ReadUserData('token');
  if (token == null) {
    runApp(MyApp('/login'));
  } else {
    runApp(MyApp('/NewTaskList'));
  }
}

class MyApp extends StatelessWidget {
  final String FirstRoute;
  MyApp(this.FirstRoute);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      initialRoute: FirstRoute,
      routes: {
        '/': (context) => homeScreen(),
        '/login': (context) => LogInScreen(),
        '/registration': (context) => RegistrationScreen(),
        '/pinVerification': (context) => pinVerificationScreen(),
        '/emailVerification': (context) => emailVerificationScreen(),
        '/setPassword': (context) => setPasswordScreen(),
        '/NewTaskList': (context) => newTaskList(),
      },
    );
  }
}
