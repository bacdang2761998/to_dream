class Account {
  Account({
    this.name,
    this.birthDay,
    this.year,
    this.avataAccount,
  });
  final String? name;
  final String? birthDay;
  final String? year;
  final String? avataAccount;

  @override
  String toString() {
    return 'Account(name: $name, birthDay: $birthDay, year: $year, avataAccount: $avataAccount)';
  }
}
