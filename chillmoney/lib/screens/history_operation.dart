import 'package:chillmoney/transactions.dart';
import 'package:flutter/material.dart';

class HistoryOperation extends StatefulWidget {
  final TransactionsService transactionsService;
  const HistoryOperation({super.key, required this.transactionsService});

  @override
  State<HistoryOperation> createState() => _HistoryOperationState();
}

class _HistoryOperationState extends State<HistoryOperation> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onPageChandedLeft() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _pageController.animateToPage(
          _currentIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void _onPageChandedRight() {
    if (_currentIndex < 1) {
      setState(() {
        _currentIndex++;
        _pageController.animateToPage(
          _currentIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 51, 51, 51),
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 51, 51, 51),
        title: Column(children: [
          Text(
            'История операций',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      _onPageChandedLeft();
                    },
                    child: Text('В этом месяце',
                        style: TextStyle(
                            color:
                                _currentIndex == 0 ? Colors.white : Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold))),
                TextButton(
                    onPressed: () {
                      _onPageChandedRight();
                    },
                    child: Text('В прошлом месяце',
                        style: TextStyle(
                            color:
                                _currentIndex == 1 ? Colors.white : Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold))),
              ],
            ),
            Expanded(
              child: PageView(
                onPageChanged: _onPageChanged,
                controller: _pageController,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 67, 67, 67),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 17, horizontal: 16),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Доходы',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: const Color.fromARGB(
                                              255, 162, 162, 162)),
                                    ),
                                    Text(
                                      widget
                                          .transactionsService.icomeCurrentMonth
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: const Color.fromARGB(
                                              255, 0, 208, 49)),
                                    ), // Переменная доходов
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Расходы',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: const Color.fromARGB(
                                              255, 162, 162, 162)),
                                    ),
                                    Text(
                                      '1000',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: const Color.fromARGB(
                                              255, 208, 0, 0)),
                                    ), // Переменная расходов
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 1,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 102, 102, 102)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '700', // Переменная общей суммы
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 29, 148, 57)),
                                    onPressed: () {},
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 15),
                                      child: Text(
                                        'Просмотр отчета за этот периуд',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 0, 250, 58)),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 67, 67, 67),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 17, horizontal: 16),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Доходы',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: const Color.fromARGB(
                                              255, 162, 162, 162)),
                                    ),
                                    Text(
                                      '1500',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: const Color.fromARGB(
                                              255, 0, 208, 49)),
                                    ), // Переменная доходов
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Расходы',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: const Color.fromARGB(
                                              255, 162, 162, 162)),
                                    ),
                                    Text(
                                      '1000',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: const Color.fromARGB(
                                              255, 208, 0, 0)),
                                    ), // Переменная расходов
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 1,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 102, 102, 102)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '700', // Переменная общей суммы
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 29, 148, 57)),
                                    onPressed: () {},
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 15),
                                      child: Text(
                                        'Просмотр отчета за этот периуд',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 0, 250, 58)),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 22,
            )
          ],
        ),
      ),
    );
  }
}
