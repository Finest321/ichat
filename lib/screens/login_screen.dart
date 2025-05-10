import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.lock_outline, color: Colors.black),
        title: Text('Login with Phone', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
              Image.asset('assets/images/login.png', height: 150),
              SizedBox(height: 30),
              Text(
                'Enter your phone number',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  prefixText: '+234 ',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Obx(() {
                return ElevatedButton(
                  onPressed:
                      authController.isLoading.value
                          ? null
                          : () => authController.loginWithPhone(
                            "+234${phoneController.text.trim()}",
                          ),
                  child:
                      authController.isLoading.value
                          ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                          : Text('Send OTP'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                );
              }),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
