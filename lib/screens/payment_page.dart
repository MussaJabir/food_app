import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_app/components/custom_button.dart';

import 'delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  //User want to make the payment
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      //Only show dialog if form is valid
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text('Confirm Payment'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text('Card Number: $cardNumber'),
                    Text('Expiry Date: $expiryDate'),
                    Text('Card Holder Name: $cardHolderName'),
                    Text('Cvv: $cvvCode'),
                  ],
                ),
              ),
              actions: [
                //Yes button
                TextButton(
                  onPressed:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeliveryProgressPage(),
                        ),
                      ),
                  child: Text('Yes'),
                ),

                //Cancel button
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
              ],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text('Checkout'),
      ),
      body: Column(
        children: [
          //Credit card
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            onCreditCardWidgetChange: (po) {},
          ),
          CreditCardForm(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (data) {
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
              });
            },
            formKey: formKey,
          ),
          Spacer(),
          CustomButton(onTap: userTappedPay, text: 'Pay'),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
