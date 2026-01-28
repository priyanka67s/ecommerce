import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wcart_vendor/features/presentation/screens/home__page/bloc/home_page_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/login/loginpage.dart';
import 'package:wcart_vendor/features/presentation/widgets/start_shimmer.dart';
import 'package:wcart_vendor/features/data/model/home_model.dart';
import 'dart:math';

import 'package:wcart_vendor/router.dart'; // For converting degrees to radians

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomePageBloc>().add(FetchHomePageData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        UserDeviceType deviceType = getDeviceType(constraints.maxWidth);
        int crossAxisCount = UserDeviceType.mobile == deviceType ? 1 : 3;
        debugPrint('Device Type: $deviceType, CrossAxisCount: $crossAxisCount');
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Welcome to Wcart Vendor",
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Dashboard",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                BlocBuilder<HomePageBloc, HomePageState>(
                                  builder: (context, state) {
                                    return GridView.count(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      crossAxisCount: crossAxisCount,
                                      crossAxisSpacing: 35,
                                      mainAxisSpacing: 10,
                                      childAspectRatio:
                                          3 / 1, // wider card style
                                      children: [
                                        MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.offAllNamed(
                                                Routes.sideBar,
                                                arguments: {
                                                  'screen': 'products',
                                                },
                                              );
                                            },
                                            child: HomePageCard(
                                              title: "Products",
                                              value:
                                                  state is DashboardDataLoaded
                                                      ? state.productCount
                                                      : "0",
                                              icon: Icons.edit_note,
                                              color: Colors.orange,
                                            ),
                                          ),
                                        ),
                                        MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.offAllNamed(Routes.sideBar,
                                                  arguments: {
                                                    'screen': "order",
                                                  });
                                            },
                                            child: HomePageCard(
                                              title: "Order",
                                              value:
                                                  state is DashboardDataLoaded
                                                      ? state.orderCount
                                                      : "0",
                                              icon: Icons.menu,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ),
                                        MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.offAllNamed(Routes.sideBar,
                                                  arguments: {
                                                    'screen': "sales",
                                                  });
                                            },
                                            child: HomePageCard(
                                              title: " Revenue",
                                              value:
                                                  state is DashboardDataLoaded
                                                      ? state.orderValue
                                                      : "0",
                                              icon: Icons.group,
                                              color: Colors.lightBlue,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Analytics",
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          BlocBuilder<HomePageBloc,
                                                  HomePageState>(
                                              builder: (context, state) {
                                            return (state
                                                        is DashboardDataLoaded &&
                                                    state.dashboardData
                                                            .monthBasedOrders !=
                                                        null)
                                                ? LinearGraph(
                                                    dashboardData:
                                                        state.dashboardData)
                                                : SizedBox(
                                                    height: 300,
                                                    width: 500,
                                                    child: StartShimmer(),
                                                  );
                                          })
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Sales by Category',
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                          BlocBuilder<HomePageBloc,
                                                  HomePageState>(
                                              builder: (context, state) {
                                            return (state
                                                        is DashboardDataLoaded &&
                                                    state.dashboardData
                                                            .salesByCategory !=
                                                        null)
                                                ? Container(
                                                    margin: EdgeInsets.only(
                                                        top: 20),
                                                    decoration: BoxDecoration(
                                                      color: Colors.blue[700]!
                                                          .withOpacity(.1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    child: SfCircularChart(
                                                      margin:
                                                          const EdgeInsets.only(
                                                        top: 0,
                                                        bottom: 0,
                                                        left: 0,
                                                        right: 0,
                                                      ),
                                                      legend: const Legend(
                                                          isVisible: true),
                                                      series: <PieSeries<
                                                          PieData, String>>[
                                                        PieSeries<PieData,
                                                            String>(
                                                          explode: true,
                                                          explodeIndex: 0,
                                                          dataSource:
                                                              state.pieData,
                                                          xValueMapper:
                                                              (PieData data,
                                                                      _) =>
                                                                  data.xData,
                                                          yValueMapper:
                                                              (PieData data,
                                                                      _) =>
                                                                  data.yData,
                                                          dataLabelMapper:
                                                              (PieData data,
                                                                      _) =>
                                                                  data.text,
                                                          dataLabelSettings:
                                                              const DataLabelSettings(
                                                                  isVisible:
                                                                      true),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : SizedBox(
                                                    height: 300,
                                                    width: 500,
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      spacing: 30,
                                                      children: [
                                                        SizedBox(
                                                          height: 160,
                                                          width: 160,
                                                          child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          80),
                                                              child:
                                                                  StartShimmer()),
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          spacing: 10,
                                                          children: [
                                                            SizedBox(
                                                              height: 20,
                                                              width: 100,
                                                              child:
                                                                  StartShimmer(),
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                              width: 100,
                                                              child:
                                                                  StartShimmer(),
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                              width: 100,
                                                              child:
                                                                  StartShimmer(),
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                              width: 100,
                                                              child:
                                                                  StartShimmer(),
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                              width: 100,
                                                              child:
                                                                  StartShimmer(),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  );
                                          }),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "©2025 Webnexs Ecommerce. All rights reserved.",
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LinearGraph extends StatelessWidget {
  final VendorModel dashboardData;

  const LinearGraph({
    super.key,
    required this.dashboardData,
  });

  @override
  Widget build(BuildContext context) {
    // Generate data for last 6 months (including current month)
    List<MonthData> last6Months = generateLast6MonthsData(dashboardData);

    // Create spots for the chart
    List<FlSpot> spots = [];
    double maxSalesInK = 0;

    for (int i = 0; i < last6Months.length; i++) {
      double salesInK = last6Months[i].totalSales / 1000;
      spots.add(FlSpot(i.toDouble(), salesInK));

      if (salesInK > maxSalesInK) {
        maxSalesInK = salesInK;
      }
    }

    // Calculate max Y value for chart scaling (add 20% padding)
    double maxY = maxSalesInK > 0 ? (maxSalesInK * 1.2).ceilToDouble() : 10;

    return Container(
      height: 300,
      width: 500,
      decoration: BoxDecoration(
          color: Colors.blue[700]!.withOpacity(.1),
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '6-Month Revenue Report',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          // Text(
          //   'Current month: ${DateFormat('MMMM yyyy').format(DateTime.now())}',
          //   style: TextStyle(
          //     color: Colors.grey[700],
          //     fontSize: 14,
          //   ),
          // ),
          const SizedBox(height: 20),
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const style = TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        );
                        return SideTitleWidget(
                          meta: meta,
                          child: Text(
                              value < 1
                                  ? '${(value * 1000).toInt()}'
                                  : value < 5
                                      ? '${value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1)}k'
                                      : '${value.toInt()}k',
                              style: style),
                        );
                      },
                      reservedSize: 45,
                      interval: (maxY / 5).round().toDouble() <= 0
                          ? maxY < 5.0
                              ? 0.5
                              : 2
                          : (maxY / 5).round().toDouble(), // 5 intervals
                    ),
                  ),
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(
                    showTitles: false,
                    reservedSize: 50,
                    interval: 1,
                  )),
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const style = TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        );
                        int index = value.toInt();
                        if (index >= 0 && index < last6Months.length) {
                          // Show abbreviated month name
                          return SideTitleWidget(
                            meta: meta,
                            space: 20,
                            child: Text(
                              DateFormat('MMM').format(last6Months[index].date),
                              style: style,
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                      reservedSize: 40,
                      interval: 1,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: false, // Remove the border
                ),
                minX: 0,
                maxX: 5,
                minY: 0,
                maxY: maxY,
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    curveSmoothness: 0.1,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 5,
                          color: Colors.pink,
                          strokeWidth: 1,
                          strokeColor: Colors.white,
                        );
                      },
                    ),
                    color: Colors.pink,
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.pink.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Legend or summary
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Total: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: NumberFormat.currency(
                        symbol: '₹',
                        decimalDigits: 0,
                      ).format(last6Months.fold<double>(
                          0, (sum, month) => sum + month.totalSales)),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'Orders: ',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      "${last6Months.fold<int>(0, (sum, month) => sum + month.totalOrders)}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                )
              ])),
            ],
          ),
        ],
      ),
    );
  }

  // Generate data for the last 6 months
  List<MonthData> generateLast6MonthsData(VendorModel data) {
    List<MonthData> result = [];

    // Get current date
    DateTime now = DateTime.now(); // May 2025

    // Map to store existing month data
    Map<String, MonthData> existingMonthData = {};

    // Process existing monthly orders data
    if (data.monthBasedOrders != null) {
      for (var monthOrder in data.monthBasedOrders!) {
        if (monthOrder.orderDate != null) {
          // Create a key in format 'YYYY-MM'
          String monthKey =
              '${monthOrder.orderDate!.year}-${monthOrder.orderDate!.month.toString().padLeft(2, '0')}';

          existingMonthData[monthKey] = MonthData(
            DateTime(
                monthOrder.orderDate!.year, monthOrder.orderDate!.month, 1),
            monthOrder.totalSales ?? 0,
            monthOrder.totalOrders ?? 0,
          );
        }
      }
    }

    // Generate data for last 6 months
    for (int i = 5; i >= 0; i--) {
      DateTime monthDate = DateTime(now.year, now.month - i, 1);
      String monthKey =
          '${monthDate.year}-${monthDate.month.toString().padLeft(2, '0')}';

      if (existingMonthData.containsKey(monthKey)) {
        // Use existing data
        result.add(existingMonthData[monthKey]!);
      } else {
        // No sales for this month
        result.add(MonthData(monthDate, 0, 0));
      }
    }

    return result;
  }
}

// Helper class to hold month data
class MonthData {
  final DateTime date;
  final double totalSales;
  final int totalOrders;

  MonthData(this.date, this.totalSales, this.totalOrders);
}

class HomePageCard extends StatefulWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const HomePageCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  _HomePageCardState createState() => _HomePageCardState();
}

class _HomePageCardState extends State<HomePageCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()
          ..scale(isHovered ? 1.05 : 1.0)
          ..rotateZ(isHovered ? 08 * pi / 360 : 0),
        transformAlignment: Alignment.center,
        width: 250,
        height: 150,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.color,
          boxShadow: [
            const BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 6),
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    widget.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.white70,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      widget.icon,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
