import 'package:crypto_price_tracker/blocs/app_events.dart';
import 'package:crypto_price_tracker/models/crypto_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:crypto_price_tracker/blocs/crypto_bloc.dart';
import 'package:crypto_price_tracker/blocs/app_states.dart';
import 'package:crypto_price_tracker/services/crypto_service.dart';

class CryptoView extends StatelessWidget {
  const CryptoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppBloc(
              RepositoryProvider.of<CryptoRepo>(context),
            )..add(AppLoad()),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Crypto Market Prices'),
          ),
          body: BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              if (state is AppLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ExchangeErrorState) {
                return Center(
                  child: Text('Error loading data: ${state.error}'),
                );
              }
              if (state is AppLoadedState) {
                List<CryptoModel> data = state.data;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    CryptoModel crypto = data[index];
                    return ListTile(
                      title: Text(crypto.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price: ${crypto.price.toString()}'),
                          Text('High: ${crypto.high.toString()}'),
                          Text('Low: ${crypto.low.toString()}'),
                          Text('Change: ${crypto.change.toString()}'),
                        ],
                      ),
                    );
                  },
                );
              }
              return Container();
            },
          ),
        ));
  }
}
