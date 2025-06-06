import 'package:flutter/material.dart';
import 'package:account_app/model/account.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Account> accountList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    accountList = AccountService.getSortedAccount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AppBar")),
      body: Column(
        children: [
          ListView.builder(
            itemCount: accountList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Row(
                  children: <Widget>[
                    Text(accountList[index].title),
                    Text(accountList[index].isIncome ? 'income' : 'expense'),
                  ],
                ),
                subtitle: Row(
                  children: <Widget>[
                    Text(accountList[index].amount.toString()),
                    Text(accountList[index].date.toString()),
                  ],
                ),
              );
            },
          ),
          Row(
            children: <Widget>[
              Text('收入:${AccountService.getMonthlyIncome()}'),
              Text('收入:${AccountService.getMonthlyIncome()}')
            ],
          ),
        ],
      ),

    );
  }
}
