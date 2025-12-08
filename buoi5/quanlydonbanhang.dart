import 'dart:io';

void main() {
  stdout.writeln("Nhập tên sản phẩm: ");
  String name = stdin.readLineSync()!;
  stdout.writeln("Nhập số lượng mua: ");
  int quantity = int.parse(stdin.readLineSync()!);
  stdout.writeln("Nhập đơn giá: ");
  double price = double.parse(stdin.readLineSync()!);

  double thanhTien = quantity*price;
  double giamGia = 0.0;

  if (thanhTien >= 1000000) {
    giamGia = thanhTien * 10 / 100;
  } else if (thanhTien >= 500000) {
    giamGia = thanhTien * 5 / 100;
  } else if (thanhTien < 500000) {
    giamGia = 0.0;
  }
 
  double tongTienSauGiamGia = thanhTien - giamGia;
  double VAT = tongTienSauGiamGia * 8 / 100;
  double tong = tongTienSauGiamGia + VAT;


  while (true) {
    stdout.writeln("QUẢN LÝ ĐƠN HÀNG");
    stdout.writeln("1. Tính thành tiền");
    stdout.writeln("2. Áp dụng giảm giá");
    stdout.writeln("3. Tính thuế VAT");
    stdout.writeln("4. In kết quả");
    stdout.writeln("5. Thoát chương trình");
    stdout.writeln("Hãy nhập một lựa chọn: ");
    int option = int.parse(stdin.readLineSync()!);
    
    if (option == 1) {
      print('Thành tiền trước giảm giá và VAT: ${thanhTien}');
    } else if (option == 2) {
      print('Giảm giá: ${giamGia}');
    } else if (option == 3) {
      print('VAT: ${VAT}');
    } else if (option == 4) {
      print(" - Tên sản phẩm: ${name} \n - Số lượng: ${quantity} \n - Đơn giá: ${price}");
      print("-"*50);
      print(" - Thành tiền: ${thanhTien} \n - Giảm giá: ${giamGia} \n - VAT: ${VAT} \n - Tổng thanh toán cuối cùng: ${tong}");
    } else {
      exit(0);
    }
  }
}