part of 'network_info_bloc.dart';

abstract class NetworkInfoState extends Equatable {
  const NetworkInfoState();
  
  @override
  List<Object> get props => [];
}

class NetworkInfoInitial extends NetworkInfoState {}

class NetworkOfflineState extends NetworkInfoState{}

class NetworkOnlineState extends NetworkInfoState{}
