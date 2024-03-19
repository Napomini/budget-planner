import 'package:budgetplanner/constants/helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants/models/data.dart';
import '../../constants/models/transaction.dart';

class BuildIncomeEditor extends StatefulWidget {
  final Data data;
  const BuildIncomeEditor({super.key, required this.data});

  @override
  State<BuildIncomeEditor> createState() => _BuildIncomeEditorState();
}

class _BuildIncomeEditorState extends State<BuildIncomeEditor> {
  bool loading = false;
  late TextEditingController amountController;
  String subTypeImgUrl = 'assets/transactions/icon_salary.png';
  String subTypeTitle = 'Income';
  DateTime date = DateTime.now();
  late TextEditingController noteConroller;

  void updateLoading(bool newVal) {
    setState(() {
      loading = newVal;
    });
  }

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
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }
    final double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              // border: Border.all(
              //   color: Colors.blue,
              // ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 39, 39, 39)
                      .withOpacity(0.3), // Shadow color
                  spreadRadius: 0, // Spread radius
                  blurRadius: 10, // Blur radius
                  offset: const Offset(0, 4), // Offset
                ),
              ],
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
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Text(
                              'BDT',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 14),
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
                                          color: Color.fromARGB(179, 0, 0, 0),
                                          fontSize: 14,
                                        ),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color.fromARGB(137, 0, 0, 0),
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
                        color: Colors.black26,
                        indent: width * (1 - 0.78),
                      ),
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
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
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
                                          color: Color.fromARGB(179, 0, 0, 0),
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
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
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
                                          color: Color.fromARGB(179, 0, 0, 0),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color.fromARGB(137, 0, 0, 0),
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
          Center(
            child: GestureDetector(
              onTap: () async {
                updateLoading(true);
                debugPrint('## adding Income');
                String amountString = amountController.text;
                if (amountString.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Amount can not be empty'),
                  ));
                  updateLoading(false);
                  return;
                }
                if (amountString == '0') {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Amount can not be zero'),
                  ));
                  updateLoading(false);
                  return;
                }
                int amount = int.parse(amountString);
                final mt = MicroTransaction(
                  type: 'Income',
                  subType: subTypeTitle,
                  subTypeImg: subTypeImgUrl,
                  amount: amount.toDouble(),
                  time: date,
                );
                Data d = widget.data;
                int index = -1;
                for (int i = 0; i < d.transactions.length; i++) {
                  DateTime dtDate = d.transactions[i].dateTime;
                  if (dtDate.year == date.year &&
                      dtDate.month == date.month &&
                      dtDate.day == date.day) {
                    index = i;
                    break;
                  }
                }
                debugPrint('## index $index');
                List<DailyTransaction> dailyT = [];
                dailyT.addAll(d.transactions);
                if (index < 0) {
                  final dt = DailyTransaction(
                    dateTime: date,
                    transactions: [mt],
                  );
                  dailyT.insert(0, dt);
                  index = 0;
                } else {
                  dailyT[index].transactions.add(mt);
                }
                var newD = Data(
                  userName: d.userName,
                  userEmail: d.userEmail,
                  userPhone: d.userPhone,
                  transactions: dailyT,
                  totalAmount: d.totalAmount,
                );
                newD = adjustAmount(
                  newD,
                  amount.toDouble(),
                  'Income',
                  '',
                  index,
                );

                final dJson = newD.toJson();
                debugPrint('## [new_data] ${dJson.toString()}');
                final db = FirebaseFirestore.instance;

                db
                    .collection("test")
                    .doc(d.userEmail)
                    .set(dJson, SetOptions(merge: true));
                debugPrint('## end................');
                updateLoading(false);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Added $subTypeTitle successfully'),
                ));
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
                  child: Text('Add $subTypeTitle'),
                ),
              ),
            ),
          ),
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
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: 400,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  'Select a Category',
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
                      'Salary',
                      'assets/transactions/icon_salary.png',
                    ),
                    _buildSubTypeOption(
                      'Award',
                      'assets/transactions/icon_award.png',
                    ),
                    _buildSubTypeOption(
                      'Interest',
                      'assets/transactions/icon_interest.png',
                    ),
                    _buildSubTypeOption(
                      'Other',
                      'assets/transactions/icon_plus.png',
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
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 255, 255, 255)
                  .withOpacity(1), // Shadow color
              spreadRadius: 0, // Spread radius
              blurRadius: 0, // Blur radius
              offset: const Offset(0, 0), // Offset
            ),
          ],
          border: Border.all(
            color: Colors.black,
            width: 2.0,
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
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getTitle(String txt) {
    if (txt.length < 18) {
      return txt;
    }
    return '${txt.substring(0, 17)}.';
  }
}
