# Visual Testing Guide - Telugu Calendar App

## Quick Start Testing

### 1. Run the App
```bash
flutter run
```

---

## 🎯 Test Scenario 1: Today's Panchang Layout

### What to Check:
✅ **Three vertical sections** in Today's Panchang card:
   1. Date widget (centered, white background)
   2. Sunrise/Moonrise section (pink gradient)
   3. Sunset/Moonset section (pink gradient)

✅ **Equal spacing** between sections (~10 pixels)

✅ **Date widget centered** in the card

✅ **No overlapping** widgets

### Expected Layout:
```
┌─────────────────────────────────┐
│     Today's Panchang            │
├─────────────────────────────────┤
│                                 │
│        ┌──────────┐             │
│        │  2025    │             │
│        │ January  │             │
│        │   13     │  ← Centered │
│        │  Monday  │             │
│        └──────────┘             │
│                                 │
│  ┌─────────────────────────┐   │
│  │ 🌅 Sunrise  🌙 Moonrise │   │
│  │   6:30 AM     7:45 PM   │   │
│  └─────────────────────────┘   │
│                                 │
│  ┌─────────────────────────┐   │
│  │ 🌇 Sunset   🌙 Moonset  │   │
│  │   6:15 PM     8:30 AM   │   │
│  └─────────────────────────┘   │
│                                 │
└─────────────────────────────────┘
```

### How to Test:
1. Launch the app
2. Scroll to "Today's Panchang" card
3. Verify the layout matches the expected structure
4. Check that all three sections are visible
5. Verify equal spacing between sections

---

## 🎯 Test Scenario 2: Font Size Increases

### What to Check:
✅ **Header Section**:
   - "Good Morning!" is readable (13sp)
   - "Telugu Calendar" title is prominent (22sp)

✅ **Today's Panchang**:
   - Card title "Today's Panchang" is larger (14sp)
   - Date numbers are bigger (16sp for day)
   - Timing labels are readable (11sp)
   - Time values are clear (12sp)

✅ **Panchangam Details**:
   - Section header is larger (15sp)
   - Labels and values are readable (12sp)

✅ **Quick Links**:
   - Icons are bigger (24sp)
   - Labels are readable (11sp)

✅ **Bottom Navigation**:
   - Selected tab label is clear (13sp)
   - Unselected tab labels are readable (12sp)

### How to Test:
1. Compare text sizes with previous version
2. Verify all text is easily readable
3. Check that no text is cut off or overflowing
4. Test on different screen sizes

---

## 🎯 Test Scenario 3: Quick Links Navigation

### What to Check:
✅ **Calendar Quick Link**:
   - Tap the Calendar card
   - Should navigate to Calendar tab (index 1)
   - Bottom navigation should highlight Calendar tab

✅ **Holidays Quick Link**:
   - Tap the Holidays card
   - Should navigate to Festivals tab (index 2)
   - Bottom navigation should highlight Festivals tab

✅ **Festivals Quick Link**:
   - Tap the Festivals card
   - Should navigate to Festivals tab (index 2)
   - Bottom navigation should highlight Festivals tab

✅ **Rasipalalu Quick Link**:
   - Tap the Rasipalalu (Horoscope) card
   - Should navigate to Horoscope tab (index 3)
   - Bottom navigation should highlight Horoscope tab

### How to Test:
1. From Home screen, tap each quick link card
2. Verify navigation to correct tab
3. Verify bottom navigation highlights correct tab
4. Return to Home tab using bottom navigation
5. Repeat for all quick links

### Expected Behavior:
```
Quick Link Card → Tab Navigation
─────────────────────────────────
Calendar        → Calendar Tab (1)
Holidays        → Festivals Tab (2)
Festivals       → Festivals Tab (2)
Rasipalalu      → Horoscope Tab (3)
```

---

## 🎯 Test Scenario 4: Header Height Reduction

### What to Check:
✅ **Header is more compact** (70h instead of 100h)

✅ **All elements still visible**:
   - "Good Morning!" greeting
   - "Telugu Calendar" title
   - Translate icon (🌐)
   - Search icon (🔍)
   - Share icon (📤)

✅ **Icons remain functional**:
   - Tap translate icon → Language switches
   - Search and share icons are clickable

✅ **No text overflow** or clipping

### How to Test:
1. Check header height visually
2. Verify all text is visible
3. Tap translate icon to switch language
4. Verify header looks good in both languages
5. Check that header doesn't take too much space

---

## 🎯 Test Scenario 5: Bottom Navigation

### What to Check:
✅ **Four tabs visible**:
   1. Home (🏠)
   2. Calendar (📅)
   3. Festivals (🎉)
   4. Horoscope (🌙)

✅ **Labels are localized**:
   - English: Home, Calendar, Festivals, Horoscope
   - Telugu: హోమ్, క్యాలెండర్, పండుగలు, రాశి ఫలాలు

✅ **Tab selection works**:
   - Tap each tab
   - Correct screen is displayed
   - Selected tab is highlighted
   - Icon changes to filled version

✅ **Font sizes are readable**:
   - Selected: 13sp
   - Unselected: 12sp

