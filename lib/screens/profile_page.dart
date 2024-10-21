import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;
  String firstName = 'Имя';
  String lastName = 'Фамилия';
  String email = 'example@mail.com';
  String phone = '+123456789';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Личный кабинет'),
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.save : Icons.edit),
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/ponch.png'),
            ),
            const SizedBox(height: 16),
            _buildTextField('Имя', firstName, (value) => firstName = value),
            _buildTextField('Фамилия', lastName, (value) => lastName = value),
            _buildTextField('Email', email, (value) => email = value),
            _buildTextField('Телефон', phone, (value) => phone = value),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String value, Function(String) onChanged) {
    return TextField(
      enabled: isEditing,
      controller: TextEditingController(text: value),
      decoration: InputDecoration(labelText: label),
      onChanged: onChanged,
    );
  }
}
