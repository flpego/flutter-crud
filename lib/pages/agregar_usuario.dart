import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user_model.dart';
import 'package:flutter_crud/services/firestore_service.dart';
import 'package:flutter_crud/pages/home.dart';


class AgregarUsuario extends StatefulWidget {
  const AgregarUsuario({super.key});

  @override
  State<AgregarUsuario> createState() => _AgregarUsuarioState();
}

class _AgregarUsuarioState extends State<AgregarUsuario> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  String? _selectedRole;

  final List<String> _roles = ['Admin', 'Mecanico'];

  @override
  void dispose() {
    _nombreController.dispose();
    _apellidoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar Usuario"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                    labelText: "Nombre", hintText: "Nombre"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingrese un nombre";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _apellidoController,
                decoration: const InputDecoration(
                    labelText: "Apellido", hintText: "Apellido"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un apellido';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedRole,
                decoration: const InputDecoration(labelText: 'Rol'),
                items: _roles.map((String role) {
                  return DropdownMenuItem<String>(
                    value: role,
                    child: Text(role),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedRole = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor seleccione un rol';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final newUser = User(
                          id: DateTime.now().microsecondsSinceEpoch.toString(),
                          nombre: _nombreController.text,
                          apellido: _apellidoController.text,
                          rol: _selectedRole!);
                      await saveUser(newUser);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
                    }
                  },
                  child: const Text("Agregar"))
            ],
          ),
        ),
      ),
    );
  }
}
