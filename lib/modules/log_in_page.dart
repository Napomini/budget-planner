import 'package:budgetplanner/modules/create_account_page/create_account_page.dart';
import 'package:budgetplanner/modules/forget_password_page/forget_password_page.dart';
import 'package:flutter/material.dart';

// state access korte parbo nah
// what is state?
// statefull : state ta access korte parbo
// state -> ekta widget ki obosthay ace
//

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // SizedBox(
            //   height: height,
            //   width: width,
            //   child: Image.asset(
            //     'assets/background/login_background.jpg',
            //     fit: BoxFit.fill,
            //     // fit: BoxFit.fitWidth,
            //   ),
            // ),
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                'assets/background/login_background_2.png',
                fit: BoxFit.fill,
              ),
            ),
            // Positioned(
            //   top: 30,
            //   left: 30,
            //   child: Container(
            //     height: 41,
            //     width: 41,
            //     decoration: BoxDecoration(
            //       border: Border.all(
            //         color: Colors.blue,
            //       ),
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //     child: const Center(
            //       child: Icon(Icons.arrow_back_ios_new_sharp),
            //     ),
            //   ),
            // ),
            // const Positioned(
            //   top: 100,
            //   child: Text(
            //     'Hello',
            //     style: TextStyle(
            //       fontWeight: FontWeight.w500,
            //       fontSize: 80,
            //     ),
            //   ),
            // ),
            // const Positioned(
            //   top: 210,
            //   child: Text(
            //     'Sign in to your account',
            //     style: TextStyle(
            //       fontWeight: FontWeight.w500,
            //       fontSize: 20,
            //     ),
            //   ),
            // ),
            const Positioned(
              top: 0,
              child: LogInScreenContents(),
            ),
          ],
        ),
      ),
    );
  }
}

class LogInScreenContents extends StatefulWidget {
  const LogInScreenContents({super.key});

  @override
  State<LogInScreenContents> createState() => _LogInScreenContentsState();
}

class _LogInScreenContentsState extends State<LogInScreenContents> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void logIn() {
    final String email = emailController.text;
    final String password = passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please add email and password'),
        ),
      );
      return;
    }
    // logIn logic
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 90),
        const Text(
          'Hello',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 80,
          ),
        ),
        // // SizedBox(height: 0),
        const Text(
          'Sign in to your account',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 80),
        SizedBox(
          width: 350,
          child: Material(
            elevation: 7.0,
            shadowColor: Color.fromARGB(118, 33, 149, 243),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            child: TextFormField(
              // obscureText: true,
              // autofocus: false,
              controller: emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.account_box),
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
            elevation: 7.0,
            shadowColor: Color.fromARGB(118, 33, 149, 243),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            child: TextFormField(
              // obscureText: true,
              // autofocus: false,
              controller: passwordController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.account_box),
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
        const SizedBox(height: 20),
        SizedBox(
          height: 20,
          // width: width,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: width - width * 0.8),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ForgetPasswordPage(),
                    ),
                  );
                },
                child: const Text('Forget password'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            // Spacer(),
            const SizedBox(width: 150),
            InkWell(
              onTap: () => logIn(),
              child: const Text('Sign in', style: TextStyle(fontSize: 25)),
            ),
            InkWell(
              onTap: () => logIn(),
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
        const SizedBox(height: 70),
        Row(
          children: [
            const Text("Don't have an account?"),
            const SizedBox(width: 5),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CreateAccountPage()),
                );
              },
              child: const Text(
                "Create",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
