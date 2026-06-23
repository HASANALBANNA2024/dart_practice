void main() {
  /// primary students list
  List<String> initialStudents = ["Tonmoy", "Sakib", "Rahat", "Nafis"];

  /// conditional variable
  bool isNewStudent = true;

  //spread operator
  List<String> students = [...initialStudents, if (isNewStudent) "Rahim"];

  /// set of course
  Set<String> courses = {"Flutter", "Dart", "Git"};

  /// create map using name and age
  Map<String, int> studentAges = {
    "Tonmoy": 22,
    "Sakib": 23,
    "Rahat": 21,
    "Nafis": 24,
    if (isNewStudent) "Rahim": 20,
  };

  /// ---- output print report ----

  /// student list print
  print("Students:");
  print(students);
  print("");

  /// course set print
  print("Courses:");
  print(courses);
  print("");

  /// using loop for print map data
  print("Student Ages:");
  studentAges.forEach((name, age) {
    print("$name -> $age");
  });
}
