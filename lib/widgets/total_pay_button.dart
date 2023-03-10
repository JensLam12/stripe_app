import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TotalPayButton extends StatelessWidget {
  const TotalPayButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: 100,
      padding: const EdgeInsets.symmetric( horizontal: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Total', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold) ),
              Text('250.55 USD', style: TextStyle( fontSize: 20) )
            ],
          ),
          const _BtnPay()
        ],
      ),
    );
  }
}


class _BtnPay extends StatelessWidget {
  const _BtnPay({super.key});

  Widget buildCardButton(BuildContext context) {
    return MaterialButton(
      height: 45,
      minWidth: 170,
      shape: const StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      child: Row(
        children: const [
          Icon(
            FontAwesomeIcons.creditCard,
            color: Colors.white,
          ),
          Text("  Pay", style: TextStyle( color: Colors.white, fontSize: 22 ))
        ],
      ),
      onPressed: () {},
    );
  }
  
  Widget buildAppleAndGooglePay(BuildContext context) {
    return MaterialButton(
      height: 45,
      minWidth: 170,
      shape: const StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      child: Row(
        children: [
          Icon(
            Platform.isAndroid
            ? FontAwesomeIcons.google
            : FontAwesomeIcons.appStore,
            color: Colors.white,
          ),
          const Text(" Pay", style: TextStyle( color: Colors.white, fontSize: 22 ))
        ],
      ),
      onPressed: () {},
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return true
    ? buildCardButton(context)
    : buildAppleAndGooglePay(context);
  }
}