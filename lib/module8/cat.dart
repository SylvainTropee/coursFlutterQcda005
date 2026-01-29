class Cat {
  String id;
  String url;

  Cat(this.id, this.url);

  Cat.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        url = json['url'];

  @override
  String toString() {
    return 'Cat{id: $id, url: $url}';
  }
}
