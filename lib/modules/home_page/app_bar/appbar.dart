import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String userName;
  final int totalAmount;
  const CustomAppBar({
    super.key,
    required this.userName,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 0, 123, 255),
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // SizedBox(width: 10),
                        const CircleAvatar(
                          radius: 10,
                          child: Icon(Icons.person, size: 15),
                        ),
                        const SizedBox(width: 5),
                        Text(userName),
                        const Spacer(),
                        const Icon(Icons.remove_red_eye),
                        const SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Tk $totalAmount',
                      style: const TextStyle(
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
