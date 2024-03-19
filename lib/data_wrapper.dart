import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'constants/constants.dart';
import 'constants/models/data.dart';
import 'modules/root/root.dart';

class DataWrapper extends StatelessWidget {
  final User user;
  const DataWrapper({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection(collectionName)
          .doc(user.email)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }

        final Data data = Data.fromJson(snapshot.data!.data()!);
        debugPrint('## data ${data.toJson().toString()}');
        return Root(data: data);
      },
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
