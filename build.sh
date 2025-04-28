#!/bin/sh
set x

./bootstrap.sh
emconfigure ./configure --host=wasm32-emscripten --disable-shared --prefix=$PWD
emmake make LDFLAGS="USE_WEBUSB=1" -j$(nproc)
