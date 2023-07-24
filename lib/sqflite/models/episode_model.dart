class EpisodeInfoModel {
  late int? id;
  late String name;
  late String sitcom;
  late bool isReleased;
  late int number;
  late int season;

  EpisodeInfoModel();

  EpisodeInfoModel.factory({
    this.id,
    required this.name,
    required this.sitcom,
    required this.isReleased,
    required this.number,
    required this.season,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'sitcom': sitcom,
      'isReleased': isReleased ? 1 : 0,
      'number': number,
      'season': season,
    };
  }

  factory EpisodeInfoModel.fromMap(Map<String, dynamic> map) {
    return EpisodeInfoModel.factory(
      id: map['id'] as int,
      name: map['name'] as String,
      sitcom: map['sitcom'] as String,
      isReleased: (map['isReleased'] == 1),
      number: map['number'] as int,
      season: map['season'] as int,
    );
  }

  @override
  String toString() {
    return '$season X $number';
  }
}
