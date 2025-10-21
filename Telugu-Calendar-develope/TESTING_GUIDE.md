# Telugu Calendar App - Testing Guide

## Quick Start

### Prerequisites
- Flutter SDK installed
- Android Studio or VS Code with Flutter extensions
- Android emulator or physical device

### Running the App
```bash
# Install dependencies
flutter pub get

# Run the app
flutter run

# Or run in debug mode
flutter run --debug

# For release build
flutter build apk --release
```

## Testing Checklist

### ✅ 1. Layout & Overflow Testing

#### Test on Different Screen Sizes
- [ ] Small screen (< 360px width) - e.g., iPhone SE
- [ ] Medium screen (360-400px width) - e.g., Pixel 4
- [ ] Large screen (> 400px width) - e.g., Pixel 6 Pro

#### Verify No Overflow Errors
1. Launch the app
2. Check the debug console for any RenderFlex overflow errors
3. Scroll through the entire home screen
4. Verify all widgets are visible and properly positioned

**Expected Result:** No overflow errors in console, all content visible

#### Scrollability Test
1. Launch the app on home screen
2. Scroll from top to bottom
3. Verify smooth scrolling
4. Check that all sections are accessible:
   - Header
   - Carousel
   - Quick Links
   - Today's Panchang
   - Panchangam Details
   - Auspicious Timings

**Expected Result:** Smooth scrolling, all content accessible

### ✅ 2. Responsive Design Testing

#### Font Size Adaptation
1. Test on small screen device
2. Verify text is readable but smaller
3. Test on large screen device
4. Verify text scales appropriately

**Expected Result:** Text adapts to screen size, remains readable

#### Layout Adaptation
1. Check spacing on different screens
2. Verify padding adjusts appropriately
3. Check that widgets don't overlap
4. Verify cards and containers scale properly

**Expected Result:** Layout adapts gracefully to all screen sizes

### ✅ 3. Localization Testing

#### English to Telugu Switch
1. Launch app (default: English)
2. Verify all text is in English:
   - "Good Morning!"
   - "Telugu Calendar"
   - "Calendar", "Holidays", "Festivals", "Rasipalalu"
   - "Today's Panchang"
   - Month and day names in English
3. Tap the translate icon (🌐) in header
4. Verify all text changes to Telugu:
   - "శుభోదయం!"
   - "తెలుగు క్యాలెండర్"
   - "క్యాలెండర్", "సెలవులు", "పండుగలు", "రాశిఫలాలు"
   - "నేటి పంచాంగం"
   - Month and day names in Telugu

**Expected Result:** Complete language switch, no missing translations

#### Telugu to English Switch
1. From Telugu mode, tap translate icon again
2. Verify all text switches back to English
3. Check that layout remains intact

**Expected Result:** Seamless switch back to English

#### Layout Integrity in Both Languages
1. Switch between languages multiple times
2. Verify no layout breaks
3. Check that Telugu text (which can be longer) doesn't overflow
4. Verify all widgets remain properly positioned

**Expected Result:** Layout remains stable in both languages

### ✅ 4. Widget Functionality Testing

#### Header Section
- [ ] Translate button works (toggles language)
- [ ] Search button is visible
- [ ] Share button is visible
- [ ] Greeting text displays correctly
- [ ] App title displays correctly

#### Carousel
- [ ] Auto-scrolls every 3 seconds
- [ ] Indicators update correctly
- [ ] Manual swipe works
- [ ] Infinite scroll works

#### Quick Links
- [ ] All 4 cards are visible
- [ ] Icons display correctly
- [ ] Labels are readable
- [ ] Cards are evenly spaced

#### Today's Panchang Card
- [ ] Date displays correctly
- [ ] Month and year display correctly
- [ ] Day name displays correctly
- [ ] Sunrise/Sunset times visible
- [ ] Moonrise/Moonset times visible
- [ ] All timing items are readable

#### Panchangam Details Card
- [ ] Section title displays
- [ ] Tithi information visible
- [ ] Nakshatram information visible
- [ ] Arambham time visible
- [ ] Samapti time visible

