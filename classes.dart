import 'dart:io';
import 'dart:convert';

abstract class Vehicle {
  String name;
  Vehicle(this.name);
  void drive();
}

class Car extends Vehicle {
  Car(String name) : super(name);
  @override
  void drive() => print('Driving a $name');
}

// Implement an Interface
abstract class IsFunny {
  void makePeopleLaugh();
}

class Comedian implements IsFunny {
  @override
  void makePeopleLaugh() {
    print('Making people laugh');
  }
}

// Override an Inherited Method
class ElectricCar extends Car {
  double chargeCapacity;
  ElectricCar(String name, this.chargeCapacity) : super(name);
  @override
  void drive() => print(
      'Driving an electric $name with a charge capacity of $chargeCapacity');
}

// Initialize a Class with Data from a File
Future<void> main() async {
  final file = File('data.txt');
  final content = await file.readAsString();
  final data = jsonDecode(content);
  final electricCar = ElectricCar(data['name'], data['chargeCapacity']);

  // Step 5: Use a Loop in a Method
  electricCar.drive();
  for (var i = 0; i < 5; i++) {
    print('Loop iteration $i');
  }

  // Demonstrate interface implementation
  final comedian = Comedian();
  comedian.makePeopleLaugh();
}

//data.txt file contents

// {
//  "name": "Tesla Model S",
//  "chargeCapacity": 100
// }