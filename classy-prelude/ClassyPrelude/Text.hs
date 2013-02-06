{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
module ClassyPrelude.Text
    ( Text
    ) where

import CorePrelude
import ClassyPrelude.Classes
import qualified Data.Text as Text
import qualified Data.Text.Encoding as Text
import qualified Data.Text.Encoding.Error as Text
import qualified Data.Text.IO as Text


instance CanMapFunc Text Text Char Char where
    mapFunc = Text.map

instance CanConcatMapFunc Text Text Char Text where
    concatMapFunc = Text.concatMap

instance CanFilterFunc Text Text Char where
    filterFunc = Text.filter

instance CanLength Text Int where
    length = Text.length

instance CanSingleton Text Char where
    singleton = Text.singleton

instance CanNull Text where
    null = Text.null

instance CanPack Text Char where
    pack = Text.pack
    unpack = Text.unpack

instance CanIntersperse Text Char where
    intersperse = Text.intersperse

instance CanStripPrefix Text where
    stripPrefix = Text.stripPrefix
    isPrefixOf = Text.isPrefixOf

instance CanBreak Text Char where
    break = Text.break
    span = Text.span
    dropWhile = Text.dropWhile
    takeWhile = Text.takeWhile

instance CanAny Text Char where
    any = Text.any
    all = Text.all

instance CanSplitAt Text Int where
    splitAt = Text.splitAt

instance CanWords Text where
    words = Text.words
    unwords = Text.unwords

instance CanLinesFunc Text where
    linesFunc = Text.lines

instance CanUnlines Text where
    unlines = Text.unlines

instance CanSplit Text Char where
    split = Text.split

instance CanStripSuffix Text where
    stripSuffix = Text.stripSuffix
    isSuffixOf = Text.isSuffixOf

instance CanIsInfixOf Text where
    isInfixOf = Text.isInfixOf

instance CanReverse Text where
    reverse = Text.reverse

instance CanFoldFunc Text Char accum where
    foldFunc = Text.foldl'

instance CanReplicate Text Text Int where
    replicate = Text.replicate

instance CanEncodeUtf8Func Text ByteString where
    encodeUtf8Func = Text.encodeUtf8
    
instance CanDecodeUtf8Func ByteString Text where
    decodeUtf8Func = Text.decodeUtf8With Text.lenientDecode

instance MonadIO m => CanGetLine (m Text) where
    getLine = liftIO Text.getLine

instance CanToLower Text where
    toLower = Text.toLower

instance CanToUpper Text where
    toUpper = Text.toUpper

instance CanToCaseFold Text where
    toCaseFold = Text.toCaseFold

instance CanFind Text Char where
    find = Text.find

instance CanPartition Text Char where
    partition = Text.partition
