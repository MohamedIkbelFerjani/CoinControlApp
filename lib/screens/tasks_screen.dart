import 'package:flutter/material.dart';
import 'package:CoinControl/screens/add_screen.dart';
import 'package:provider/provider.dart';
import 'package:CoinControl/screens/top_card.dart';
import 'package:CoinControl/screens/widgets/transactions_list.dart';
import 'package:CoinControl/screens/widgets/modals/data.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TransactionData transactionData = Provider.of<TransactionData>(context);
    double totalIncome = transactionData.calculateTotalIncome();
    double totalExpenses = transactionData.calculateTotalExpenses();
    double balance = transactionData.calculateBalance();
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTasksScreen((newTaskTilte) {
                    // setState(() {
                    //   tasks.add(Task(name: newTaskTilte));
                    //   Navigator.pop(
                    //       context); //this is to close the window and the keyboard
                    // });
                  }),
                ),
              ),
            );
          },
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          child: Icon(
            Icons.add,
            color: Color.fromARGB(255, 28, 128, 210),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 28, 128, 210),
        body: Scaffold(
          backgroundColor: Colors.grey[300],
          body: Padding(
            padding: const EdgeInsets.fromLTRB(15, 35, 15, 2),
            child: Column(
              children: [
                topNeuCard(
                  balance: balance.toString(),
                  expanse: totalExpenses.toString(),
                  income: totalIncome.toString(),
                ),
                SizedBox(height: 15),
                Text(
                  '${Provider.of<TransactionData>(context).transactions.length} Transactions',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 36, 36, 36),
                    fontSize: 20,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TasksList(),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
