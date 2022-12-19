class AppUser {
  // Auth identifiers
  final String? uid;
  final String? email;
  final String? provider;
  final bool isVerified;

  // Variables
  String? fullName;
  String? unitNum;
  String? road;
  String? city;
  String? postcode;

  bool get hasProfileDetails => fullName != null && unitNum != null && road != null && city != null && postcode != null;

  AppUser({this.provider, this.email, this.uid, this.isVerified = false});
}
