class Business{
  String orgName;
  String orgType;
  String owner;
  String phone;
  String token;

  Business({
    required this.orgName,
    required this.orgType,
    required this.owner,
    required this.phone,
    required this.token
  });


  @override
  String toString() {
    return "$orgType \"$orgName\"";
  }

}