// import 'dart:convert';
// import 'package:coronatracker/models/cases_model.dart';
// import 'package:coronatracker/values/colors_values.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class CaseDetails extends StatefulWidget {
//   @override
//   _CaseDetailsState createState() => _CaseDetailsState();
// }

// class _CaseDetailsState extends State<CaseDetails> {

//   final String url = "http://10.0.0.2:5000/api/cases/kathmandu";
//   Future<Cases> _future;

//    @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _future = getData();
//   }

//   Future getData() async {
//     var response = await http.get(
//       Uri.encodeFull(url),
//       headers: {"Accept":"application/json"}
//     );
//     if (response.statusCode == 200){
//       var details = json.decode(response.body);
//       return details;
//     }else{
//       print("Sorry");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return OverallStats(future: _future);
//   }
// }

// class OverallStats extends StatelessWidget {
//   const OverallStats({
//     Key? key,
//     // @required Future<Cases> future,
//   }) 
//   // : _future = future, super(key: key);

//   // final Future<Cases> _future;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(10.0),
//       child: ListView(
//         children: <Widget>[
//           // Card(
//           //   color: ColorsValues.defaultColor,
//           //   elevation: 1,
//           //   child: ListTile(
//           //   title: Text("Total Tested"),
//           //   trailing: FutureBuilder<Cases>(
//           //     future: _future,
//           //     builder: (context, snapshot){
//           //       if (snapshot.hasData){
//           //         return Text(snapshot.data.total);
//           //       } else {
//           //         return CircularProgressIndicator();
//           //       }
//           //     },
//           //   )
//           //   ),
//           // ),
//           // Card(
//           //   color: ColorsValues.defaultColor,
//           //   elevation: 1,
//           //   child: ListTile(
//           //   title: Text("Positive Tested"),
//           //   trailing: FutureBuilder<Cases>(
//           //     future: _future,
//           //     builder: (context, snapshot){
//           //       if (snapshot.hasData){
//           //         return Text(snapshot.data.pos_tested);
//           //       } else {
//           //         return CircularProgressIndicator();
//           //       }
//           //     },
//           //   )
//           //   ),
//           // ),
//           // Card(
//           //   color: ColorsValues.defaultColor,
//           //   elevation: 1,
//           //   child: ListTile(
//           //   title: Text("Negative Tested"),
//           //   trailing: FutureBuilder<Cases>(
//           //     future: _future,
//           //     builder: (context, snapshot){
//           //       if (snapshot.hasData){
//           //         return Text(snapshot.data.neg_tested);
//           //       } else {
//           //         return CircularProgressIndicator();
//           //       }
//           //     },
//           //   )
//           //   ),
//           // ),
//           // Card(
//           //   color: ColorsValues.defaultColor,
//           //   elevation: 1,
//           //   child: ListTile(
//           //   title: Text("In Isolation"),
//           //   trailing: FutureBuilder<Cases>(
//           //     future: _future,
//           //     builder: (context, snapshot){
//           //       if (snapshot.hasData){
//           //         return Text(snapshot.data.isolation);
//           //       } else {
//           //         return CircularProgressIndicator();
//           //       }
//           //     },
//           //   )
//           //   ),
//           // ),
//           // Card(
//           //   color: ColorsValues.defaultColor,
//           //   elevation: 1,
//           //   child: ListTile(
//           //   title: Text("In Quarantine"),
//           //   trailing: FutureBuilder<Cases>(
//           //     future: _future,
//           //     builder: (context, snapshot){
//           //       if (snapshot.hasData){
//           //         return Text(snapshot.data.quarentine);
//           //       } else {
//           //         return CircularProgressIndicator();
//           //       }
//           //     },
//           //   )
//           //   ),
//           // ),
//           // Card(
//           //   color: ColorsValues.defaultColor,
//           //   elevation: 1,
//           //   child: ListTile(
//           //   title: Text("Tested RTD"),
//           //   trailing: FutureBuilder<Cases>(
//           //     future: _future,
//           //     builder: (context, snapshot){
//           //       if (snapshot.hasData){
//           //         return Text(snapshot.data.tested_rtd);
//           //       } else {
//           //         return CircularProgressIndicator();
//           //       }
//           //     },
//           //   )
//           //   ),
//           // ),
//           // Card(
//           //   color: ColorsValues.defaultColor,
//           //   elevation: 1,
//           //   child: ListTile(
//           //   title: Text("Pending Result"),
//           //   trailing: FutureBuilder<Cases>(
//           //     future: _future,
//           //     builder: (context, snapshot){
//           //       if (snapshot.hasData){
//           //         return Text(snapshot.data.pending);
//           //       } else {
//           //         return CircularProgressIndicator();
//           //       }
//               // },
//             // )
//             // ),
//           ),
//         ],
//       ),
//     );
//   }
// }