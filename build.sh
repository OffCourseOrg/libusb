#!/bin/sh
set xe

if [ ! -f "./configure.ac" ] || [ ! -f "./configure" ] || [ ! -f "./Makefile" ] || [ "./bootstrap.sh" -nt "./configure" ] || [ "./bootstrap.sh" -nt "./configure.ac" ] || [ "./Makefile" -nt "./configure" ]; then
  ./bootstrap.sh
  emconfigure ./configure --host=wasm32-emscripten --disable-shared
  touch Makefile config.status
else
  echo Do not reconfigure
fi
emmake make LDFLAGS="USE_WEBUSB=1" -j$(nproc)
