import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class ScrollExample extends StatelessWidget {
  final List<String> items = List.generate(50, (index) => "Item $index");

  ScrollExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Suggestion box will resize when scrolling"),
        ),
      ),
      const SizedBox(height: 200),
      TypeAheadField<String>(
        getImmediateSuggestions: true,
        textFieldConfiguration: const TextFieldConfiguration(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'What are you looking for?'),
        ),
        suggestionsCallback: (String pattern) async {
          return items
              .where((item) =>
                  item.toLowerCase().startsWith(pattern.toLowerCase()))
              .toList();
        },
        itemBuilder: (context, String suggestion) {
          return ListTile(
            title: Text(suggestion),
          );
        },
        onSuggestionSelected: (String suggestion) {
          print("Suggestion selected");
        },
      ),
      const SizedBox(height: 500),
    ]);
  }
}
