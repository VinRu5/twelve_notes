# Twelve Notes — Agent Guide

App Flutter per suonare canzoni preferite con testi e accordi.

## Stack

| Area | Tecnologia |
|------|------------|
| Framework | Flutter 3.35.7 (FVM) |
| Linguaggio | Dart SDK `>=3.4.3 <4.0.0` |
| State management | `flutter_bloc` (Bloc + Cubit) |
| Routing | `auto_route` |
| Backend | Supabase (`supabase_flutter`) |
| Form | `flutter_form_builder` + `form_builder_validators` |
| Logging | `talker` + `talker_bloc_logger` |
| Serializzazione | `json_serializable` + `json_annotation` |
| Test | `flutter_test`, `bloc_test`, `mockito` |

## Struttura del progetto

```
lib/
├── main.dart              # Entry point, Bloc observer, desktop window setup
├── l10n/                  # Localizzazione (en, it) via ARB
└── src/
    ├── app.dart           # MaterialApp.router + DependencyInjector
    ├── di/                # Provider, Repository, Bloc wiring
    ├── router/            # AppRouter (auto_route) + guard auth
    ├── theme/             # TwelveTheme, colori, tipografia
    ├── errors/            # Eccezioni di dominio
    ├── data/mappers/      # Interfaccia Mapper<E, D> condivisa
    ├── presentation/      # Widget e pagine condivise (main, navbar, loader)
    ├── misc/              # Costanti, environment, assets, responsive
    ├── utils/             # Logger, deep link, mixin
    └── <feature>/         # Moduli per feature (auth, home, library, …)
        ├── data/
        │   ├── services/  # Chiamate API / Supabase
        │   ├── mappers/   # DTO ↔ domain model
        │   └── dto/       # Modelli JSON (con .g.dart generati)
        ├── domain/
        │   ├── models/
        │   └── repositories/
        └── presentation/
            ├── blocs/     # Bloc o Cubit (+ event/state in part file)
            ├── pages/     # @RoutePage con wrappedRoute per BlocProvider
            └── widgets/
supabase/                  # Migrazioni, seed, config locale
```

## Architettura

- **Feature-first**: ogni dominio (`auth`, `home`, `library`, `profile`, `search`, `song`, `welcome`) ha layer `data` → `domain` → `presentation`.
- **DI centralizzata**: `DependencyInjector` in `lib/src/di/` registra services (`Provider`), repositories (`RepositoryProvider`) e bloc globali (`BlocProvider`). I bloc locali alla pagina si creano in `wrappedRoute`.
- **Repository pattern**: i repository orchestrano services e mapper; la presentation non chiama Supabase direttamente.
- **Mapper**: interfaccia `Mapper<E, D>` in `lib/src/data/mappers/mapper.dart`; implementazioni per feature.
- **Routing**: `AppRouter` con guard auth basata su `AuthCubit`. Dopo modifiche alle route, rigenerare con build_runner.
- **Tema**: usare `TwelveTheme.instance` e le extension (`TwelveTypographyExtension`) — non hardcodare colori/font fuori da `lib/src/theme/`.
- **i18n**: stringhe utente in `lib/l10n/*.arb`; accedere via `AppLocalizations.of(context)`.

## Stato attuale (importante)

- Supabase e auth sono **parzialmente mockati**: `MockSupabaseClient`, `AuthenticationService` con implementazioni stub, init Supabase commentata in `main.dart`.
- La cartella `.env/` contiene segreti locali ed è ignorata da Cursor (`.cursorignore`). Le variabili si passano con `--dart-define` (vedi `Environment`).
- Non committare mai file in `.env/` o chiavi API.

## Comandi utili

```bash
# Dipendenze
flutter pub get

# Codegen (router, json_serializable)
dart run build_runner build --delete-conflicting-outputs

# Analisi e test
flutter analyze
flutter test

# Run con variabili d'ambiente
flutter run \
  --dart-define=SUPABASE_URL=... \
  --dart-define=SUPABASE_ANON=... \
  --dart-define=GOOGLE_AUTH_WEB=... \
  --dart-define=GOOGLE_AUTH_IOS=...
```

## Convenzioni di codice

- **Bloc/Cubit**: estendere `Equatable` per state/event; usare `part` file per event e state.
- **Pagine**: annotare con `@RoutePage()`; fornire `wrappedRoute` per iniettare bloc locali.
- **DTO**: `@JsonSerializable(fieldRename: FieldRename.snake)`; file generati `*.g.dart` non editare a mano.
- **Errori**: eccezioni tipizzate in `lib/src/errors/errors.dart`; log con `talker` da `lib/src/utils/logger.dart`.
- **Costanti**: path route e regex in `TwelveK` (`lib/src/misc/constants.dart`).

## Cosa evitare

- Modificare `*.gr.dart` o `*.g.dart` manualmente.
- Aggiungere dipendenze senza registrarle in `lib/src/di/`.
- Mettere logica di business nei widget o nelle pagine.
- Esporre segreti in codice sorgente o in commit.

## Piattaforme

Supporto mobile (iOS/Android), desktop (macOS, Linux, Windows) e web. Su desktop, `main.dart` imposta dimensioni minime finestra via `window_manager`.
