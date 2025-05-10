import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import '../screens/otp_screen.dart';

class AuthController extends GetxController {
  // Observable properties
  var isLoading = false.obs;
  var countdown = 60.obs;
  String _verificationId = '';
  String _lastPhoneNumber = '';

  // Timer variable
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startCountdown();
  }

  // Start the countdown
  void startCountdown() {
    countdown.value = 60; // Reset countdown to 60 seconds
    _timer?.cancel(); // Cancel any previous timers
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        _timer?.cancel();
      }
    });
  }

  // Login with Phone Number
  Future<void> loginWithPhone(String phoneNumber) async {
    isLoading.value = true;
    _lastPhoneNumber = phoneNumber; // Save the phone number

    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Handle auto-verification
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        isLoading.value = false;
        Get.snackbar('Error', 'Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        isLoading.value = false;
        _verificationId = verificationId; // Save the verification ID
        Get.to(
          () => OtpScreen(verificationId: verificationId),
        ); // Navigate to OTP screen
        startCountdown(); // Start the countdown for OTP resend
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId; // Save the verification ID
      },
    );
  }

  // Verify OTP
  Future<void> verifyOTP(String otp) async {
    isLoading.value = true;

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: otp,
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      isLoading.value = false;
      Get.snackbar('Success', 'OTP Verified! You are logged in.');
      Get.offAllNamed('/home'); // Redirect to home screen
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Failed to verify OTP: $e');
    }
  }

  // Resend OTP
  void resendOtp() {
    if (_lastPhoneNumber.isNotEmpty) {
      loginWithPhone(
        _lastPhoneNumber,
      ); // Resend OTP using the last phone number
      startCountdown(); // Restart countdown
    }
  }
}
