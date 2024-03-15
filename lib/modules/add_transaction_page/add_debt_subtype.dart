import 'package:flutter/material.dart';

class BuildDebtSubtype extends StatefulWidget {
  const BuildDebtSubtype({super.key});

  @override
  State<BuildDebtSubtype> createState() => _BuildDebtSubtypeState();
}

class _BuildDebtSubtypeState extends State<BuildDebtSubtype> {
  late TextEditingController amountController;
  late TextEditingController otherPersionController;
  String subTypeImgUrl = 'assets/transactions/1710526737750.png';
  String subTypeTitle = 'Lend';
  DateTime date = DateTime.now();
  late TextEditingController noteConroller;

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController(text: '0');
    noteConroller = TextEditingController();
    otherPersionController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    amountController.dispose();
    noteConroller.dispose();
    otherPersionController.dispose();
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
                        color: Colors.black26,
                        indent: width * (1 - 0.78),
                      ),
                    ],
                  ),

                  /// other persion
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
                              controller: otherPersionController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: getOtherPersionString(),
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

  String getOtherPersionString() {
    if (subTypeTitle == 'Borrow') {
      return 'Lender';
    }
    return 'Borrower';
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
                      'Lend',
                      'assets/transactions/1710526737750.png',
                    ),
                    _buildSubTypeOption(
                      'Repayment',
                      'assets/transactions/1710526737750.png',
                    ),
                    _buildSubTypeOption(
                      'Borrow',
                      'assets/transactions/1710526737750.png',
                    ),
                    _buildSubTypeOption(
                      'Debt Collection',
                      'assets/transactions/1710526737750.png',
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
