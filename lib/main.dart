import 'package:flutter/material.dart';
import 'package:CoinControl/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:CoinControl/screens/widgets/modals/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransactionData(),
      child: MaterialApp(
        home: TasksScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
