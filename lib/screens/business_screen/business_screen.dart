import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jara_market/screens/business_screen/controller/business_controller.dart';
import '../../widgets/status_bar.dart';
import '../../widgets/back_button.dart';

BusinessController controller = Get.put(BusinessController());

class BusinessNameScreen extends StatefulWidget {
  const BusinessNameScreen({super.key});

  @override
  State<BusinessNameScreen> createState() => _BusinessNameScreenState();
}

class _BusinessNameScreenState extends State<BusinessNameScreen> {
  final TextEditingController _businessNameController = TextEditingController();

  @override
  void dispose() {
    _businessNameController.dispose();
    super.dispose();
  }

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
                    'Your business name',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Lorem ipsum dolor sit amet consectetur. In elementum nisi et amet sapien nibh tristique ultricies.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Business Name*',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _businessNameController,
                decoration: const InputDecoration(
                  hintText: 'Enter your business name',
                  border: OutlineInputBorder(),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/product-selection');
                },
                child: const Text('Continue'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
