# Dice Builder - Game Design Document

## Core Concept

Hybrid board game inspired by:

* Dice Forge
* Shards of Infinity
* Dice Throne
* Engine-building games

Players improve customizable dice during the game while building a set of activable cards powered by mana.

---

# Core Gameplay Loop

Each turn:

1. Roll dices
2. Gain resources
3. Buy:

   * new dice faces
   * cards
4. Activate cards using mana
5. End turn

---

# Main Resources

## Gold

Temporary.
Used to buy:

* dice faces
* cards

Reset at end of turn.

---

## Mana

Temporary.
Used to activate cards.

Reset at end of turn.

---

## Shield

Temporary defense.

Persists during opponents turns.
Reset at start of owner's next turn.

---

## Mastery

Permanent progression resource.

Used to:

* unlock stronger effects
* scale cards
* enable advanced synergies

---

## Health

Permanent.
Lose when attacked.
Game ends at 0.

---

# Dice System

Each player starts with 4 customizable dices.

## Starting Dice Philosophy

All dices share:

* Gold I
* Attack I
* Mana I
* Shield I
* Blank

But each dice has one specialized face:

### Dice 1

Gold II

### Dice 2

Attack II

### Dice 3

Mana II

### Dice 4

Shield II

This creates:

* light asymmetry
* strategic direction
* player freedom

---

# Dice Faces

Each face contains:

* icon
* type
* value
* rarity
* cost

Example:

* 💰 Gold II
* ⚔️ Attack I
* 🔮 Mana II
* 🛡️ Shield I

---

# Dice Building

Players can:

* buy new faces from the shop
* replace any existing face

Strategic customization is one of the core mechanics.

---

# Shop System

Shared market inspired by Shards of Infinity.

## Face Shop

Shared pool of purchasable dice faces.

## Card Shop

Shared pool of purchasable cards.

First player to buy:

* removes the item
* reveals another item

---

# Card Philosophy

Cards are NOT traditional deckbuilding cards.

No:

* draw
* discard
* reshuffle

Instead:

* cards are permanent owned abilities
* visible at all times
* activable using mana

This keeps dices as the core gameplay system.

---

# Card Types

## Spell

Immediate activated effect.

Example:

* Fireball

---

## Passive

Permanent effect.

Example:

* Mana Reactor

---

## Power

Strong activable ability.
Can later support cooldowns.

---

## Reaction

Reserved for future defensive mechanics.

---

# Mastery Scaling

Cards scale dynamically with mastery.

Example:

```json
[
  {
    "mastery_required": 0,
    "action": "deal_damage",
    "value": 4
  },
  {
    "mastery_required": 10,
    "action": "deal_damage",
    "value": 7
  }
]
```

Effects stack dynamically.

---

# Current Technical Architecture

## Backend

Ruby on Rails

## Frontend

* ERB
* Turbo
* Stimulus
* CSS

---

# Main Models

## Match

Game instance.

## Player

Game participant.

## Dice

Customizable dice.

## DiceFace

One face of a dice.

## FaceTemplate

Definition of a face.

## CardTemplate

Definition of a card.

## PlayerCard

Owned card instance.

## ShopSlot

Visible market slot.

---

# Turn System

Only active player can:

* roll dices
* buy
* activate cards

Turn flow:

1. Start turn
2. Roll
3. Buy / activate
4. End turn

---

# Current UI Goals

* visible dice faces
* active rolled faces highlighted
* animated dice rolling
* separate shops
* readable board state

---

# Future Features

## High Priority

* card activation system
* damage targeting
* passive effects
* cooldowns
* better dice UI

## Medium Priority

* rerolls
* status effects
* dice archetypes
* card synergies

## Long Term

* multiplayer online
* AI opponents
* animations
* polished boardgame UI
