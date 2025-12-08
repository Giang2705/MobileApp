import 'dart:io';

void main() {
  stdout.writeln("Nhập họ tên sinh viên: ");
  String name = stdin.readLineSync()!;
  stdout.writeln("Nhập số giờ làm việc của sinh viên: ");
  int hour = int.parse(stdin.readLineSync()!);
  stdout.writeln("Nhập lương mỗi giờ: ");
  double salary = double.parse(stdin.readLineSync()!);

  double tongLuongTruocThue = hour*salary;
  double phuCap = 0.0;
  double thueThuNhap = 0.0;

  if (hour > 40) {
    phuCap = tongLuongTruocThue * 20 / 100;
  }

  if (tongLuongTruocThue + phuCap > 10000000) {
    thueThuNhap = (tongLuongTruocThue + phuCap) * 10 / 100;
  } else if (tongLuongTruocThue + phuCap >= 7000000) {
    thueThuNhap = (tongLuongTruocThue + phuCap) * 5 / 100;
  } else if (tongLuongTruocThue + phuCap < 7000000) {
    thueThuNhap = 0.0;
  }
 
  double tongLuongSauThue = (tongLuongTruocThue + phuCap) - thueThuNhap;

  while (true) {
    stdout.writeln("QUẢN LÝ SINH VIÊN");
    stdout.writeln("1. Tính tổng lương");
    stdout.writeln("2. Thêm phụ cấp");
    stdout.writeln("3. Trừ thuế thu nhập");
    stdout.writeln("4. In kết quả");
    stdout.writeln("5. Thoát chương trình");
    stdout.writeln("Hãy nhập một lựa chọn: ");
    int option = int.parse(stdin.readLineSync()!);
    
    if (option == 1) {
      print('Tổng lương trước thuế: ${tongLuongTruocThue}');
    } else if (option == 2) {
      print('Phụ cấp: ${phuCap}');
    } else if (option == 3) {
      print('Thuế thu nhập: ${thueThuNhap}');
    } else if (option == 4) {
      print(' - Họ tên: ${name} \n - Tổng lương trước thuế: ${tongLuongTruocThue} \n - Thuế thu nhập: ${thueThuNhap} \n - Lương thực lãnh: ${tongLuongSauThue}');
    } else {
      exit(0);
    }
  }
}