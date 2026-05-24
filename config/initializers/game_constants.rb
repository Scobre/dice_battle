CARD_TYPE = {
  spell: 0,
  passive: 1,
  artifact: 2,
  reaction: 3
}.freeze

FACE_TYPE = {
  gold: 0,
  attack: 1,
  mana: 2,
  shield: 3,
  utility: 4
}.freeze

MATCH_STATUS = {
  waiting: 0,
  playing: 1,
  finished: 2
}.freeze

RARITIES = {
  common: 0,
  rare: 1,
  epic: 2,
  legendary: 3
}.freeze

SLOT_TYPE = {
  face: 0,
  card: 1
}.freeze

PLAYER_CARD_ZONE = {
  deck: 0,
  hand: 1,
  discard: 2,
  in_play: 3,
  exhausted: 4,
  banished: 5
}.freeze
