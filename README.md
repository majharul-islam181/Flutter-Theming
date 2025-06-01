# Flutter-Theming


## 🔧 Overview
```
static final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark, // Enables dark mode defaults


static final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light, // Enables light mode defaults
```

## 🎨 Color Configuration
 **1. primaryColor**
```
primaryColor: Colors.tealAccent.shade200,
```
- This is the app’s primary branding color.

- Used for buttons, selection highlights, progress bars (if no override via colorScheme).

**2. scaffoldBackgroundColor**
```
scaffoldBackgroundColor: Colors.grey.shade900,
```
- The main background color of screens.

- Affects most page backgrounds.

**3. colorScheme: ColorScheme.dark(...)**
- This is the core color system Flutter widgets rely on.
```
primary: Colors.tealAccent.shade200,         // Main branding color (used in buttons, toggles, etc.)
secondary: Colors.deepOrangeAccent.shade100, // Used for accent elements like FABs or Chips
background: Colors.grey.shade900,            // Background for major UI areas
surface: Colors.grey.shade800,               // For cards, sheets, panels
onPrimary: Colors.black87,                   // Text/icon color on top of `primary`
onSecondary: Colors.black87,                 // Text/icon color on top of `secondary`
onBackground: Colors.white70,                // Text color on `background`
onSurface: Colors.white70,                   // Text color on `surface`
```
## 🧭 AppBar Theme
```
appBarTheme: AppBarTheme(
  backgroundColor: Colors.red,             // App bar background color
  foregroundColor: Colors.blue,            // Text/icon color (may be overridden)
  elevation: 2,                            // Slight shadow
  iconTheme: IconThemeData(color: Colors.black), // Icon color in app bar
  titleTextStyle: TextStyle(...),          // Title text styling
  systemOverlayStyle: ...,                 // Status bar style
  toolbarTextStyle: ...,                   // General toolbar text style
  centerTitle: true,                       // Title centered
  actionsIconTheme: IconThemeData(color: Colors.white70), // Actions (e.g. share, menu)
)
```
## 📝 Text Theme
```
textTheme: TextTheme(
  displayLarge: TextStyle(...),   // Large titles or banners (e.g., screen headers)
  titleLarge: TextStyle(...),     // AppBar or section titles
  bodyLarge: TextStyle(...),      // Regular body text
  bodyMedium: TextStyle(...),     // Slightly smaller body text
  labelLarge: TextStyle(...),     // For buttons, chips, labels
),
```

## 🔘 Elevated Button Theme
```
elevatedButtonTheme: ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    foregroundColor: Colors.black87,               // Text/icon color inside the button
    backgroundColor: Colors.tealAccent.shade200,   // Button background color
  ),
),
```


## 🃏 Card Color
```
cardColor: Colors.grey.shade800,
```
- Background color of all Card widgets.

  
## 🧾 Input Decoration (TextFields, Forms)

```
inputDecorationTheme: InputDecorationTheme(
  filled: true,
  fillColor: Colors.grey.shade800,                  // Background inside TextFields
  labelStyle: TextStyle(color: Colors.grey.shade400), // Label text color
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.shade600),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.tealAccent.shade200),
  ),
),
```


# ✅ 1. Modify Drawer and TabBar — Light Theme Example

```
static final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.grey.shade100,        // Drawer background
    elevation: 4,
    surfaceTintColor: Colors.white,
  ),
  tabBarTheme: TabBarTheme(
    labelColor: Colors.tealAccent.shade700,       // Selected tab text/icon
    unselectedLabelColor: Colors.grey.shade600,   // Unselected tab text/icon
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(width: 2, color: Colors.tealAccent.shade700),
    ),
    labelStyle: TextStyle(fontWeight: FontWeight.bold),
    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
  ),
);
```

## 🧠 What It Means:
- ```drawerTheme```: Controls how the drawer background and elevation look in light mode.

- ```tabBarTheme```: Controls how the tabs behave — selected/unselected colors, indicator (underline), and text style.


# 🌑 2. Modify Drawer and TabBar — Dark Theme (Black UI)

```
static final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.grey.shade900,        // Dark drawer
    elevation: 4,
    surfaceTintColor: Colors.grey.shade800,
  ),
  tabBarTheme: TabBarTheme(
    labelColor: Colors.tealAccent.shade200,       // Active tab
    unselectedLabelColor: Colors.white54,         // Inactive tab
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(width: 2, color: Colors.tealAccent.shade200),
    ),
    labelStyle: TextStyle(fontWeight: FontWeight.bold),
    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
  ),
);
```

## 🧾 Summary Table: Drawer & TabBar

```
| Feature      | Light Theme                  | Dark Theme                   |
| ------------ | ---------------------------- | ---------------------------- |
| Drawer BG    | `Colors.grey.shade100`       | `Colors.grey.shade900`       |
| Tab Selected | `Colors.tealAccent.shade700` | `Colors.tealAccent.shade200` |
| Tab Unselect | `Colors.grey.shade600`       | `Colors.white54`             |
| Indicator    | Teal underline               | Teal underline               |

```

## 👨‍🏫 Final Tips:

 - You can test this using a DefaultTabController with a TabBar in the AppBar.

 - For the drawer, just use Drawer() and Scaffold.drawer — the theme will auto-apply.

 - Want icons or text colors inside drawer? Customize ListTileThemeData.




