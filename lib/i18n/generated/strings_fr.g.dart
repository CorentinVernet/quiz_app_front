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
	late final Translations$history_page$fr history_page = Translations$history_page$fr._(_root);
	late final Translations$profile_page$fr profile_page = Translations$profile_page$fr._(_root);
	late final Translations$settings_page$fr settings_page = Translations$settings_page$fr._(_root);
	late final Translations$sing_in_page$fr sing_in_page = Translations$sing_in_page$fr._(_root);
	late final Translations$sign_up_page$fr sign_up_page = Translations$sign_up_page$fr._(_root);
	late final Translations$waiting_for_theme_page$fr waiting_for_theme_page = Translations$waiting_for_theme_page$fr._(_root);
	late final Translations$forgot_password_page$fr forgot_password_page = Translations$forgot_password_page$fr._(_root);
	late final Translations$matchmaking_page$fr matchmaking_page = Translations$matchmaking_page$fr._(_root);
	late final Translations$accept_player_page$fr accept_player_page = Translations$accept_player_page$fr._(_root);
	late final Translations$between_rounds_page$fr between_rounds_page = Translations$between_rounds_page$fr._(_root);
	late final Translations$choose_first_player_page$fr choose_first_player_page = Translations$choose_first_player_page$fr._(_root);
	late final Translations$choose_theme_page$fr choose_theme_page = Translations$choose_theme_page$fr._(_root);
	late final Translations$shared$fr shared = Translations$shared$fr._(_root);
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

// Path: history_page
class Translations$history_page$fr {
	Translations$history_page$fr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// fr: 'Historique'
	String get history_label => 'Historique';
}

// Path: profile_page
class Translations$profile_page$fr {
	Translations$profile_page$fr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// fr: 'Mon profil'
	String get my_profile => 'Mon profil';

	/// fr: 'Nom d'utilisateur'
	String get user_name => 'Nom d\'utilisateur';
}

// Path: settings_page
class Translations$settings_page$fr {
	Translations$settings_page$fr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// fr: 'Paramètres'
	String get settings_page_label => 'Paramètres';
}

// Path: sing_in_page
class Translations$sing_in_page$fr {
	Translations$sing_in_page$fr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$sing_in_page$error_labels$fr error_labels = Translations$sing_in_page$error_labels$fr._(_root);

	/// fr: 'Ok'
	String get ok => 'Ok';

	/// fr: 'Email:'
	String get email_field_label => 'Email:';

	/// fr: 'Entrez votre Email'
	String get enter_email_label => 'Entrez votre Email';

	/// fr: 'Connectez-vous pour continuer'
	String get sign_in_label => 'Connectez-vous pour continuer';

	/// fr: 'Mot de passe:'
	String get password_field_Label => 'Mot de passe:';

	/// fr: 'Entrez votre mot de passe'
	String get enter_password_label => 'Entrez votre mot de passe';

	/// fr: 'Connexion'
	String get login_label => 'Connexion';

	/// fr: 'Mot de passe oublié ?'
	String get forgot_password_label => 'Mot de passe oublié ?';

	/// fr: 'Vous n'avez pas de compte ?'
	String get create_account_link_label => 'Vous n\'avez pas de compte ?';

	/// fr: 'Créer un compte'
	String get sign_up_label => 'Créer un compte';
}

// Path: sign_up_page
class Translations$sign_up_page$fr {
	Translations$sign_up_page$fr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$sign_up_page$error_labels$fr error_labels = Translations$sign_up_page$error_labels$fr._(_root);

	/// fr: 'Ok'
	String get ok => 'Ok';

	/// fr: 'Connectez-vous'
	String get sign_in_label => 'Connectez-vous';

	/// fr: 'Mot de passe:'
	String get password_field_label => 'Mot de passe:';

	/// fr: 'Créer le compte'
	String get create_account_button_label => 'Créer le compte';

	/// fr: 'Creez un compte pour continuer'
	String get sign_up_label => 'Creez un compte pour continuer';

	/// fr: 'Entrez votre mot de passe'
	String get enter_password_label => 'Entrez votre mot de passe';

	/// fr: 'Confirmez votre mot de passe'
	String get confirm_your_password => 'Confirmez votre mot de passe';

	/// fr: 'Confirmation du mot de passe:'
	String get confirm_password_label => 'Confirmation du mot de passe:';

	/// fr: 'Vous avez déjà un compte ?'
	String get already_have_account_label => 'Vous avez déjà un compte ?';
}

