class InstructorModel {
  final int id;
  final String name;
  final String profilePic;
  final String department;
  var comment;
  int evalCount;
  InstructorModel(
      {required this.id,
      required this.name,
      required this.department,
      this.comment = const {},
      this.evalCount = 0,
      this.profilePic = ''});
}
