# Text Styles Guide for Dr. Record App

This document provides a comprehensive guide to all text styles used in the Dr. Record application. All styles are centralized in `lib/core/utils/my_text_styles.dart` for consistent typography throughout the app.

## Overview

The text styles follow Material Design 3 typography guidelines with custom adaptations for medical application needs. Each style has been carefully chosen for specific use cases to ensure readability and visual hierarchy.

---

## Text Style Categories

### 1. Display Styles
**Purpose:** Used for the largest text on screen (hero sections, splash screens)

| Style | Font Size | Weight | Use Case |
|-------|-----------|--------|----------|
| `displayLarge` | 57px | Bold (700) | Splash screen titles |
| `displayMedium` | 45px | Bold (700) | Hero section headers |
| `displaySmall` | 36px | SemiBold (600) | Large promotional text |

**Example Usage:**
```dart
Text("Dr. Record", style: MyTextStyles.displayLarge)
```

---

### 2. Headline Styles
**Purpose:** Section headers and important titles

| Style | Font Size | Weight | Use Case |
|-------|-----------|--------|----------|
| `headlineLarge` | 32px | Bold (700) | Main page titles |
| `headlineMedium` | 28px | Bold (700) | "Welcome Back", "Welcome to Dr.record" |
| `headlineSmall` | 24px | SemiBold (600) | "Diseaes Categories", "Undiagnosed Cases" |

**Example Usage:**
```dart
Text("Welcome Back", style: MyTextStyles.headlineMedium)
Text("Diseaes Categories", style: MyTextStyles.headlineSmall)
```

**Current Implementation:**
- Login screen: "Welcome Back"
- Register screen: "Welcome to Dr.record"
- Home screen: Section headers

---

### 3. Title Styles
**Purpose:** Card titles, dialog titles, list item titles

| Style | Font Size | Weight | Use Case |
|-------|-----------|--------|----------|
| `titleLarge` | 22px | SemiBold (600) | Large card titles |
| `titleMedium` | 16px | SemiBold (600) | Standard card titles |
| `titleSmall` | 14px | SemiBold (600) | Small card titles, labels |

**Example Usage:**
```dart
Text("Patient Information", style: MyTextStyles.titleLarge)
```

---

### 4. Body Styles
**Purpose:** Main content, paragraphs, descriptions

| Style | Font Size | Weight | Use Case |
|-------|-----------|--------|----------|
| `bodyLarge` | 16px | Regular (400) | Main content text |
| `bodyMedium` | 14px | Regular (400) | "Forget your password?", "Don't have an account?" |
| `bodySmall` | 12px | Regular (400) | Helper text, captions |

**Example Usage:**
```dart
Text("Don't have an account?", style: MyTextStyles.bodyMedium)
Text(diagnosis, style: MyTextStyles.bodyMedium)
```

**Current Implementation:**
- Login/Register screens: Question text before action links
- Patient cards: Diagnosis text

---

### 5. Label Styles
**Purpose:** Labels, captions, helper text

| Style | Font Size | Weight | Use Case |
|-------|-----------|--------|----------|
| `labelLarge` | 14px | Medium (500) | Form labels |
| `labelMedium` | 12px | Medium (500) | Small labels |
| `labelSmall` | 11px | Medium (500) | Tiny labels, metadata |

**Example Usage:**
```dart
Text("Required *", style: MyTextStyles.labelSmall)
```

---

### 6. Button Styles
**Purpose:** Button text

| Style | Font Size | Weight | Use Case |
|-------|-----------|--------|----------|
| `buttonLarge` | 16px | SemiBold (600) | Primary buttons (Login, Register, Save) |
| `buttonMedium` | 14px | SemiBold (600) | Secondary buttons |
| `buttonSmall` | 12px | SemiBold (600) | Small action buttons |

**Example Usage:**
```dart
ElevatedButton(
  child: Text("Login", style: MyTextStyles.buttonLarge),
)
```

**Current Implementation:**
- `MyMainBotton` component uses `buttonLarge`
- All primary action buttons throughout the app

---

## Specialized Styles

### App-Specific Styles

#### Welcome Text
```dart
static const TextStyle welcomeText = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: MyColors.textPrimary,
);
```
**Used for:** "Welcome Doctor [Name]!" on home screen

#### App Bar Title
```dart
static const TextStyle appBarTitle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: MyColors.textPrimary,
);
```
**Used for:** All app bar titles (Login, Register, Edit Patient, etc.)

**Current Implementation:**
- Login screen app bar
- Register screen app bar
- Add/Edit Patient screen app bar

#### Text Button
```dart
static const TextStyle textButton = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: MyColors.primary,
);
```
**Used for:** "Reset", "Sign Up", "Login" text buttons

**Current Implementation:**
- `MyTextBottn` component
- Dialog action buttons

#### Divider Text
```dart
static const TextStyle dividerText = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: MyColors.textSecondary,
);
```
**Used for:** "or continue with" text between dividers

**Current Implementation:**
- Login screen social sign-in section
- Register screen social sign-in section

---

### Form-Related Styles

#### Hint Text
```dart
static const TextStyle hintText = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Colors.grey,
);
```
**Used for:** Text field placeholder text

**Current Implementation:**
- `MyTextFeild` component hintStyle

