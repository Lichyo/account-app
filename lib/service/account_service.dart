import 'package:account_app/model/account.dart';

class AccountService {
  List<Account> accounts = [];
  Future<List<dynamic>> getSortedAccount() async {
    List<Account> sortedAccount = accounts;
    sortedAccount.sort((a, b) => b.date.compareTo(a.date));

    return sortedAccount;
  }

  int getMonthlyIncome() {
    int monthlyIncome = 0;
    accounts.forEach((account) {
      if (account.isIncome == true) {
        monthlyIncome = monthlyIncome + account.amount;
      }
    });
    return monthlyIncome;
  }

  int getMonthlyExpense() {
    int monthlyExpense = 0;
    accounts.forEach((account) {
      if (account.isIncome == false) {
        monthlyExpense = monthlyExpense + account.amount;
      }
    });
    return monthlyExpense;
  }

  addAccount(Account newAccount) {
    accounts.add(newAccount);
  }
}
