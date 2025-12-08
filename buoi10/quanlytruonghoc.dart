import 'dart:io';

void main() {
  List<Classroom> classrooms = [];
  List<Student> students = [];
  List<Teacher> teachers = [];

  while (true) {
    stdout.writeln("QUẢN LÝ TRƯỜNG HỌC");
    stdout.writeln("1. Thêm lớp học");
    stdout.writeln("2. Thêm sinh viên");
    stdout.writeln("3. Thêm giáo viên");
    stdout.writeln("4. Hiển thị danh sách sinh viên trong lớp học");
    stdout.writeln("5. Hiển thị thông tin giáo viên");
    stdout.writeln("6. Hiển thị thông tin sinh viên");
    stdout.writeln("7. Thoát chương trình");
    stdout.writeln("Hãy nhập một lựa chọn: ");
    int option = int.parse(stdin.readLineSync()!);
    
    if (option == 1) {
      addClassroom(classrooms);
    } else if (option == 2) {
      if (classrooms.length == 0){
        print("Không có lớp học tồn tại. Không thể thêm sinh viên.");
      } else {
        stdout.writeln("Nhập id hoặc tên lớp học cần thêm sinh viên: ");
        String enter = stdin.readLineSync()!;
        bool isExisted = false;
        for (int i = 0; i < classrooms.length; i++){
          if (enter == classrooms[i].id || enter == classrooms[i].name){
            stdout.writeln("Nhập id sinh viên: ");
            String id = stdin.readLineSync()!;
            stdout.writeln("Nhập tên sinh viên: ");
            String name = stdin.readLineSync()!;
            stdout.writeln("Nhập tuổi sinh viên: ");
            int age = int.parse(stdin.readLineSync()!);
            stdout.writeln("Nhập giới tính sinh viên: ");
            String gender = stdin.readLineSync()!;
            stdout.writeln("Nhập điểm sinh viên: ");
            double score = double.parse(stdin.readLineSync()!);

            Student student = Student(id, name, age, gender, classrooms[i].name, score);
            classrooms[i].addStudent(student);
            print("Thêm sinh viên thành công");
          }
        }
      }
    } else if (option == 7) {
      exit(0);
    }
  }
}

void addClassroom(List<Classroom> classrooms){
  stdout.writeln("Nhập id lớp học: ");
  String id = stdin.readLineSync()!;
  stdout.writeln("Nhập tên lớp học: ");
  String name = stdin.readLineSync()!;
  Classroom classroom = Classroom(
    id: id,
    name: name,
  );
  classrooms.add(classroom);
  stdout.writeln("Thêm lớp học thành công!");
}


class Person {
  String id;
  String name;
  int age;
  String gender;

  Person(
      this.id,
      this.name,
      this.age,
      this.gender
  );

  @override
  String toString() {
    return " ";
  }
}

class Student extends Person {
  String grade;
  double score;
  Student(String id, String name, int age, String gender, this.grade, this.score): super(id, name, age, gender);

  @override
  String toString() {
    return " - ID sinh viên: ${id} \n - Tên sinh viên: ${name} \n - Tuổi: ${age} \n - Giới tính: ${gender} \n Lớp học: ${grade} \n - Điểm: ${score}";
  }

  void info(){
    print("Thông tin sinh viên: ");
    print(this.toString());
  }
}

class Teacher extends Person {
  String subject;
  double salary;
  Teacher(String id, String name, int age, String gender, this.subject, this.salary): super(id, name, age, gender);

  @override
  String toString() {
    return " - ID giáo viên: ${id} \n - Tên giáo viên: ${name} \n - Tuổi: ${age} \n - Giới tính: ${gender} \n Môn học: ${subject} \n Lương: ${salary}";
  }

  void info(){
    print("Thông tin giáo viên: ");
    print(this.toString());
  }
}

class Classroom {
  String id;
  String name;
  List<Student> students = [];
  Teacher teacher = new Teacher("", "", 0, "", "", 0.0);

  Classroom(
    {
      required this.id,
      required this.name,
    }
  );

  @override
  String toString() {
    return "- ID lớp học: ${id} \n - Tên lớp học: ${name} \n - Sĩ số: ${students.length} \n - Giáo viên: ${teacher}";
  }

  void addStudent(Student student){
    this.students.add(student);
  }

  void assignTeacher(Teacher teacher){
    this.teacher = teacher;
  }

  void info(){
    print("Thông tin lớp học");
    print(this.toString());
  }
}