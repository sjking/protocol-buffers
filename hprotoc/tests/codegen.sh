#!/bin/bash

cd `dirname $0`
HASKELL_PATH="hs-codegen"
HASKELL_SRC_PATH="$HASKELL_PATH/src"
PROTO_PATH="proto"
CABAL_FILE="hs-codegen.cabal"
PROTO_PREFIX="HSCodeGen"

stack exec hprotoc -- \
  --haskell_out=$HASKELL_SRC_PATH \
  --proto_path=$PROTO_PATH \
  --prefix="HSCodeGen" \
  --unknown_fields `find $PROTO_PATH  -type f | egrep '\.proto$'`

cd "$HASKELL_SRC_PATH"
EXPOSED_MODULES=`find * -print | egrep '\.hs$' | cut -f 1 -d '.'`
cd -

display_modules () {
  for i in ${EXPOSED_MODULES}; do
    printf "\n%8s$i";
  done
}

cat << EOF > "$HASKELL_PATH/hs-codegen.cabal"
name:                hs-codegen
version:             0.1.0.0
synopsis:            Protocol buffer types auto-generated package for testing protobuf serdes
author:              Nobody
maintainer:          nobody@example.com
build-type:          Simple
cabal-version:       >= 1.10
library
  exposed-modules:`display_modules "$EXPOSED_MODULES"`
  build-depends:        base
                      , filepath
                      , process
                      , protocol-buffers
                      , protocol-buffers-descriptor
  hs-source-dirs:       src
  default-language:     Haskell2010
  ghc-options:          -O1
EOF

