class UserModel {
  String firstName;
  String lastName;
  DateTime birthDate;
  String email;
  String password;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'birthDate': birthDate.toIso8601String(),
      'email': email,
    };
  }

  // Méthode pour créer un UserModel à partir d'une Map, utile pour la lecture à partir d'une base de données
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      birthDate: DateTime.parse(map['birthDate']),
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }
}
