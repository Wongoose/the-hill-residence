class Account {
  final String? id;
  final String? name;
  final String email;
  final String unitAlias;
  final String? phone;
  final String? access;
  final bool? isOwner;

  String get getPhone => (phone == null || phone!.isEmpty) ? "No phone registered" : phone!;

  bool get isNew => access == null || access!.isEmpty;
  bool get isUser => access == "user";

  String get getRoleDisplay => isNew
      ? "Pending"
      : isOwner ?? false
          ? "Owner"
          : "Resident";

  Account(
      {required this.id,
      required this.access,
      required this.phone,
      required this.email,
      required this.unitAlias,
      this.name,
      this.isOwner});
}

class Unit {
  final String id;
  final String unitAlias;
  final String? ownerUID;
  final String ownerName;
  final String ownerEmail;
  final List<String> residentNames;
  final List<String> residentsUID;
  final List<String> invitedEmails;
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
    displayNames.add(ownerName);
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
      required this.ownerEmail,
      required this.residentNames,
      required this.residentsUID,
      required this.invitedEmails,
      required this.activated});
}
