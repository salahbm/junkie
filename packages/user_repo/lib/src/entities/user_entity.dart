class MyUserEntity {
  String userId;
  String email;
  String name;
  bool hasActiveCart;

  MyUserEntity(
      {required this.userId,
      required this.email,
      required this.name,
      required this.hasActiveCart});

  Map<String, Object> toDocument() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'hasActiveCart': hasActiveCart
    };
  }

  static MyUserEntity fromDocument(Map<String, Object> document) {
    return MyUserEntity(
        userId: document['userId'] as String,
        email: document['email'] as String,
        name: document['name'] as String,
        hasActiveCart: document['hasActiveCart'] as bool);
  }
}
