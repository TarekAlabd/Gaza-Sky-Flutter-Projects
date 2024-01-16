Future<void> main() async {
  print('Fetching user order...');
  print( createOrderMessage());
}

Future<String> createOrderMessage() async {
  var order = await fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> fetchUserOrder() =>
    // Imagine that this function is
    // more complex and slow.
    Future.delayed(
      const Duration(seconds: 2),
      () => 'Large Latte',
    );

// Utility Class
class AppColors {
  static const String primaryColor = '#ffffff';
  static const String secondaryColor = '#000000';
}

abstract class Animal {
  void eat();
}

class Mammal implements Animal {
  @override
  void eat() {
    print('A mammal is eating');
  }
}

abstract class LandMammal {
  void walk();
  void run();
}

abstract class SeaMammal {
  void swim();
}

mixin Flyable {
  void fly() {
    print('A flyable animal is flying');
  }
}

class Dolphin extends Mammal implements SeaMammal {
  @override
  void swim() {
    print('A dolphin is swimming');
  }

  @override
  void eat() {
    print('A dolphin is eating');
  }
}

class Bat extends Mammal with Flyable implements LandMammal {
  @override
  void walk() {
    print('A bat is walking');
  }

  @override
  void run() {
    print('A bat is running');
  }
}

class Elephant extends Mammal implements LandMammal {
  @override
  void walk() {
    print('An elephant is walking');
  }

  @override
  void run() {
    print('An elephant is running');
  }
}

class Dog implements Animal {
  void bark() {
    print('Bark!');
  }

  @override
  void eat() {
    print('A dog is eating');
  }
}

class Cat implements Animal {
  void meow() {
    print('Meow!');
  }

  @override
  void eat() {
    print('A cat is eating');
  }
}

class Person {
  final String name;
  final int age;
  final String address;

  const Person({
    required this.name,
    required this.age,
    required this.address,
  });

  void printDetails() {
    print('Name: $name, Age: $age, Address: $address');
  }

  Person copyWith({
    String? name,
    int? age,
    String? address,
  }) {
    return Person(
      name: name ?? this.name,
      age: age != null && age > 0 ? age : this.age,
      address: address ?? this.address,
    );
  }
}

class Student extends Person {
  final double gpa;
  final int level;

  Student({
    required this.gpa,
    required this.level,
    required super.name,
    required super.age,
    required super.address,
  });

  @override
  void printDetails() {
    super.printDetails();
    print('GPA: $gpa, Level: $level');
  }
}

double calculateArea({required double width, required double height}) {
  return width * height;
}

List<int> getNumbers() {
  return [1, 2, 3, 4, 5];
}

double sum(double a, double b) {
  return a + b;
}

void printAmazingNumber(int number, [String name = "Unknown"]) {
  if (number > 25) {
    print('Amazing number!, $name');
  } else {
    print('Not an amazing number!');
  }
}

void printHelloWorld() {
  for (var i = 0; i < 5; i++) {
    print('Hello, World! $i');
  }
}
