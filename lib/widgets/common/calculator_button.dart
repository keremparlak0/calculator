import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final double width;
  final double height;
  final bool isOperator;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.width = 80,
    this.height = 80,
    this.isOperator = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor:
                backgroundColor ??
                (isOperator
                    ? theme.colorScheme.secondary
                    : theme.colorScheme.surface),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            padding: EdgeInsets.zero,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize ?? 24,
                fontWeight: FontWeight.bold,
                color:
                    textColor ??
                    (isOperator
                        ? theme.colorScheme.onSecondary
                        : theme.colorScheme.onSurface),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
