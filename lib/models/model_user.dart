class AppUser {
  // Identifiers
  // NEXT: add isVerified
  final String? uid;
  final String? email;
  final String? provider;

  // Variables
  String? firstName;
  String? lastName;
  String? address;
  String? unitNum;

  bool get hasProfileDetails => firstName != null && lastName != null && address != null && unitNum != null;

  AppUser({this.provider, this.email, this.uid});
}
