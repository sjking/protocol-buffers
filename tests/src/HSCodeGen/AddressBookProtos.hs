{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module HSCodeGen.AddressBookProtos (protoInfo, fileDescriptorProto) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import Text.DescriptorProtos.FileDescriptorProto (FileDescriptorProto)
import Text.ProtocolBuffers.Reflections (ProtoInfo)
import qualified Text.ProtocolBuffers.WireMessage as P' (wireGet,getFromBS)

protoInfo :: ProtoInfo
protoInfo
 = Prelude'.read
    "ProtoInfo {protoMod = ProtoName {protobufName = FIName \".tutorial\", haskellPrefix = [MName \"HSCodeGen\"], parentModule = [], baseName = MName \"AddressBookProtos\"}, protoFilePath = [\"HSCodeGen\",\"AddressBookProtos.hs\"], protoSource = \"proto/addressbook.proto\", extensionKeys = fromList [], messages = [DescriptorInfo {descName = ProtoName {protobufName = FIName \".tutorial.Person\", haskellPrefix = [MName \"HSCodeGen\"], parentModule = [MName \"AddressBookProtos\"], baseName = MName \"Person\"}, descFilePath = [\"HSCodeGen\",\"AddressBookProtos\",\"Person.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".tutorial.Person.name\", haskellPrefix' = [MName \"HSCodeGen\"], parentModule' = [MName \"AddressBookProtos\",MName \"Person\"], baseName' = FName \"name\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".tutorial.Person.id\", haskellPrefix' = [MName \"HSCodeGen\"], parentModule' = [MName \"AddressBookProtos\",MName \"Person\"], baseName' = FName \"id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".tutorial.Person.email\", haskellPrefix' = [MName \"HSCodeGen\"], parentModule' = [MName \"AddressBookProtos\",MName \"Person\"], baseName' = FName \"email\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".tutorial.Person.phone\", haskellPrefix' = [MName \"HSCodeGen\"], parentModule' = [MName \"AddressBookProtos\",MName \"Person\"], baseName' = FName \"phone\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".tutorial.Person.PhoneNumber\", haskellPrefix = [MName \"HSCodeGen\"], parentModule = [MName \"AddressBookProtos\",MName \"Person\"], baseName = MName \"PhoneNumber\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = True, lazyFields = False, makeLenses = False},DescriptorInfo {descName = ProtoName {protobufName = FIName \".tutorial.Person.PhoneNumber\", haskellPrefix = [MName \"HSCodeGen\"], parentModule = [MName \"AddressBookProtos\",MName \"Person\"], baseName = MName \"PhoneNumber\"}, descFilePath = [\"HSCodeGen\",\"AddressBookProtos\",\"Person\",\"PhoneNumber.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".tutorial.Person.PhoneNumber.number\", haskellPrefix' = [MName \"HSCodeGen\"], parentModule' = [MName \"AddressBookProtos\",MName \"Person\",MName \"PhoneNumber\"], baseName' = FName \"number\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".tutorial.Person.PhoneNumber.type\", haskellPrefix' = [MName \"HSCodeGen\"], parentModule' = [MName \"AddressBookProtos\",MName \"Person\",MName \"PhoneNumber\"], baseName' = FName \"type'\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".tutorial.Person.PhoneType\", haskellPrefix = [MName \"HSCodeGen\"], parentModule = [MName \"AddressBookProtos\",MName \"Person\"], baseName = MName \"PhoneType\"}), hsRawDefault = Just \"HOME\", hsDefault = Just (HsDef'Enum \"HOME\")}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = True, lazyFields = False, makeLenses = False},DescriptorInfo {descName = ProtoName {protobufName = FIName \".tutorial.AddressBook\", haskellPrefix = [MName \"HSCodeGen\"], parentModule = [MName \"AddressBookProtos\"], baseName = MName \"AddressBook\"}, descFilePath = [\"HSCodeGen\",\"AddressBookProtos\",\"AddressBook.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".tutorial.AddressBook.person\", haskellPrefix' = [MName \"HSCodeGen\"], parentModule' = [MName \"AddressBookProtos\",MName \"AddressBook\"], baseName' = FName \"person\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".tutorial.Person\", haskellPrefix = [MName \"HSCodeGen\"], parentModule = [MName \"AddressBookProtos\"], baseName = MName \"Person\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = True, lazyFields = False, makeLenses = False}], enums = [EnumInfo {enumName = ProtoName {protobufName = FIName \".tutorial.Person.PhoneType\", haskellPrefix = [MName \"HSCodeGen\"], parentModule = [MName \"AddressBookProtos\",MName \"Person\"], baseName = MName \"PhoneType\"}, enumFilePath = [\"HSCodeGen\",\"AddressBookProtos\",\"Person\",\"PhoneType.hs\"], enumValues = [(EnumCode {getEnumCode = 0},\"MOBILE\"),(EnumCode {getEnumCode = 1},\"HOME\"),(EnumCode {getEnumCode = 2},\"WORK\")]}], oneofs = [], knownKeyMap = fromList []}"

fileDescriptorProto :: FileDescriptorProto
fileDescriptorProto
 = P'.getFromBS (P'.wireGet 11)
    (P'.pack
      "\245\STX\n\ETBproto/addressbook.proto\DC2\btutorial\"\218\SOH\n\ACKPerson\DC2\f\n\EOTname\CAN\SOH \STX(\t\DC2\n\n\STXid\CAN\STX \STX(\ENQ\DC2\r\n\ENQemail\CAN\ETX \SOH(\t\DC2+\n\ENQphone\CAN\EOT \ETX(\v2\FS.tutorial.Person.PhoneNumber\SUBM\n\vPhoneNumber\DC2\SO\n\ACKnumber\CAN\SOH \STX(\t\DC2.\n\EOTtype\CAN\STX \SOH(\SO2\SUB.tutorial.Person.PhoneType:\EOTHOME\"+\n\tPhoneType\DC2\n\n\ACKMOBILE\DLE\NUL\DC2\b\n\EOTHOME\DLE\SOH\DC2\b\n\EOTWORK\DLE\STX\"/\n\vAddressBook\DC2 \n\ACKperson\CAN\SOH \ETX(\v2\DLE.tutorial.PersonBB\n\DC4com.example.tutorialB\DC1AddressBookProtosH\SOHP\NUL\128\SOH\NUL\136\SOH\NUL\144\SOH\NUL\160\SOH\NUL\184\SOH\NUL\216\SOH\NUL\248\SOH\NUL")