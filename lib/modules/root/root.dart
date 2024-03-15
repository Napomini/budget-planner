import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

<<<<<<< HEAD
import '../home_page/home_page.dart';

class Root extends StatelessWidget {
=======
import '../add_transaction_page/add_transaction_page.dart';
import '../home_page/home_page.dart';

class Root extends StatefulWidget {
>>>>>>> d73e265d611e097fde1d7d630c4005eb357912c3
  final User user;
  const Root({super.key, required this.user});

  @override
<<<<<<< HEAD
  Widget build(BuildContext context) {
    return HomePage(user: user);
=======
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _currentIndex = 2;

  Widget _buildBody(User user) {
    if (_currentIndex == 0) {
      return HomePage(user: user);
    }
    if (_currentIndex == 2) {
      return const AddTransactionPage();
    }
    return Center(child: Text('$_currentIndex'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(widget.user),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet'),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Budget',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq),
            label: 'Reports',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),
        ],
      ),
    );
>>>>>>> d73e265d611e097fde1d7d630c4005eb357912c3
  }
}
