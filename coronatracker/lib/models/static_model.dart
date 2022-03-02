class CasesGraph {
  String? date;
  int? activeCases;
  int? recoveredCases;
  int? deathCases;

  CasesGraph(
      {this.date, this.activeCases, this.recoveredCases, this.deathCases});

  factory CasesGraph.fromJson(Map<String, dynamic> json) {
    return CasesGraph(
      date: json["date"],
      activeCases: json["totalCases"],
      recoveredCases: json["totalRecoveries"],
      deathCases: json["totalDeaths"],
    );
  }
}
