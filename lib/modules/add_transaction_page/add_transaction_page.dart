import 'package:budgetplanner/widgets/triple_rail.dart';

import 'package:flutter/material.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  int _currentIndex = 0;

  void ontapTranactionType(int newVal) {
    setState(() {
      debugPrint('Ontaped at $newVal');
      _currentIndex == newVal;
    });
  }

  void activeFirst() {
    setState(() {
      _currentIndex = 0;
    });
  }

  void activeSecond() {
    setState(() {
      _currentIndex = 1;
    });
  }

  void activeThird() {
    setState(() {
      _currentIndex = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Center(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 310,
                  child: TripleRail(
                    leading: BuildTransactionTypeButton(
                      title: 'Expense',
                      activeInd: _currentIndex,
                      ownInd: 0,
                      ontap: () => activeFirst(),
                    ),
                    middle: BuildTransactionTypeButton(
                      title: 'Income',
                      activeInd: _currentIndex,
                      ownInd: 1,
                      ontap: () => activeSecond(),
                    ),
                    trailing: BuildTransactionTypeButton(
                      title: 'Debt',
                      activeInd: _currentIndex,
                      ownInd: 2,
                      ontap: () => activeThird(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          if (_currentIndex == 0) const BuildExpenseEditor(),
        ],
      ),
    );
  }
}

class BuildTransactionTypeButton extends StatelessWidget {
  final String title;
  final int activeInd;
  final int ownInd;
  final Function() ontap;
  const BuildTransactionTypeButton({
    super.key,
    required this.title,
    required this.activeInd,
    required this.ownInd,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    bool isActive = ownInd == activeInd;
    return InkWell(
      onTap: () => ontap(),
      child: Container(
        decoration: BoxDecoration(
          color: isActive
              ? const Color.fromARGB(255, 47, 47, 49)
              : const Color.fromARGB(255, 71, 71, 73),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        height: 35,
        width: 100,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

class BuildExpenseEditor extends StatefulWidget {
  const BuildExpenseEditor({super.key});

  @override
  State<BuildExpenseEditor> createState() => _BuildExpenseEditorState();
}

class _BuildExpenseEditorState extends State<BuildExpenseEditor> {
  late TextEditingController amountController;
  String subTypeImgUrl = 'assets/tranactions/icon_food.jpg';
  String subTypeTitle = 'Food';
  DateTime date = DateTime.now();
  late TextEditingController noteConroller;

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController(text: '0');
    noteConroller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    amountController.dispose();
    noteConroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black45,
              // border: Border.all(
              //   color: Colors.blue,
              // ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 15, 8, 15),
              child: Column(
                children: [
                  /// amount
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Container()),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                            child: Text(
                              'BDT',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      SizedBox(
                        width: width * 0.78,
                        child: Column(
                          children: [
                            TextField(
                              controller: amountController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'Amount',
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                            const Divider(color: Colors.black26),
                          ],
                        ),
                      ),
                    ],
                  ),

                  /// sub type
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(child: Container()),
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(20), // Image border
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(25), // Image radius
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Image.asset(
                                  subTypeImgUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                          GestureDetector(
                            onTap: () => showMyModalBottomSheet(),
                            child: SizedBox(
                              width: width * 0.78,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        subTypeTitle,
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white54,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 15),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                          color: Colors.black26, indent: width * (1 - 0.78)),
                    ],
                  ),

                  /// Time
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(child: Container()),
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(20), // Image border
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(25), // Image radius
                              child: const Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Icon(Icons.timelapse, size: 50),
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                          SizedBox(
                            width: width * 0.78,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () => selectDate(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        12,
                                        5,
                                        12,
                                        5,
                                      ),
                                      child: Text(
                                        getDateString(date),
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                GestureDetector(
                                  onTap: () => _selectTime(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        12,
                                        5,
                                        12,
                                        5,
                                      ),
                                      child: Text(
                                        getTimeString(date),
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white54,
                                  size: 16,
                                ),
                                const SizedBox(width: 15),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black26,
                        indent: width * (1 - 0.78),
                      ),
                    ],
                  ),

                  /// note
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Container()),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20), // Image border
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(25), // Image radius
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(Icons.note, size: 50),
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      SizedBox(
                        width: width * 0.78,
                        child: Column(
                          children: [
                            TextField(
                              controller: noteConroller,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                hintText: 'Note',
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                            const Divider(color: Colors.black26),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 150),
          OutlinedButton(
            onPressed: () async {
              debugPrint('## Onpressed at add expense');
              String amountTxt = amountController.text;
              int amount = int.parse(amountTxt);
              debugPrint('## amount $amount');
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'amount $amount, category $subTypeTitle, time ${date.toString()}',
                ),
              ));
            },
            child: const Padding(
              padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
              child: Text('add'),
            ),
          )
        ],
      ),
    );
  }

  void selectDate() async {
    final newDate = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 10),
      initialDate: date,
    );

    if (newDate == null) {
      return; // User pressed cancel
    }

    DateTime dt = DateTime(
      newDate.year,
      newDate.month,
      newDate.day,
      date.hour,
      date.minute,
    );

    setState(() {
      date = dt;
    });
  }

  Future<void> _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime == null) {
      return;
    }
    DateTime dt = DateTime(
      date.year,
      date.month,
      date.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    setState(() {
      date = dt;
    });

    // Handle the selected time (e.g., update UI or perform an action)
    // print("Selected time: ${pickedTime.format()}");
  }

  String getDateString(DateTime dt) {
    DateTime now = DateTime.now();
    if (dt.year == now.year && dt.month == now.month && dt.day == now.day) {
      return 'today';
    }

    return '${dt.day}:${dt.month}:${dt.year}';
  }

  String getTimeString(DateTime dt) {
    debugPrint('## time ${dt.minute} : ${dt.minute}');
    // DateTime now = DateTime.now();
    // if (dt.difference(now) <= const Duration(minutes: 5)) {
    //   return 'now';
    // }
    int hour = dt.hour;
    String d = 'am';
    if (hour >= 12) {
      hour = hour - 12;
      d = 'pm';
    }
    return '$hour : ${dt.minute} $d';
  }

  void showMyModalBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      // color is applied to main screen when modal bottom screen is displayed
      // barrierColor: Colors.greenAccent,
      //background color for modal bottom screen
      // backgroundColor: Colors.yellow,
      //elevates modal bottom screen
      elevation: 10,
      // gives rounded corner to modal bottom screen
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (BuildContext context) {
        // UDE : SizedBox instead of Container for whitespaces
        return SizedBox(
          height: 400,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  'Add Expense type',
                  style: TextStyle(
                    // color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 15),
                GridView(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                    childAspectRatio: 2,
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
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSubTypeOption(String title, String photoUrl) {
    return GestureDetector(
      onTap: () {
        setState(() {
          subTypeTitle = title;
          subTypeImgUrl = photoUrl;
        });
        Navigator.of(context).pop();
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
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
                getTitle(title),
                // overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  // color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getTitle(String txt) {
    if (txt.length < 8) {
      return txt;
    }
    return '${txt.substring(0, 7)}.';
  }
}
