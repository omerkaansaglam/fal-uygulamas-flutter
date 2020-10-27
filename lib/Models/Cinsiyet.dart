class Cinsiyet {
  int id;
  String ad;

  Cinsiyet({this.id, this.ad});

  Cinsiyet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ad = json['ad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ad'] = this.ad;
    return data;
  }
}
