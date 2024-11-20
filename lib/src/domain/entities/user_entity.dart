class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String sessionToken;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.sessionToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'] ?? 'Unknown Name',
      username: json['username'] ?? 'Unknown Username',
      email: json['email'] ?? '',
      sessionToken: json['session_token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'session_token': sessionToken,
    };
  }
}
