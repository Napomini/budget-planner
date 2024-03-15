import 'package:flutter/material.dart';

class AddExpenseSubtype extends StatelessWidget {
  const AddExpenseSubtype({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense type'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          children: <Widget>[
            _buildSubTypeOption(
              'Food',
              'assets/tranactions/icon_food.jpg',
            ),
            _buildSubTypeOption(
              'Apparel',
              'assets/tranactions/icon_apparel.jpg',
            ),
            _buildSubTypeOption(
              'Beauty',
              'assets/tranactions/icon_beauty.jpg',
            ),
            _buildSubTypeOption(
              'Culture',
              'assets/tranactions/icon_culture.jpg',
            ),
            _buildSubTypeOption(
              'Donation',
              'assets/tranactions/icon_donation.jpg',
            ),
            _buildSubTypeOption(
              'Education',
              'assets/tranactions/icon_education.jpg',
            ),
            _buildSubTypeOption(
              'Food',
              'assets/tranactions/icon_food.jpg',
            ),
            _buildSubTypeOption(
              'Gift',
              'assets/tranactions/icon_gift.jpg',
            ),
            _buildSubTypeOption(
              'Health',
              'assets/tranactions/icon_health.jpg',
            ),
            _buildSubTypeOption(
              'Household',
              'assets/tranactions/icon_household.jpg',
            ),
            _buildSubTypeOption(
              'Pet',
              'assets/tranactions/icon_pet.jpg',
            ),
            _buildSubTypeOption(
              'Transportation',
              'assets/tranactions/icon_transportation.jpg',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubTypeOption(String title, String photoUrl) {
    return Container(
      height: 20,
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     color: Colors.black,
      //   ),
      //   // borderRadius: BorderRadius.circular(8.0),
      // ),
      // child: Text(
      //   title,
      //   style: const TextStyle(
      //     color: Colors.white70,
      //     fontSize: 14,
      //   ),
      // ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20), // Image border
              child: SizedBox.fromSize(
                size: const Size.fromRadius(15), // Image radius
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset(
                    photoUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                // color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
