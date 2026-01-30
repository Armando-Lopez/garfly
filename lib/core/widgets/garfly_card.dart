import 'package:flutter/material.dart';

class GarflyCard extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  const GarflyCard({
    super.key,
    this.padding,
    required this.child,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    
    return Container(
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: colors.outline.withValues(alpha: 0.2),
          width: 1
        ),
      ),
      child: child,
    );
  }
}
