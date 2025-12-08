import 'dart:io';

void main() {
  List<Student> danhSachSinhVien = [];

  while (true) {
    stdout.writeln("QUẢN LÝ SINH VIÊN");
    stdout.writeln("1. Thêm sinh viên");
    stdout.writeln("2. Hiển thị danh sách sinh viên");
    stdout.writeln("3. Tìm sinh viên có điểm trung bình cao nhất");
    stdout.writeln("4. Thoát chương trình");
    stdout.writeln("Hãy nhập một lựa chọn: ");
    int option = int.parse(stdin.readLineSync()!);
    
    if (option == 1) {
      stdout.writeln("Nhập tên sinh viên: ");
      String name = stdin.readLineSync()!;
      stdout.writeln("Nhập tuổi sinh viên: ");
      int age = int.parse(stdin.readLineSync()!);
      stdout.writeln("Nhập điểm Toán: ");
      double diemToan = double.parse(stdin.readLineSync()!);
      stdout.writeln("Nhập điểm Lý: ");
      double diemLy = double.parse(stdin.readLineSync()!);
      stdout.writeln("Nhập điểm Hoá: ");
      double diemHoa = double.parse(stdin.readLineSync()!);
      Student student = Student(
        name: name,
        age: age,
        diemToan: diemToan,
        diemLy: diemLy,
        diemHoa: diemHoa
      );
      danhSachSinhVien.add(student);
      stdout.writeln("Thêm sinh viên thành công!");
    } else if (option == 2) {
      stdout.writeln("DANH SÁCH SINH VIÊN");
      for (var student in danhSachSinhVien) {
        stdout.writeln(student.toString());
      }
    } else if (option == 3) {
      double avg = 0;
      Student? topStudent;
      for (var student in danhSachSinhVien) {
        final studentAvg =
            (student.diemToan + student.diemLy + student.diemHoa) / 3;
        if (studentAvg > avg) {
          avg = studentAvg;
          topStudent = student;
        }
      }
      print('Top SV ${topStudent?.toString()}');
    } else {
      exit(0);
    }
  }
}

class Student {
  String name;
  int age;
  double diemToan;
  double diemLy;
  double diemHoa;

  Student(
    {
      required this.name,
      required this.age,
      required this.diemToan,
      required this.diemLy,
      required this.diemHoa
    }
  );

  @override
  String toString() {
    return "Tên: $name - Tuổi: $age - Điểm Toán: $diemToan - Điểm Lý: $diemLy - Điểm Hoá: $diemHoa";
  }
}