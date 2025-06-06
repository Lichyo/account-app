import 'package:account_app/account_model.dart';

class AccountService {
  List<Account> accounts = [];
  List<Account> getSortedAccount() {
    List<Account> sortedAccount = accounts;
    sortedAccount.sort((a, b) => b.date.compareTo(a.date));

    return sortedAccount;
  }

  addAccount(Account newAccount) {
    accounts.add(newAccount);
  }
}
