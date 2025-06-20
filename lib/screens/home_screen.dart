import 'package:flutter/material.dart';
import '../configs/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Çok Fonksiyonlu Hesap Makinesi')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Hesap Makinesi Modları',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),

            _buildModuleCard(
              context: context,
              title: 'Temel Hesap Makinesi',
              description:
                  'Temel dört işlem, yüzde hesaplama ve daha fazlası...',
              icon: Icons.calculate_outlined,
              color: colorScheme.primary,
              route: Routes.basicCalculator,
            ),

            const SizedBox(height: 16),

            _buildModuleCard(
              context: context,
              title: 'BMI Hesaplayıcı',
              description:
                  'Vücut kitle indeksinizi hesaplayın ve sağlık durumunuzu öğrenin.',
              icon: Icons.monitor_weight_outlined,
              color: colorScheme.secondary,
              route: Routes.bmiCalculator,
            ),

            const Spacer(),

            const Center(
              child: Text(
                'Bu uygulama farklı hesap makinesi modları arasında\ngeçiş yapabilmeniz için tasarlanmıştır.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildModuleCard({
    required BuildContext context,
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required String route,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, size: 32, color: color),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
