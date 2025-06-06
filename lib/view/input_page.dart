import 'package:flutter/material.dart';
import 'package:account_app/model/account.dart';

class InputPage extends StatefulWidget {
  InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController titleController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  bool isIncome = true;

  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.mic),
      ),
      appBar: AppBar(
        title: Text('Add Item'),
        actionsPadding: EdgeInsets.all(8.0),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios_new_rounded),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              readOnly: true,
              controller: dateController,
              decoration: InputDecoration(
                labelText: 'Date',
                border: OutlineInputBorder(),
              ),
              onTap: () async {
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (selectedDate != null) {
                  dateController.text = selectedDate.toLocal().toString().split(
                    ' ',
                  )[0];
                }
              },
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      isIncome = true;
                      setState(() {});
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: isIncome ? Colors.blue : Colors.transparent,
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text('Income'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      isIncome = false;
                      setState(() {});
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: !isIncome ? Colors.red : Colors.transparent,
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text('Expense'),
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            TextButton(
              onPressed: () {
                if (titleController.text.isEmpty ||
                    dateController.text.isEmpty ||
                    amountController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please fill all fields')),
                  );
                  return;
                }
                Account account = Account(
                  title: titleController.text,
                  date: DateTime.parse(dateController.text),
                  isIncome: isIncome,
                  amount: int.parse(amountController.text),
                );
              },
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
