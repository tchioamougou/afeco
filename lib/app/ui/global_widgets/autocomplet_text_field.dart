import 'package:afeco/app/data/models/feature_collection.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AutocompleteTextField extends StatefulWidget {

  const AutocompleteTextField({super.key, required this.onChanged});
  final ValueChanged<Location> onChanged;

  @override
  State<AutocompleteTextField> createState() => _AutocompleteTextFieldState();
}

class _AutocompleteTextFieldState extends State<AutocompleteTextField> {
  final TextEditingController _controller = TextEditingController();
  List<Feature> suggestions = [];
  final String apiUrl ='https://api.geoapify.com/v1/geocode/autocomplete?apiKey=6b345d1727d04eb9ae4363943fa7a08e&';
  Future<void> fetchSuggestions(String query) async {
    final response = await http.get(Uri.parse('${apiUrl}text=$query'));
    print(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String,dynamic>;
      FeatureCollection featureCollection = FeatureCollection.fromJson(data);
      setState(() {
        suggestions = featureCollection.features;
      });
    } else {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          onChanged: (value) {
            fetchSuggestions(value);
          },
        ),
        Column(
          children: suggestions.map((e)=>ListTile(
            title: Text(e.properties.city),
            onTap: () {

              setState(() {
                _controller.text = e.properties.country;
                widget.onChanged(e.properties);
              });

            },
          )).toList(),
        ),
      ],
    );
  }
}
