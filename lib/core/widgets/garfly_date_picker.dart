import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Necesitarás este paquete para formatear fechas

class GarflyDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;
  final String label;

  const GarflyDatePicker({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Formateamos la fecha: si es nula, mostramos un mensaje
    String displayText = selectedDate == null
        ? 'Selecciona tu fecha'
        : DateFormat('dd / MM / yyyy').format(selectedDate!);
    final initDate = selectedDate ?? DateTime(2000);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.titleMedium),
        const SizedBox(height: 8),
        InkWell(
          onTap: () async {
            FocusScope.of(context).unfocus();

            // Abrimos el selector de fecha nativo
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: initDate, // Fecha sugerida al abrir
              firstDate: DateTime(1920), // Fecha mínima
              lastDate: DateTime.now(), // No puedes nacer en el futuro
              locale: const Locale("es", "ES"),
            );
            if (picked != null) onDateSelected(picked);

            // 1. Esperamos un microsegundo para que el teclado termine de bajar
            await Future.delayed(const Duration(milliseconds: 100));
            // 2. Quitamos el foco de cualquier lado (esto oculta el teclado y el cursor)
            FocusScope.of(context).unfocus();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(
                100,
              ), // Estilo píldora como los demás
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(displayText, style: theme.textTheme.bodyLarge),
                Icon(
                  Icons.calendar_today_outlined,
                  color: theme.colorScheme.primary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
