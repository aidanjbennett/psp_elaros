import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:psp_elaros/data/repositories/trends_repository.dart';
import 'package:psp_elaros/models/trend_enums.dart';
import 'package:psp_elaros/models/trend_model.dart';
import 'package:psp_elaros/models/zone_duration.dart';

class MockTrendsRepository extends Mock implements TrendsRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(Timeframe.daily);
    registerFallbackValue(DateTime(2025));
  });
  late MockTrendsRepository mockRepository;
  late TrendsViewModel viewModel;

  final fakeSpots = [const FlSpot(0, 72), const FlSpot(1, 75)];
  final fakeZones = [
    const ZoneDuration(label: 'Zone 1', minutes: 180),
    const ZoneDuration(label: 'Zone 2', minutes: 360),
    const ZoneDuration(label: 'Zone 3', minutes: 0),
    const ZoneDuration(label: 'Zone 4', minutes: 0),
    const ZoneDuration(label: 'Zone 5', minutes: 0),
  ];

  setUp(() {
    mockRepository = MockTrendsRepository();

    when(
      () => mockRepository.getHeartRateSpots(
        timeframe: any(named: 'timeframe'),
        selectedDate: any(named: 'selectedDate'),
      ),
    ).thenAnswer((_) async => fakeSpots);

    when(
      () => mockRepository.getHRVSpots(
        timeframe: any(named: 'timeframe'),
        selectedDate: any(named: 'selectedDate'),
      ),
    ).thenAnswer((_) async => fakeSpots);

    when(
      () => mockRepository.getZoneDurations(
        timeframe: any(named: 'timeframe'),
        selectedDate: any(named: 'selectedDate'),
      ),
    ).thenAnswer((_) async => fakeZones);

    viewModel = TrendsViewModel(repository: mockRepository);
  });

  // ----------------------------
  // LOADING STATE
  // ----------------------------

  group('load()', () {
    test('sets isLoading to false after completing', () async {
      await viewModel.load();
      expect(viewModel.isLoading, false);
    });

    test('populates spots on success', () async {
      await viewModel.load();
      expect(viewModel.spots, fakeSpots);
    });

    test('populates zoneDurations on success', () async {
      await viewModel.load();
      expect(viewModel.zoneDurations, fakeZones);
    });

    test('sets hasError and clears spots when repository throws', () async {
      when(
        () => mockRepository.getHeartRateSpots(
          timeframe: any(named: 'timeframe'),
          selectedDate: any(named: 'selectedDate'),
        ),
      ).thenThrow(Exception('DB error'));

      await viewModel.load();

      expect(viewModel.hasError, true);
      expect(viewModel.spots, isEmpty);
      expect(viewModel.zoneDurations, isEmpty);
    });

    test('notifies listeners on completion', () async {
      var notified = false;
      viewModel.addListener(() => notified = true);
      await viewModel.load();
      expect(notified, true);
    });
  });

  // ----------------------------
  // METRIC / TIMEFRAME SELECTION
  // ----------------------------

  group('setMetric()', () {
    test('updates selectedMetric and calls load', () async {
      viewModel.setMetric(MetricType.hrv);
      expect(viewModel.selectedMetric, MetricType.hrv);
    });

    test('switching to hrv calls getHRVSpots', () async {
      viewModel.setMetric(MetricType.hrv);
      verify(
        () => mockRepository.getHRVSpots(
          timeframe: any(named: 'timeframe'),
          selectedDate: any(named: 'selectedDate'),
        ),
      ).called(1);
    });
  });

  group('setTimeframe()', () {
    test('updates selectedTimeframe and calls load', () async {
      viewModel.setTimeframe(Timeframe.monthly);
      expect(viewModel.selectedTimeframe, Timeframe.monthly);
    });
  });

  // ----------------------------
  // DATE NAVIGATION
  // ----------------------------

  group('goToPreviousPeriod()', () {
    test('subtracts 1 day in daily mode', () async {
      viewModel.selectedTimeframe = Timeframe.daily;
      final before = viewModel.selectedDate;
      viewModel.goToPreviousPeriod();
      expect(viewModel.selectedDate, before.subtract(const Duration(days: 1)));
    });

    test('subtracts 7 days in weekly mode', () async {
      viewModel.selectedTimeframe = Timeframe.weekly;
      final before = viewModel.selectedDate;
      viewModel.goToPreviousPeriod();
      expect(viewModel.selectedDate, before.subtract(const Duration(days: 7)));
    });

    test('subtracts 1 month in monthly mode', () async {
      viewModel.selectedTimeframe = Timeframe.monthly;
      viewModel.selectedDate = DateTime(2025, 3, 15);
      viewModel.goToPreviousPeriod();
      expect(viewModel.selectedDate, DateTime(2025, 2, 15));
    });
  });

  group('goToNextPeriod()', () {
    test('does nothing when canMoveForward is false', () async {
      viewModel.selectedTimeframe = Timeframe.daily;
      // selectedDate defaults to today so canMoveForward is false
      final before = viewModel.selectedDate;
      viewModel.goToNextPeriod();
      expect(viewModel.selectedDate, before);
    });

    test('adds 7 days in weekly mode when allowed', () async {
      viewModel.selectedTimeframe = Timeframe.weekly;
      viewModel.selectedDate = DateTime(2025, 1, 6);
      final before = viewModel.selectedDate;
      viewModel.goToNextPeriod();
      expect(viewModel.selectedDate, before.add(const Duration(days: 7)));
    });
  });

  // ----------------------------
  // canMoveForward
  // ----------------------------

  group('canMoveForward', () {
    test('returns false for daily when selectedDate is today', () {
      viewModel.selectedTimeframe = Timeframe.daily;
      viewModel.selectedDate = DateTime.now();
      expect(viewModel.canMoveForward, false);
    });

    test('returns true for daily when selectedDate is in the past', () {
      viewModel.selectedTimeframe = Timeframe.daily;
      viewModel.selectedDate = DateTime(2025, 1, 6);
      expect(viewModel.canMoveForward, true);
    });

    test('returns false for weekly when on current week', () {
      viewModel.selectedTimeframe = Timeframe.weekly;
      viewModel.selectedDate = DateTime.now();
      expect(viewModel.canMoveForward, false);
    });

    test('returns false for monthly when on current month', () {
      viewModel.selectedTimeframe = Timeframe.monthly;
      viewModel.selectedDate = DateTime.now();
      expect(viewModel.canMoveForward, false);
    });

    test('returns true for monthly when on a past month', () {
      viewModel.selectedTimeframe = Timeframe.monthly;
      viewModel.selectedDate = DateTime(2025, 1, 1);
      expect(viewModel.canMoveForward, true);
    });
  });

  // ----------------------------
  // formattedPeriod
  // ----------------------------

  group('formattedPeriod', () {
    test('daily format includes weekday, day, month and year', () {
      viewModel.selectedTimeframe = Timeframe.daily;
      viewModel.selectedDate = DateTime(2025, 1, 6); // Monday
      expect(viewModel.formattedPeriod, 'Mon 6 January 2025');
    });

    test('weekly format starts with "Week of"', () {
      viewModel.selectedTimeframe = Timeframe.weekly;
      viewModel.selectedDate = DateTime(2025, 1, 8); // Wed in same week
      expect(viewModel.formattedPeriod, startsWith('Week of 6'));
    });

    test('monthly format shows month and year', () {
      viewModel.selectedTimeframe = Timeframe.monthly;
      viewModel.selectedDate = DateTime(2025, 3, 1);
      expect(viewModel.formattedPeriod, 'March 2025');
    });
  });
}
