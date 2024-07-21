import 'package:flutter/material.dart';


class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selectedLanguage = 'English';

  final List<String> _languages = [
    'English',
    'Bahasa Indonesia',
    'Español',
    'Français',
    'Deutsch',
    '中文',
    '日本語',
    '한국어',
    'Русский',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _languages.length,
        itemBuilder: (context, index) {
          return RadioListTile<String>(
            title: Text(_languages[index]),
            value: _languages[index],
            groupValue: _selectedLanguage,
            onChanged: (String? value) {
              setState(() {
                _selectedLanguage = value!;
              });
            },
          );
        },
      ),
    );
  }
}