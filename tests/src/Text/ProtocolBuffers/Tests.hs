{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExtendedDefaultRules #-}
module Text.ProtocolBuffers.Tests
  ( tests
  )
  where

-- import Test.HUnit (TestCase, assertEqual, runTestTT)
import Test.HUnit (runTestTT)

import Text.ProtocolBuffers.Tests.AddressBook (addressBookTest)

tests :: IO ()
tests = runTestTT
  [ addressBookTest ]
