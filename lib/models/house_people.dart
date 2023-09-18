class HousePeople {
  final int timeStamp;
  final int houseNumber;
  final String peopleName;
  final int powerUsage;
  final int water;
  final bool containsBalance;
  final int total;
  final int amount;

  HousePeople(
      {this.timeStamp = 0,
      this.houseNumber = 0,
      this.peopleName = '',
      this.powerUsage = 0,
      this.water = 0,
      this.containsBalance = false,
      this.total = 0,
      this.amount = 0});
}
