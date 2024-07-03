class User {
  final String id;
  final String nombre;
  final String apellido;
  final String rol;

  User({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.rol,
  });

  // Método para convertir un User a un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'apellido': apellido,
      'rol': rol,
    };
  }

  // Método para crear un User desde un Map
  factory User.fromMap(Map<String, dynamic> map, String id) {
    return User(
      id: id,
      nombre: map['nombre'] ?? '',
      apellido: map['apellido'] ?? '',
      rol: map['rol'] ?? '',
    );
  }
}
