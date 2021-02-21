class UserData {
  UserData(this.email, this.name, this.photoURL);
  UserData.fullProfile(this.email, this.name, this.photoURL, this.highSchool, this.university, this.inHighSchool);
  String email;
  String name;
  String photoURL; 
  String highSchool;
  String university;
  bool inHighSchool;
}