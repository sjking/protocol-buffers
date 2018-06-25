module Text.ProtocolBuffers.Tests.AddressBook (addressBookTest) where

import Data.Text (Text)
import Data.Map (Map, fromList)
import qualified Data.Sequence as Seq
import Data.Sequence (Seq)

-- import Text.ProtocolBuffers.Basic
import Text.ProtocolBuffers.Header (uFromString, Default(..))
-- import Text.ProtocolBuffers.TextMessage
-- import Text.ProtocolBuffers.WireMessage
import Text.ProtocolBuffers.Unknown ()

import qualified HSCodeGen.AddressBookProtos.AddressBook        as AddressBook'
import qualified HSCodeGen.AddressBookProtos.Person             as Person'
import qualified HSCodeGen.AddressBookProtos.Person.PhoneNumber as PhoneNumber'
-- import qualified HSCodeGen.AddressBookProtos.Person.PhoneType   as PhoneType'
import HSCodeGen.AddressBookProtos.AddressBook        (AddressBook(..))
import HSCodeGen.AddressBookProtos.Person             (Person(..))
import HSCodeGen.AddressBookProtos.Person.PhoneNumber (PhoneNumber(..))
import HSCodeGen.AddressBookProtos.Person.PhoneType   (PhoneType(..))

addressBook :: AddressBook
addressBook =
  AddressBook {
    AddressBook'.person = Seq.fromList
      [ mkPerson "Alice" 1 (Just "alice@example.com") $ Seq.singleton ("123-456-7890", HOME)
      , mkPerson "Bob" 2 Nothing $ Seq.fromList [("1-800-123-4567", MOBILE), ("604-291-1234", WORK)]
      ]
  , AddressBook'.unknown'field = defaultValue
  }

mkPerson :: String -> Int -> Maybe String -> Seq (String, PhoneType) -> Person
mkPerson name id email phoneNumbers =
  Person {
    Person'.name = uFromString name
  , Person'.id = id
  , Person'.email = uFromString <$> email
  , Person'.phone = mkPhoneNumbers phoneNumbers
  , Person'.unknown'field = defaultValue
  }

mkPhoneNumbers :: Seq (String, PhoneType) -> Seq PhoneNumber
mkPhoneNumbers = fmap mkPhoneNumbers' where
  mkPhoneNumbers' (num, t) =
    PhoneNumber {
      PhoneNumber'.number = uFromString num
    , PhoneNumber'.type' = t
    , PhoneNumber'.unknown'field = defaultValue
    }

addressBookTest :: IO ()
addressBookTest = return ()