#### Input Text
```dart
static const TextStyle inputText = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: MyColors.textPrimary,
);
```
**Used for:** User-entered text in text fields

**Current Implementation:**
- `MyTextFeild` component style

#### Error Text
```dart
static const TextStyle errorText = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: Colors.red,
);
```
**Used for:** Form validation error messages

**Current Implementation:**
- `MyTextFeild` component errorStyle

---

### Card & List Styles

#### Card Title
```dart
static const TextStyle cardTitle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
  color: MyColors.textPrimary,
);
```
**Used for:** Patient name in patient cards

**Current Implementation:**
- `PatientCard` component for patient name

#### Card Subtitle
```dart
static const TextStyle cardSubtitle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: MyColors.textSecondary,
);
```
**Used for:** Patient ID in patient cards

**Current Implementation:**
- `PatientCard` component for patient ID

#### List Tile Title
```dart
static const TextStyle listTileTitle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: MyColors.textPrimary,
);
```
**Used for:** List item titles

**Current Implementation:**
- `MyListTile` component

#### List Tile Subtitle
```dart
static const TextStyle listTileSubtitle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: MyColors.textSecondary,
);
```
**Used for:** List item secondary text

---

### Dialog Styles

#### Dialog Title
```dart
static const TextStyle dialogTitle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: MyColors.textPrimary,
);
```
**Used for:** Dialog header text

**Current Implementation:**
- Error dialog title

#### Dialog Content
```dart
static const TextStyle dialogContent = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: MyColors.textPrimary,
);
```
**Used for:** Dialog body text

**Current Implementation:**
- Error dialog content
- Message dialog content

---

### Component-Specific Styles

#### Chip Text
```dart
static const TextStyle chipText = TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.w500,
  color: MyColors.textPrimary,
);
```
**Used for:** Filter chip labels

**Current Implementation:**
- `MyChip` component

#### Tab Text
```dart
static const TextStyle tabText = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: MyColors.textPrimary,
);
```
**Used for:** Tab bar labels

#### Bottom Navigation Label
```dart
static const TextStyle bottomNavLabel = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: MyColors.textSecondary,
);
```
**Used for:** Bottom navigation bar labels

---

## Implementation Summary

### Files Updated with MyTextStyles

1. **Authentication Screens:**
   - ✅ `login_screen.dart` - All text elements
   - ✅ `register_screen.dart` - All text elements

2. **Components:**
   - ✅ `my_main_botton.dart` - Button text
   - ✅ `my_text_bottn.dart` - Text button
   - ✅ `my_text_feild.dart` - Hint, input, and error text
   - ✅ `my_list_tile.dart` - List tile title
   - ✅ `my_chip.dart` - Chip label

3. **Home Screen:**
   - ✅ `home_screen.dart` - Welcome message and section headers
   - ✅ `patient_card.dart` - Patient name, ID, and diagnosis

4. **Dialogs:**
   - ✅ `error_dialog.dart` - Title and content
   - ✅ `massage_dialog.dart` - Content

5. **Patient Management:**
   - ✅ `add_edit_patient.dart` - App bar title

---

## Usage Guidelines

### How to Use Text Styles

1. **Import the styles:**
```dart
import 'package:my_graduation/core/utils/my_text_styles.dart';
```

2. **Apply to Text widgets:**
```dart
Text("Your Text", style: MyTextStyles.headlineSmall)
```

3. **Customize when needed:**
```dart
Text(
  "Your Text",
  style: MyTextStyles.bodyMedium.copyWith(color: Colors.red),
)
```

### Best Practices

1. **Always use predefined styles** - Don't create inline TextStyle objects
2. **Choose the appropriate style** - Match the style to the content's purpose
3. **Maintain hierarchy** - Use larger/bolder styles for more important content
4. **Be consistent** - Use the same style for similar content across the app
5. **Consider accessibility** - Ensure sufficient contrast and readable font sizes

### When to Create New Styles

Create a new style in `my_text_styles.dart` when:
- You need a style that will be reused in multiple places
- The style represents a specific UI pattern in your app
- None of the existing styles fit your use case

---

## Color Integration

All text styles use colors from `MyColors` class:
- `MyColors.textPrimary` - Main text color (dark blue)
- `MyColors.textSecondary` - Secondary text color (medium blue)
- `MyColors.primary` - Accent color for interactive elements
- `Colors.white` - For text on colored backgrounds
- `Colors.grey` - For placeholder text
- `Colors.red` - For error messages

---

## Future Enhancements

Consider adding:
1. **Dark mode support** - Create alternate color schemes
2. **Font family customization** - Add Google Fonts integration
3. **Accessibility scaling** - Support for user font size preferences
4. **Localization support** - RTL text direction for Arabic
5. **Dynamic type** - Responsive font sizes based on screen size

---

## Quick Reference

### Most Common Styles

| Use Case | Style |
|----------|-------|
| Screen titles | `headlineMedium` or `headlineSmall` |
| App bar | `appBarTitle` |
| Button text | `buttonLarge` |
| Body text | `bodyMedium` |
| Card titles | `cardTitle` |
| Card subtitles | `cardSubtitle` |
| Text buttons | `textButton` |
| Form hints | `hintText` |
| Form input | `inputText` |
| Errors | `errorText` |

---

**Last Updated:** January 29, 2026  
**Version:** 1.0  
**Maintained by:** Development Team
