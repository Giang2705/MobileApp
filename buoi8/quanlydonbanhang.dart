import 'dart:io';

void main() {
  List<Product> productList = [];

  while (true) {
    stdout.writeln("QUẢN LÝ ĐƠN BÁN HÀNG");
    stdout.writeln("1. Thêm sản phẩm vào giỏ hàng");
    stdout.writeln("2. Sửa và xoá sản phẩm ở giỏ hàng");
    stdout.writeln("3. Hiển thị giỏ hàng");
    stdout.writeln("4. Tính tổng tiền hoá đơn");
    stdout.writeln("5. Thoát chương trình");
    stdout.writeln("Hãy nhập một lựa chọn: ");
    int option = int.parse(stdin.readLineSync()!);
    
    if (option == 1) {
      addToCart(productList);
    } else if (option == 2) {
      stdout.writeln("1. Sửa sản phẩm");
      stdout.writeln("2. Xoá sản phẩm");
      stdout.writeln("Hãy nhập một lựa chọn: ");
      int choice = int.parse(stdin.readLineSync()!);
      if (choice == 1){
        editProductInCart(productList);
      } else if (choice == 2) {
        deleteProductInCart(productList);
      }
    } else if (option == 3) {
      printCart(productList);
    } else if (option == 4) {
      print("Tổng hoá đơn: ${total(productList)}");
    } else {
      exit(0);
    }
  }
}

void addToCart(List<Product> products){
  stdout.writeln("Nhập tên sản phẩm: ");
  String name = stdin.readLineSync()!;
  stdout.writeln("Nhập số lượng: ");
  int quantity = int.parse(stdin.readLineSync()!);
  stdout.writeln("Nhập tổng giá: ");
  double total = double.parse(stdin.readLineSync()!);
  Product product = Product(
    name: name,
    quantity: quantity,
    total: total
  );
  products.add(product);
  stdout.writeln("Thêm sản phẩm vào giỏ hàng thành công!");
}

void editProductInCart(List<Product> products){
  stdout.writeln("Nhập tên của sản phẩm cần thay đổi giá trị: ");
  String name = stdin.readLineSync()!;
  bool isExisted = false;
  for (int i = 0; i < products.length; i++) {
    if (products[i].name == name){
      isExisted = true;

      stdout.writeln("Nhập tên sản phẩm cần thay đổi: ");
      String name = stdin.readLineSync()!;
      stdout.writeln("Nhập số lượng cần thay đổi: ");
      int quantity = int.parse(stdin.readLineSync()!);
      stdout.writeln("Nhập giá cần thay đổi: ");
      double total = double.parse(stdin.readLineSync()!);

      products[i].name = name;
      products[i].quantity = quantity;
      products[i].total = total;
      
      print("Thay đổi thông tin sản phẩm thành công!");
      break;
    }
  }

  if (!isExisted) {
    print("Sản phẩm không tồn tại trong giỏ hàng!");
  }
}

void deleteProductInCart(List<Product> products){
  stdout.writeln("Nhập tên của sản phẩm cần xoá: ");
  String name = stdin.readLineSync()!;
  bool isExisted = false;
  for (int i = 0; i < products.length; i++) {
    if (products[i].name == name){
      isExisted = true;

      products.remove(products[i]);
      
      print("Xoá sản phẩm thành công!");
      break;
    }
  }

  if (!isExisted) {
    print("Sản phẩm không tồn tại trong giỏ hàng!");
  }
}

void printCart(List<Product> products){
  if (products.length == 0){
    print("Giỏ hàng rỗng");
  } else {
    for (int i = 0; i < products.length; i++) {
      print('${products[i].toString()}');
      print('');
    }
  }
}

double total(List<Product> products){
  double total = 0.0;
  for (int i = 0; i < products.length; i++) {
   total += products[i].total;
  }

  return total;  
}

class Product {
  String name;
  int quantity;
  double total;

  Product(
    {
      required this.name,
      required this.quantity,
      required this.total
    }
  );

  @override
  String toString() {
    return " - Tên sản phẩm: $name \n - Số lượng: $quantity \n - Tổng giá tiền: $total";
  }
}