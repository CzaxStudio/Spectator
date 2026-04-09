// A function that returns an asynchronous stream of 'Records'
Stream<(int id, String name, bool active)> getUserStream() async* {
  final mockData = [
    (1, 'Alice', true),
    (2, 'Bob', false),
    (3, 'Charlie', true),
  ];

  for (var user in mockData) {
    await Future.delayed(Duration(seconds: 1)); // Simulating network lag
    yield user; 
  }
}

void main() async {
  print('Fetching users...');

  await for (final user in getUserStream()) {
    // Pattern matching and destructuring in a switch statement
    final statusMessage = switch (user) {
      (_, _, false) => 'User ${user.name} is currently offline.',
      (int id, String name, true) when id == 1 => '$name is the Admin!',
      (_, String name, true) => '$name is online and active.',
    };

    print('ID: ${user.id} | $statusMessage');
  }
}
