import 'package:flutter/material.dart';
import '../../../i18n/generated/strings.g.dart';

class StatusLabel extends StatelessWidget {
  const StatusLabel({super.key});

  @override
  Widget build(BuildContext context) =>
          Container(
              margin: EdgeInsets.only(top: 80, bottom: 150),
              child: Text(
                t.between_rounds_page.round_status,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40),
              ),
            ); 
} 