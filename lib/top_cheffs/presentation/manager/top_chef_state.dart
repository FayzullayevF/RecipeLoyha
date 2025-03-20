import 'package:chef_staff/data/models/top_chef_model.dart';
import 'package:equatable/equatable.dart';

enum ChefsStatus { idle, loading, error, success }

class ChefsState extends Equatable {
  final List<ChefModel> mostViewedChefs;
  final ChefsStatus mostViewedChefsStatus;
  final List<ChefModel> mostLikedChefs;
  final ChefsStatus mostLikedChefsStatus;
  final List<ChefModel> newChefs;
  final ChefsStatus newStatus;

  const ChefsState({
    required this.mostViewedChefs,
    required this.mostViewedChefsStatus,
    required this.mostLikedChefs,
    required this.mostLikedChefsStatus,
    required this.newChefs,
    required this.newStatus,
  });

  factory ChefsState.initial() {
    return ChefsState(
      mostViewedChefs: [],
      mostViewedChefsStatus: ChefsStatus.idle,
      mostLikedChefs: [],
      mostLikedChefsStatus: ChefsStatus.idle,
      newChefs: [],
      newStatus: ChefsStatus.idle,
    );
  }

  ChefsState copyWith({
    List<ChefModel>? mostViewedChefs,
    ChefsStatus? mostViewedChefsStatus,
    List<ChefModel>? mostLikedChefs,
    ChefsStatus? mostLikedChefsStatus,
    List<ChefModel>? newChefs,
    ChefsStatus? newStatus,
  }) {
    return ChefsState(
        mostViewedChefs: mostViewedChefs ?? this.mostViewedChefs,
        mostViewedChefsStatus:
            mostViewedChefsStatus ?? this.mostViewedChefsStatus,
        mostLikedChefs: mostLikedChefs ?? this.mostLikedChefs,
        mostLikedChefsStatus: mostLikedChefsStatus ?? this.mostLikedChefsStatus,
        newChefs: newChefs ?? this.newChefs,
        newStatus: newStatus ?? this.newStatus);
  }

  @override
  List<Object?> get props => [
        mostLikedChefs,
        mostViewedChefs,
        newChefs,
        mostLikedChefsStatus,
        mostViewedChefsStatus,
        newStatus
      ];
}
