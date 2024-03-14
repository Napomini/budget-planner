import 'package:budgetplanner/modules/home_page/home_page.dart';
import 'package:budgetplanner/modules/root/root.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../log_in_page.dart';

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
    return StreamBuilder(
      // stream provides continuous update.
      stream: FirebaseAuth.instance.authStateChanges(), // <- data source
      // this stream returns a user.
      // if authentication state chages, this widget will update
      // we can check the changes.
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
