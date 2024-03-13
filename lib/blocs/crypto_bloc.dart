import 'package:crypto_price_tracker/models/crypto_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/crypto_service.dart';
import 'app_events.dart';
import 'app_states.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final CryptoRepo cryptoService;

  AppBloc(this.cryptoService) : super(AppLoadingState()) {
    on<AppEvent>((event, emit) async {
      try {
        emit(AppLoadingState());
        print('Loading data');
        final List<CryptoModel> data =
            await cryptoService.getExchangeStream().first;
        emit(AppLoadedState(data));
        print('Data loaded');
      } catch (error) {
        emit(ExchangeErrorState('Error loading data: $error'));
      }
    });
  }
}
