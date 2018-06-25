{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExtendedDefaultRules #-}
module Text.ProtocolBuffers.Tests
  ( tests
  )
  where

import Text.ProtocolBuffers.Tests.AddressBook (addressBookTest)

tests :: [IO ()]
tests =
  [ addressBookTest ]
