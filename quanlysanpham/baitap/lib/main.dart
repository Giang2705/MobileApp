import 'dart:io';

void main() {
  List<Product> products = [];

  while (true) {
    stdout.writeln("QUẢN LÝ SẢN PHẨM");
    stdout.writeln("1. Thêm sản phẩm");
    stdout.writeln("2. Hiển thị danh sách sản phẩm");
    stdout.writeln("3. Tìm sản phẩm theo tên");
    stdout.writeln("4. Bán sản phẩm");
    stdout.writeln("5. Thoát chương trình");
    stdout.writeln("Hãy nhập một lựa chọn: ");
    int option = int.parse(stdin.readLineSync()!);
    
    if (option == 1) {
      stdout.writeln("THÊM SẢN PHẨM");
      stdout.writeln("Nhập tên sản phẩm: ");
      String name = stdin.readLineSync()!;
      stdout.writeln("Nhập giá sản phẩm: ");
      double giaTien = double.parse(stdin.readLineSync()!);
      stdout.writeln("Nhập số lượng: ");
      int soLuong = int.parse(stdin.readLineSync()!);
      Product product = Product(
        name: name,
        giaTien: giaTien,
        soLuong: soLuong
      );
      products.add(product);
      stdout.writeln("Thêm sản phẩm thành công!");
    } else if (option == 2) {
      stdout.writeln("DANH SÁCH SẢN PHẨM");
      for (var product in products) {
        stdout.writeln(product.toString());
      }
    } else if (option == 3) {
        stdout.writeln("TÌM KIẾM SẢN PHẨM");
        stdout.writeln("Nhập tên sản phẩm cần tìm kiếm: ");
        String name = stdin.readLineSync()!;
        Product? searchedProduct;
        for (var product in products) {
          if (name == product.name) {
            searchedProduct = product;
            break;
          }
        }

        if (searchedProduct != null){
          print('Sản phẩm tìm kiếm: ${searchedProduct.toString()}');
        } else {
          print("Không tìm thấy sản phẩm!");
        }
    } else if (option == 4) {
        stdout.writeln("BÁN SẢN PHẨM");
        stdout.writeln("Nhập tên sản phẩm cần bán: ");
        String name = stdin.readLineSync()!;
        Product? searchedProduct;
        for (var product in products) {
          if (name == product.name) {
            searchedProduct = product;
            break;
          }
        }
        if (searchedProduct != null){
          stdout.writeln("Nhập số lượng sản phẩm cần bán: ");
          int soLuong = int.parse(stdin.readLineSync()!);
          
          if (name == searchedProduct.name) {
            if (soLuong > searchedProduct.soLuong) {
              print("Không đủ số lượng để bán ra!");
            } else {
              print("Đã bán $soLuong $name");
              searchedProduct.soLuong -= soLuong;
              print('Sản phẩm: ${searchedProduct.toString()}');
            }
          }
          
        } else {
          print("Không tìm thấy sản phẩm!");
        }
    } else {
      exit(0);
    }
  }
}

class Product {
  String name;
  double giaTien;
  int soLuong;

  Product(
    {
      required this.name,
      required this.giaTien,
      required this.soLuong,
    }
  );

  @override
  String toString() {
    return "Tên sản phẩm: $name - Giá tiền: $giaTien - Số lượng: $soLuong";
  }
}