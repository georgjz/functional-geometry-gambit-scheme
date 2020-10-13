# Notes

## Weird Gambit Behavior

* When invoking `___BEGIN_SFUN_POINTER_TO_SCMOBJ`, make sure argument two is `___FAL`, and argument three is `0`; formers leads to errors when casting between pointer and scheme objects, the latter crashes the program on shutdown. Why?
* During type to Scheme object casting, make sure the last `cons`ing happens directly in `*dst`; else, the `car` of the list is corrupted. Why?

## Weird Raylib Behavior

## Todo

-[ ] Test Material dereference function more thoroughly
-[ ] Find a better way for creating pointers (`int`, `char`, etc.)
-[ ] Benchmark raymath vs. pure Scheme implementation

## Restructure

-[ ] Rewrite the Schemerizer. `c-define-type` names should match C struct case.
-[ ] Mirror all C structs as records in Scheme.
