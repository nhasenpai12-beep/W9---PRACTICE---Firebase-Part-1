import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../model/artists/artists.dart';
import '../../../theme/theme.dart';
import '../../../utils/async_value.dart';
import '../view_model/artists_view_model.dart';
import 'artists_tiles.dart';

class ArtistsContent extends StatelessWidget {
  const ArtistsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final ArtistsViewModel viewModel = context.watch<ArtistsViewModel>();
    final AsyncValue<List<Artists>> asyncValue = viewModel.artistsValue;

    Widget content;
    switch (asyncValue.state) {
      case AsyncValueState.loading:
        content = const Center(child: CircularProgressIndicator());
        break;
      case AsyncValueState.error:
        content = const Center(child: Text('Failed to load artists', style: const TextStyle(color: Colors.red)));
        break;
      case AsyncValueState.success:
        final artists = asyncValue.data!;
        content = ListView.builder(
          itemCount: artists.length,
          itemBuilder: (context, index) => ArtistsTiles(artist: artists[index]),
        );
    }
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Text('Artists', style: AppTextStyles.heading),
          const SizedBox(height: 50),
          Expanded(child: content),
        ],
      ),
    );
  }
}