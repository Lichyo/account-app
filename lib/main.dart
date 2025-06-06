import 'account_model.dart';
import 'service/account_service.dart';

List<Account> sampleAccounts = [
  Account(
    title: '禮物收入',
    date: DateTime(2025, 6, 4),
    isIncome: true,
    amount: 1000,
  ),
  Account(
    title: '薪水',
    date: DateTime(2025, 6, 1),
    isIncome: true,
    amount: 50000,
  ),
  Account(title: '早餐', date: DateTime(2025, 6, 2), isIncome: false, amount: 80),
  Account(
    title: '午餐',
    date: DateTime(2025, 6, 3),
    isIncome: false,
    amount: 120,
  ),
  Account(
    title: '股票股利',
    date: DateTime(2025, 5, 20),
    isIncome: true,
    amount: 2000,
  ),

  Account(
    title: '電影票',
    date: DateTime(2025, 5, 30),
    isIncome: false,
    amount: 300,
  ),
  Account(
    title: '兼職收入',
    date: DateTime(2025, 5, 28),
    isIncome: true,
    amount: 8000,
  ),
  Account(
    title: '晚餐',
    date: DateTime(2025, 6, 1),
    isIncome: false,
    amount: 150,
  ),
  Account(
    title: '交通費',
    date: DateTime(2025, 5, 25),
    isIncome: false,
    amount: 60,
  ),

  Account(
    title: '網購',
    date: DateTime(2025, 6, 5),
    isIncome: false,
    amount: 2000,
  ),
];

void main() {
  AccountService accountService = AccountService();
  for (int i = 0; i < sampleAccounts.length; i++) {
    accountService.addAccount(sampleAccounts[i]);
  }

  accountService.getSortedAccount().forEach((account) {
    print(account.date);
  });
}
