class Coronacase {
  final String countryname;
  final int totalcase;
  final String countrylogo;
  final int activecase;

  Coronacase({
    required this.countryname,
    required this.totalcase,
    required this.countrylogo,
    required this.activecase,
  });

  factory Coronacase.fromMap({required Map data}) {
    return Coronacase(
      countryname: data["country"],
      totalcase: data["cases"],
      countrylogo: data["countryInfo"]["flag"],
      activecase: data["active"],
    );
  }
}
