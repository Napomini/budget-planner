import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                'assets/background/login_background_2.png',
                fit: BoxFit.fill,
              ),
            ),
            const Positioned(
              top: 0,
              child: CreateAccountPageContents(),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateAccountPageContents extends StatefulWidget {
  const CreateAccountPageContents({super.key});

  @override
  State<CreateAccountPageContents> createState() =>
      _CreateAccountPageContentsState();
}

class _CreateAccountPageContentsState extends State<CreateAccountPageContents> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  bool looding = false;

  void createAccount() {
    final String name = nameController.text;
    final String password = passwordController.text;
    final String email = emailController.text;
    final String phone = phoneController.text;
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please add your name'),
        ),
      );
      return;
    }
    if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please add a password'),
        ),
      );
      return;
    }
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please add your email'),
        ),
      );
      return;
    }
    if (phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please add your phone number'),
        ),
      );
      return;
    }
    // logIn logic
    signUp(email, password);
  }

  void signUp(String email, String password) async {
    setState(() {
      looding = true;
    });
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.pop(context);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('weak-password. Please add a strong password'),
          ));
        }
      } else if (e.code == 'email-already-in-use') {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('email-already-in-use. Please add a new email'),
          ));
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString()),
        ));
      }
    }
    setState(() {
      looding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (looding) {
      return const Center(child: Text('loading'));
    }
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 100),
        const Text(
          'Create account',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 26,
          ),
        ),
        const SizedBox(height: 50),
        SizedBox(
          width: 350,
          child: Material(
            elevation: 10.0,
            shadowColor: Colors.blue,
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            child: TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.account_box),
                hintText: 'name',
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
          ),
        ),
        const SizedBox(height: 35),
        SizedBox(
          width: 350,
          child: Material(
            elevation: 10.0,
            shadowColor: Colors.blue,
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            child: TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.security),
                hintText: 'Password',
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
          ),
        ),
        const SizedBox(height: 35),
        SizedBox(
          width: 350,
          child: Material(
            elevation: 10.0,
            shadowColor: Colors.blue,
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            child: TextFormField(
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
          ),
        ),
        const SizedBox(height: 35),
        SizedBox(
          width: 350,
          child: Material(
            elevation: 10.0,
            shadowColor: Colors.blue,
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            child: TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: 'Phone Number',
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
          ),
        ),
        const SizedBox(height: 35),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            // Spacer(),
            const SizedBox(width: 150),
            InkWell(
              onTap: () => createAccount(),
              child: const Text('Create', style: TextStyle(fontSize: 25)),
            ),
            InkWell(
              onTap: () => createAccount(),
              child: SizedBox(
                height: 80,
                width: 100,
                child: Image.asset(
                  'assets/components/go_forward_button.png',
                  // fit: BoxFit.fitWidth,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 200),
      ],
    );
  }
}
