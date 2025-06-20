import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bmi_calculator_provider.dart';

class BMICalculatorScreen extends StatelessWidget {
  const BMICalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bmiProvider = Provider.of<BMICalculatorProvider>(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Hesaplayıcı'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => bmiProvider.reset(),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Result display
                if (bmiProvider.bmi != null)
                  _buildResultCard(context, bmiProvider),

                // Gender selection
                const SizedBox(height: 20),
                const Text(
                  'Cinsiyet',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                _buildGenderSelector(bmiProvider, colorScheme),

                // Height slider
                const SizedBox(height: 20),
                _buildHeightSection(bmiProvider, colorScheme),

                // Weight selector
                const SizedBox(height: 20),
                _buildWeightSection(bmiProvider, colorScheme),

                // Age selector
                const SizedBox(height: 20),
                _buildAgeSection(bmiProvider, colorScheme),

                // Calculate button
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () => bmiProvider.calculateBMI(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'HESAPLA',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResultCard(
    BuildContext context,
    BMICalculatorProvider provider,
  ) {
    Color statusColor;
    switch (provider.statusColor) {
      case 'blue':
        statusColor = Colors.blue;
        break;
      case 'green':
        statusColor = Colors.green;
        break;
      case 'yellow':
        statusColor = Colors.orange;
        break;
      case 'red':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.blue;
    }

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: statusColor, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'BMI Sonucu',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              provider.bmi?.toStringAsFixed(1) ?? '',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: statusColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              provider.bmiStatus,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: statusColor,
              ),
            ),
            const SizedBox(height: 16),
            _buildBMIInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildBMIInfo() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('BMI Değer Aralıkları:'),
        SizedBox(height: 6),
        Text('• < 18.5: Düşük Kilo'),
        Text('• 18.5 - 24.9: Normal'),
        Text('• 25 - 29.9: Fazla Kilolu'),
        Text('• > 30: Obez'),
      ],
    );
  }

  Widget _buildGenderSelector(
    BMICalculatorProvider provider,
    ColorScheme colorScheme,
  ) {
    return Row(
      children: [
        Expanded(
          child: _buildGenderCard(
            icon: Icons.male,
            label: 'Erkek',
            isSelected: provider.gender == 'male',
            onTap: () => provider.updateGender('male'),
            colorScheme: colorScheme,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildGenderCard(
            icon: Icons.female,
            label: 'Kadın',
            isSelected: provider.gender == 'female',
            onTap: () => provider.updateGender('female'),
            colorScheme: colorScheme,
          ),
        ),
      ],
    );
  }

  Widget _buildGenderCard({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    required ColorScheme colorScheme,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: isSelected ? colorScheme.primaryContainer : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: isSelected
              ? BorderSide(color: colorScheme.primary, width: 2)
              : BorderSide.none,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 60,
                color: isSelected ? colorScheme.primary : colorScheme.onSurface,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected
                      ? colorScheme.primary
                      : colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeightSection(
    BMICalculatorProvider provider,
    ColorScheme colorScheme,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Boy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  provider.height.toInt().toString(),
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 4),
                const Text('cm', style: TextStyle(fontSize: 18)),
              ],
            ),
            Slider(
              value: provider.height,
              min: 120,
              max: 220,
              divisions: 100,
              activeColor: colorScheme.primary,
              inactiveColor: colorScheme.primary.withOpacity(0.2),
              onChanged: (value) => provider.updateHeight(value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeightSection(
    BMICalculatorProvider provider,
    ColorScheme colorScheme,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Kilo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  provider.weight.toInt().toString(),
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 4),
                const Text('kg', style: TextStyle(fontSize: 18)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCircularButton(
                  onPressed: () => provider.updateWeight(provider.weight - 1),
                  icon: Icons.remove,
                  colorScheme: colorScheme,
                ),
                const SizedBox(width: 16),
                _buildCircularButton(
                  onPressed: () => provider.updateWeight(provider.weight + 1),
                  icon: Icons.add,
                  colorScheme: colorScheme,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAgeSection(
    BMICalculatorProvider provider,
    ColorScheme colorScheme,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Yaş',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              provider.age.toString(),
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCircularButton(
                  onPressed: () => provider.updateAge(provider.age - 1),
                  icon: Icons.remove,
                  colorScheme: colorScheme,
                ),
                const SizedBox(width: 16),
                _buildCircularButton(
                  onPressed: () => provider.updateAge(provider.age + 1),
                  icon: Icons.add,
                  colorScheme: colorScheme,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularButton({
    required VoidCallback onPressed,
    required IconData icon,
    required ColorScheme colorScheme,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      child: Icon(icon, size: 28),
    );
  }
}
