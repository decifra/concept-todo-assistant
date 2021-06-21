import 'package:uuid/uuid.dart';

class Task {
  final String uuid;
  String iconPath;
  String title;
  DateTime date;
  String? description;

  Task(
      {required this.uuid,
      required this.iconPath,
      required this.title,
      required this.date,
      this.description});
}

var uuid = Uuid();

List<Task> tasks = [
  Task(
      uuid: uuid.v4(),
      title: "Workout",
      iconPath: "assets/icons/gym.svg",
      date: DateTime.now(),
      description: ""),
  Task(
      uuid: uuid.v4(),
      title: "School Project",
      iconPath: "assets/icons/layers.svg",
      date: DateTime.now(),
      description: ""),
  Task(
      uuid: uuid.v4(),
      title: "Walk the dog",
      iconPath: "assets/icons/house.svg",
      date: DateTime.now(),
      description: ""),
  Task(
      uuid: uuid.v4(),
      title: "Hangout with friends",
      iconPath: "assets/icons/friends.svg",
      date: DateTime.now(),
      description: ""),
  Task(
      uuid: uuid.v4(),
      title: "Pubquiz night",
      iconPath: "assets/icons/friends.svg",
      date: DateTime.now(),
      description: ""),
];
