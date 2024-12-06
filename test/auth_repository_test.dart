import 'package:Demoz/Repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:hive/hive.dart';

import 'auth_repository_test.mocks.dart';

@GenerateMocks(
  [Box],
  customMocks: [MockSpec<Box>(as: #MockHiveBox)]
)
void main() {
  late AuthRepository authRepository;
  late MockHiveBox mockBox;

  setUp(() {
    mockBox = MockHiveBox();
    authRepository = AuthRepository(mockBox);
  });

  group('login', () {
    test('saves email and password when valid', () async {
      final email = 'test@example.com';
      final password = 'password123';

      when(mockBox.put('email', email)).thenAnswer((_) async => null);
      when(mockBox.put('password', password)).thenAnswer((_) async => null);

      await authRepository.login(email, password);

      verify(mockBox.put('email', email)).called(1);
      verify(mockBox.put('password', password)).called(1);
    });

    test('throws exception for invalid email', () async {
      final email = 'invalid-email';
      final password = 'password123';

      expect(
        () async => await authRepository.login(email, password),
        throwsException,
      );
    });

    test('throws exception for invalid password', () async {
      final email = 'test@example.com';
      final password = '123';

      expect(
        () async => await authRepository.login(email, password),
        throwsException,
      );
    });
  });

  group('isLoggedIn', () {
    test('returns true when email and password are stored', () {
      when(mockBox.get('email')).thenReturn('test@example.com');
      when(mockBox.get('password')).thenReturn('password123');

      final result = authRepository.isLoggedIn();

      expect(result, true);
    });

    test('returns false when email or password is not stored', () {
      when(mockBox.get('email')).thenReturn(null);
      when(mockBox.get('password')).thenReturn('password123');

      final result = authRepository.isLoggedIn();

      expect(result, false);
    });
  });

  group('logout', () {
    test('removes email and password from storage', () async {
      when(mockBox.delete('email')).thenAnswer((_) async => null);
      when(mockBox.delete('password')).thenAnswer((_) async => null);

      await authRepository.logout();

      verify(mockBox.delete('email')).called(1);
      verify(mockBox.delete('password')).called(1);
    });
  });
}