// Path: waiting_for_theme_page
class Translations$waiting_for_theme_page$fr {
	Translations$waiting_for_theme_page$fr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// fr: 'L'adversaire choisit un thème...'
	String get waiting_for_theme_label => 'L\'adversaire choisit un thème...';
}

// Path: forgot_password_page
class Translations$forgot_password_page$fr {
	Translations$forgot_password_page$fr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// fr: 'Envoyer'
	String get send_button_label => 'Envoyer';

	/// fr: 'Email:'
	String get email_field_label => 'Email:';

	/// fr: 'Entrez votre Email'
	String get enter_email => 'Entrez votre Email';

	/// fr: 'Mot de passe oublié ?'
	String get forgot_your_password_label => 'Mot de passe oublié ?';
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

// Path: between_rounds_page
class Translations$between_rounds_page$fr {
	Translations$between_rounds_page$fr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// fr: 'Statut des manches'
	String get round_status => 'Statut des manches';
}

// Path: choose_first_player_page
class Translations$choose_first_player_page$fr {
	Translations$choose_first_player_page$fr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// fr: 'VS'
	String get vs_label => 'VS';

	/// fr: 'Moi'
	String get me_label => 'Moi';

	/// fr: 'Choix du premier joueur'
	String get choose_first_player => 'Choix du premier joueur';

	/// fr: 'Commencer la partie'
	String get start_game => 'Commencer la partie';
}

// Path: choose_theme_page
class Translations$choose_theme_page$fr {
	Translations$choose_theme_page$fr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// fr: 'Choisis un thème:'
	String get choose_theme_label => 'Choisis un thème:';
}

// Path: shared
class Translations$shared$fr {
	Translations$shared$fr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$shared$round_names$fr round_names = Translations$shared$round_names$fr._(_root);
	late final Translations$shared$theme_names$fr theme_names = Translations$shared$theme_names$fr._(_root);

	/// fr: 'Bienvenue sur Qwiz !'
	String get welcome_label => 'Bienvenue sur Qwiz !';
}

// Path: sing_in_page.error_labels
class Translations$sing_in_page$error_labels$fr {
	Translations$sing_in_page$error_labels$fr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// fr: 'Compte introuvable'
	String get missing_account => 'Compte introuvable';

	/// fr: 'Mot de passe incorect'
	String get incorrect_password => 'Mot de passe incorect';

	/// fr: 'Informations manquantes'
	String get missing_credentials => 'Informations manquantes';

	/// fr: 'Une erreur inconnue s'est produite'
	String get unknown_error => 'Une erreur inconnue s\'est produite';
}

// Path: sign_up_page.error_labels
class Translations$sign_up_page$error_labels$fr {
	Translations$sign_up_page$error_labels$fr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// fr: 'Informations manquantes'
	String get missing_credentials => 'Informations manquantes';

	/// fr: 'Une erreur inconnue s'est produite'
	String get unknown_error => 'Une erreur inconnue s\'est produite';

	/// fr: 'Un.e utilisateur.ice avec ce nom d'utilisateur existe deja.'
	String get already_existing_user => 'Un.e utilisateur.ice avec ce nom d\'utilisateur existe deja.';
}

// Path: shared.round_names
class Translations$shared$round_names$fr {
	Translations$shared$round_names$fr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// fr: 'Première Manche'
	String get first_round_name => 'Première Manche';

	/// fr: 'Seconde Manche'
	String get second_round_name => 'Seconde Manche';

	/// fr: 'Troisième Manche'
	String get third_round_name => 'Troisième Manche';

	/// fr: 'Quatrième Manche'
	String get fourth_round_name => 'Quatrième Manche';

	/// fr: 'Cinquième Manche'
	String get fifth_round_name => 'Cinquième Manche';
}

// Path: shared.theme_names
class Translations$shared$theme_names$fr {
	Translations$shared$theme_names$fr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// fr: 'Musique'
	String get music => 'Musique';

	/// fr: 'Biologie'
	String get biology => 'Biologie';

	/// fr: 'Histoire'
	String get history => 'Histoire';

	/// fr: 'Géographie'
	String get geography => 'Géographie';

	/// fr: 'Littérature'
	String get literature => 'Littérature';

	/// fr: 'Mathématiques'
	String get mathematics => 'Mathématiques';

	/// fr: 'Divertissement'
	String get entertainment => 'Divertissement';

