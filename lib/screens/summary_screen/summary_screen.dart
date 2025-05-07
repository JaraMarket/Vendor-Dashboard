import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:jara_market/screens/summary_screen/controller/summary_controller.dart';
import '../../widgets/status_bar.dart';
import '../../widgets/back_button.dart';

SummaryController summaryController = Get.put(SummaryController());

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StatusBar(),
              const SizedBox(height: 16),
              Row(
                children: [
                  const CustomBackButton(),
                  const SizedBox(width: 16),
                  const Text(
                    'Summary',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle('Business Details'),
                      const SizedBox(height: 16),
                      _buildBusinessDetails(),
                      const SizedBox(height: 24),
                      _buildSectionTitle('Payment Method'),
                      const SizedBox(height: 16),
                      _buildPaymentMethod(),
                      const SizedBox(height: 24),
                      _buildSectionTitle('Subscription Plan'),
                      const SizedBox(height: 16),
                      _buildSubscriptionPlan(),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/dashboard',
                    (route) => false,
                  );
                },
                child: const Text('Done'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildBusinessDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(Icons.person, color: Colors.grey.shade500),
              ),
            ),
            const SizedBox(width: 16),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Victoria James',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Spices',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        _buildInfoRow('Phone Number', '+234 890 864 6754'),
        const SizedBox(height: 16),
        _buildInfoRow('Email Address', 'hello@victoriajames.com'),
        const SizedBox(height: 16),
        _buildInfoRow('Address', 'Uran Street, Uyo'),
        const SizedBox(height: 16),
        _buildInfoRow('Website', '@victoriajames'),
      ],
    );
  }

  Widget _buildPaymentMethod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Online Payment',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Lorem ipsum dolor sit amet consectetur. Fames diam lobortis et tellus. Viverra in ut integer iaculis lectus.',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildSubscriptionPlan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Lorem Ipsum Dolor Sit',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Lorem ipsum dolor sit amet consectetur. Fames diam lobortis et tellus. Viverra in ut integer iaculis lectus.',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
