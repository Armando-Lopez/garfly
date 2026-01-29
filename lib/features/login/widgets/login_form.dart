import 'package:flutter/material.dart';
import 'package:garfly/core/screens/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  Future<void> _checkSavedData() async {
    final preferences = await SharedPreferences.getInstance();
    final String? savedName = preferences.getString('user_name');

    if (savedName != null && mounted) {
      _nameController.text = savedName;
    }
    print(savedName);
  }

  Future<void> _saveUserData(BuildContext context) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString("user_name", _nameController.text.trim());
    await preferences.setString("user_gender", _currentGender);
    if (_birthDate != null) {
      await preferences.setString(
        "user_birthdate",
        _birthDate!.toIso8601String(),
      );
    }

    if (!context.mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainScreen()),
    );
  }

  @override
  void initState() {
    super.initState();
    _checkSavedData();
    _nameController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool canContinue =
        _nameController.text.trim().length > 2 &&
        _currentGender.isNotEmpty &&
        _birthDate != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("¿Cuál es tu nombre?", style: theme.textTheme.bodyLarge),
        const SizedBox(height: 8),
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(hintText: "Escribe tu nombre aquí"),
          textCapitalization: TextCapitalization.words,
        ),
        const SizedBox(height: 12),
        Text("Género", style: theme.textTheme.bodyLarge),
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
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            onPressed: canContinue && mounted
                ? () => _saveUserData(context)
                : null,
            child: Text("Empieza tu transformación"),
          ),
        ),
      ],
    );
  }
}
