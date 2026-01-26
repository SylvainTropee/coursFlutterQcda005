enum Genre { Comedy, SF, Drama }

class Movie {
  String name;
  int year;
  Genre genre;

  Movie({required this.name, required this.year, this.genre = Genre.Comedy});

  Movie.fromJson(Map<String, dynamic> json)
    : this.name = json['name'],
      this.year = json['year'],
      this.genre = json['genre'];

  @override
  String toString() {
    return 'Movie{name: $name, year: $year, genre: $genre}';
  }
}

void main() {
  // Movie avatar = Movie("Avatar 3", 2025, Genre.SF);
  // print(avatar);

  Movie interstellar = Movie(name: "Interstellar", year: 2014);
  print(interstellar);

  var lotr = {
    "name" : "Le seigneur des anneaux",
    "year" : 2001,
    "genre" : Genre.Drama
  };
  
  Movie seigneur = Movie.fromJson(lotr);
  print(seigneur);
}
