import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/calculator_provider.dart';
import '../widgets/common/calculator_button.dart';
import '../widgets/common/result_display.dart';

class BasicCalculatorScreen extends StatelessWidget {
  const BasicCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final calculatorProvider = Provider.of<CalculatorProvider>(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Temel Hesap Makinesi')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Result display
              ResultDisplay(
                expression: calculatorProvider.currentExpression,
                result: calculatorProvider.currentInput.isEmpty
                    ? calculatorProvider.result
                    : calculatorProvider.currentInput,
              ),

              const Spacer(),

              // Calculator buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: 'C',
                    onPressed: () => calculatorProvider.clear(),
                    backgroundColor: colorScheme.errorContainer,
                    textColor: colorScheme.onErrorContainer,
                  ),
                  CalculatorButton(
                    text: '⌫',
                    onPressed: () => calculatorProvider.delete(),
                    backgroundColor: colorScheme.primaryContainer,
                    textColor: colorScheme.onPrimaryContainer,
                  ),
                  CalculatorButton(
                    text: '%',
                    onPressed: () {},
                    backgroundColor: colorScheme.primaryContainer,
                    textColor: colorScheme.onPrimaryContainer,
                  ),
                  CalculatorButton(
                    text: '÷',
                    onPressed: () => calculatorProvider.appendOperator('÷'),
                    backgroundColor: colorScheme.tertiary,
                    textColor: colorScheme.onTertiary,
                    isOperator: true,
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '7',
                    onPressed: () => calculatorProvider.appendNumber('7'),
                  ),
                  CalculatorButton(
                    text: '8',
                    onPressed: () => calculatorProvider.appendNumber('8'),
                  ),
                  CalculatorButton(
                    text: '9',
                    onPressed: () => calculatorProvider.appendNumber('9'),
                  ),
                  CalculatorButton(
                    text: '×',
                    onPressed: () => calculatorProvider.appendOperator('×'),
                    backgroundColor: colorScheme.tertiary,
                    textColor: colorScheme.onTertiary,
                    isOperator: true,
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '4',
                    onPressed: () => calculatorProvider.appendNumber('4'),
                  ),
                  CalculatorButton(
                    text: '5',
                    onPressed: () => calculatorProvider.appendNumber('5'),
                  ),
                  CalculatorButton(
                    text: '6',
                    onPressed: () => calculatorProvider.appendNumber('6'),
                  ),
                  CalculatorButton(
                    text: '-',
                    onPressed: () => calculatorProvider.appendOperator('-'),
                    backgroundColor: colorScheme.tertiary,
                    textColor: colorScheme.onTertiary,
                    isOperator: true,
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '1',
                    onPressed: () => calculatorProvider.appendNumber('1'),
                  ),
                  CalculatorButton(
                    text: '2',
                    onPressed: () => calculatorProvider.appendNumber('2'),
                  ),
                  CalculatorButton(
                    text: '3',
                    onPressed: () => calculatorProvider.appendNumber('3'),
                  ),
                  CalculatorButton(
                    text: '+',
                    onPressed: () => calculatorProvider.appendOperator('+'),
                    backgroundColor: colorScheme.tertiary,
                    textColor: colorScheme.onTertiary,
                    isOperator: true,
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '0',
                    onPressed: () => calculatorProvider.appendNumber('0'),
                  ),
                  CalculatorButton(
                    text: '.',
                    onPressed: () => calculatorProvider.appendDecimal(),
                  ),
                  CalculatorButton(
                    text: '00',
                    onPressed: () => calculatorProvider.appendNumber('00'),
                  ),
                  CalculatorButton(
                    text: '=',
                    onPressed: () => calculatorProvider.calculate(),
                    backgroundColor: colorScheme.primary,
                    textColor: colorScheme.onPrimary,
                    isOperator: true,
                  ),
                ],
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
