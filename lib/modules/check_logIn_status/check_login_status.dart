import 'package:budgetplanner/modules/root/root.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../log_in/log_in_page.dart';

class CheckLogInStatus extends StatefulWidget {
  const CheckLogInStatus({super.key});

  @override
  State<CheckLogInStatus> createState() => _CheckLogInStatusState();
}

class _CheckLogInStatusState extends State<CheckLogInStatus> {
  @override
  void initState() {
    super.initState();
  }

  void checkInternetAccess() async {}

  @override
  Widget build(BuildContext context) {
    // return const LogInPage();
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: Text('checking login status'),
            ),
          );
        }

        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text('encountered problem while checking log in status'),
            ),
          );
        }
        if (snapshot.data == null) {
          return const LogInPage();
        }
        // return HomePage(user: snapshot.data!);
        return Root(user: snapshot.data!);
      },
    );
  }
}
