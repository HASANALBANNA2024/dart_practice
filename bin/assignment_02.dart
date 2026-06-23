void main() {
  // Primary students list
  List<String> initialStudents = ["Tonmoy", "Sakib", "Rahat", "Nafis"];

  // Conditional variable
  bool isNewStudent = true;

  // Spread operator and collection if to combine lists
  List<String> students = [...initialStudents, if (isNewStudent) "Rahim"];

  // Set of courses
  Set<String> courses = {"Flutter", "Dart", "Git"};

  // Create map using name and age
  Map<String, int> studentAges = {
    "Tonmoy": 22,
    "Sakib": 23,
    "Rahat": 21,
    "Nafis": 24,
    if (isNewStudent) "Rahim": 20,
  };

  // ---- Output Print Report ----

  // Student list print
  print("Students:");
  print(students);
  print("");

  // Course set print
  print("Courses:");
  print(courses);
  print("");

  // Using loop to print map data
  print("Student Ages:");
  studentAges.forEach((name, age) {
    print("$name -> $age");
  });
}
