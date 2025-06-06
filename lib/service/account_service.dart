import 'package:account_app/model/account.dart';

class AccountService {
  List<Account> accounts = [];
  Future<List<dynamic>> getSortedAccount() async {
    List<Account> sortedAccount = accounts;
    sortedAccount.sort((a, b) => b.date.compareTo(a.date));

    return sortedAccount;
  }

  addAccount(Account newAccount) {
    accounts.add(newAccount);
  }
}
