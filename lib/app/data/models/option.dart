import 'dart:convert';

class Option {
  final String value;
  final String label;

  Option({required this.value, required this.label});

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      value: json['value'],
      label: json['label'],
    );
  }

  Map<String, dynamic> toJson() => {
    'value': value,
    'label': label,
  };

  static List<Option> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((e) => Option.fromJson(e)).toList();
  }

  static List<dynamic> toJsonList(List<Option> OptionList) {
    return OptionList.map((e) => e.toJson()).toList();
  }
}