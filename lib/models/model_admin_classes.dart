class Account {
  final String name;
  final String unitAlias;
  final String phone;
  Account({required this.phone, required this.name, required this.unitAlias});
}

class Unit {
  final String id;
  final String unitAlias;
  final String? ownerUID;
  final String ownerName;
  final List<String> residentNames;
  bool activated;

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

  String get myResidentsDisplay {
    final List<String> displayNames = [];
    displayNames.add("You");
    displayNames.addAll(residentNames);
    if (displayNames.length == 1) return (displayNames[0]);
    if (displayNames.length == 2) return ("${displayNames[0]} and ${displayNames[1]}");
    if (displayNames.length > 2) {
      return ("${displayNames[0]}, ${displayNames[1]} and ${displayNames.length - 2} more");
    }
    return ("No residents");
  }

  Unit(
      {this.ownerUID,
      required this.id,
      required this.unitAlias,
      required this.ownerName,
      required this.residentNames,
      required this.activated});
}
