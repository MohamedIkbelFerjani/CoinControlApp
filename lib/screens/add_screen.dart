import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:CoinControl/screens/widgets/modals/data.dart';

class AddTasksScreen extends StatefulWidget {
  final Function addTaskCallback;

  AddTasksScreen(this.addTaskCallback);

  @override
  _AddTasksScreenState createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  String? newTaskTitle;
  String? newTaskBud;
  String? newTaskType;

  String selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Transaction',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 20),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newTaskTitle = newText;
            },
            decoration: const InputDecoration(
              labelText: 'Enter Your Transaction Name',
            ),
          ),
          SizedBox(height: 20),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number, // Set the keyboard to numeric.
            onChanged: (newText1) {
              newTaskBud = newText1;
            },
            decoration: const InputDecoration(
              labelText: 'Budget',
            ),
          ),
          SizedBox(height: 20),
          Column(
            children: [
              RadioListTile(
                title: Text('Expense'),
                value: 'expense',
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                    newTaskType = value;
                  });
                },
              ),
              RadioListTile(
                title: Text('Income'),
                value: 'income',
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                    newTaskType = value;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              if (newTaskTitle != null &&
                  newTaskBud != null &&
                  newTaskType != null) {
                Provider.of<TransactionData>(context, listen: false)
                    .addTask(newTaskTitle!, newTaskBud!, newTaskType!);
                Navigator.pop(context);
              }
            },
            child: Text('Add'),
            style: TextButton.styleFrom(
              backgroundColor: Colors.teal[400],
              primary: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
