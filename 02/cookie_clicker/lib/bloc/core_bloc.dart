import 'package:flutter_bloc/flutter_bloc.dart';

part 'core_event.dart';
part 'core_state.dart';

class CoreBloc extends Bloc<CoreEvent, CoreState> {
  int score = 1000;
  int cookiePerClick = 1;
  String currentSkin = "cookie_1.png";

  /// Effects
  bool bonusOne = false;

  /// Skin
  bool skinOne = false;

  CoreBloc() : super(CoreInitial()) {
    on<OnCookieTapped>(onCookieTapped);
    on<OnSkinOneUnlocked>(onSkinOneUnlocked);
    on<OnBonusOneUnlocked>(onBonusOneUnlocked);
  }

  void onCookieTapped(OnCookieTapped event, Emitter<CoreState> emit) {
    score += cookiePerClick;
    emit(CoreUpdated());
  }

  void onSkinOneUnlocked(OnSkinOneUnlocked event, Emitter<CoreState> emit) {
    skinOne = true;
    currentSkin = "cookie_4.png";
    emit(CoreUpdated());
  }

  void onBonusOneUnlocked(OnBonusOneUnlocked event, Emitter<CoreState> emit) {
    bonusOne = true;
    score -= 100;
    cookiePerClick = 3;
    emit(CoreUpdated());
  }
}
