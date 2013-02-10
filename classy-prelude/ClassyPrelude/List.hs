{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
module ClassyPrelude.List () where

import CorePrelude
import ClassyPrelude.Classes
import qualified Data.List as List
import qualified Control.Monad as Monad
import qualified Data.Monoid as Monoid
import qualified Data.Set as Set


instance CanMap [a] [b] a b where
    map = List.map

instance CanConcatMap [a] [b] a [b] where
    concatMap = List.concatMap

instance CanFilter [a] a where
    filter = List.filter

instance CanFilterM [a] a where
    filterM = Monad.filterM

instance CanLength [a] Int where
    length = List.length

instance CanSingleton [a] a where
    singleton = return

instance CanNull [a] where
    null = List.null

instance CanPack [a] a where
    pack = id
    unpack = id
    subsequences = List.subsequences
    permutations = List.permutations

instance CanIntersperse [a] a where
    intersperse = List.intersperse

instance Monad m => CanMapM [i] (m [o]) m i o where
    mapM = Monad.mapM

instance CanMapM_ [a] a where
    mapM_ = Monad.mapM_

instance Eq k => CanLookup [(k, v)] k v where
    lookup = List.lookup

instance Eq k => CanInsertVal [(k, v)] k v where
    insertVal k v c = (k, v) : delete k c

instance Eq k => CanDeleteVal [(k, v)] k where
    deleteVal k = filter ((/= k) . fst)

instance Eq x => CanMember [x] x where
    member x = List.any (== x)

instance Eq a => CanStripPrefix [a] where
    stripPrefix = List.stripPrefix
    isPrefixOf = List.isPrefixOf

instance CanBreak [a] a where
    break = List.break
    span = List.span
    dropWhile = List.dropWhile
    takeWhile = List.takeWhile

instance CanAny [a] a where
    any = List.any
    all = List.all

instance CanSplitAt [c] Int where
    splitAt = List.splitAt

instance CanFold [a] a accum where
    fold = List.foldl'

instance (c ~ Char) => CanWords [c] where
    words = List.words
    unwords = List.unwords

instance (c ~ Char) => CanLines [c] where
    lines = List.lines

instance (c ~ Char) => CanUnlines [c] where
    unlines = List.unlines

instance Eq a => CanIsInfixOf [a] where
    isInfixOf = List.isInfixOf

instance CanReverse [a] where
    reverse = List.reverse

instance CanReplicate [i] i Int where
    replicate = List.replicate

instance CanReplicateM [a] a Int where
    replicateM = Monad.replicateM

instance CanFind [a] a where
    find = List.find

instance (Monoid m) => CanConcat [m] m where
    concat = Monoid.mconcat

instance CanPartition [a] a where
    partition = List.partition

instance CanNubBy [a] a where
    nubBy = List.nubBy

    nub =
        go Set.empty
      where
        go _ [] = []
        go set (x:xs)
            | x `Set.member` set = go set xs
            | otherwise = x : go (Set.insert x set) xs

instance (Eq a) => CanUnion [a] where
    union = List.union

instance (Eq a) => CanDifference [a] where
    difference = (List.\\)

instance (Eq a) => CanIntersection [a] where
    intersection = List.intersect

instance (Ord a) => CanSortBy [] a where
    sortBy = List.sortBy

instance CanCons [a] a where
    cons = (:)

instance CanUncons [a] a where
    uncons (head:tail) = Just (head, tail)
    uncons _ = Nothing

instance CanCompareLength [a] where
    compareLength [] 0 = EQ
    compareLength _ i | i <= 0 = GT
    compareLength [] _ = LT
    compareLength (_:t) i = compareLength t (i-1)
