import 'dart:io';

void main(List<String> arguments) async {
  if (arguments.isEmpty) {
    print('❌ Feature name missing!');
    print('Usage: dart create_feature.dart <feature_name>');
    exit(1);
  }

  final String featureName = arguments.first.trim().toLowerCase().replaceAll(
    "'",
    '',
  );

  if (featureName.isEmpty || !RegExp(r'^[a-z_]+$').hasMatch(featureName)) {
    print(
      '❌ Invalid feature name: Use lowercase letters and underscores only.',
    );
    exit(1);
  }

  final className = featureName
      .split('_')
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join(); // snake_case => PascalCase

  final currentDir = Directory.current.path;
  final baseDir = Directory('$currentDir/lib/features/$featureName');

  if (baseDir.existsSync()) {
    print('⚠️ Feature "$featureName" already exists at ${baseDir.path}');
    exit(0);
  }

  try {
    await createDirs([
      'lib/features/$featureName/domain/entities',
      'lib/features/$featureName/domain/repositories',
      'lib/features/$featureName/domain/usecases',
      'lib/features/$featureName/data/datasource',
      'lib/features/$featureName/data/repositories',
      'lib/features/$featureName/presentation/admin_drill_details_bloc',
      'lib/features/$featureName/presentation/components',
      'lib/features/$featureName/presentation/view',
    ]);

    // Domain Layer
    await createFile(
      'lib/features/$featureName/domain/entities/${featureName}_entity.dart',
      'class ${className}Entity {\n  // Define properties here\n}',
    );

    await createFile(
      'lib/features/$featureName/domain/repositories/${featureName}_repository.dart',
      '''
abstract class ${className}Repository {
  // Define contract here
}
''',
    );

    await createFile(
      'lib/features/$featureName/domain/usecases/${featureName}_usecase.dart',
      '''
import '../repositories/${featureName}_repository.dart';

class ${className}UseCase {
  final ${className}Repository repository;

  ${className}UseCase(this.repository);
}
''',
    );

    // Data Layer
    await createFile(
      'lib/features/$featureName/data/datasource/${featureName}_remote_datasource.dart',
      '''
class ${className}RemoteDataSource {
  // Implement API logic here
}
''',
    );

    await createFile(
      'lib/features/$featureName/data/repositories/${featureName}_repository_impl.dart',
      '''
import '../../domain/repositories/${featureName}_repository.dart';

class ${className}RepositoryImpl implements ${className}Repository {
  // Implement methods here
}
''',
    );

    // Presentation - Bloc
    await createFile(
      'lib/features/$featureName/presentation/admin_drill_details_bloc/${featureName}_event.dart',
      '''
part of '${featureName}_bloc.dart';

sealed class ${className}Event {}

class ${className}Started extends ${className}Event {}
''',
    );

    await createFile(
      'lib/features/$featureName/presentation/admin_drill_details_bloc/${featureName}_state.dart',
      '''
part of '${featureName}_bloc.dart';

sealed class ${className}State {}

class ${className}InitialState extends ${className}State {}
class ${className}LoadingState extends ${className}State {}

class ${className}SuccessState extends ${className}State {
  // final YourData data;
  // ${className}SuccessState(this.data);
}

class ${className}ErrorState extends ${className}State {
  final String message;
  ${className}ErrorState(this.message);
}
''',
    );

    await createFile(
      'lib/features/$featureName/presentation/admin_drill_details_bloc/${featureName}_bloc.dart',
      '''
import 'package:flutter_bloc/flutter_bloc.dart';
part '${featureName}_event.dart';
part '${featureName}_state.dart';

class ${className}Bloc extends Bloc<${className}Event, ${className}State> {
  ${className}Bloc() : super(${className}InitialState()) {
    on<${className}Started>((event, emit) async {
      try {
        // Simulate logic
        emit(${className}SuccessState());
      } catch (e) {
        emit(${className}ErrorState(e.toString()));
      }
    });
  }
}
''',
    );

    // View
    await createFile(
      'lib/features/$featureName/presentation/view/${featureName}_view.dart',
      '''
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../admin_drill_details_bloc/${featureName}_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ${className}View extends StatelessWidget {
  const ${className}View({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ${className}Bloc()..add(${className}Started()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('$className'),
        ),
        body: BlocBuilder<${className}Bloc, ${className}State>(
          builder: (context, state) {
            if (state is ${className}InitialState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ${className}SuccessState) {
              return const Center(child: Text("Success!"));
            } else if (state is ${className}ErrorState) {
              return Center(child: Text("Error: \${state.message}"));
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
''',
    );

    print('✅ Feature "$featureName" created successfully.');
    // ✅ Inject repository, usecase, aur admin_drill_details_bloc in locator.dart
    /// await injectLocatorBindings(featureName, className);
    // ✅ Inject Route in app_router.dart
    await injectRouteToAppRouter(featureName, className);

    // ✅ Run build_runner
    await runBuildRunner();
  } catch (e, stack) {
    print('❌ Error occurred while creating feature: $e');
    print(stack);
  }
}

