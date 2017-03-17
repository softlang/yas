enum State { EXCEPTION, LOCKED, UNDEFINED, UNLOCKED };
enum State initial = LOCKED;
enum Event { RELEASE, TICKET, MUTE, PASS };
void collect() { }
void alarm() { }
void eject() { }
enum State next(enum State s, enum Event e) {
 switch(s) {
  case EXCEPTION:
   switch(e) {
    case RELEASE: return LOCKED;
    case TICKET: eject(); return EXCEPTION;
    case PASS: return EXCEPTION;
    case MUTE: return EXCEPTION;
    default: return UNDEFINED;
   }
  case LOCKED:
   switch(e) {
    case TICKET: collect(); return UNLOCKED;
    case PASS: alarm(); return EXCEPTION;
    default: return UNDEFINED;
   }
  case UNLOCKED:
   switch(e) {
    case TICKET: eject(); return UNLOCKED;
    case PASS: return LOCKED;
    default: return UNDEFINED;
   }
  default: return UNDEFINED;
 }
}