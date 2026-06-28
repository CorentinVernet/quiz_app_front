import 'package:flutter/material.dart';
import '../../../i18n/generated/strings.g.dart';
import 'package:quiz_app_front/pages/main_page.dart';

class AcceptPlayerPageBottomNavigationBar extends StatelessWidget {
  const AcceptPlayerPageBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(bottom: 70, left: 20),
    child: InkWell(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 2),
            child: Icon(Icons.keyboard_arrow_left),
          ),
          Text(
            t.accept_player_page.come_back_to_home_page,
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      },
    ),
  );
}
