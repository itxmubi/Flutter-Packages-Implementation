import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'data.dart';

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'flutter_typeahead demo',
      home: CupertinoPageScaffold(
        child: FavoriteCitiesPage(),
      ), //MyHomePage(),
    );
  }
}

class FavoriteCitiesPage extends StatefulWidget {
  const FavoriteCitiesPage({super.key});

  @override
  _FavoriteCitiesPage createState() => _FavoriteCitiesPage();
}

class _FavoriteCitiesPage extends State<FavoriteCitiesPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
  final CupertinoSuggestionsBoxController _suggestionsBoxController =
      CupertinoSuggestionsBoxController();
  String favoriteCity = 'Unavailable';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 100.0,
            ),
            const Text('What is your favorite city?'),
            CupertinoTypeAheadFormField(
              getImmediateSuggestions: true,
              suggestionsBoxController: _suggestionsBoxController,
              textFieldConfiguration: CupertinoTextFieldConfiguration(
                controller: _typeAheadController,
              ),
              suggestionsCallback: (pattern) {
                return Future.delayed(
                  const Duration(seconds: 1),
                  () => CitiesService.getSuggestions(pattern),
                );
              },
              itemBuilder: (context, String suggestion) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    suggestion,
                  ),
                );
              },
              onSuggestionSelected: (String suggestion) {
                _typeAheadController.text = suggestion;
              },
              validator: (value) =>
                  value!.isEmpty ? 'Please select a city' : null,
            ),
            const SizedBox(
              height: 10.0,
            ),
            CupertinoButton(
              child: const Text('Submit'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  setState(() {
                    favoriteCity = _typeAheadController.text;
                  });
                }
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Your favorite city is $favoriteCity!',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
