import 'package:flutter/material.dart';
import 'package:garfly/core/widgets/garfly_date_picker.dart';
import 'package:garfly/core/widgets/garfly_radio_group.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _nameController = TextEditingController();
  final _genderOptions = ["Femenino", "Masculino", "No binario"];
  late String _currentGender = _genderOptions.first;
  DateTime? _birthDate;
  
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("¿Cuál es tu nombre?", style: theme.textTheme.titleMedium),
        const SizedBox(height: 8),
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(hintText: "Escribe tu nombre aquí"),
        ),
        const SizedBox(height: 12), 
        Text("Género", style: theme.textTheme.titleMedium),
        const SizedBox(height: 8),
        GarflyRadioGroup(
          options: _genderOptions,
          selectedOption: _currentGender,
          onSelected: (value) {
            setState(() {
              _currentGender = value;
            });
          },
        ),
        const SizedBox(height: 12),
        GarflyDatePicker(
          label: "¿Cuándo naciste?",
          selectedDate: _birthDate,
          onDateSelected: (value) {
            setState(() {
              _birthDate = value;
            });
          },
        ),
      ],
    );
  }
}
