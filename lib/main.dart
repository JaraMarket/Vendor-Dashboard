import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:jara_market/routes/app_routes.dart';
// import 'screens/onboarding_screen/onboarding_screen.dart';
// import 'screens/profile_setup_screen/profile_setup_screen.dart';
// import 'screens/address_screen/address_screen.dart';
// import 'screens/summary_screen/summary_screen.dart';
// import 'screens/dashboard_screen/dashboard_screen.dart';
// import 'screens/profile_screen/profile_screen.dart';
// import 'screens/earnings_screen/earnings_screen.dart';
// import 'screens/orders_screen/orders_screen.dart';
// import 'screens/wallet_screen/wallet_screen.dart';
// import 'screens/splash_screen/splash_screen.dart';
// import 'screens/create_account/create_account.dart';
// import 'screens/email_verification/email_verification.dart';
// import 'screens/business_screen/business_screen.dart';
// import 'screens/product_selection/product_selection.dart';
// import 'screens/shop_size/shop_size.dart';
// import 'screens/payment_method/payment_method.dart';
// import 'screens/job_details/job_details.dart';
// import 'screens/market_list/market_list.dart';
// import 'screens/withdraw_money/withdraw_money.dart';
// import 'screens/bank_selection/bank_selection.dart';
// import 'screens/order_history/order_history.dart';
// import 'screens/job_progress/job_progress.dart';
// import 'screens/job_completed/job_completed.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Jara Market',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF9800),
          primary: const Color(0xFFFF9800),
        ),
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFFF9800)),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF9800),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      initialRoute: AppRoutes.splash,
      // home: const SplashScreen(),
      getPages: AppRoutes.pages,
      // routes: {
      //   '/onboarding': (context) => const OnboardingScreen(),
      //   '/create-account': (context) => const CreateAccountScreen(),
      //   '/email-verification': (context) => const EmailVerificationScreen(),
      //   '/profile-setup': (context) => const ProfileSetupScreen(),
      //   '/business-name': (context) => const BusinessNameScreen(),
      //   '/product-selection': (context) => const ProductSelectionScreen(),
      //   '/shop-size': (context) => const ShopSizeScreen(),
      //   '/address': (context) => const AddressScreen(),
      //   '/payment-method': (context) => const PaymentMethodScreen(),
      //   '/summary': (context) => const SummaryScreen(),
      //   '/dashboard': (context) => const DashboardScreen(),
      //   '/job-details': (context) => const JobDetailsScreen(),
      //   '/job-progress': (context) => const JobProgressScreen(),
      //   '/job-completed': (context) => const JobCompletedScreen(),
      //   '/market-list': (context) => const MarketListScreen(),
      //   '/withdraw-money': (context) => const WithdrawMoneyScreen(),
      //   '/bank-selection': (context) => const BankSelectionScreen(),
      //   '/profile': (context) => const ProfileScreen(),
      //   '/earnings': (context) => const EarningsScreen(),
      //   '/orders': (context) => const OrdersScreen(),
      //   '/order-history': (context) => const OrderHistoryScreen(),
      //   '/wallet': (context) => const WalletScreen(),
      // },
    );
  }
}
