import 'package:bloc/bloc.dart';
import 'package:news/core/helper/cach.dart';

part 'change_state.dart';

class ChangeCubit extends Cubit<ChangeState> {
  ChangeCubit() : super(ChangeInitial());

  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangesModeState());
    } else {
      isDark = !isDark;
      ChachHelper.putBoolean(key: 'isDark', value: isDark).then(
        (value) {
          emit(ChangesModeState());
        },
      );
    }
  }
}
