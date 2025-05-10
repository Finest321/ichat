import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class OtpScreen extends StatelessWidget {
  final String verificationId;
  final TextEditingController otpController = TextEditingController();

  OtpScreen({required this.verificationId});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ), // iPhone-style pop icon
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Verify OTP',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.8,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Spacer(),
                  Image.asset(
                    'assets/images/otp.png',
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Enter the OTP sent to your phone number',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'OTP Code',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 24),
                  Obx(() {
                    return ElevatedButton(
                      onPressed:
                          authController.isLoading.value
                              ? null
                              : () => authController.verifyOTP(
                                otpController.text.trim(),
                              ),
                      child:
                          authController.isLoading.value
                              ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                              : Text('Verify OTP'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 12,
                        ),
                      ),
                    );
                  }),
                  Spacer(),
                  Obx(() {
                    if (authController.countdown.value > 0) {
                      return Center(
                        child: Text(
                          'Resend OTP in ${authController.countdown.value}s',
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
                    } else {
                      return TextButton(
                        onPressed: () {
                          authController.resendOtp(); // Resend OTP logic
                        },
                        child: Text('Resend OTP'),
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
