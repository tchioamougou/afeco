class LanguageModel {
  final String code;
  final String name;

  LanguageModel({required this.code, required this.name});

  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
    code: json['code'] as String,
    name: json['name'] as String,
  );

  Map<String, dynamic> toJson() => {
    'code': code,
    'name': name,
  };
}

List<LanguageModel> languages = [
  LanguageModel(code: 'en', name: 'English'),
  LanguageModel(code: 'fr', name: 'French'),
];
