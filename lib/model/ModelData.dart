// 写一个构造类
class ModelData {
  final int id;
  final String title;
  final String author;
  final String description;
  final String imageUrl;

  ModelData(this.id, this.title, this.author, this.description, this.imageUrl);

  ModelData.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        author = json['author'],
        description = json['description'],
        imageUrl = json['imageUrl'];

  Map toJson() => {
        'title': title,
        'description': description,
        'imageUrl': imageUrl,
        'author': author,
        'id': id,
      };
}
