import 'package:flutter/material.dart';
import 'package:lofi/constants.dart';

class Mix extends StatelessWidget {
  Mix(
      {this.mixName,
      this.cover1URL,
      this.cover2URL,
      this.cover3URL,
      this.cover4URL});

  final String mixName, cover1URL, cover2URL, cover3URL, cover4URL;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kBorderRadiusDefault)),
                child: Image.asset(
                  cover1URL,
                  height: 75,
                  width: 75,
                  fit: BoxFit.cover,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(kBorderRadiusDefault)),
                child: Image.asset(
                  cover2URL,
                  height: 75,
                  width: 75,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(kBorderRadiusDefault)),
                child: Image.asset(
                  cover3URL,
                  height: 75,
                  width: 75,
                  fit: BoxFit.cover,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(kBorderRadiusDefault)),
                child: Image.asset(
                  cover4URL,
                  height: 75,
                  width: 75,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            mixName,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
