import 'dart:io';

/// create abstract class
abstract class Person {
  void displayRole();
}

/// create student class and extend to Person class
class Student extends Person {
  ///Encapsulation (Private Fields)
  int? _id;
  String? _name;
  int? _age;

  /// Constructor
  Student(this._id, this._name, this._age);

  /// Getters to access private fields
  int? get id => _id;
  String? get name => _name;
  int? get age => _age;

  /// Arrow Function used to display role
  @override
  void displayRole() => print("Role: Student");
}

void main() {
  /// List to store student data
  List<Student> studentList = [];

  while (true) {
    /// Menu based item for student information manager
    print("\n===== Student Information Manager =====");
    print("1. Add Student");
    print("2. View Students");
    print("3. Search Student");
    print("4. Delete Student");
    print("5. Exit");
    stdout.write("Choose: ");

    String? choice = stdin.readLineSync();

    if (choice == '1') {
      /// ---- Add Student ----
      stdout.write("Enter Student ID: ");
      int id = int.parse(stdin.readLineSync()!);

      stdout.write("Enter Student Name: ");
      String name = stdin.readLineSync()!;

      stdout.write("Enter Student Age: ");
      int age = int.parse(stdin.readLineSync()!);

      studentList.add(Student(id, name, age));
      print("Student added successfully!");
    } else if (choice == '2') {
      /// ---- View Students ----
      if (studentList.isEmpty) {
        print("No student records found.");
      } else {
        print("\n--- All Students ---");

        /// Anonymous Function used inside the loop
        studentList.forEach((student) {
          print(
            "ID: ${student.id} | Name: ${student.name} | Age: ${student.age}",
          );
          student.displayRole();
        });
      }
    } else if (choice == '3') {
      /// ---- Search Student ----
      stdout.write("Enter Student ID to Search: ");
      int searchId = int.parse(stdin.readLineSync()!);

      /// Anonymous function used here for filtering/searching
      var foundStudents = studentList.where(
        (student) => student.id == searchId,
      );

      if (foundStudents.isEmpty) {
        print("Student with ID $searchId not found.");
      } else {
        for (var student in foundStudents) {
          print(
            "Found! ID: ${student.id} | Name: ${student.name} | Age: ${student.age}",
          );
        }
      }
    } else if (choice == '4') {
      /// ---- Delete Student ----
      stdout.write("Enter Student ID to Delete: ");
      int deleteId = int.parse(stdin.readLineSync()!);

      int originalLength = studentList.length;

      /// Removes the student if the ID matches
      studentList.removeWhere((student) => student.id == deleteId);

      if (studentList.length < originalLength) {
        print("Student with ID $deleteId deleted successfully!");
      } else {
        print("Student ID not found.");
      }
    } else if (choice == '5') {
      /// ---- Exit ----
      print("Exiting application. Thank you!");
      break;
    } else {
      print("Invalid choice! Please enter a number between 1 and 5.");
    }
  }
}
