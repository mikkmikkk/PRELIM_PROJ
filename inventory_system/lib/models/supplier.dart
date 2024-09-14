class Supplier {
  String name;
  String email;

  Supplier(this.name, this.email);

  @override
  String toString() => '$name (Email: $email)';
}
