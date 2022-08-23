import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_cinema/src/domain/entities/cast.dart';
import 'package:app_cinema/src/ui/utils/responsive.dart';
import 'package:app_cinema/src/domain/helpers/helpers.dart';
import 'package:app_cinema/src/ui/views/movies_provider.dart';
import 'package:app_cinema/src/ui/widgets/circular_icon.dart';
import 'package:app_cinema/src/ui/widgets/my_network_image.dart';

class CastView extends StatefulWidget {
  const CastView({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<CastView> createState() => _CastViewState();
}

class _CastViewState extends State<CastView> {
  late Future<List<Cast>> _movieCastFuture;

  @override
  void initState() {
    super.initState();
    _movieCastFuture = context.read<MoviesProvider>().getMovieCast(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: CircularIcon(
          icon: Icons.keyboard_arrow_down_rounded,
          onTap: () => Navigator.pop(context),
        ),
        title: const Text('Cast'),
      ),
      body: FutureBuilder(
        future: _movieCastFuture,
        builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
          if (snapshot.hasData) {
            final casts = snapshot.data!;
            return ListView.separated(
              itemCount: casts.length,
              itemBuilder: (_, i) {
                final cast = casts[i];
                return ListTile(
                  leading: cast.profilePath != null
                      ? ClipOval(
                          child: MyNetworkImage(
                            Helpers.getUrlImage(cast.profilePath!),
                            height: 55,
                            width: 55,
                          ),
                        )
                      : const SizedBox(
                          height: 65,
                          width: 65,
                          child: Icon(Icons.chair_alt_rounded),
                        ),
                  title: Text(
                    cast.character,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    cast.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              },
              separatorBuilder: (_, __) => const Divider(),
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
