class RecipeModel{
  String? label;
  String? image;
  String? source;
  String? url;

  RecipeModel(this.label, this.image, this.source, this.url);
  
  factory RecipeModel.fromMap(Map<String, dynamic> parsedJson){
    return RecipeModel(parsedJson['label']?? null, parsedJson['image']?? null,parsedJson['source']?? null,parsedJson['url']?? null);
  }

}