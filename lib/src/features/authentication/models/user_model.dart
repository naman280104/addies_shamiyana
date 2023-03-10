class UserModel{
  final String? id;
  final String fName;
  final String lName;
  final String phoneNo;
  final String email;
  final String password;

  const UserModel({
    this.id,
    required this.fName,
    required this.lName,
    required this.phoneNo,
    required this.email,
    required this.password,

  });

  toJson(){
    return{
      "First Name":fName,
      "Last Name" :lName,
      "phoneNo" :phoneNo,
      "email" :email,
      "Password" :password,
    };
  }
}