///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsFr = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final Translations$home_page$fr home_page = Translations$home_page$fr._(_root);
	late final Translations$matchmaking_page$fr matchmaking_page = Translations$matchmaking_page$fr._(_root);
	late final Translations$accept_player_page$fr accept_player_page = Translations$accept_player_page$fr._(_root);
}

// Path: home_page
class Translations$home_page$fr {
	Translations$home_page$fr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// fr: 'Nouvelle partie'
	String get new_game => 'Nouvelle partie';

	/// fr: 'Lancer une nouvelle partie'
	String get run_game => 'Lancer une nouvelle partie';
}

// Path: matchmaking_page
class Translations$matchmaking_page$fr {
	Translations$matchmaking_page$fr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// fr: 'Recherche de partie...'
	String get searching_game => 'Recherche de partie...';
}

// Path: accept_player_page
class Translations$accept_player_page$fr {
	Translations$accept_player_page$fr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// fr: 'Refuser'
	String get reject_opponent => 'Refuser';

	/// fr: 'Accepter'
	String get accept_opponent => 'Accepter';

	/// fr: 'Partie trouvée !'
	String get found_opponent => 'Partie trouvée !';

	/// fr: 'Revenir a l'accueil'
	String get come_back_to_home_page => 'Revenir a l\'accueil';
}

/// The flat map containing all translations for locale <fr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'home_page.new_game' => 'Nouvelle partie',
			'home_page.run_game' => 'Lancer une nouvelle partie',
			'matchmaking_page.searching_game' => 'Recherche de partie...',
			'accept_player_page.reject_opponent' => 'Refuser',
			'accept_player_page.accept_opponent' => 'Accepter',
			'accept_player_page.found_opponent' => 'Partie trouvée !',
			'accept_player_page.come_back_to_home_page' => 'Revenir a l\'accueil',
			_ => null,
		};
	}
}
