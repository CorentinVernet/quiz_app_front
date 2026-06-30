import "package:flutter/material.dart";

class Theme extends StatelessWidget {
  final Color themeColor;
  final String themeName;
  final String roundName;
  final void Function() onThemePressed;

  const Theme({
    super.key,
    required this.themeName,
    required this.roundName,
    required this.themeColor,
    required this.onThemePressed,
  });

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
    child: SizedBox(
      width: double.infinity,
      child: Card(
        color: themeColor,
        child: InkWell(
          onTap: onThemePressed,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              themeName,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ),
      ),
    ),
  );
}
