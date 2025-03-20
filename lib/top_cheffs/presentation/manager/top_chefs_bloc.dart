import 'package:chef_staff/data/repository/chef_staff_repository.dart';
import 'package:chef_staff/top_cheffs/presentation/manager/top_chef_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'top_chefs_event.dart';

class ChefsBloc extends Bloc<ChefsEvent, ChefsState> {
  ChefsBloc({required ChefStaffRepository chefRepo})
      : _chefRepo = chefRepo,
        super(ChefsState.initial());
  final ChefStaffRepository _chefRepo;

  Future<void> _onLoad(ChefsLoading event, Emitter<ChefsState> emit) async {
    emit(state.copyWith(
      mostLikedChefsStatus: ChefsStatus.loading,
      mostViewedChefsStatus: ChefsStatus.loading,
      newStatus: ChefsStatus.loading,
    ));
    final mostViewedChefs = await _chefRepo.fetchMostViewedChefs();
    emit(state.copyWith(mostViewedChefs: mostViewedChefs, mostViewedChefsStatus: ChefsStatus.success ));
    final mostLikedChefs = await _chefRepo.fetchMostLikedChefs();
    emit(state.copyWith(mostLikedChefs: mostLikedChefs, mostLikedChefsStatus: ChefsStatus.success));
    final newChefs = await _chefRepo.fetchNewChefs();
    emit(state.copyWith(newChefs: newChefs, newStatus: ChefsStatus.success));
  }
}
