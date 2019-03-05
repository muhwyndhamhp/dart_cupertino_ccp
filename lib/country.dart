class Country {
  final String countryCode;
  final String countryName;
  final int phoneCode;
  final int index;

  const Country(this.index, this.countryCode, this.countryName, this.phoneCode);

  Country.fromMap(Map<String, dynamic> map)
      : countryCode = map['country_code'],
        countryName = map['country_name'],
        phoneCode = map['dialling_code'],
        index = map['index'];
}
