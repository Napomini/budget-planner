import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home_page/home_page.dart';

class Root extends StatelessWidget {
  final User user;
  const Root({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return HomePage(user: user);
  }
}
