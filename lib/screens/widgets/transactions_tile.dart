import 'package:flutter/material.dart';

class TransactionsTile extends StatelessWidget {
  final String transactionName;
  final String money;
  final String expanseOrIncome;
  final void Function() listTiledelete;
  TransactionsTile(
      {required this.transactionName,
      required this.money,
      required this.expanseOrIncome,
      required this.listTiledelete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        // Call the function to delete the item
        listTiledelete(); // Make sure to pass the necessary parameters to the function if needed
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey[200],
            height: 50,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    Text(
                      transactionName,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Text(
                  (expanseOrIncome == 'expense' ? '-' : '+') + money + 'AED',
                  style: TextStyle(
                      color: (expanseOrIncome == 'expense'
                          ? Colors.red
                          : Colors.green)),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
