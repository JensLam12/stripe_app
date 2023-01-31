import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_app/data/cards.dart';
import 'package:stripe_app/screens/card_screen.dart';
import 'package:stripe_app/widgets/total_pay_button.dart';

import '../helpers/helpers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of( context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pay"),
        actions: [
          IconButton(
            onPressed: () async { 
              // showLoading(context);
              // await Future.delayed( const Duration(seconds: 1) );
              // Navigator.pop(context);

              showAlert(context, 'Title', 'Text');
            }, 
            icon: const Icon( Icons.add)
          )
        ],
      ),
      body: Stack(
        children: [

          Positioned(
            width: size.width,
            height: size.height,
            top: 200,
            child: PageView.builder(
              controller: PageController(
                viewportFraction: 0.85
              ),
              physics: const BouncingScrollPhysics(),
              itemCount: tarjetas.length,
              itemBuilder: (_, i) {
                final tarjeta = tarjetas[i];
          
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, NavigateFadeIn(context, CardScreen() ));
                  },
                  child: Hero(
                    tag: tarjeta.cardNumber,
                    child: CreditCardWidget(
                      cardNumber: tarjeta.cardNumber, 
                      expiryDate: tarjeta.expiracyDate, 
                      cardHolderName: tarjeta.cardHolderName, 
                      cvvCode: tarjeta.cvv, 
                      showBackView: false, 
                      onCreditCardWidgetChange: ((p0) {
                        
                      }) 
                    ),
                  ),
                );
              },
            ),
          ),
          const Positioned(
            bottom: 0,
            child: TotalPayButton(),
          )
        ],
      )
    );
  }
}