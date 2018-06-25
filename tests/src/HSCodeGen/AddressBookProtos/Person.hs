{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module HSCodeGen.AddressBookProtos.Person (Person(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified HSCodeGen.AddressBookProtos.Person.PhoneNumber as AddressBookProtos.Person (PhoneNumber)

data Person = Person{name :: !(P'.Utf8), id :: !(P'.Int32), email :: !(P'.Maybe P'.Utf8),
                     phone :: !(P'.Seq AddressBookProtos.Person.PhoneNumber), unknown'field :: !(P'.UnknownField)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.UnknownMessage Person where
  getUnknownField = unknown'field
  putUnknownField u'f msg = msg{unknown'field = u'f}

instance P'.Mergeable Person where
  mergeAppend (Person x'1 x'2 x'3 x'4 x'5) (Person y'1 y'2 y'3 y'4 y'5)
   = Person (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)

instance P'.Default Person where
  defaultValue = Person P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire Person where
  wireSize ft' self'@(Person x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 9 x'1 + P'.wireSizeReq 1 5 x'2 + P'.wireSizeOpt 1 9 x'3 + P'.wireSizeRep 1 11 x'4 +
             P'.wireSizeUnknownField x'5)
  wirePutWithSize ft' self'@(Person x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 9 x'1, P'.wirePutReqWithSize 16 5 x'2, P'.wirePutOptWithSize 26 9 x'3,
             P'.wirePutRepWithSize 34 11 x'4, P'.wirePutUnknownFieldWithSize x'5]
        put'FieldsSized
         = let size' = Prelude'.fst (P'.runPutM put'Fields)
               put'Size
                = do
                    P'.putSize size'
                    Prelude'.return (P'.size'WireSize size')
            in P'.sequencePutWithSize [put'Size, put'Fields]
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith (P'.catch'Unknown update'Self)
       11 -> P'.getMessageWith (P'.catch'Unknown update'Self)
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{name = new'Field}) (P'.wireGet 9)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{id = new'Field}) (P'.wireGet 5)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{email = Prelude'.Just new'Field}) (P'.wireGet 9)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{phone = P'.append (phone old'Self) new'Field}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Person) Person where
  getVal m' f' = f' m'

instance P'.GPB Person

instance P'.ReflectDescriptor Person where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 16]) (P'.fromDistinctAscList [10, 16, 26, 34])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".tutorial.Person\", haskellPrefix = [MName \"HSCodeGen\"], parentModule = [MName \"AddressBookProtos\"], baseName = MName \"Person\"}, descFilePath = [\"HSCodeGen\",\"AddressBookProtos\",\"Person.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".tutorial.Person.name\", haskellPrefix' = [MName \"HSCodeGen\"], parentModule' = [MName \"AddressBookProtos\",MName \"Person\"], baseName' = FName \"name\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".tutorial.Person.id\", haskellPrefix' = [MName \"HSCodeGen\"], parentModule' = [MName \"AddressBookProtos\",MName \"Person\"], baseName' = FName \"id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".tutorial.Person.email\", haskellPrefix' = [MName \"HSCodeGen\"], parentModule' = [MName \"AddressBookProtos\",MName \"Person\"], baseName' = FName \"email\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".tutorial.Person.phone\", haskellPrefix' = [MName \"HSCodeGen\"], parentModule' = [MName \"AddressBookProtos\",MName \"Person\"], baseName' = FName \"phone\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".tutorial.Person.PhoneNumber\", haskellPrefix = [MName \"HSCodeGen\"], parentModule = [MName \"AddressBookProtos\",MName \"Person\"], baseName = MName \"PhoneNumber\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = True, lazyFields = False, makeLenses = False}"

instance P'.TextType Person where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Person where
  textPut msg
   = do
       P'.tellT "name" (name msg)
       P'.tellT "id" (id msg)
       P'.tellT "email" (email msg)
       P'.tellT "phone" (phone msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'name, parse'id, parse'email, parse'phone]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'name
         = P'.try
            (do
               v <- P'.getT "name"
               Prelude'.return (\ o -> o{name = v}))
        parse'id
         = P'.try
            (do
               v <- P'.getT "id"
               Prelude'.return (\ o -> o{id = v}))
        parse'email
         = P'.try
            (do
               v <- P'.getT "email"
               Prelude'.return (\ o -> o{email = v}))
        parse'phone
         = P'.try
            (do
               v <- P'.getT "phone"
               Prelude'.return (\ o -> o{phone = P'.append (phone o) v}))