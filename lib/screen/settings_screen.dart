import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'set_screen.dart';
import 'languages_screen.dart';
import 'package:kuva/enums.dart';
import 'package:kuva/models/menu_info.dart';
import 'package:kuva/views/homepage.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool lockInBackground = true;
  bool notificationsEnabled = true;
  // double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        //actions: [Text("Ronik")],
      ),
      body: buildSettingsList(),
    );
  }

  Widget buildSettingsList() {
    return SettingsList(
      sections: [
        SettingsSection(
          title: 'Settings',
          tiles: [
            SettingsTile(
              title: 'Alarm',
              subtitle: 'Set Alarm',
              leading: Icon(Icons.alarm),
              onPressed: (context) {
                /* 
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider<MenuInfo>(
                            create: (context) => MenuInfo(MenuType.clock),
                            child: HomePage(),
                          )),
                ); */
              },
            ),
            SettingsTile(
              title: 'Language',
              subtitle: 'English',
              leading: Icon(Icons.language),
              onPressed: (context) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => LanguagesScreen(),
                ));
              },
            ),
            SettingsTile(
              title: 'Number of Sets',
              subtitle: 'Select Number of Sets',
              leading: Icon(Icons.add),
              onPressed: (context) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => SetScreen(),
                ));
              },
            ),
            SettingsTile(
              title: 'Categories',
              subtitle: 'Goto Categories Page',
              leading: Icon(Icons.category),
              onPressed: (context) {
                Navigator.pushNamed(context, '/');
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (_) => LanguagesScreen(),
                // ));
                // redirect to main page
              },
            ),
            SettingsTile(
              title: 'Transaction History',
              subtitle: 'Number of Days Remaining in Subscription',
              leading: Icon(Icons.history),
              onPressed: (context) {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (_) => LanguagesScreen(),
                // ));
                // new page - transaction to days left
              },
            ),
            SettingsTile.switchTile(
              title: 'Push Notification',
              leading: Icon(Icons.notifications),
              switchValue: lockInBackground,
              onToggle: (bool value) {
                setState(() {
                  lockInBackground = value;
                  notificationsEnabled = value;
                });
                // take onpress event and redirect to notifications page
              },
            ),
            SettingsTile(
              title: 'Playlist',
              subtitle: 'Your Customized Playlist',
              leading: Icon(Icons.playlist_play),
              onPressed: (context) {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (_) => LanguagesScreen(),
                // ));
                // redirect to the page after checkbox page
              },
            ),
            SettingsTile(
              title: 'Playback Speed',
              subtitle: 'Suit your style',
              leading: Icon(Icons.shutter_speed),
              /* trailing: Slider(
                value: _currentSliderValue,
                min: 0,
                max: 100,
                divisions: 5,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                  // value is in _currentSliderValue
                },
              ),   */
              // check this slider
              onPressed: (context) {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (_) => LanguagesScreen(),
                // ));
                // redirect to the page of 0.25x to 2.00x
              },
            ),
            SettingsTile(
              title: 'FAQ',
              subtitle: 'Answering Frequently Asked Questions',
              leading: Icon(Icons.question_answer),
              onPressed: (context) {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (_) => LanguagesScreen(),
                // ));
                // redirect to FAQ page
              },
            ),
          ],
        ),
        // SettingsSection(
        //   title: 'Account',
        //   tiles: [
        //     SettingsTile(title: 'Phone number', leading: Icon(Icons.phone)),
        //     SettingsTile(title: 'Email', leading: Icon(Icons.email)),
        //     SettingsTile(title: 'Sign out', leading: Icon(Icons.exit_to_app)),
        //   ],
        // ),
        CustomSection(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 22, bottom: 8),
              ),
              Text(
                'Kuva',
                style: TextStyle(color: Color(0xFF777777)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
