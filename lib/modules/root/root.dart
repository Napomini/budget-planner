import 'package:budgetplanner/constants/constants.dart';
import 'package:budgetplanner/constants/models/data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../add_transaction_page/add_transaction_page.dart';
import '../home_page/home_page.dart';
import '../more/more_page.dart';

class Root extends StatefulWidget {
  final Data data;
  const Root({super.key, required this.data});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _currentIndex = 0;

  Widget _buildBody(Data data) {
    if (_currentIndex == 0) {
      return HomePage(data: data);
    }
    if (_currentIndex == 2) {
      return AddTransactionPage(data: data);
    }
    if (_currentIndex == 4) {
      return MorePage(data: data);
    }
    return Center(child: Text('$_currentIndex'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(widget.data),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Wallet',
          ),
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
  }
}
