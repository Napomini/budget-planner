import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(76, 176, 80, 1.0),
      child: Column(
        children: [
          SafeArea(child: Container()),
          const SizedBox(height: 5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.search),
              SizedBox(width: 15),
              Icon(Icons.notifications),
              SizedBox(width: 15),
            ],
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // SizedBox(width: 10),
                        CircleAvatar(
                          radius: 10,
                          child: Icon(Icons.person, size: 15),
                        ),
                        SizedBox(width: 5),
                        Text('user name'),
                        Spacer(),
                        Icon(Icons.remove_red_eye),
                        SizedBox(width: 10),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Tk 56, 000.00',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
