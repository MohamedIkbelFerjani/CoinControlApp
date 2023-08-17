import 'package:flutter/material.dart';

import 'package:CoinControl/screens/widgets/transactions_tile.dart';
import 'package:provider/provider.dart';
import 'package:CoinControl/screens/widgets/modals/data.dart';

import 'modals/data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionData>(
      builder: (context, TaskData, child) {
        return ListView.builder(
            itemCount: TaskData.transactions.length,
            itemBuilder: (context, index) {
              return TransactionsTile(
                money: TaskData.transactions[index].budget,
                transactionName: TaskData.transactions[index].name,
                expanseOrIncome: TaskData.transactions[index].type,
                listTiledelete: () {
                  TaskData.deleteTask(TaskData.transactions[index]);
                },
              );
            });
      },
    );
  }
}
