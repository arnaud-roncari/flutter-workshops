part of 'core_bloc.dart';

sealed class CoreState {}

final class CoreInitial extends CoreState {}

final class CoreUpdated extends CoreState {}
