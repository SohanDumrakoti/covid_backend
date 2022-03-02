class Cases {
  int? total;
  int? confirmed;
  int? recovered;
  int? death;
  int? pos_tested;
  int? neg_tested;
  int? isolation;
  int? quarentine;
  int? tested_rtd;
  int? pending;

  Cases(
      {this.total,
      this.confirmed,
      this.recovered,
      this.death,
      this.pos_tested,
      this.neg_tested,
      this.isolation,
      this.quarentine,
      this.tested_rtd,
      this.pending});

  factory Cases.fromJson(Map<String, dynamic> json) {
    return Cases(
      total: json['tested_total'],
      confirmed: json['tested_positive'],
      recovered: json['recovered'],
      death: json['deaths'],
      pos_tested: json['tested_positive'],
      neg_tested: json['tested_negative'],
      isolation: json['in_isolation'],
      quarentine: json['quarantined'],
      tested_rtd: json['tested_rdt'],
      pending: json['pending_result'],
    );
  }
}
