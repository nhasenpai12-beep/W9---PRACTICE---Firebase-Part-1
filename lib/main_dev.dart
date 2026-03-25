import 'package:provider/provider.dart';
import 'package:w9_firebase/data/repositories/settings/app_settings_repository.dart';
import 'data/repositories/artists/artists_repository_firebase.dart';
import 'data/repositories/artists/artists_repository.dart';
import 'data/repositories/songs/song_repository_firebase.dart';
import 'main_common.dart';
import 'data/repositories/settings/app_settings_repository_mock.dart';
import 'data/repositories/songs/song_repository.dart';
import 'ui/states/player_state.dart';
import 'ui/states/settings_state.dart';

/// Configure provider dependencies for dev environment
List<InheritedProvider> get devProviders {
  final appSettingsRepository = AppSettingsRepositoryMock();

  return [
    Provider<SongRepository>(
      create: (_) => SongRepositoryFirebase(),
    ),
    Provider<ArtistRepository>(
      create: (_) => ArtistRepositoryFirebase(),
    ),
    Provider<PlayerState>(
      create: (_) => PlayerState(),
    ),
    ChangeNotifierProvider<AppSettingsState>(
      create: (_) => AppSettingsState(repository: appSettingsRepository),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
