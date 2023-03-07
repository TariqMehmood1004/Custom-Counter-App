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

  void _resetCounter() {
    setState(() {
      for (var i = 0; i < _counters.length; i++) {
        _counters[i] = 0;
      }
      showSnackBar("You have reset all the counters.");
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
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: AppColors.transamberorange,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              title: Text(
                'Counter ${index + 1}',
                style: TextStyle(
                  color: AppColors.bodybackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              subtitle: Text('Value: ${_counters[index]}'),
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
                          child: Text(
                            "+",
                            style: TextStyle(color: Colors.black, fontSize: 20),
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
                          child: Text(
                            "-",
                            style: TextStyle(color: Colors.black, fontSize: 20),
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
                backgroundColor: AppColors.white,
                splashColor: AppColors.vivacious,
                foregroundColor: Colors.amber,
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
                backgroundColor: AppColors.blackBackColor,
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