### How to Test:
1. Tap each bottom navigation tab
2. Verify correct screen is displayed
3. Check that selected tab is highlighted
4. Verify icon changes (outlined → filled)
5. Switch language and verify labels change
6. Check font sizes are readable

---

## 🎯 Test Scenario 6: Responsive Design

### Screen Sizes to Test:

#### Small Screen (360x640):
```bash
flutter run -d <device> --dart-define=SCREEN_SIZE=small
```
- Verify no overflow errors
- Check all text is readable
- Verify spacing is appropriate

#### Medium Screen (411x914):
```bash
flutter run -d <device> --dart-define=SCREEN_SIZE=medium
```
- Verify layout looks balanced
- Check font sizes are appropriate
- Verify spacing is good

#### Large Screen (428x926):
```bash
flutter run -d <device> --dart-define=SCREEN_SIZE=large
```
- Verify layout doesn't look too spread out
- Check font sizes are not too large
- Verify spacing is appropriate

### What to Check:
✅ No RenderFlex overflow errors
✅ All text is readable on all screen sizes
✅ Spacing adapts properly
✅ Images/icons scale correctly
✅ Bottom navigation fits properly

---

## 🎯 Test Scenario 7: Localization

### English Language:
1. Launch app (default: English)
2. Verify all text is in English:
   - Header: "Good Morning!", "Telugu Calendar"
   - Quick Links: "Calendar", "Holidays", "Festivals", "Rasipalalu"
   - Bottom Nav: "Home", "Calendar", "Festivals", "Horoscope"
   - Panchang: "Today's Panchang", "Sunrise", "Sunset", etc.

### Telugu Language:
1. Tap translate icon (🌐)
2. Verify all text switches to Telugu:
   - Header: "శుభోదయం!", "తెలుగు క్యాలెండర్"
   - Quick Links: Telugu labels
   - Bottom Nav: "హోమ్", "క్యాలెండర్", "పండుగలు", "రాశి ఫలాలు"
   - Panchang: Telugu labels

### What to Check:
✅ All text switches language
✅ No English text remains in Telugu mode
✅ No Telugu text remains in English mode
✅ Font sizes remain appropriate
✅ No text overflow in either language
✅ Bottom navigation labels update

---

## 🎯 Test Scenario 8: Scrolling

### What to Check:
✅ **Smooth scrolling** throughout the home screen

✅ **All sections accessible**:
   - Header (fixed at top)
   - Quick Links
   - Today's Panchang
   - Panchangam Details
   - Auspicious Timings
   - Carousel (if present)

✅ **No scroll issues**:
   - No jerky scrolling
   - No stuck sections
   - Scroll reaches bottom
   - Scroll returns to top

### How to Test:
1. Scroll down slowly
2. Scroll down quickly
3. Scroll up slowly
4. Scroll up quickly
5. Verify all sections are accessible
6. Check for any layout issues during scroll

---

## 📊 Test Results Template

### Device Information:
- **Device**: _________________
- **Screen Size**: _________________
- **Android/iOS Version**: _________________
- **Flutter Version**: _________________

### Test Results:

| Test Scenario | Status | Notes |
|--------------|--------|-------|
| 1. Panchang Layout | ☐ Pass ☐ Fail | |
| 2. Font Sizes | ☐ Pass ☐ Fail | |
| 3. Quick Links Nav | ☐ Pass ☐ Fail | |
| 4. Header Height | ☐ Pass ☐ Fail | |
| 5. Bottom Nav | ☐ Pass ☐ Fail | |
| 6. Responsive Design | ☐ Pass ☐ Fail | |
| 7. Localization | ☐ Pass ☐ Fail | |
| 8. Scrolling | ☐ Pass ☐ Fail | |

### Issues Found:
1. _______________________________________
2. _______________________________________
3. _______________________________________

### Screenshots:
- [ ] Home screen (English)
- [ ] Home screen (Telugu)
- [ ] Today's Panchang card
- [ ] Quick links navigation
- [ ] Bottom navigation
- [ ] All tabs

---

## 🐛 Common Issues to Watch For

### Layout Issues:
- ❌ Widgets overlapping
- ❌ Text overflow
- ❌ Unequal spacing
- ❌ Misaligned elements

### Navigation Issues:
- ❌ Quick links not working
- ❌ Bottom nav not highlighting
- ❌ Wrong tab displayed
- ❌ Navigation lag

### Font Issues:
- ❌ Text too small
- ❌ Text too large
- ❌ Text cut off
- ❌ Inconsistent sizes

### Localization Issues:
- ❌ Mixed languages
- ❌ Untranslated text
- ❌ Font issues in Telugu
- ❌ Layout breaks in Telugu

---

## ✅ Success Criteria

All tests should pass with:
- ✅ No RenderFlex overflow errors
- ✅ No layout issues
- ✅ All navigation working
- ✅ All text readable
- ✅ Both languages working
- ✅ Smooth scrolling
- ✅ Responsive on all screen sizes

---

## 🚀 Quick Test Commands

```bash
# Run app
flutter run

# Run with specific device
flutter run -d <device-id>

# Check for errors
flutter analyze --no-fatal-infos

# Hot reload after changes
r (in terminal)

# Hot restart
R (in terminal)

# Quit app
q (in terminal)
```

---

**Happy Testing! 🎉**

