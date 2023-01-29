class Account {
  final String name;
  final String uniqueAddress;
  final String address;
  final String phone;
  Account({required this.address, required this.phone, required this.name, required this.uniqueAddress});
}

class Unit {
  final String uniqueAddress;
  final String ownerUID;
  final List<String> residentNames = [];

  // Getters
  String get residentsDisplay {
    print("Length is ${residentNames.length}");
    if (residentNames.length == 1) return (residentNames[0]);
    if (residentNames.length == 2) return ("${residentNames[0]} and ${residentNames[1]}");
    if (residentNames.length > 2) {
      return ("${residentNames[0]}, ${residentNames[1]} and ${residentNames.length - 2} more");
    }
    return ("No residents");
  }

  Unit({required this.uniqueAddress, required this.ownerUID});
}
