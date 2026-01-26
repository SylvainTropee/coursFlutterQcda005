class Course {
  String name;
  List<double> notes;

  Course({required this.name, required this.notes});

  double getAverage() {
    double average = notes.reduce((a, b) => a + b) / notes.length;
    print("La moyenne en $name est de $average !");
    return average;
  }
}

void main() {
  List<Course> courses = [
    Course(name: "Français", notes: [10, 12, 15, 10, 8]),
    Course(name: "Maths", notes: [0, 2, 15, 7, 8]),
    Course(name: "Informatique", notes: [20, 12, 15, 10, 17.5]),
  ];

  double sumTotal = 0.0;

  for (Course c in courses) {
    sumTotal += c.getAverage();
  }
  print("La moyenne générale est de ${sumTotal / courses.length}");
}
