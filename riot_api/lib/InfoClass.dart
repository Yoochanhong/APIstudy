class Info {
  final String? id;
  final String? accountId;
  final String? puuid;
  final String? name;
  final int? profileIconId;
  final int? revisionDate;
  final int? summonerLevel;

  Info(
      {this.id,
        this.accountId,
        this.puuid,
        this.name,
        this.profileIconId,
        this.revisionDate,
        this.summonerLevel});

  factory Info.fromjson(Map<dynamic, dynamic> json) {
    return Info(
      id: json['id'],
      accountId: json['accountId'],
      puuid: json['puuid'],
      name: json['name'],
      profileIconId: json['profileIconId'],
      revisionDate: json['revisionDate'],
      summonerLevel: json['summonerLevel'],
    );
  }
}