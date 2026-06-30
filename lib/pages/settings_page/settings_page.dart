import 'package:flutter/material.dart';
import 'package:quiz_app_front/pages/settings_page/widgets/back_arrow.dart';
import 'package:quiz_app_front/pages/settings_page/widgets/settings_page_label.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:quiz_app_front/i18n/generated/strings.g.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _darkMode = false;
  List<String> get languageList => [
    t.settings_page.languages.english,
    t.settings_page.languages.french,
    t.settings_page.languages.german,
    t.settings_page.languages.italian,
    t.settings_page.languages.spanish,
    t.settings_page.languages.russian,
    t.settings_page.languages.arabic,
  ];
  String selectedLanguage = t.settings_page.selected_language;

  void main() => runApp(const SettingsPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 96, 71, 219),
              Color.fromARGB(255, 100, 231, 148),
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              child: Column(children: const [BackArrow(), SettingsPageLabel()]),
            ),

            // le reste prend le reste de l'écran
            Expanded(
              child: SettingsList(
                sections: [
                  SettingsSection(
                    title: Text(t.settings_page.general_section.title),
                    tiles: [
                      SettingsTile.navigation(
                        leading: const Icon(Icons.language),
                        title: Text(
                          t.settings_page.general_section.language_section,
                        ),
                        value: Text(selectedLanguage),
                        onPressed: (context) async {
                          final language = await showDialog<String>(
                            context: context,
                            builder: (context) => SimpleDialog(
                              title: Text(
                                t
                                    .settings_page
                                    .general_section
                                    .choose_language_popup,
                                style: TextStyle(fontSize: 30),
                              ),
                              children: [
                                SizedBox(
                                  width: 400,
                                  child: Column(
                                    children: languageList.map((language) {
                                      return SimpleDialogOption(
                                        onPressed: () =>
                                            Navigator.pop(context, language),
                                        child: Text(
                                          language,
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          );

                          if (language != null) {
                            setState(() {
                              selectedLanguage = language;
                            });
                          }
                        },
                      ),
                      SettingsTile.switchTile(
                        leading: const Icon(Icons.notifications),
                        title: Text(
                          t.settings_page.general_section.notification,
                        ),
                        description: Text(
                          t
                              .settings_page
                              .general_section
                              .notification_description,
                        ),
                        initialValue: _notificationsEnabled,
                        onToggle: (value) =>
                            setState(() => _notificationsEnabled = value),
                      ),
                    ],
                  ),

                  SettingsSection(
                    title: Text(t.settings_page.appearance_section.title),
                    tiles: [
                      SettingsTile.switchTile(
                        leading: const Icon(Icons.dark_mode),
                        title: Text(
                          t.settings_page.appearance_section.dark_mode_section,
                        ),
                        initialValue: _darkMode,
                        onToggle: (value) => setState(() => _darkMode = value),
                      ),
                    ],
                  ),

                  SettingsSection(
                    title: Text(t.settings_page.account_section.title),
                    tiles: [
                      SettingsTile.navigation(
                        leading: const Icon(Icons.email),
                        title: Text(
                          t.settings_page.account_section.change_email_section,
                        ),
                        onPressed: (context) {},
                      ),
                      SettingsTile.navigation(
                        leading: const Icon(Icons.logout),
                        title: Text(
                          t.settings_page.account_section.sign_out_section,
                        ),
                        onPressed: (context) {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
