import '../imports.dart';

class CalendarPage extends StatefulWidget {

  @override
  _CalendarPageState createState() => _CalendarPageState();

  static const routName = 'calendar-page';
  const CalendarPage({super.key});
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  final ScrollController _scrollController = ScrollController();

  void _goToToday() {
    setState(() {
      _focusedDay = DateTime.now();
      _selectedDay = DateTime.now();
    });


    int monthIndex = _focusedDay.month - 1;
    double scrollTo = monthIndex * 400;
    _scrollController.animateTo(
      scrollTo,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "${_focusedDay.year}",
          style: const TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: _goToToday,
            child: Text(
              "Сегодня",
              style: TextStyle(color: Colors.black, fontSize: 16.sp),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              for (var i = 0; i < 12; i++)
                TableCalendar(
                  locale: 'ru_RU',
                  firstDay: DateTime(DateTime.now().year, 1, 1),
                  lastDay: DateTime(DateTime.now().year, 12, 31),
                  focusedDay: DateTime(DateTime.now().year, i + 1, 1),
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  calendarFormat: CalendarFormat.month,
                  headerVisible: true,
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    leftChevronVisible: false,
                    rightChevronVisible: false,
                  ),
                  calendarStyle: const CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Color.fromRGBO(255, 135, 2, 1),
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Color.fromRGBO(255, 135, 2, 1),
                      shape: BoxShape.circle,
                    ),
                    defaultTextStyle: TextStyle(color: Colors.black),
                    weekendTextStyle: TextStyle(color: Colors.black),
                  ),
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(color: Colors.grey),
                    weekendStyle: TextStyle(color: Colors.grey),
                  ),
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'month',
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