// === Helper Functions ===

Future<void> createDirs(List<String> paths) async {
  for (final path in paths) {
    final dir = Directory(path);
    if (!dir.existsSync()) {
      await dir.create(recursive: true);
      print('📁 Created: $path');
    }
  }
}

Future<void> createFile(String path, String content) async {
  final file = File(path);
  if (!file.existsSync()) {
    await file.writeAsString(content.trim());
    print('📝 Created: $path');
  }
}

Future<void> injectRouteToAppRouter(
  String featureName,
  String className,
) async {
  final routerFilePath = 'lib/routes/app_router.dart';
  final routerFile = File(routerFilePath);

  if (!routerFile.existsSync()) {
    print('❌ Route file not found at $routerFilePath');
    return;
  }

  String content = routerFile.readAsStringSync();

  final routeEntry = 'AutoRoute(page: ${className}Route.page),';
  final viewImport =
      "import '../features/$featureName/presentation/view/${featureName}_view.dart';";

  if (!content.contains(routeEntry)) {
    content = content.replaceFirst(
      'List<AutoRoute> get routes => [',
      'List<AutoRoute> get routes => [\n    $routeEntry',
    );
    print('🔁 Route added: $routeEntry');
  } else {
    print('⚠️ Route already exists.');
  }

  if (!content.contains(viewImport)) {
    content = '$viewImport\n$content';
    print('📥 View import added.');
  }

  await routerFile.writeAsString(content);
}

Future<void> runBuildRunner() async {
  print('🏗 Running build_runner...');
  final buildRunner = await Process.start('dart', [
    'run',
    'build_runner',
    'build',
    '--delete-conflicting-outputs',
  ], runInShell: true);

  await stdout.addStream(buildRunner.stdout);
  await stderr.addStream(buildRunner.stderr);

  final exitCode = await buildRunner.exitCode;
  if (exitCode == 0) {
    print('✅ build_runner completed successfully.');
  } else {
    print('❌ build_runner failed with exit code $exitCode');
  }
}

Future<void> injectLocatorBindings(String featureName, String className) async {
  final locatorFilePath = 'lib/di/locator.dart';
  final locatorFile = File(locatorFilePath);

  if (!locatorFile.existsSync()) {
    print('❌ locator.dart file not found!');
    return;
  }

  String content = locatorFile.readAsStringSync();

  final repoImport =
      "import 'package:new_club_app/features/$featureName/domain/repositories/${featureName}_repository.dart';";
  final repoImplImport =
      "import 'package:new_club_app/features/$featureName/data/repositories/${featureName}_repository_impl.dart';";
  final useCaseImport =
      "import 'package:new_club_app/features/$featureName/domain/usecases/${featureName}_usecase.dart';";
  final blocImport =
      "import 'package:new_club_app/features/$featureName/presentation/admin_drill_details_bloc/${featureName}_bloc.dart';";

  final repoRegister =
      "  sl.registerLazySingleton<${className}Repository>(() => ${className}RepositoryImpl());";
  final useCaseRegister =
      "  sl.registerLazySingleton(() => ${className}UseCase(sl()));";
  final blocRegister = "  sl.registerFactory(() => ${className}Bloc(sl()));";

  final importsToAdd = [repoImport, repoImplImport, useCaseImport, blocImport];
  final registrationsToAdd = [repoRegister, useCaseRegister, blocRegister];

  // Inject imports
  for (final import in importsToAdd) {
    if (!content.contains(import)) {
      content = '$import\n$content';
    }
  }

  // Inject into setupLocator()
  final locatorFunctionPattern = RegExp(
    r'Future<void> setupLocator\(\) async \{([\s\S]*?)\}',
  );
  final match = locatorFunctionPattern.firstMatch(content);

  if (match != null) {
    String body = match.group(1)!;

    for (final reg in registrationsToAdd) {
      if (!body.contains(reg)) {
        body += '\n$reg';
      }
    }

    content = content.replaceFirst(
      locatorFunctionPattern,
      'Future<void> setupLocator() async {$body\n}',
    );
    print('🧩 locator.dart updated with $featureName dependencies.');
  } else {
    print('❌ Could not find setupLocator function.');
  }

  await locatorFile.writeAsString(content);
}
