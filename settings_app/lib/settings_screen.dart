import 'package:flutter/material.dart';
import 'package:settings_app/preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkmode = false;      //no se cambiará porque está en un stateless. Se tiene que crear un futurebuilder!
  String _language = "es";
  double _fontsize = 16;


  @override initState(){        //PARA QUE SE CARGUE NAMAS ABRIR LA APP
    super.initState();
      _loadPreferences();
  }


  _savePreferences(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is String) {
      await prefs.setString(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    }
  }

  _loadPreferences () async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _darkmode = prefs.getBool(PreferencesKeys.darkMode) ?? false;
      _language = prefs.getString(PreferencesKeys.language)?? "es";
      _fontsize = prefs.getDouble(PreferencesKeys.fontSize)?? 16;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          title: Text("Modo oscuro"),
          value: _darkmode,
          onChanged: (darkMode) {
            setState(() => _darkmode = darkMode);
            _savePreferences(PreferencesKeys.darkMode, darkMode);
          },
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 8,
            bottom: 8,
          ),
          child: DropdownButtonFormField(
            initialValue: _language,
            items: [
              DropdownMenuItem(value: "es", child: Text("Español")),
              DropdownMenuItem(value: "en", child: Text("Inlgés")),
              DropdownMenuItem(value: "ch", child: Text("Chino")),
            ],
            onChanged: (language) {
              if (language != null) {
                setState(() => _language = language);
                _savePreferences(PreferencesKeys.language, language);

              }
            },
            decoration: InputDecoration(label: Text("idioma")),
          ),
        ),
        Text("Tamaño de la fuente ${_fontsize.toStringAsFixed(0)}"),
        Slider(
          min: 14,
          max: 24,
          value: _fontsize,
          onChanged: (fontSize) {
            setState(() => _fontsize = fontSize);
            _savePreferences(PreferencesKeys.fontSize, fontSize);
          },
        ),
      ],
    );
  }
}
