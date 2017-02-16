enum State { LOCKED, UNLOCKED, EXCEPTION, UNDEFINED };
enum State initial = LOCKED;
enum Event { TICKET, RELEASE, MUTE, PASS };
void alarm() { }
void eject() { }
void collect() { }
enum State next(enum State s, enum Event e) {
    switch(s) {
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
        case EXCEPTION:
            switch(e) {
                case TICKET: eject(); return EXCEPTION;
                case PASS: return EXCEPTION;
                case MUTE: return EXCEPTION;
                case RELEASE: return LOCKED;
                default: return UNDEFINED;
            }
        default: return UNDEFINED;
    }
}