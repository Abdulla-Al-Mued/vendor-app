import 'package:flutter_riverpod/flutter_riverpod.dart';

enum InboxFilter { customer, deliveryMan }

class InboxState {
  final InboxFilter selectedFilter;
  final String searchQuery;

  InboxState({
    this.selectedFilter = InboxFilter.customer,
    this.searchQuery = '',
  });

  InboxState copyWith({
    InboxFilter? selectedFilter,
    String? searchQuery,
  }) {
    return InboxState(
      selectedFilter: selectedFilter ?? this.selectedFilter,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

class InboxController extends Notifier<InboxState> {
  @override
  InboxState build() {
    return InboxState();
  }

  void setFilter(InboxFilter filter) {
    state = state.copyWith(selectedFilter: filter);
  }

  void search(String query) {
    state = state.copyWith(searchQuery: query);
  }
}

final inboxControllerProvider =
    NotifierProvider<InboxController, InboxState>(InboxController.new);
