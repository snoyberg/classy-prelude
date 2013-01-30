{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
module ClassyPrelude.LByteString
    ( LByteString
    ) where

import ClassyPrelude.Classes
import Prelude ((.), ($), otherwise, Maybe(..), Monad, Ord, Eq, Int, Bool, Char, Bool(..))
import Control.Monad.IO.Class (MonadIO, liftIO)
import Data.ByteString (ByteString)
import Data.Word (Word8)
import Data.Int (Int64)
import qualified Prelude
import qualified Data.ByteString as ByteString
import qualified Filesystem.Path.CurrentOS as FilePath
import qualified Data.ByteString.Lazy as LByteString


type LByteString = LByteString.ByteString

instance CanMapFunc LByteString LByteString Word8 Word8 where
    mapFunc = LByteString.map

instance CanConcatMapFunc LByteString LByteString Word8 LByteString where
    concatMapFunc = LByteString.concatMap

instance CanFilterFunc LByteString LByteString Word8 where
    filterFunc = LByteString.filter

instance CanLength LByteString Int64 where
    length = LByteString.length

instance CanSingleton LByteString Word8 where
    singleton = LByteString.singleton

instance CanNull LByteString where
    null = LByteString.null

instance CanPack LByteString Word8 where
    pack = LByteString.pack
    unpack = LByteString.unpack

instance CanIntersperse LByteString Word8 where
    intersperse = LByteString.intersperse

instance MonadIO m => CanReadFile (m LByteString) where
    readFile = liftIO . LByteString.readFile . FilePath.encodeString

instance CanWriteFileFunc LByteString where
    writeFileFunc fp = liftIO . LByteString.writeFile (FilePath.encodeString fp)

instance CanBreak LByteString Word8 where
    break = LByteString.break
    span = LByteString.span
    dropWhile = LByteString.dropWhile
    takeWhile = LByteString.takeWhile

instance CanAny LByteString Word8 where
    any = LByteString.any
    all = LByteString.all

instance CanSplitAt LByteString Int64 where
    splitAt = LByteString.splitAt

instance CanReverse LByteString where
    reverse = LByteString.reverse

instance CanFoldFunc LByteString Word8 accum where
    foldFunc = LByteString.foldl'

instance CanReplicate LByteString Word8 Int64 where
    replicate = LByteString.replicate

instance CanToChunks LByteString ByteString where
    toChunks = LByteString.toChunks
    fromChunks = LByteString.fromChunks

instance CanStripSuffix LByteString where
    stripSuffix x y
        | x `LByteString.isSuffixOf` y = Just (LByteString.take (LByteString.length y Prelude.- LByteString.length x) y)
        | Prelude.otherwise = Nothing
    isSuffixOf = LByteString.isSuffixOf

instance CanToStrict LByteString ByteString where
    toStrict = ByteString.concat . toChunks
    fromStrict = fromChunks . Prelude.return

instance CanPartition LByteString Word8 where
    partition = LByteString.partition
