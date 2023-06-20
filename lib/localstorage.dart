import 'package:hive/hive.dart';

part 'localstorage.g.dart';

late Box localstoragehive;

@HiveType(typeId: 1)
class Localstorage {
  Localstorage({required this.name, required this.suggestedBatterySize, required this.calculatedBatterySize, required this.ILBC, required this.ILDC, required this.inverterSize, required this.Iscc, required this.spv});
  @HiveField(0)
  String ILDC;

  @HiveField(1)
  String ILBC;

  @HiveField(2)
  String Iscc;

  @HiveField(3)
  String spv;

  @HiveField(4)
  String calculatedBatterySize;

  @HiveField(5)
  String suggestedBatterySize;

  @HiveField(6)
  String inverterSize;

  @HiveField(7)
  String? name;

// @HiveField(2)
// List<Person> friends;
}
