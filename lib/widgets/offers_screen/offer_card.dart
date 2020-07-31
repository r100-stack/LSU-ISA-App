import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';
import 'package:isa_app/models/offer.dart';

class OfferCard extends StatelessWidget {
  final Offer offer;

  OfferCard(this.offer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.bathtub_outlined,
                    color: Colors.blueGrey,
                  ),
                  Text('1 - 5'),
                  SizedBox(
                    width: kDefaultMargin / 2,
                  ),
                  Icon(
                    Icons.bathtub_outlined,
                    color: Colors.blueGrey,
                  ),
                  Text('1 - 5')
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: kDefaultMargin/2, vertical: kDefaultMargin/4),
                child: Text('AVAILABLE', style: TextStyle(color: Colors.white),),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(kDefaultBorderRadius))
                ),
              )
            ],
          ),
          Text('LARK BATON ROUGE'),
          Container(
            width: 20,
            height: 5,
            color: Theme.of(context).accentColor,
          ),
          Text('\$400 - \$645'),
          Text('1200 sqft - 1400 sqft')
        ],
      ),
    );
  }
}
