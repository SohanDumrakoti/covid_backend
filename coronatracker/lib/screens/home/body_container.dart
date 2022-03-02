import 'package:coronatracker/data/cases.dart';
import 'package:coronatracker/models/cases_model.dart';
import 'package:coronatracker/values/colors_values.dart';
import 'package:coronatracker/widgets/custom_tile.dart';
import 'package:coronatracker/widgets/grid_Card.dart';
import 'package:flutter/material.dart';

class BodyContainer extends StatefulWidget {
  @override
  _BodyContainerState createState() => _BodyContainerState();
}

class _BodyContainerState extends State<BodyContainer> {
  Future<Cases>? _future;
  CasesResponse casesResponse = CasesResponse();

  Future getCases() async {
    final cases = await casesResponse.fetchCases();
    setState(() {
      _future = casesResponse.fetchCases();
    });
    return cases;
  }

  void initState() {
    getCases();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<Cases>(
          future: _future,
          builder: (context, AsyncSnapshot<Cases> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  Text(
                    "Nepal",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    shrinkWrap: true,
                    children: <Widget>[
                      GridCard(
                        title: "Total Tests",
                        value: snapshot.data!.total!,
                        color: ColorsValues.activeColor,
                      ),
                      GridCard(
                        title: "Confirmed",
                        value: snapshot.data!.confirmed!,
                        color: ColorsValues.redColor,
                      ),
                      GridCard(
                        title: "Recovered",
                        value: snapshot.data!.recovered!,
                        color: ColorsValues.recoveredColor,
                      ),
                      GridCard(
                        title: "Deaths",
                        value: snapshot.data!.death!,
                        color: ColorsValues.deathColor,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Overall Stats",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                  CustomTile(
                    title: "Total tested",
                    value: snapshot.data!.total!,
                  ),
                  CustomTile(
                    title: "Positive tested",
                    value: snapshot.data!.pos_tested!,
                  ),
                  CustomTile(
                    title: "Negative tested",
                    value: snapshot.data!.neg_tested!,
                  ),
                  CustomTile(
                    title: "In Isolation",
                    value: snapshot.data!.isolation!,
                  ),
                  CustomTile(
                    title: "In Quarantine",
                    value: snapshot.data!.quarentine!,
                  ),
                  CustomTile(
                    title: "Tested RTD",
                    value: snapshot.data!.tested_rtd!,
                  ),
                  CustomTile(
                    title: "Pending result",
                    value: snapshot.data!.pending!,
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