	/// fr: 'Physique-Chimie'
	String get physics_chemistry => 'Physique-Chimie';
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
			'history_page.history_label' => 'Historique',
			'profile_page.my_profile' => 'Mon profil',
			'profile_page.user_name' => 'Nom d\'utilisateur',
			'settings_page.settings_page_label' => 'Paramètres',
			'sing_in_page.error_labels.missing_account' => 'Compte introuvable',
			'sing_in_page.error_labels.incorrect_password' => 'Mot de passe incorect',
			'sing_in_page.error_labels.missing_credentials' => 'Informations manquantes',
			'sing_in_page.error_labels.unknown_error' => 'Une erreur inconnue s\'est produite',
			'sing_in_page.ok' => 'Ok',
			'sing_in_page.email_field_label' => 'Email:',
			'sing_in_page.enter_email_label' => 'Entrez votre Email',
			'sing_in_page.sign_in_label' => 'Connectez-vous pour continuer',
			'sing_in_page.password_field_Label' => 'Mot de passe:',
			'sing_in_page.enter_password_label' => 'Entrez votre mot de passe',
			'sing_in_page.login_label' => 'Connexion',
			'sing_in_page.forgot_password_label' => 'Mot de passe oublié ?',
			'sing_in_page.create_account_link_label' => 'Vous n\'avez pas de compte ?',
			'sing_in_page.sign_up_label' => 'Créer un compte',
			'sign_up_page.error_labels.missing_credentials' => 'Informations manquantes',
			'sign_up_page.error_labels.unknown_error' => 'Une erreur inconnue s\'est produite',
			'sign_up_page.error_labels.already_existing_user' => 'Un.e utilisateur.ice avec ce nom d\'utilisateur existe deja.',
			'sign_up_page.ok' => 'Ok',
			'sign_up_page.sign_in_label' => 'Connectez-vous',
			'sign_up_page.password_field_label' => 'Mot de passe:',
			'sign_up_page.create_account_button_label' => 'Créer le compte',
			'sign_up_page.sign_up_label' => 'Creez un compte pour continuer',
			'sign_up_page.enter_password_label' => 'Entrez votre mot de passe',
			'sign_up_page.confirm_your_password' => 'Confirmez votre mot de passe',
			'sign_up_page.confirm_password_label' => 'Confirmation du mot de passe:',
			'sign_up_page.already_have_account_label' => 'Vous avez déjà un compte ?',
			'waiting_for_theme_page.waiting_for_theme_label' => 'L\'adversaire choisit un thème...',
			'forgot_password_page.send_button_label' => 'Envoyer',
			'forgot_password_page.email_field_label' => 'Email:',
			'forgot_password_page.enter_email' => 'Entrez votre Email',
			'forgot_password_page.forgot_your_password_label' => 'Mot de passe oublié ?',
			'matchmaking_page.searching_game' => 'Recherche de partie...',
			'accept_player_page.reject_opponent' => 'Refuser',
			'accept_player_page.accept_opponent' => 'Accepter',
			'accept_player_page.found_opponent' => 'Partie trouvée !',
			'accept_player_page.come_back_to_home_page' => 'Revenir a l\'accueil',
			'between_rounds_page.round_status' => 'Statut des manches',
			'choose_first_player_page.vs_label' => 'VS',
			'choose_first_player_page.me_label' => 'Moi',
			'choose_first_player_page.choose_first_player' => 'Choix du premier joueur',
			'choose_first_player_page.start_game' => 'Commencer la partie',
			'choose_theme_page.choose_theme_label' => 'Choisis un thème:',
			'shared.round_names.first_round_name' => 'Première Manche',
			'shared.round_names.second_round_name' => 'Seconde Manche',
			'shared.round_names.third_round_name' => 'Troisième Manche',
			'shared.round_names.fourth_round_name' => 'Quatrième Manche',
			'shared.round_names.fifth_round_name' => 'Cinquième Manche',
			'shared.theme_names.music' => 'Musique',
			'shared.theme_names.biology' => 'Biologie',
			'shared.theme_names.history' => 'Histoire',
			'shared.theme_names.geography' => 'Géographie',
			'shared.theme_names.literature' => 'Littérature',
			'shared.theme_names.mathematics' => 'Mathématiques',
			'shared.theme_names.entertainment' => 'Divertissement',
			'shared.theme_names.physics_chemistry' => 'Physique-Chimie',
			'shared.welcome_label' => 'Bienvenue sur Qwiz !',
			_ => null,
		};
	}
}
