class Language {
  final String? language;
  final String? languageCode;

  Language({this.language, this.languageCode});

  @override
  String toString() {
    return 'Language(language: $language, languageCode: $languageCode)';
  }
}
