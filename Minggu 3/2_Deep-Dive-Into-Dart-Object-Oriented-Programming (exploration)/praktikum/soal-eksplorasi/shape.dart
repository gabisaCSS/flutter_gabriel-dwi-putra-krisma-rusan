// class parent
abstract class Shape {
  int getArea();
  int getPerimeter();
}

class Circle implements Shape {
  int radius;

  Circle(this.radius);

  @override
  int getArea() {
    return (3.1415 * radius * radius).ceil();
  }

  @override
  int getPerimeter() {
    return (2 * 3.1415 * radius).ceil();
  }
}

class Square implements Shape {
  int side;

  Square(this.side);

  @override
  int getArea() {
    return 4 * side;
  }

  @override
  int getPerimeter() {
    return side * side;
  }
}

class Rectangle implements Shape {
  int width, height;

  Rectangle(this.width, this.height);

  @override
  int getArea() {
    return width * height;
  }

  @override
  int getPerimeter() {
    return 2 * (width + height);
  }
}

void main() {
  List<Map<String, Shape>> shapeList = [
    {'circle': Circle(7)},
    {'square': Square(5)},
    {'rectangle': Rectangle(5, 7)}
  ];

  shapeList.forEach((element) {
    element.forEach((key, value) {
      print(
          '$key area = ${value.getArea()}\n$key perimeter = ${value.getPerimeter()}\n');
    });
  });
}
