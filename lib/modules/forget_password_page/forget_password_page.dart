import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  late TextEditingController emailController;

  bool emailSent = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (emailSent == false) {
      Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              const Center(
                child: Text('A email with further instraction have been send.'),
              ),
              const SizedBox(height: 50),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go back'),
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: 'Email',
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(
                  20.0,
                  10.0,
                  20.0,
                  10.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            OutlinedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.sendPasswordResetEmail(
                    email: emailController.text,
                  );
                } on FirebaseException catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(e.code),
                    ));
                  }
                } catch (e) {
                  print(e);
                }
                setState(() {
                  emailSent = true;
                });
              },
              child: const Text('Send recovery email'),
            ),
          ],
        ),
      ),
    );
  }
}
