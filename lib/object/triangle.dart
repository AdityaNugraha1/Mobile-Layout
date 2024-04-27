class Triangle {
  double base;
  double height;
  double side1;
  double side2;

  Triangle(this.base, this.height, this.side1, this.side2);

  double calculateArea() {
    return 0.5 * base * height;
  }

  double calculatePerimeter() {
    return base + side1 + side2;
  }
}