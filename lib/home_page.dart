import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> habits = []; // List to store habits
  List<String> defaultHabits = [
    'Habit 1',
    'Habit 2',
    'Habit 3'
  ]; // Initial default habits

  @override
  void initState() {
    super.initState();
    habits.addAll(defaultHabits); // Add default habits to the list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Hey There XYZ,",
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Handle notifications button pressed
                        },
                        icon: const Icon(Icons.notifications),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: const Text(
                  "Ready For A Run?",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Column(
                  children: [
                    TableCalendar(
                      focusedDay: DateTime.now(),
                      firstDay: DateTime(2022),
                      lastDay: DateTime(2023, 12, 31),
                      calendarStyle: const CalendarStyle(
                        selectedDecoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        selectedTextStyle: TextStyle(color: Colors.white),
                      ),
                      headerStyle: const HeaderStyle(
                        titleCentered: true,
                        formatButtonVisible: false,
                      ),
                      calendarFormat: CalendarFormat.week,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      child: const Text(
                        "Your Habits",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: habits.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // Handle habit tile clicked
                              print('${habits[index]} clicked');
                            },
                            child: ListTile(
                              title: Text(habits[index]),
                              subtitle: Text('Habit description'),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle add habit button pressed
          _addHabit();
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                // Handle Home button pressed
              },
              icon: Icon(Icons.home),
            ),
            SizedBox(width: 30),
            IconButton(
              onPressed: () {
                // Handle Profile button pressed
              },
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }

  void _addHabit() {
    setState(() {
      if (habits.length < 3) {
        habits.addAll(defaultHabits.sublist(habits.length));
      } else {
        habits.add('Habit ${habits.length + 1}');
      }
    });
  }
}
