#!/bin/bash

cd `dirname $0`
PROTO_PATH="proto"
PROTO_PREFIX="HSCodeGen"
HASKELL_SRC_PATH="src/"

stack exec hprotoc -- \
  --haskell_out=$HASKELL_SRC_PATH \
  --proto_path=$PROTO_PATH \
  --prefix=$PROTO_PREFIX \
  --unknown_fields `find $PROTO_PATH  -type f | egrep '\.proto$'`

cd "$HASKELL_SRC_PATH"
EXPOSED_MODULES=`find * -print | egrep '\.hs$' | egrep "$PROTO_PREFIX" | cut -f 1 -d '.' | tr / .`
cd -

display_modules () {
  for i in ${EXPOSED_MODULES}; do
    printf "\n%8s$i";
  done
}

echo "Please add these modules to protocol-buffers.cabal test suite other modules section:"
display_modules "$EXPOSED_MODULES"
