import 'package:flutter/material.dart';
import 'package:playground_flutter_app/sqflite/models/episode_model.dart';
import 'package:playground_flutter_app/sqflite/sqflite_datasource.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final databaseDatasource = SqfliteDatasource();

  Future<List<EpisodeInfoModel>> retrieveData() async {
    // final episode = EpisodeInfoModel.factory(name: 'Ozymandias', sitcom: 'Breaking Bad', isReleased: true, number: 14, season: 5);
    // await databaseDatasource.insert(episode);
    final jsonList =
        await databaseDatasource.retrieveAll(table: 'EPISODE_INFO');
    return jsonList.map((json) => EpisodeInfoModel.fromMap(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: retrieveData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final item = snapshot.data![index];
            return Column(
              children: [
                ListTile(
                    title: Text(item.name),
                    leading: CircleAvatar(
                      child: Text(item.toString(), textScaleFactor: 0.8),
                    )),
              ],
            );
            // return Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(item.toString()),
            // );
          },
        );
      },
    );
  }
}