#### Auspicious Timings Section
- [ ] Section title displays
- [ ] Rahukalam chip visible with correct color
- [ ] Yamagandam chip visible with correct color
- [ ] Varjyam chip visible with correct color
- [ ] Durmuhurtam chip visible with correct color

### ✅ 5. Performance Testing

#### App Launch
1. Close the app completely
2. Launch the app
3. Measure time to first screen

**Expected Result:** App launches within 2-3 seconds

#### Language Switch Performance
1. Tap translate button
2. Observe transition time

**Expected Result:** Language switches within 500ms

#### Scroll Performance
1. Scroll rapidly up and down
2. Check for lag or stuttering

**Expected Result:** Smooth 60fps scrolling

### ✅ 6. Edge Cases Testing

#### Long Text Handling
1. Check if any text overflows
2. Verify ellipsis (...) appears for truncated text
3. Check Telugu text (typically longer than English)

**Expected Result:** No text overflow, proper truncation

#### Rapid Language Switching
1. Tap translate button rapidly 10 times
2. Verify app doesn't crash
3. Check final language state is correct

**Expected Result:** App remains stable, correct language displayed

#### Memory Test
1. Switch languages 20 times
2. Scroll through content multiple times
3. Check for memory leaks in profiler

**Expected Result:** No memory leaks, stable memory usage

## Known Issues (Non-Critical)

### Info-Level Warnings
- `withOpacity()` deprecation warnings - These are from Flutter SDK and don't affect functionality
- Code style suggestions - These are recommendations, not errors

### Current Limitations
1. **Language Preference Not Persisted**
   - Language resets to English on app restart
   - Future: Add SharedPreferences to save preference

2. **No Tablet Support Yet**
   - Optimized for mobile screens only
   - Future: Add tablet-specific layouts

## Debugging Tips

### If You See Overflow Errors
1. Check the debug console for the exact widget causing overflow
2. Look for the file and line number in the error
3. Verify that widget uses Flexible or Expanded appropriately

### If Language Doesn't Switch
1. Check that AppLocalizations.of(context) is not null
2. Verify the language provider is properly passed down
3. Check console for any errors

### If Layout Looks Wrong
1. Verify flutter_screenutil is initialized in main.dart
2. Check that design size is set to Size(411, 914)
3. Ensure all dimensions use .w, .h, .sp, or .r extensions

## Testing on Different Devices

### Recommended Test Devices
1. **Small Screen:** iPhone SE (375 x 667)
2. **Medium Screen:** Pixel 4 (411 x 869)
3. **Large Screen:** Pixel 6 Pro (411 x 914)

### How to Test on Emulator
```bash
# List available emulators
flutter emulators

# Launch specific emulator
flutter emulators --launch <emulator_id>

# Run app on specific device
flutter run -d <device_id>
```

## Automated Testing (Future)

### Widget Tests
```dart
testWidgets('Language switch test', (WidgetTester tester) async {
  await tester.pumpWidget(MyApp());
  
  // Find translate button
  final translateButton = find.byIcon(Icons.translate);
  
  // Tap it
  await tester.tap(translateButton);
  await tester.pump();
  
  // Verify language changed
  expect(find.text('శుభోదయం!'), findsOneWidget);
});
```

## Reporting Issues

If you find any issues during testing:

1. **Note the device/emulator** you're testing on
2. **Capture screenshots** of the issue
3. **Copy error messages** from the console
4. **Document steps to reproduce** the issue
5. **Check if it happens in both languages**

## Success Criteria

All tests pass when:
- ✅ No RenderFlex overflow errors
- ✅ All content is scrollable
- ✅ Layout works on all screen sizes
- ✅ Language switching works perfectly
- ✅ All widgets display correctly
- ✅ No crashes or freezes
- ✅ Smooth performance (60fps)

---

**Last Updated:** 2025-10-13
**Version:** 1.0.0
**Status:** Ready for Testing ✅

