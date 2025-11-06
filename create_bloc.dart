import 'dart:io';

void main(List<String> arguments) async {
  if (arguments.isEmpty) {
    print('❌ BLoC name missing!');
    print('Usage: dart create_bloc.dart <bloc_name> [directory_path]');
    print('Examples:');
    print('  dart create_bloc.dart my_bloc');
    print('  dart create_bloc.dart my_bloc lib/admin_drill_details_bloc');
    print('  dart create_bloc.dart my_bloc ../other_project/lib');
    exit(1);
  }

  final String blocName = arguments.first.trim().toLowerCase().replaceAll(
    "'",
    '',
  );

  if (blocName.isEmpty || !RegExp(r'^[a-z_]+$').hasMatch(blocName)) {
    print(
      '❌ Invalid BLoC name: Use lowercase letters and underscores only.',
    );
    exit(1);
  }

  final className = blocName
      .split('_')
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join(); // snake_case => PascalCase

  // Use provided directory or current directory
  final String baseDir = arguments.length > 1
      ? arguments[1].trim()
      : Directory.current.path;

  // Create a new directory with admin_drill_details_bloc name inside the base directory
  final String targetDir = '$baseDir/$blocName';
  final targetDirectory = Directory(targetDir);

  if (targetDirectory.existsSync()) {
    print('⚠️ Directory "$blocName" already exists at $targetDir');
    print('Files will be created inside existing directory.');
  } else {
    print('📁 Creating new directory: $targetDir');
    await targetDirectory.create(recursive: true);
  }

  try {
    // Create BLoC Event file
    await createFile(
      '$targetDir/${blocName}_event.dart',
      '''
part of '${blocName}_bloc.dart';

sealed class ${className}Event {}

class ${className}Started extends ${className}Event {}
''',
    );

    // Create BLoC State file
    await createFile(
      '$targetDir/${blocName}_state.dart',
      '''
part of '${blocName}_bloc.dart';

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

    // Create BLoC file
    await createFile(
      '$targetDir/${blocName}_bloc.dart',
      '''
import 'package:flutter_bloc/flutter_bloc.dart';

part '${blocName}_event.dart';
part '${blocName}_state.dart';

class ${className}Bloc extends Bloc<${className}Event, ${className}State> {
  ${className}Bloc() : super(${className}InitialState()) {
    on<${className}Started>((event, emit) async {
      try {
        emit(${className}LoadingState());

        // TODO: Implement your logic here

        emit(${className}SuccessState());
      } catch (e) {
        emit(${className}ErrorState(e.toString()));
      }
    });
  }
}
''',
    );

    print('✅ BLoC "$blocName" created successfully!');
    print('📁 Directory: $targetDir');
    print('📝 Files created:');
    print('   • ${blocName}_bloc.dart');
    print('   • ${blocName}_event.dart');
    print('   • ${blocName}_state.dart');

  } catch (e, stack) {
    print('❌ Error occurred while creating BLoC: $e');
    print(stack);
  }
}

// === Helper Functions ===

Future<void> createFile(String path, String content) async {
  final file = File(path);
  if (file.existsSync()) {
    print('⚠️ File already exists: ${file.path}');
    return;
  }

  await file.writeAsString(content.trim());
  print('📝 Created: ${file.path}');
}
