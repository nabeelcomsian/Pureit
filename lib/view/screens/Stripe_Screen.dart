import 'package:flutter/material.dart';
import 'package:pureit/Services/Stripe_Services.dart';

class StripeScreen extends StatefulWidget {
  const StripeScreen({super.key});

  @override
  State<StripeScreen> createState() => _StripeScreenState();
}

class _StripeScreenState extends State<StripeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            color: Colors.green,
            onPressed: () {
              StripeServices.instance.makePayment(20, 'USD');
            },
            child: Text('purchase'),
          ),
        ],
      ),
    );
  }
}
