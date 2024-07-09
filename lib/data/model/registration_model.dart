class UserRegistration {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;

  UserRegistration({
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'c_password': confirmPassword,
      };
}
