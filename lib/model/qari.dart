class Qari {
  String? name;
  String? path;
  String? format;

  Qari({this.name, this.path, this.format});

  factory Qari.fromJson(Map<String, dynamic> json) {
    return Qari(
        name: json['name'],
        path: json['relative_path'],
        format: json['file_formats']);
  }
}
