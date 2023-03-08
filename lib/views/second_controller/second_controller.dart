//
//
//
//dummy code
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:list_view_project/views/colors/colors_controller.dart';

//dummy code
class CounterAppManager extends StatelessWidget {
  const CounterAppManager({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }

  final List<int> _counters = [0];

  void showSnackBar(String msg) {
    final snackBar = SnackBar(
      backgroundColor: AppColors.vivacious,
      content: Text('Yay! ${msg.toString()}'),
      action: SnackBarAction(
        label: 'Ok',
        textColor: AppColors.white,
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _incrementCounter(int index) {
    setState(() {
      if (_counters[index] > 0) {
        _counters[index]++;
      }
      _counters[index]++;
      showSnackBar("Incrementations");
    });
  }

  void _decrementCounter(int index) {
    setState(() {
      _counters[index]--;
      if (_counters[index] < 0) {
        _counters[index] = 0;
      }
      showSnackBar("Decrementations");
    });
  }

  void _addCounter() {
    setState(() {
      _counters.add(0);
      showSnackBar("Added one more counter widget.");
    });
  }

  void _removeCounter() {
    setState(() {
      if (_counters.remove(0)) {
        showSnackBar("Deleted counter widget.");
      } else {
        showSnackBar("There is no any other counter to delete that.");
      }
    });
  }

  void _resetCounter() {
    setState(() {
      for (var i = 0; i < _counters.length; i++) {
        _counters[i] = 0;
      }
      showSnackBar("You have reseted all the counters.");
    });
  }

  void _singleWidgetResetCounter(int index) {
    setState(() {
      _counters[index] = 0;
      showSnackBar("You reseted the counter.");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.amberorange,
      body: ListView.builder(
        itemCount: _counters.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            // width: MediaQuery.of(context).size.width / 0.2,
            // height: 70,
            padding: const EdgeInsets.symmetric(vertical: 0),
            margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.transamberorange,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 0.5,
                  color: AppColors.vivacious,
                ),
              ],
            ),
            child: ListTile(
              // title: Text(
              //   'Counter ${index + 1}',
              //   style: TextStyle(
              //     color: AppColors.bodybackColor,
              //     fontWeight: FontWeight.bold,
              //     fontSize: 14,
              //   ),
              // ),
              subtitle: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 45,
                  height: 45,
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.vivacious2,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    '${_counters[index]}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackBackColor),
                  ),
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      _incrementCounter(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.circularBtnBackColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.add,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //inkwell for decrementation
                  InkWell(
                    onTap: () {
                      _decrementCounter(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.circularBtnBackColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.remove,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //
                  // inkwell for singled reseting
                  InkWell(
                    onTap: () {
                      _singleWidgetResetCounter(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.circularBtnBackColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.restore,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        // margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: FloatingActionButton(
                backgroundColor: AppColors.transamberorange,
                splashColor: AppColors.vivacious,
                foregroundColor: Colors.white,
                onPressed: _resetCounter,
                child: const Icon(
                  Icons.refresh,
                  size: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: FloatingActionButton(
                backgroundColor: AppColors.transamberorange,
                splashColor: AppColors.vivacious,
                foregroundColor: Colors.white,
                onPressed: _removeCounter,
                child: const Icon(
                  Icons.delete,
                  size: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: FloatingActionButton(
                backgroundColor: AppColors.vivacious,
                splashColor: AppColors.vivacious,
                foregroundColor: Colors.white,
                onPressed: _addCounter,
                child: const Icon(Icons.add_circle_outline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
