class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}


// generate clone 20 todos

final todos = List<Todo>.generate(
20,
(i) => Todo(
'Todo $i',
'A description of what needs to be done for Todo $i',
),
);
