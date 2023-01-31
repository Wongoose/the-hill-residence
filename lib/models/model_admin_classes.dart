class Account {
  final String name;
  final String uniqueAddress;
  final String address;
  final String phone;
  Account({required this.address, required this.phone, required this.name, required this.uniqueAddress});
}

class Unit {
  final String uniqueAddress;
  final String ownerName;
  final List<String> residentNames;

  // Getters
  String get residentsDisplay {
    final List<String> displayNames = [];
    displayNames.add(ownerName);
    displayNames.addAll(residentNames);
    if (displayNames.length == 1) return (displayNames[0]);
    if (displayNames.length == 2) return ("${displayNames[0]} and ${displayNames[1]}");
    if (displayNames.length > 2) {
      return ("${displayNames[0]}, ${displayNames[1]} and ${displayNames.length - 2} more");
    }
    return ("No residents");
  }

  Unit({required this.uniqueAddress, required this.ownerName, required this.residentNames});
}
