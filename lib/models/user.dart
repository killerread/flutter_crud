// ignore_for_file: empty_constructor_bodies

class User {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final String numero;

  const User(
      {required this.id,
      required this.name,
      required this.email,
      required this.avatarUrl,
      required this.numero});

  void put(user) {}

  void remove(User user) {}
}
