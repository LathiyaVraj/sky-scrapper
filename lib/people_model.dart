class Random {
  final String gender;
  final String first;
  final String last;
  final String city;
  final String country;
  final String email;
  final int age;
  final String phone;
  final String pic;

  Random({
    required this.gender,
    required this.first,
    required this.last,
    required this.city,
    required this.country,
    required this.email,
    required this.age,
    required this.phone,
    required this.pic,
  });

  factory Random.fromMap({required Map<String, dynamic> data}) {
    return Random(
        gender: data["results"][0]["gender"],
        first: data["results"][0]["name"]["first"],
        last: data["results"][0]["name"]["last"],
        city: data["results"][0]["location"]["city"],
        country: data["results"][0]["location"]["country"],
        email: data["results"][0]["email"],
        age: data["results"][0]["dob"]["age"],
        phone: data["results"][0]["cell"],
        pic: data["results"][0]["picture"]["medium"]);
  }
}
