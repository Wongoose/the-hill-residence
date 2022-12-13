class AppUser {
  // Auth identifiers
  final String? uid;
  final String? email;
  final String? provider;
  final bool isVerified;

  // Variables
  String? fullName;
  String? address;
  String? unitNum;

  bool get hasProfileDetails => fullName != null && address != null;

  AppUser({this.provider, this.email, this.uid, this.isVerified = false});
}
