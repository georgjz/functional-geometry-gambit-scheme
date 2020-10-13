# Gambit Scheme Binding for Raylib

This is a simple binding for calling [raylib][1] functions within [Gambit Scheme][2]. Consider everything in this repository experimental, under heavy development, and subject to change.

It comes with a simply CMake-based language configuration for Gambit Scheme.

These are the tools you need to use the code in this repository:

* [CMake][3]
* [make][4] (or any build system you prefer, like Ninja, etc.)
* [Gambit Scheme][2]
* Optional: [Raylib][1] (if you want to use a system-wide installation instead of the submodule provided here)

## Warning About Gambit Scheme Naming

Because I'm using Arch Linux, there's a bit of a naming conflict when installing Gambit Scheme. So the Gambit compiler `gsc` is called `gambitc` on my system. To avoid this problem, there are two options:

1. If you already have Gambit Scheme compiler installed as `gsc` on your system, change all occurences of `gambitc` into `gsc` in all files in the `cmake` subdirectory.
2. If you build Gambit Scheme from source, use the `--enable-interpreter-name` and `--enable-compiler-name` options during the configuration step to rename `gsc` into `gambitc`.

It's a bit annoying, but this will be fixed when I improve the CMake language definition (see #-)

## Usage

This repository comes with raylib already integrated as a git submodule. This reflects my personal preferences, if you prefer to use CMake's `FetchPackage`, it should be easy enough to modify the main `CMakeLists.txt` to do that (I haven't tested it, though).

So start writing code, clone this repository and make sure all submodules are downloaded too:

```bash
git clone --recursive https://github.com/georgjz/raylib-gambit-scheme.git myschemegame
```

To build the example code found in `src/main.scm`, just execute:

```bash
cd myschemegame
cmake -S . -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -B build
cmake --build build
./build/raylib-gambit-scheme
```

If you wish to change the name of the output binary, just edit line 8 of `CMakeLists.txt`.

This should output the following window:

![Result of example code](screenshot.png)

## Known Bugs and Future Features

* In the build commands above, I explicitly tell CMake to use `gcc`; I have used both `gcc` and `clang` successfully to build all code in this repository. But since Gambit Scheme itself is built with `gcc`, I prefer to keep it consistent. **I want to add an option to let users choose between compilers**.
* **This code is not tested on Windows and OSX**. I have only tested this code as well as the CMake files on Arch Linux; cross-platform support is planned.
* The binding to raylib in `src/raylibbinding/raylib.scm` acts like a "single file header"; i.e., *all* functions of raylib are always bound. **I plan to modify the CMake files to make sure only used functions/modules are actually bound (and built).** I want this binding to follow the module design of raylib.
* **The Texture module is not working**. The code is there, but I have commented it out, there are some bugs I need to fix (converting between different lengths of (pointers to) `int`s is the probable cause).
* **The variadic functions are not included**. These are mostly small functions for tracing and text formatting.

## Contribution

Contributions are highly encouraged and welcomed! I'll probably need some help by porting to Windows and OSX; my experience on developing on these platforms is very limited.

## License

Everything in this repository is released under the [MIT License][5] (see `LICENSE`). For the raylib license, [go here][6].

[1]: https://www.raylib.com/index.html
[2]: https://github.com/gambit/gambit
[3]: https://cmake.org
[4]: https://www.gnu.org/software/make/manual/html_node/index.html
[5]: https://opensource.org/licenses/MIT
[6]: https://github.com/raysan5/raylib/blob/master/LICENSE