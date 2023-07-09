import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecom/models/models.dart';
import 'package:equatable/equatable.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutLoading()) {
    on<CheckoutEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
