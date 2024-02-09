import 'package:alura_flutter_curso_1/components/tasks.dart';
import 'package:flutter/material.dart';

class TaskInhireted extends InheritedWidget {
  TaskInhireted({Key? key, required Widget child})
      : super(key: key, child: child);

  final List<Tasks> taskList = [
    const Tasks('Andar de Bike', 'assets/images/bike.webp', 2),
    const Tasks('Ler 50 páginas', 'assets/images/ler.jpg', 1),
    const Tasks('Meditar', 'assets/images/meditar.jpeg', 4),
    const Tasks('Jogar', 'assets/images/jogar.jpg', 0),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Tasks(name, photo, difficulty));
  }

  static TaskInhireted of(BuildContext context) {
    final TaskInhireted? result =
        context.dependOnInheritedWidgetOfExactType<TaskInhireted>();
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInhireted oldWidget) =>
      oldWidget.taskList.length != taskList.length;
}
