class User {
  final int id;
  final String userName;
  final String password;

  User({required this.id, required this.userName, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'User{is: $id, userName: $userName, password: $password}';
  }
}




// class User {
//   final String userName;
//   final String password;

//   User({required required this.userName, required this.password});

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(userName: json['userName'], password: json['password']);
//   }
//   Map<String, dynamic> toJson() {
//     return {
//       'userName': userName,
//       'password': password
//     };
//   }
// }

// class UserList {
//   final List<User> users;

//   UserList({required this.users});

//   factory UserList.fromJson(List<dynamic> parsedJson) {
//     List<User> _usersList = <User>[];
//     // _usersList.addAll(jsonList.map((e) => User.fromJson(e)).toList());
//     _usersList = parsedJson.map((i) => User.fromJson(i)).toList();

//     return UserList(users: _usersList);
//   }
// }