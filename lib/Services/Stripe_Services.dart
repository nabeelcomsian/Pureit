import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pureit/utils/Stripe_Const.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeServices {
  StripeServices._();
  static final StripeServices instance = StripeServices._();

  Future<void> makePayment(int amount, String Currency) async {
    try {
      String? paymentIntenClientSecret =
          await _createPaymentIntent(amount, Currency);
      if (paymentIntenClientSecret == null) return;
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntenClientSecret,
            merchantDisplayName: 'Tech House'),
      );
      await _processPyament();
    } catch (e) {
      print(e);
    }
  }

  Future<String?> _createPaymentIntent(int amount, String currency) async {
    try {
      final Dio dio = Dio();
      Map<String, dynamic> data = {
        "amount": calculateAmount(amount),
        "currency": currency,
      };
      var response = await dio.post(
        'https://api.stripe.com/v1/payment_intents',
        data: data,
        options:
            Options(contentType: Headers.formUrlEncodedContentType, headers: {
          "Authorization": "Bearer $stripeSecretKey",
          "Content-Type": "application/x-www-form-urlencoded",
        }),
      );
      if (response.data != null) {
        debugPrint("here is the response ${response.data} ");
        return response.data["client_secret"];
      }
      return null;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> _processPyament() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      print(e);
    }
  }

  String calculateAmount(int amount) {
    final calculatedAmount = amount * 100;
    return calculatedAmount.toString();
  }
}
