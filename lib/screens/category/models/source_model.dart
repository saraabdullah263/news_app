
class SourcesModel {
  String? status;
  List<Sources>? sources;

  SourcesModel({this.status, this.sources});

  SourcesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = <Sources>[];
      json['sources'].forEach((v) {
        sources!.add( Sources.fromJson(v));
      });
    }
  }
   static List<Sources> fromList(List<Map<String,dynamic>>list){
    return list.map(Sources.fromJson).toList();
  }
}

class Sources {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Sources(
      {this.id,
      this.name,
      this.description,
      this.url,
      this.category,
      this.language,
      this.country});

  Sources.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
    language = json['language'];
    country = json['country'];
  }
  static List<Sources> fromList(List<Map<String,dynamic>>list){
    return list.map(Sources.fromJson).toList();
  }
}