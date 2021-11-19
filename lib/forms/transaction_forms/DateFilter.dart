// ignore: file_names
// ignore_for_file: file_names, curly_braces_in_flow_control_structures, prefer_const_constructors, avoid_print, sized_box_for_whitespace, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFilter extends StatefulWidget {
  final DateTime fromDate;
  final DateTime toDate;
  final void Function(DateTime fromDate, DateTime toDate) datesSelected;
  const DateFilter({
    Key? key,
    required this.fromDate,
    required this.toDate,
    required this.datesSelected,
  }) : super(key: key);
  @override
  _DateFilterState createState() => _DateFilterState();
}

class _DateFilterState extends State<DateFilter> {
  late DateTime fromDate = widget.fromDate;
  late DateTime toDate = widget.toDate;
  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    String fromDateStr = formatter.format(fromDate);
    String toDateStr = formatter.format(toDate);
    print('d from : $fromDateStr');
    print('d to : $toDateStr');
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              // color: Colors.red,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Date",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      // height: 50,
                      // width: 180,
                      margin: EdgeInsets.symmetric(horizontal: 1),
                      padding: EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                          padding:
                              EdgeInsets.only(left: 1.0, right: 10.0, top: 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Flexible(
                                child: IconButton(
                                  icon: Icon(Icons.calendar_today,
                                      color: Colors.black),
                                  onPressed: () {
                                    _fromselectDate(context);
                                    print('select date');
                                  },
                                ),
                              ),
                              Text(fromDateStr),
                            ],
                          )),
                    ),
                  ),
                  Text(
                    "To",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 1),
                      padding: EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                          padding:
                              EdgeInsets.only(left: 1.0, right: 10.0, top: 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Flexible(
                                child: IconButton(
                                  icon: Icon(Icons.calendar_today,
                                      color: Colors.black),
                                  onPressed: () => _toselectDate(context),
                                ),
                              ),
                              Text(toDateStr),
                            ],
                          )),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      widget.datesSelected(fromDate, toDate);
                      // print('fromdate33 : $fromDate');
                      // print('todate33 : $toDate');
                    },
                    icon: Icon(
                      Icons.send_rounded,
                      color: Colors.blue,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _fromselectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.fromDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );

    if (picked != null)
      // fromDate = picked;
      setState(
        () {
          print('fromDate is $picked');
          fromDate = picked;
          // print();
        },
      );
    print('fromDate selected');
  }

  _toselectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.toDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null)
      setState(() {
        print('todate is $picked');
        toDate = picked;
      });
  }
}
