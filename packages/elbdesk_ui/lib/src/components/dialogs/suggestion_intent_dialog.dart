import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Dialog for selecting a suggestion from a list.
class SuggestionIntentDialog extends HookConsumerWidget {
  const SuggestionIntentDialog({
    required this.onSuggestionSelected,
    required this.fieldSuggestion,
    required this.initialValue,
    super.key,
  });

  static const double _maxDialogHeight = 400;
  static const double _itemHeight = 40;

  final void Function(String) onSuggestionSelected;
  final String initialValue;
  final FieldSuggestion fieldSuggestion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final searchController = useTextEditingController(text: initialValue);
    final selectedIndex = useState(0);
    final scrollController = useScrollController();

    final searchText = useListenableSelector(
      searchController,
      () => searchController.text,
    );

    final suggestionsAsync = ref.watch(
      fieldSuggestionsControllerProvider(
        fieldSuggestion.tableType,
        fieldSuggestion.fieldKey,
      ),
    );

    final suggestions = suggestionsAsync.valueOrNull ?? const [];

    // Update search term
    useEffect(
      () {
        Future.microtask(() {
          ref
              .read(
                fieldSuggestionsControllerProvider(
                  fieldSuggestion.tableType,
                  fieldSuggestion.fieldKey,
                ).notifier,
              )
              .updateSearchTerm(searchText);
        });
        return null;
      },
      [searchText],
    );

    // Auto-focus is handled by NextTextField autofocus: true

    // Reset selection on suggestions change
    useEffect(
      () {
        selectedIndex.value = 0;
        return null;
      },
      [suggestions],
    );

    // Scroll to selected item
    useEffect(
      () {
        if (!scrollController.hasClients || suggestions.isEmpty) return null;

        final targetOffset = selectedIndex.value * _itemHeight;
        final viewportHeight = scrollController.position.viewportDimension;
        final currentOffset = scrollController.offset;

        // Only scroll if item is outside viewport
        if (targetOffset < currentOffset ||
            targetOffset + _itemHeight > currentOffset + viewportHeight) {
          scrollController.animateTo(
            (targetOffset - viewportHeight / 2 + _itemHeight / 2)
                .clamp(0.0, scrollController.position.maxScrollExtent),
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
          );
        }
        return null;
      },
      [selectedIndex.value],
    );

    void selectSuggestion() {
      if (suggestions.isNotEmpty) {
        onSuggestionSelected(suggestions[selectedIndex.value]);
        Navigator.of(context).pop();
      }
    }

    void moveSelection(int delta) {
      if (suggestions.isEmpty) return;
      final newIndex = selectedIndex.value + delta;
      selectedIndex.value = newIndex.clamp(0, suggestions.length - 1);
    }

    return ElbAlertDialog(
      titleText: l10n.suggestion_select,
      titleIcon: AppIcons.search,
      contentPadding: const EdgeInsets.only(
        left: UiConstants.defaultPadding,
        top: UiConstants.defaultPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CallbackShortcuts(
            bindings: {
              const SingleActivator(LogicalKeyboardKey.arrowDown): () =>
                  moveSelection(1),
              const SingleActivator(LogicalKeyboardKey.arrowUp): () =>
                  moveSelection(-1),
              const SingleActivator(LogicalKeyboardKey.enter): selectSuggestion,
              const SingleActivator(LogicalKeyboardKey.numpadEnter):
                  selectSuggestion,
            },
            child: Padding(
              padding: const EdgeInsets.only(
                right: UiConstants.defaultPadding,
              ),
              child: NextTextField(
                controller: searchController,
                hintText: l10n.gen_search,
                leadingIcon: const ElbIcon(AppIcons.search),
                autofocus: true,
                onSubmitted: (_) => selectSuggestion(),
              ),
            ),
          ),
          const SizedBox(height: AppSpace.m),
          SizedBox(
            height: 300,
            child: suggestionsAsync.when(
              skipLoadingOnRefresh: true,
              data: (data) => data.isEmpty
                  ? _EmptyView(l10n: l10n)
                  : _SuggestionsList(
                      suggestions: data,
                      selectedIndex: selectedIndex.value,
                      scrollController: scrollController,
                      onSelect: (s) {
                        onSuggestionSelected(s);
                        Navigator.of(context).pop();
                      },
                      onHover: (i) => selectedIndex.value = i,
                    ),
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}

class _SuggestionsList extends StatelessWidget {
  const _SuggestionsList({
    required this.suggestions,
    required this.selectedIndex,
    required this.scrollController,
    required this.onSelect,
    required this.onHover,
  });

  final List<String> suggestions;
  final int selectedIndex;
  final ScrollController scrollController;
  final ValueChanged<String> onSelect;
  final ValueChanged<int> onHover;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return ListView.builder(
      controller: scrollController,
      itemCount: suggestions.length,
      padding: const EdgeInsets.only(
        right: UiConstants.defaultPadding,
      ),
      itemBuilder: (context, index) {
        final isSelected = index == selectedIndex;

        return ElbInkWell(
          backgroundColor: isSelected
              ? theme.generalColors.primary.withAppOpacity(0.15)
              : Colors.transparent,
          hoverColor: theme.generalColors.primary.withAppOpacity(0.15),
          onTap: () => onSelect(suggestions[index]),
          // onHover: (_) => onHover(index),
          child: Container(
            height: SuggestionIntentDialog._itemHeight,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.m),
            child: AppText(
              suggestions[index],
              color: isSelected
                  ? theme.generalColors.primary
                  : theme.generalColors.onBackground,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView({required this.l10n});

  final ElbCoreLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElbIcon(
            AppIcons.search_off,
            size: AppIconSize.l,
            color: theme.generalColors.onBackground.withAppOpacity(0.3),
          ),
          const SizedBox(height: AppSpace.m),
          AppText(
            l10n.suggestion_none_found,
            color: theme.generalColors.onBackground.withAppOpacity(0.6),
          ),
        ],
      ),
    );
  }
}
