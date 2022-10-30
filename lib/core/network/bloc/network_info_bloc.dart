import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_app/core/injection_container.dart';

part 'network_info_event.dart';
part 'network_info_state.dart';

class NetworkInfoBloc extends Bloc<NetworkInfoEvent, NetworkInfoState> {
  final InternetConnectionChecker internetConnectionChecker =
      sl<InternetConnectionChecker>();

  NetworkInfoBloc() : super(NetworkInfoInitial()) {
    on<NetworkOnline>((event, emit) => emit(NetworkOnlineState()));

    on<NetworkOffline>((event, emit) => emit(NetworkOfflineState()));
  }
}
