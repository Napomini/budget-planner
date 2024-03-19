import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants/models/data.dart';

class MorePage extends StatelessWidget {
  final Data data;
  const MorePage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text('More Options'),
            const SizedBox(height: 100),
            const Divider(),
            ListTile(
              title: const Text('Clear Wallet'),
              onTap: () async {
                final newD = Data(
                  userName: data.userName,
                  userEmail: data.userEmail,
                  userPhone: data.userPhone,
                );
                final newDataJson = newD.toJson();

                final db = FirebaseFirestore.instance
                    .collection('test')
                    .doc(data.userEmail)
                    .set(newDataJson);
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Log out'),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
