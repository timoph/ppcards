# ppcards
Planning poker cards

The original idea was to have a deck of planning poker cards on my phone eliminating the
need for physical cards. Worked well for my purpose back in the day.

This was originally written for Nokia N9. Nokia specific stuff has been now removed.
The application should be usuable with a mobile device that can run a recent version of Qt.
Also works on desktop but it's not very usable there.

## Usage

- Swipe (or use the arrow keys) to browse the cards.
- Tap the card (or press Space/Enter) to turn it face down, and tap again to reveal it.
  A card that is face down cannot be changed by accident.
- Long press (or press M) to open the menu. There you can pick a card directly and
  switch between the Fibonacci, T-shirt and custom decks. A custom deck is a comma
  separated list of values, for example `1, 2, 4, 8, ∞, ?, coffee`.

## Building

Requires CMake 3.21+ and Qt 6.5+ with the Quick and Quick Controls modules.

    cmake -S . -B build
    cmake --build build
    ./build/ppcards
