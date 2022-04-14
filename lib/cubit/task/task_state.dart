abstract class TaskState{}

class TaskLoadingState extends TaskState{}

class TaskLoadedState extends TaskState{}

class TaskErrorState extends TaskState{
  String error;

  TaskErrorState({required this.error});
}

class TaskCreatedState extends TaskState{}

class TaskEditedState extends TaskState{}
