import '../imports.dart';

class MoodStatisticsPage extends StatelessWidget {
  final List<double> moodScores = [0.2, 0.6, 0.4, 0.7, 0.2, 0.9, 0.5];
  final List<String> daysOfWeek = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];

  static const routName = '/statistic-page';
   MoodStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Еженедельный прогресс настроения',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          Expanded(
            child: LineChart(
              LineChartData(
                minY: 0,
                maxY: 1,
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        return Text('${(value * 100).toInt()}%');
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        return Text(daysOfWeek[index]);
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  getDrawingHorizontalLine: (value) => const FlLine(color: Colors.grey, strokeWidth: 0.5),
                  getDrawingVerticalLine: (value) => const FlLine(color: Colors.grey, strokeWidth: 0.5),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: List.generate(
                      moodScores.length,
                          (index) => FlSpot(index.toDouble(), moodScores[index]),
                    ),
                    isCurved: true,
                    barWidth: 3,
                    color: Colors.orange,
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.orange.withOpacity(0.3),
                    ),
                    dotData: const FlDotData(show: true),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'статистика настроения за день',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.builder(
              itemCount: moodScores.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        daysOfWeek[index],
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: LinearProgressIndicator(
                            value: moodScores[index],
                            color: Colors.orange,
                            backgroundColor: Colors.grey.shade300,
                            minHeight: 10,
                          ),
                        ),
                      ),
                      Text(
                        '${(moodScores[index] * 100).toInt()}%',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),

    );
  }
}
