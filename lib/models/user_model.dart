class UserModel {
  final String id;
  final String username;
  String profilePic = '';
  final String email;
  String firstName = '';
  String lastName = '';

  UserModel(
      {required this.id,
      required this.username,
      required this.email,
      this.firstName = '',
      this.lastName = '',
      this.profilePic = ''});
}
