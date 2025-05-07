import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:jara_market/screens/profile_screen/controller/profile_controller.dart';
import '../../widgets/status_bar.dart';


ProfileController controller = Get.put(ProfileController());
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StatusBar(),
            // Profile header with curved background
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            // Profile picture (positioned to overlap the curved background)
            Transform.translate(
              offset: const Offset(0, -80),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.person,
                          size: 80,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(26), // Changed from withOpacity(0.1)
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.edit,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Name
            Transform.translate(
              offset: const Offset(0, -60),
              child: const Center(
                child: Text(
                  'Jacob Peter',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Contact Information
            Transform.translate(
              offset: const Offset(0, -40),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Contact Information',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              const Text(
                                'Edit',
                                style: TextStyle(
                                  color: Color(0xFFFF9800),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                                color: Colors.orange.shade700,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        children: [
                          _buildInfoRow(
                            'Phone Number',
                            '+49 151 23456789',
                            Icons.phone,
                            const Color(0xFFFF9800),
                          ),
                          const Divider(height: 24),
                          _buildInfoRow(
                            'Email Address',
                            'hello@mystiquelounge.com',
                            Icons.email,
                            const Color(0xFFFF9800),
                          ),
                          const Divider(height: 24),
                          _buildInfoRow(
                            'Address',
                            '4905 Verla Rapid, South Nicklaus 50971',
                            Icons.location_on,
                            const Color(0xFFFF9800),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        children: [
                          _buildSettingRow(
                            'Notifications',
                            Icons.notifications_none,
                            true,
                          ),
                          const Divider(height: 24),
                          _buildSettingRow(
                            'Wallet',
                            Icons.account_balance_wallet_outlined,
                            false,
                            onTap: () {
                              Navigator.pushNamed(context, '/wallet');
                            },
                          ),
                          const Divider(height: 24),
                          _buildSettingRow(
                            'Referral',
                            Icons.people_outline,
                            false,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        children: [
                          _buildSettingRow(
                            'Security',
                            Icons.security_outlined,
                            false,
                          ),
                          const Divider(height: 24),
                          _buildSettingRow(
                            'Help & Support',
                            Icons.help_outline,
                            false,
                          ),
                          const Divider(height: 24),
                          _buildSettingRow(
                            'Contact Us',
                            Icons.message_outlined,
                            false,
                          ),
                          const Divider(height: 24),
                          _buildSettingRow(
                            'Privacy Policy',
                            Icons.lock_outline,
                            false,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    String title,
    String value,
    IconData icon,
    Color iconColor,
  ) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Icon(icon, color: iconColor, size: 24),
      ],
    );
  }

  Widget _buildSettingRow(
    String title,
    IconData icon,
    bool hasSwitch, {
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.black87),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          if (hasSwitch)
            const Text(
              'On',
              style: TextStyle(
                color: Color(0xFFFF9800),
                fontWeight: FontWeight.w600,
              ),
            )
          else if (onTap != null)
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.black54,
            ),
        ],
      ),
    );
  }
}
