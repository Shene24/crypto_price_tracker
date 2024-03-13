import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/crypto_service.dart';
import 'app_events.dart';
import 'app_states.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final CryptoRepo cryptoService;

  AppBloc(this.cryptoService) : super(AppLoadingState()) {
    on<AppEvent>((event, emit) async {
      emit(AppLoadingState());
      print('you emitted $event');
      emit(AppLoadedState());
    });
  }
}
