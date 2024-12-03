{-# OPTIONS_GHC -w #-}
{-# LANGUAGE CPP #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE PatternGuards #-}
{-# LANGUAGE NoStrictData #-}
#if __GLASGOW_HASKELL__ >= 710
{-# LANGUAGE PartialTypeSignatures #-}
#endif
module Parser where
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 2.0.2

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17
        = HappyTerminal (Token)
        | HappyErrorToken Prelude.Int
        | HappyAbsSyn4 t4
        | HappyAbsSyn5 t5
        | HappyAbsSyn6 t6
        | HappyAbsSyn7 t7
        | HappyAbsSyn8 t8
        | HappyAbsSyn9 t9
        | HappyAbsSyn10 t10
        | HappyAbsSyn11 t11
        | HappyAbsSyn12 t12
        | HappyAbsSyn13 t13
        | HappyAbsSyn14 t14
        | HappyAbsSyn15 t15
        | HappyAbsSyn16 t16
        | HappyAbsSyn17 t17

happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x00\xee\xc1\x01\x00\x00\x00\x08\x00\x80\x7b\x70\x00\x00\x00\x00\x02\x00\xe0\x1e\x1c\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x12\x80\x00\x08\x00\x00\x00\x00\x80\x04\x20\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x48\x00\x02\x20\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x04\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x01\x08\x80\x00\x00\x00\x00\x00\x48\x00\x06\x20\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x80\x04\x20\x00\x02\x00\x00\x00\x00\x20\x01\x08\x80\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\xfe\xf9\x00\x00\x00\x00\x00\x00\x00\x80\x04\x20\x00\x02\x00\x00\x00\x00\x20\x01\x08\x80\x00\x00\x00\x00\x00\x48\x00\x02\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x88\x7f\x3e\x00\x00\x00\x00\x00\x80\xe0\x9f\x0f\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x18\x00\x00\x00\x00\x78\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x80\x04\x20\x00\x02\x00\x00\x00\x00\x20\x01\x08\x80\x00\x00\x00\x00\x00\x48\x00\x02\x20\x00\x00\x00\x00\x00\x12\x80\x00\x08\x00\x00\x00\x00\x80\x04\x20\x00\x02\x00\x00\x00\x00\x20\x01\x08\x80\x00\x00\x00\x00\x00\x48\x00\x02\x20\x00\x00\x00\x00\x00\x12\x80\x00\x08\x00\x00\x00\x00\x80\x04\x20\x00\x02\x00\x00\x00\x00\x20\x01\x08\x80\x00\x00\x00\x00\x00\x48\x00\x02\x20\x00\x00\x00\x00\x00\x12\x80\x00\x08\x00\x00\x00\x00\x80\x04\x20\x00\x02\x00\x00\x00\x00\x20\x01\x08\x80\x00\x00\x00\x00\x00\x48\x00\x02\x20\x00\x00\x00\x00\x00\x12\x80\x00\x08\x00\x00\x00\x80\x7f\x3e\x40\x00\x00\x00\x00\x00\x00\x00\x0e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x80\x7f\x3e\x40\x00\x00\x00\x00\x00\xe0\x9f\x0f\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfe\xf9\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf8\xe7\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x04\x20\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x41\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf8\xe7\x03\x00\x00\x00\x00\x00\x00\xfe\xf9\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\xe0\x00\x00\x00\x00\x00\x00\x00\x00\x38\x00\x00\x00\x00\x00\x00\xe0\x8f\x0f\x00\x00\x00\x00\x00\x00\xf8\xe1\x03\x00\x00\x00\x00\x00\x00\x00\xf8\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x00\x00\x00\x00\x00\x00\x80\x0f\x00\x00\x00\x00\x00\x00\x00\xe0\x03\x00\x00\x00\x00\x00\x00\x78\xf8\x00\x00\x00\x00\x00\x00\x00\x1e\x3e\x00\x00\x00\x00\x00\x01\xe0\x9f\x0f\x00\x00\x00\x00\x00\x00\x00\x48\x00\x02\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x48\x00\x02\x20\x00\x00\x00\x00\xfe\xf9\x00\x00\x00\x00\x00\x00\x80\x7f\x3e\x00\x00\x00\x00\x00\x00\x00\x20\x01\x08\x80\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\xe0\x9f\x0f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x12\x80\x00\x08\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\xe0\x9f\x0f\x00\x00\x00\x00\x00\x00\x00\x48\x00\x02\x20\x00\x00\x00\x00\xfe\xf9\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe0\x9f\x0f\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Program","TopLevelExprs","TopLevelExpr","OptType","Type","VarDecl","ValDecl","FunDecl","ParamList","Stmt","FuncCall","Assign","Expr","ArgList","val","var","if","else","while","break","return","fun","true","false","then","when","do","print","println","readln","'=='","'!='","'<'","'<='","'>'","'>='","'&&'","'||'","'!'","'='","'+'","'-'","'*'","'/'","'%'","'++'","'--'","'+='","'-='","'*='","'/='","'%='","'('","')'","'{'","'}'","'['","']'","';'","','","'.'","':'","int","double","identifier","stringContent","%eof"]
        bit_start = st               Prelude.* 70
        bit_end   = (st Prelude.+ 1) Prelude.* 70
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..69]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\x01\x00\x00\x00\x01\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xce\xff\xff\xff\xd9\xff\xff\xff\xfa\xff\xff\xff\xfa\xff\xff\xff\x00\x00\x00\x00\xfa\xff\xff\xff\xed\xff\xff\xff\x0b\x00\x00\x00\x0c\x00\x00\x00\x1a\x00\x00\x00\xf0\xff\xff\xff\xf5\xff\xff\xff\xfa\xff\xff\xff\x2f\x00\x00\x00\x06\x00\x00\x00\xfa\xff\xff\xff\xfa\xff\xff\xff\x1b\x00\x00\x00\xbc\x00\x00\x00\xfa\xff\xff\xff\xfa\xff\xff\xff\xfa\xff\xff\xff\x00\x00\x00\x00\xad\x00\x00\x00\x07\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\x00\x00\x00\x00\x30\x00\x00\x00\x04\x00\x00\x00\x32\x00\x00\x00\xfa\xff\xff\xff\xfa\xff\xff\xff\xfa\xff\xff\xff\xfa\xff\xff\xff\xfa\xff\xff\xff\xfa\xff\xff\xff\xfa\xff\xff\xff\xfa\xff\xff\xff\xfa\xff\xff\xff\xfa\xff\xff\xff\xfa\xff\xff\xff\xfa\xff\xff\xff\xfa\xff\xff\xff\xfa\xff\xff\xff\xfa\xff\xff\xff\xfa\xff\xff\xff\x77\x00\x00\x00\x0a\x00\x00\x00\xbc\x00\x00\x00\x16\x00\x00\x00\x86\x00\x00\x00\x95\x00\x00\x00\x00\x00\x00\x00\xbc\x00\x00\x00\xdd\xff\xff\xff\x00\x00\x00\x00\xbc\x00\x00\x00\x00\x00\x00\x00\xfa\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xbc\x00\x00\x00\x3d\x00\x00\x00\x00\x00\x00\x00\x2e\x00\x00\x00\x2e\x00\x00\x00\x0a\x00\x00\x00\x0a\x00\x00\x00\xcb\x00\x00\x00\xda\x00\x00\x00\xf6\x00\x00\x00\xf6\x00\x00\x00\xf6\x00\x00\x00\xf6\x00\x00\x00\xe9\x00\x00\x00\xe9\x00\x00\x00\x28\x00\x00\x00\xfa\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfa\xff\xff\xff\xbc\x00\x00\x00\xbc\x00\x00\x00\xfa\xff\xff\xff\x59\x00\x00\x00\x35\x00\x00\x00\x2c\x00\x00\x00\xbc\x00\x00\x00\x00\x00\x00\x00\xfa\xff\xff\xff\x37\x00\x00\x00\xbc\x00\x00\x00\xfa\xff\xff\xff\x57\x00\x00\x00\x00\x00\x00\x00\x67\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x16\x01\x00\x00\x21\x01\x00\x00\x2b\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x55\x00\x00\x00\x58\x00\x00\x00\x00\x00\x00\x00\x5a\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x64\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x65\x00\x00\x00\x6b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x74\x00\x00\x00\x7b\x00\x00\x00\x84\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x60\x00\x00\x00\x62\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x9c\x00\x00\x00\x00\x00\x00\x00\xa3\x00\x00\x00\xa9\x00\x00\x00\xaa\x00\x00\x00\xab\x00\x00\x00\xac\x00\x00\x00\xaf\x00\x00\x00\xb0\x00\x00\x00\xba\x00\x00\x00\xbb\x00\x00\x00\xc9\x00\x00\x00\xca\x00\x00\x00\xd7\x00\x00\x00\xd8\x00\x00\x00\xd9\x00\x00\x00\xe5\x00\x00\x00\xe6\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xb1\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe7\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe8\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf4\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf5\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf7\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyAdjustOffset :: Happy_GHC_Exts.Int# -> Happy_GHC_Exts.Int#
happyAdjustOffset off = off

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\x00\x00\x00\x00\x00\x00\x00\x00\xfe\xff\xff\xff\xfd\xff\xff\xff\xfa\xff\xff\xff\xf9\xff\xff\xff\xfb\xff\xff\xff\xf8\xff\xff\xff\xdf\xff\xff\xff\xde\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe3\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe4\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xcb\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\xf6\xff\xff\xff\xf6\xff\xff\xff\xfc\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd9\xff\xff\xff\xda\xff\xff\xff\xec\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\xe0\xff\xff\xff\xc9\xff\xff\xff\x00\x00\x00\x00\xdc\xff\xff\xff\xdb\xff\xff\xff\xdd\xff\xff\xff\x00\x00\x00\x00\xe1\xff\xff\xff\xe2\xff\xff\xff\x00\x00\x00\x00\xeb\xff\xff\xff\xca\xff\xff\xff\xe5\xff\xff\xff\x00\x00\x00\x00\xcc\xff\xff\xff\xcd\xff\xff\xff\xce\xff\xff\xff\xcf\xff\xff\xff\xd0\xff\xff\xff\xd8\xff\xff\xff\xd7\xff\xff\xff\xd1\xff\xff\xff\xd2\xff\xff\xff\xd3\xff\xff\xff\xd4\xff\xff\xff\xd5\xff\xff\xff\xd6\xff\xff\xff\xe9\xff\xff\xff\x00\x00\x00\x00\xf7\xff\xff\xff\xf1\xff\xff\xff\xf0\xff\xff\xff\xf4\xff\xff\xff\xf3\xff\xff\xff\xf5\xff\xff\xff\xf2\xff\xff\xff\x00\x00\x00\x00\xee\xff\xff\xff\xef\xff\xff\xff\x00\x00\x00\x00\xe8\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\xc8\xff\xff\xff\xea\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\xe6\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\xed\xff\xff\xff\x00\x00\x00\x00\xe7\xff\xff\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\xff\xff\x33\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x28\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x1a\x00\x00\x00\x2e\x00\x00\x00\x33\x00\x00\x00\x09\x00\x00\x00\x0a\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x0b\x00\x00\x00\x19\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x1c\x00\x00\x00\x27\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x33\x00\x00\x00\x27\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x35\x00\x00\x00\x28\x00\x00\x00\x04\x00\x00\x00\x33\x00\x00\x00\x28\x00\x00\x00\x30\x00\x00\x00\x29\x00\x00\x00\x2e\x00\x00\x00\x27\x00\x00\x00\x27\x00\x00\x00\x33\x00\x00\x00\x31\x00\x00\x00\x32\x00\x00\x00\x33\x00\x00\x00\x34\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x27\x00\x00\x00\x27\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x19\x00\x00\x00\x33\x00\x00\x00\x1a\x00\x00\x00\x1c\x00\x00\x00\x1a\x00\x00\x00\x1f\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x27\x00\x00\x00\x28\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x04\x00\x00\x00\x29\x00\x00\x00\x33\x00\x00\x00\x29\x00\x00\x00\x0c\x00\x00\x00\x33\x00\x00\x00\x03\x00\x00\x00\x0c\x00\x00\x00\x03\x00\x00\x00\x0c\x00\x00\x00\x2a\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x0c\x00\x00\x00\x0c\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x0c\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x0c\x00\x00\x00\x2a\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x0c\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x0c\x00\x00\x00\x2a\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x28\x00\x00\x00\x04\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x28\x00\x00\x00\x0c\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x0c\x00\x00\x00\x0c\x00\x00\x00\x0c\x00\x00\x00\x0c\x00\x00\x00\x08\x00\x00\x00\x0d\x00\x00\x00\x0c\x00\x00\x00\x0c\x00\x00\x00\x28\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x0c\x00\x00\x00\x0c\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x18\x00\x00\x00\x0c\x00\x00\x00\x0c\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x17\x00\x00\x00\x0c\x00\x00\x00\x0c\x00\x00\x00\x0c\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x0c\x00\x00\x00\x0c\x00\x00\x00\x0c\x00\x00\x00\x0c\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x0c\x00\x00\x00\x0c\x00\x00\x00\xff\xff\xff\xff\x0c\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x15\x00\x00\x00\x16\x00\x00\x00\x0c\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x00\x00\x1e\x00\x00\x00\x1f\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\xff\xff\xff\xff\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\xff\xff\xff\xff\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\x02\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\xff\xff\xff\xff\x09\x00\x00\x00\x0a\x00\x00\x00\x0b\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x00\x00\x25\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x00\x00\x0d\x00\x00\x00\x45\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x10\x00\x00\x00\x11\x00\x00\x00\x17\x00\x00\x00\x46\x00\x00\x00\x24\x00\x00\x00\x5e\x00\x00\x00\x5f\x00\x00\x00\x12\x00\x00\x00\x13\x00\x00\x00\x14\x00\x00\x00\x2a\x00\x00\x00\x1e\x00\x00\x00\x40\x00\x00\x00\x41\x00\x00\x00\x1f\x00\x00\x00\x18\x00\x00\x00\x2b\x00\x00\x00\x2c\x00\x00\x00\x2d\x00\x00\x00\x2e\x00\x00\x00\x2f\x00\x00\x00\x30\x00\x00\x00\x31\x00\x00\x00\x32\x00\x00\x00\x1c\x00\x00\x00\x20\x00\x00\x00\x33\x00\x00\x00\x34\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\xff\xff\xff\xff\x69\x00\x00\x00\x67\x00\x00\x00\x21\x00\x00\x00\x40\x00\x00\x00\x28\x00\x00\x00\x38\x00\x00\x00\x6a\x00\x00\x00\x1b\x00\x00\x00\x1a\x00\x00\x00\x15\x00\x00\x00\x60\x00\x00\x00\x61\x00\x00\x00\x62\x00\x00\x00\x63\x00\x00\x00\x2b\x00\x00\x00\x2c\x00\x00\x00\x2d\x00\x00\x00\x2e\x00\x00\x00\x2f\x00\x00\x00\x30\x00\x00\x00\x31\x00\x00\x00\x32\x00\x00\x00\x19\x00\x00\x00\x3d\x00\x00\x00\x33\x00\x00\x00\x34\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\x1e\x00\x00\x00\x4a\x00\x00\x00\x64\x00\x00\x00\x1f\x00\x00\x00\x5c\x00\x00\x00\x37\x00\x00\x00\x2b\x00\x00\x00\x2c\x00\x00\x00\x2d\x00\x00\x00\x2e\x00\x00\x00\x2f\x00\x00\x00\x30\x00\x00\x00\x31\x00\x00\x00\x32\x00\x00\x00\x20\x00\x00\x00\x43\x00\x00\x00\x33\x00\x00\x00\x34\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\x6e\x00\x00\x00\x6d\x00\x00\x00\x6c\x00\x00\x00\x70\x00\x00\x00\x22\x00\x00\x00\x21\x00\x00\x00\x28\x00\x00\x00\x21\x00\x00\x00\x26\x00\x00\x00\x1c\x00\x00\x00\x68\x00\x00\x00\x2b\x00\x00\x00\x2c\x00\x00\x00\x2d\x00\x00\x00\x2e\x00\x00\x00\x2f\x00\x00\x00\x30\x00\x00\x00\x31\x00\x00\x00\x32\x00\x00\x00\x43\x00\x00\x00\x3e\x00\x00\x00\x33\x00\x00\x00\x34\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\x3d\x00\x00\x00\x2b\x00\x00\x00\x2c\x00\x00\x00\x2d\x00\x00\x00\x2e\x00\x00\x00\x2f\x00\x00\x00\x30\x00\x00\x00\x31\x00\x00\x00\x32\x00\x00\x00\x3b\x00\x00\x00\x72\x00\x00\x00\x33\x00\x00\x00\x34\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\x3a\x00\x00\x00\x2b\x00\x00\x00\x2c\x00\x00\x00\x2d\x00\x00\x00\x2e\x00\x00\x00\x2f\x00\x00\x00\x30\x00\x00\x00\x31\x00\x00\x00\x32\x00\x00\x00\x39\x00\x00\x00\x74\x00\x00\x00\x33\x00\x00\x00\x34\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\x2b\x00\x00\x00\x2c\x00\x00\x00\x2d\x00\x00\x00\x2e\x00\x00\x00\x2f\x00\x00\x00\x30\x00\x00\x00\x31\x00\x00\x00\x32\x00\x00\x00\x4b\x00\x00\x00\x5c\x00\x00\x00\x33\x00\x00\x00\x34\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\x2b\x00\x00\x00\x2c\x00\x00\x00\x2d\x00\x00\x00\x2e\x00\x00\x00\x2f\x00\x00\x00\x30\x00\x00\x00\x31\x00\x00\x00\x32\x00\x00\x00\x48\x00\x00\x00\x5a\x00\x00\x00\x33\x00\x00\x00\x34\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\x59\x00\x00\x00\x58\x00\x00\x00\x57\x00\x00\x00\x56\x00\x00\x00\x48\x00\x00\x00\x39\x00\x00\x00\x55\x00\x00\x00\x54\x00\x00\x00\x47\x00\x00\x00\x2b\x00\x00\x00\x2c\x00\x00\x00\x2d\x00\x00\x00\x2e\x00\x00\x00\x2f\x00\x00\x00\x30\x00\x00\x00\x31\x00\x00\x00\x32\x00\x00\x00\x53\x00\x00\x00\x52\x00\x00\x00\x33\x00\x00\x00\x34\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\x2b\x00\x00\x00\x2c\x00\x00\x00\x2d\x00\x00\x00\x2e\x00\x00\x00\x2f\x00\x00\x00\x30\x00\x00\x00\x31\x00\x00\x00\x32\x00\x00\x00\x51\x00\x00\x00\x50\x00\x00\x00\x33\x00\x00\x00\x34\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\x2b\x00\x00\x00\x2c\x00\x00\x00\x2d\x00\x00\x00\x2e\x00\x00\x00\x2f\x00\x00\x00\x30\x00\x00\x00\x31\x00\x00\x00\x4f\x00\x00\x00\x4e\x00\x00\x00\x4d\x00\x00\x00\x33\x00\x00\x00\x34\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\x2b\x00\x00\x00\x2c\x00\x00\x00\x2d\x00\x00\x00\x2e\x00\x00\x00\x2f\x00\x00\x00\x30\x00\x00\x00\x4c\x00\x00\x00\x4b\x00\x00\x00\x6a\x00\x00\x00\x65\x00\x00\x00\x33\x00\x00\x00\x34\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x2d\x00\x00\x00\x2e\x00\x00\x00\x2f\x00\x00\x00\x30\x00\x00\x00\x64\x00\x00\x00\x6e\x00\x00\x00\x00\x00\x00\x00\x70\x00\x00\x00\x33\x00\x00\x00\x34\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x72\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x33\x00\x00\x00\x34\x00\x00\x00\x35\x00\x00\x00\x36\x00\x00\x00\x37\x00\x00\x00\x15\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x00\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x00\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x25\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x00\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (1, 55) [
        (1 , happyReduce_1),
        (2 , happyReduce_2),
        (3 , happyReduce_3),
        (4 , happyReduce_4),
        (5 , happyReduce_5),
        (6 , happyReduce_6),
        (7 , happyReduce_7),
        (8 , happyReduce_8),
        (9 , happyReduce_9),
        (10 , happyReduce_10),
        (11 , happyReduce_11),
        (12 , happyReduce_12),
        (13 , happyReduce_13),
        (14 , happyReduce_14),
        (15 , happyReduce_15),
        (16 , happyReduce_16),
        (17 , happyReduce_17),
        (18 , happyReduce_18),
        (19 , happyReduce_19),
        (20 , happyReduce_20),
        (21 , happyReduce_21),
        (22 , happyReduce_22),
        (23 , happyReduce_23),
        (24 , happyReduce_24),
        (25 , happyReduce_25),
        (26 , happyReduce_26),
        (27 , happyReduce_27),
        (28 , happyReduce_28),
        (29 , happyReduce_29),
        (30 , happyReduce_30),
        (31 , happyReduce_31),
        (32 , happyReduce_32),
        (33 , happyReduce_33),
        (34 , happyReduce_34),
        (35 , happyReduce_35),
        (36 , happyReduce_36),
        (37 , happyReduce_37),
        (38 , happyReduce_38),
        (39 , happyReduce_39),
        (40 , happyReduce_40),
        (41 , happyReduce_41),
        (42 , happyReduce_42),
        (43 , happyReduce_43),
        (44 , happyReduce_44),
        (45 , happyReduce_45),
        (46 , happyReduce_46),
        (47 , happyReduce_47),
        (48 , happyReduce_48),
        (49 , happyReduce_49),
        (50 , happyReduce_50),
        (51 , happyReduce_51),
        (52 , happyReduce_52),
        (53 , happyReduce_53),
        (54 , happyReduce_54),
        (55 , happyReduce_55)
        ]

happy_n_terms = 54 :: Prelude.Int
happy_n_nonterms = 14 :: Prelude.Int

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_1 = happySpecReduce_1  0# happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
         =  HappyAbsSyn4
                 (Begin happy_var_1
        )
happyReduction_1 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_2 = happySpecReduce_1  1# happyReduction_2
happyReduction_2 (HappyAbsSyn6  happy_var_1)
         =  HappyAbsSyn5
                 ([happy_var_1]
        )
happyReduction_2 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_3 = happySpecReduce_2  1# happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_2)
        (HappyAbsSyn5  happy_var_1)
         =  HappyAbsSyn5
                 (happy_var_1 ++ [happy_var_2]
        )
happyReduction_3 _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_4 = happySpecReduce_1  2# happyReduction_4
happyReduction_4 (HappyAbsSyn11  happy_var_1)
         =  HappyAbsSyn6
                 (TopLevelFunDecl happy_var_1
        )
happyReduction_4 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_5 = happySpecReduce_1  2# happyReduction_5
happyReduction_5 (HappyAbsSyn9  happy_var_1)
         =  HappyAbsSyn6
                 (TopLevelVarDecl happy_var_1
        )
happyReduction_5 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_6 = happySpecReduce_1  2# happyReduction_6
happyReduction_6 (HappyAbsSyn10  happy_var_1)
         =  HappyAbsSyn6
                 (TopLevelValDecl happy_var_1
        )
happyReduction_6 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_7 = happySpecReduce_1  2# happyReduction_7
happyReduction_7 (HappyAbsSyn13  happy_var_1)
         =  HappyAbsSyn6
                 (Statement happy_var_1
        )
happyReduction_7 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_8 = happySpecReduce_2  3# happyReduction_8
happyReduction_8 (HappyAbsSyn8  happy_var_2)
        _
         =  HappyAbsSyn7
                 (Just happy_var_2
        )
happyReduction_8 _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_9 = happySpecReduce_0  3# happyReduction_9
happyReduction_9  =  HappyAbsSyn7
                 (Nothing
        )

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_10 = happySpecReduce_1  4# happyReduction_10
happyReduction_10 (HappyTerminal (TokenId happy_var_1))
         =  HappyAbsSyn8
                 (TypeIdentifier happy_var_1
        )
happyReduction_10 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_11 = happySpecReduce_1  4# happyReduction_11
happyReduction_11 _
         =  HappyAbsSyn8
                 (IntType
        )

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_12 = happySpecReduce_1  4# happyReduction_12
happyReduction_12 _
         =  HappyAbsSyn8
                 (DoubleType
        )

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_13 = happySpecReduce_1  4# happyReduction_13
happyReduction_13 _
         =  HappyAbsSyn8
                 (StringType
        )

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_14 = happySpecReduce_1  4# happyReduction_14
happyReduction_14 _
         =  HappyAbsSyn8
                 (BoolType True
        )

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_15 = happySpecReduce_1  4# happyReduction_15
happyReduction_15 _
         =  HappyAbsSyn8
                 (BoolType False
        )

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_16 = happyReduce 5# 5# happyReduction_16
happyReduction_16 ((HappyAbsSyn16  happy_var_5) `HappyStk`
        _ `HappyStk`
        (HappyAbsSyn7  happy_var_3) `HappyStk`
        (HappyTerminal (TokenId happy_var_2)) `HappyStk`
        _ `HappyStk`
        happyRest)
         = HappyAbsSyn9
                 (VarDeclaration happy_var_2 happy_var_3 happy_var_5
        ) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_17 = happyReduce 5# 6# happyReduction_17
happyReduction_17 ((HappyAbsSyn16  happy_var_5) `HappyStk`
        _ `HappyStk`
        (HappyAbsSyn7  happy_var_3) `HappyStk`
        (HappyTerminal (TokenId happy_var_2)) `HappyStk`
        _ `HappyStk`
        happyRest)
         = HappyAbsSyn10
                 (ValDeclaration happy_var_2 happy_var_3 happy_var_5
        ) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_18 = happyReduce 8# 7# happyReduction_18
happyReduction_18 (_ `HappyStk`
        (HappyAbsSyn16  happy_var_7) `HappyStk`
        _ `HappyStk`
        _ `HappyStk`
        (HappyAbsSyn12  happy_var_4) `HappyStk`
        _ `HappyStk`
        (HappyTerminal (TokenId happy_var_2)) `HappyStk`
        _ `HappyStk`
        happyRest)
         = HappyAbsSyn11
                 (FunDeclaration happy_var_2 happy_var_4 happy_var_7
        ) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_19 = happySpecReduce_0  8# happyReduction_19
happyReduction_19  =  HappyAbsSyn12
                 ([]
        )

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_20 = happySpecReduce_1  8# happyReduction_20
happyReduction_20 (HappyTerminal (TokenId happy_var_1))
         =  HappyAbsSyn12
                 ([happy_var_1]
        )
happyReduction_20 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_21 = happySpecReduce_3  8# happyReduction_21
happyReduction_21 (HappyTerminal (TokenId happy_var_3))
        _
        (HappyAbsSyn12  happy_var_1)
         =  HappyAbsSyn12
                 (happy_var_1 ++ [happy_var_3]
        )
happyReduction_21 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_22 = happyReduce 4# 9# happyReduction_22
happyReduction_22 ((HappyAbsSyn16  happy_var_4) `HappyStk`
        _ `HappyStk`
        (HappyAbsSyn16  happy_var_2) `HappyStk`
        _ `HappyStk`
        happyRest)
         = HappyAbsSyn13
                 (IfThen happy_var_2 happy_var_4
        ) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_23 = happyReduce 5# 9# happyReduction_23
happyReduction_23 (_ `HappyStk`
        (HappyAbsSyn16  happy_var_4) `HappyStk`
        _ `HappyStk`
        (HappyAbsSyn16  happy_var_2) `HappyStk`
        _ `HappyStk`
        happyRest)
         = HappyAbsSyn13
                 (IfThen happy_var_2 happy_var_4
        ) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_24 = happyReduce 9# 9# happyReduction_24
happyReduction_24 (_ `HappyStk`
        (HappyAbsSyn16  happy_var_8) `HappyStk`
        _ `HappyStk`
        _ `HappyStk`
        _ `HappyStk`
        (HappyAbsSyn16  happy_var_4) `HappyStk`
        _ `HappyStk`
        (HappyAbsSyn16  happy_var_2) `HappyStk`
        _ `HappyStk`
        happyRest)
         = HappyAbsSyn13
                 (IfThenElse happy_var_2 happy_var_4 happy_var_8
        ) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_25 = happyReduce 6# 9# happyReduction_25
happyReduction_25 ((HappyAbsSyn16  happy_var_6) `HappyStk`
        _ `HappyStk`
        (HappyAbsSyn16  happy_var_4) `HappyStk`
        _ `HappyStk`
        (HappyAbsSyn16  happy_var_2) `HappyStk`
        _ `HappyStk`
        happyRest)
         = HappyAbsSyn13
                 (IfThenElse happy_var_2 happy_var_4 happy_var_6
        ) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_26 = happyReduce 4# 9# happyReduction_26
happyReduction_26 ((HappyAbsSyn16  happy_var_4) `HappyStk`
        _ `HappyStk`
        (HappyAbsSyn16  happy_var_2) `HappyStk`
        _ `HappyStk`
        happyRest)
         = HappyAbsSyn13
                 (While happy_var_2 happy_var_4
        ) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_27 = happySpecReduce_2  9# happyReduction_27
happyReduction_27 (HappyAbsSyn16  happy_var_2)
        _
         =  HappyAbsSyn13
                 (Return happy_var_2
        )
happyReduction_27 _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_28 = happySpecReduce_1  9# happyReduction_28
happyReduction_28 _
         =  HappyAbsSyn13
                 (Break
        )

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_29 = happyReduce 4# 9# happyReduction_29
happyReduction_29 (_ `HappyStk`
        (HappyAbsSyn16  happy_var_3) `HappyStk`
        _ `HappyStk`
        _ `HappyStk`
        happyRest)
         = HappyAbsSyn13
                 (FuncCall "print" [happy_var_3]
        ) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_30 = happyReduce 4# 9# happyReduction_30
happyReduction_30 (_ `HappyStk`
        (HappyAbsSyn16  happy_var_3) `HappyStk`
        _ `HappyStk`
        _ `HappyStk`
        happyRest)
         = HappyAbsSyn13
                 (FuncCall "println" [happy_var_3]
        ) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_31 = happySpecReduce_3  9# happyReduction_31
happyReduction_31 _
        _
        _
         =  HappyAbsSyn13
                 (FuncCall "readln" []
        )

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_32 = happySpecReduce_1  9# happyReduction_32
happyReduction_32 (HappyAbsSyn14  happy_var_1)
         =  HappyAbsSyn13
                 (happy_var_1
        )
happyReduction_32 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_33 = happySpecReduce_1  9# happyReduction_33
happyReduction_33 (HappyAbsSyn15  happy_var_1)
         =  HappyAbsSyn13
                 (happy_var_1
        )
happyReduction_33 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_34 = happyReduce 4# 10# happyReduction_34
happyReduction_34 (_ `HappyStk`
        (HappyAbsSyn17  happy_var_3) `HappyStk`
        _ `HappyStk`
        (HappyTerminal (TokenId happy_var_1)) `HappyStk`
        happyRest)
         = HappyAbsSyn14
                 (FuncCall happy_var_1 happy_var_3
        ) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_35 = happySpecReduce_3  10# happyReduction_35
happyReduction_35 _
        _
        (HappyTerminal (TokenId happy_var_1))
         =  HappyAbsSyn14
                 (FuncCall happy_var_1 []
        )
happyReduction_35 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_36 = happySpecReduce_3  11# happyReduction_36
happyReduction_36 (HappyAbsSyn16  happy_var_3)
        _
        (HappyTerminal (TokenId happy_var_1))
         =  HappyAbsSyn15
                 (Assign happy_var_1 happy_var_3
        )
happyReduction_36 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_37 = happySpecReduce_2  12# happyReduction_37
happyReduction_37 (HappyAbsSyn16  happy_var_2)
        _
         =  HappyAbsSyn16
                 (Not happy_var_2
        )
happyReduction_37 _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_38 = happySpecReduce_2  12# happyReduction_38
happyReduction_38 (HappyAbsSyn16  happy_var_2)
        _
         =  HappyAbsSyn16
                 (Negative happy_var_2
        )
happyReduction_38 _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_39 = happySpecReduce_3  12# happyReduction_39
happyReduction_39 (HappyAbsSyn16  happy_var_3)
        _
        (HappyAbsSyn16  happy_var_1)
         =  HappyAbsSyn16
                 (Op Or happy_var_1 happy_var_3
        )
happyReduction_39 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_40 = happySpecReduce_3  12# happyReduction_40
happyReduction_40 (HappyAbsSyn16  happy_var_3)
        _
        (HappyAbsSyn16  happy_var_1)
         =  HappyAbsSyn16
                 (Op And happy_var_1 happy_var_3
        )
happyReduction_40 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_41 = happySpecReduce_3  12# happyReduction_41
happyReduction_41 (HappyAbsSyn16  happy_var_3)
        _
        (HappyAbsSyn16  happy_var_1)
         =  HappyAbsSyn16
                 (Op Eq happy_var_1 happy_var_3
        )
happyReduction_41 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_42 = happySpecReduce_3  12# happyReduction_42
happyReduction_42 (HappyAbsSyn16  happy_var_3)
        _
        (HappyAbsSyn16  happy_var_1)
         =  HappyAbsSyn16
                 (Op Neq happy_var_1 happy_var_3
        )
happyReduction_42 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_43 = happySpecReduce_3  12# happyReduction_43
happyReduction_43 (HappyAbsSyn16  happy_var_3)
        _
        (HappyAbsSyn16  happy_var_1)
         =  HappyAbsSyn16
                 (Op Lt happy_var_1 happy_var_3
        )
happyReduction_43 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_44 = happySpecReduce_3  12# happyReduction_44
happyReduction_44 (HappyAbsSyn16  happy_var_3)
        _
        (HappyAbsSyn16  happy_var_1)
         =  HappyAbsSyn16
                 (Op Leq happy_var_1 happy_var_3
        )
happyReduction_44 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_45 = happySpecReduce_3  12# happyReduction_45
happyReduction_45 (HappyAbsSyn16  happy_var_3)
        _
        (HappyAbsSyn16  happy_var_1)
         =  HappyAbsSyn16
                 (Op Gt happy_var_1 happy_var_3
        )
happyReduction_45 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_46 = happySpecReduce_3  12# happyReduction_46
happyReduction_46 (HappyAbsSyn16  happy_var_3)
        _
        (HappyAbsSyn16  happy_var_1)
         =  HappyAbsSyn16
                 (Op Geq happy_var_1 happy_var_3
        )
happyReduction_46 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_47 = happySpecReduce_3  12# happyReduction_47
happyReduction_47 (HappyAbsSyn16  happy_var_3)
        _
        (HappyAbsSyn16  happy_var_1)
         =  HappyAbsSyn16
                 (Op Add happy_var_1 happy_var_3
        )
happyReduction_47 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_48 = happySpecReduce_3  12# happyReduction_48
happyReduction_48 (HappyAbsSyn16  happy_var_3)
        _
        (HappyAbsSyn16  happy_var_1)
         =  HappyAbsSyn16
                 (Op Sub happy_var_1 happy_var_3
        )
happyReduction_48 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_49 = happySpecReduce_3  12# happyReduction_49
happyReduction_49 (HappyAbsSyn16  happy_var_3)
        _
        (HappyAbsSyn16  happy_var_1)
         =  HappyAbsSyn16
                 (Op Mul happy_var_1 happy_var_3
        )
happyReduction_49 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_50 = happySpecReduce_3  12# happyReduction_50
happyReduction_50 (HappyAbsSyn16  happy_var_3)
        _
        (HappyAbsSyn16  happy_var_1)
         =  HappyAbsSyn16
                 (Op Div happy_var_1 happy_var_3
        )
happyReduction_50 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_51 = happySpecReduce_3  12# happyReduction_51
happyReduction_51 (HappyAbsSyn16  happy_var_3)
        _
        (HappyAbsSyn16  happy_var_1)
         =  HappyAbsSyn16
                 (Op Mod happy_var_1 happy_var_3
        )
happyReduction_51 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_52 = happySpecReduce_1  12# happyReduction_52
happyReduction_52 (HappyTerminal (TokenId happy_var_1))
         =  HappyAbsSyn16
                 (Var happy_var_1
        )
happyReduction_52 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_53 = happySpecReduce_3  12# happyReduction_53
happyReduction_53 _
        (HappyAbsSyn16  happy_var_2)
        _
         =  HappyAbsSyn16
                 (happy_var_2
        )
happyReduction_53 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_54 = happySpecReduce_1  13# happyReduction_54
happyReduction_54 (HappyAbsSyn16  happy_var_1)
         =  HappyAbsSyn17
                 ([happy_var_1]
        )
happyReduction_54 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_55 = happySpecReduce_3  13# happyReduction_55
happyReduction_55 (HappyAbsSyn16  happy_var_3)
        _
        (HappyAbsSyn17  happy_var_1)
         =  HappyAbsSyn17
                 (happy_var_1 ++ [happy_var_3]
        )
happyReduction_55 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
        happyDoAction 53# notHappyAtAll action sts stk []

happyNewToken action sts stk (tk:tks) =
        let cont i = happyDoAction i tk action sts stk tks in
        case tk of {
        TokenVal -> cont 1#;
        TokenVar -> cont 2#;
        TokenIf -> cont 3#;
        TokenElse -> cont 4#;
        TokenWhile -> cont 5#;
        TokenBreak -> cont 6#;
        TokenReturn -> cont 7#;
        TokenFun -> cont 8#;
        TokenTrue -> cont 9#;
        TokenFalse -> cont 10#;
        TokenThen -> cont 11#;
        TokenWhen -> cont 12#;
        TokenDo -> cont 13#;
        TokenPrint -> cont 14#;
        TokenPrintLn -> cont 15#;
        TokenReadLn -> cont 16#;
        TokenEq -> cont 17#;
        TokenNeq -> cont 18#;
        TokenLt -> cont 19#;
        TokenLeq -> cont 20#;
        TokenGt -> cont 21#;
        TokenGeq -> cont 22#;
        TokenAnd -> cont 23#;
        TokenOr -> cont 24#;
        TokenNot -> cont 25#;
        TokenAssign -> cont 26#;
        TokenPlus -> cont 27#;
        TokenMinus -> cont 28#;
        TokenMult -> cont 29#;
        TokenDiv -> cont 30#;
        TokenMod -> cont 31#;
        TokenInc -> cont 32#;
        TokenDec -> cont 33#;
        TokenPlusAssign -> cont 34#;
        TokenMinusAssign -> cont 35#;
        TokenMultAssign -> cont 36#;
        TokenDivAssign -> cont 37#;
        TokenModAssign -> cont 38#;
        TokenLParen -> cont 39#;
        TokenRParen -> cont 40#;
        TokenLBrace -> cont 41#;
        TokenRBrace -> cont 42#;
        TokenLBracket -> cont 43#;
        TokenRBracket -> cont 44#;
        TokenSemi -> cont 45#;
        TokenComma -> cont 46#;
        TokenDot -> cont 47#;
        TokenColon -> cont 48#;
        TokenInt happy_dollar_dollar -> cont 49#;
        TokenDouble happy_dollar_dollar -> cont 50#;
        TokenId happy_dollar_dollar -> cont 51#;
        Token_String happy_dollar_dollar -> cont 52#;
        _ -> happyError' ((tk:tks), [])
        }

happyError_ explist 53# tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse 0# tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


data Program = Begin [TopLevelExpr]
            deriving (Show, Eq, Read)


data TopLevelExpr = TopLevelFunDecl FunDecl
                  | TopLevelVarDecl VarDecl
                  | TopLevelValDecl ValDecl
                  | Expression Expr
                deriving (Show, Eq, Read)


data VarDecl = VarDeclaration String (Maybe Type) Expr
             deriving (Show, Eq, Read)


data ValDecl = ValDeclaration String (Maybe Type) Expr
             deriving (Show, Eq, Read)


data FunDecl = FunDeclaration String [String] Expr
          deriving (Show, Eq, Read)


data Type = TypeIdentifier String
          deriving (Show, Eq, Read)


data Expr
      = Op Op Expr Expr
      | Not Expr
      | Negative Expr
      | FuncCall String [Expr]
      | Var String
      | Assign String Expr
      | IntLit Int
      | DoubleLit Double
      | StringLit String
      | BoolLit Bool
      | IfThen Expr Expr
      | IfThenElse Expr Expr Expr
      | While Expr Expr
      | Return Expr
      | Break
    deriving (Show, Eq, Read)

data Op
        = Or
        | And
        | Eq
        | Neq
        | Lt
        | Leq
        | Gt
        | Geq
        | Add
        | Sub
        | Mul
        | Div
        | Mod
      deriving (Show, Eq, Read)


parseError :: [Token] -> a
parseError toks = error ("parse error at " ++ show toks)
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $

#if !defined(__GLASGOW_HASKELL__)
#  error This code isn't being built with GHC.
#endif

-- Get WORDS_BIGENDIAN (if defined)
#include "MachDeps.h"

-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#  define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Prelude.Bool)
#  define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Prelude.Bool)
#  define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Prelude.Bool)
#else
#  define LT(n,m) (n Happy_GHC_Exts.<# m)
#  define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#  define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif
#define PLUS(n,m) (n Happy_GHC_Exts.+# m)
#define MINUS(n,m) (n Happy_GHC_Exts.-# m)
#define TIMES(n,m) (n Happy_GHC_Exts.*# m)
#define NEGATE(n) (Happy_GHC_Exts.negateInt# (n))

type Happy_Int = Happy_GHC_Exts.Int#
data Happy_IntList = HappyCons Happy_Int Happy_IntList

#define ERROR_TOK 0#

#if defined(HAPPY_COERCE)
#  define GET_ERROR_TOKEN(x)  (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# i) -> i })
#  define MK_ERROR_TOKEN(i)   (Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# i))
#  define MK_TOKEN(x)         (happyInTok (x))
#else
#  define GET_ERROR_TOKEN(x)  (case x of { HappyErrorToken (Happy_GHC_Exts.I# i) -> i })
#  define MK_ERROR_TOKEN(i)   (HappyErrorToken (Happy_GHC_Exts.I# i))
#  define MK_TOKEN(x)         (HappyTerminal (x))
#endif

#if defined(HAPPY_DEBUG)
#  define DEBUG_TRACE(s)    (happyTrace (s)) $
happyTrace string expr = Happy_System_IO_Unsafe.unsafePerformIO $ do
    Happy_System_IO.hPutStr Happy_System_IO.stderr string
    return expr
#else
#  define DEBUG_TRACE(s)    {- nothing -}
#endif

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept ERROR_TOK tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) =
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

happyDoAction i tk st =
  DEBUG_TRACE("state: " ++ show (Happy_GHC_Exts.I# st) ++
              ",\ttoken: " ++ show (Happy_GHC_Exts.I# i) ++
              ",\taction: ")
  case happyDecodeAction (happyNextAction i st) of
    HappyFail             -> DEBUG_TRACE("failing.\n")
                             happyFail (happyExpListPerState (Happy_GHC_Exts.I# st)) i tk st
    HappyAccept           -> DEBUG_TRACE("accept.\n")
                             happyAccept i tk st
    HappyReduce rule      -> DEBUG_TRACE("reduce (rule " ++ show (Happy_GHC_Exts.I# rule) ++ ")")
                             (happyReduceArr Happy_Data_Array.! (Happy_GHC_Exts.I# rule)) i tk st
    HappyShift  new_state -> DEBUG_TRACE("shift, enter state " ++ show (Happy_GHC_Exts.I# new_state) ++ "\n")
                             happyShift new_state i tk st

{-# INLINE happyNextAction #-}
happyNextAction i st = case happyIndexActionTable i st of
  Just (Happy_GHC_Exts.I# act) -> act
  Nothing                      -> happyIndexOffAddr happyDefActions st

{-# INLINE happyIndexActionTable #-}
happyIndexActionTable i st
  | GTE(off, 0#), EQ(happyIndexOffAddr happyCheck off, i)
  = Prelude.Just (Happy_GHC_Exts.I# (happyIndexOffAddr happyTable off))
  | otherwise
  = Prelude.Nothing
  where
    off = PLUS(happyIndexOffAddr happyActOffsets st, i)

data HappyAction
  = HappyFail
  | HappyAccept
  | HappyReduce Happy_Int -- rule number
  | HappyShift Happy_Int  -- new state

{-# INLINE happyDecodeAction #-}
happyDecodeAction :: Happy_Int -> HappyAction
happyDecodeAction  0#                        = HappyFail
happyDecodeAction -1#                        = HappyAccept
happyDecodeAction action | LT(action, 0#)    = HappyReduce NEGATE(PLUS(action, 1#))
                         | otherwise         = HappyShift MINUS(action, 1#)

{-# INLINE happyIndexGotoTable #-}
happyIndexGotoTable nt st = happyIndexOffAddr happyTable off
  where
    off = PLUS(happyIndexOffAddr happyGotoOffsets st, nt)

{-# INLINE happyIndexOffAddr #-}
happyIndexOffAddr :: HappyAddr -> Happy_Int -> Happy_Int
happyIndexOffAddr (HappyA# arr) off =
#if __GLASGOW_HASKELL__ >= 901
  Happy_GHC_Exts.int32ToInt# -- qualified import because it doesn't exist on older GHC's
#endif
#ifdef WORDS_BIGENDIAN
  -- The CI of `alex` tests this code path
  (Happy_GHC_Exts.word32ToInt32# (Happy_GHC_Exts.wordToWord32# (Happy_GHC_Exts.byteSwap32# (Happy_GHC_Exts.word32ToWord# (Happy_GHC_Exts.int32ToWord32#
#endif
  (Happy_GHC_Exts.indexInt32OffAddr# arr off)
#ifdef WORDS_BIGENDIAN
  )))))
#endif

{-# INLINE happyLt #-}
happyLt x y = LT(x,y)

readArrayBit arr bit =
    Bits.testBit (Happy_GHC_Exts.I# (happyIndexOffAddr arr ((unbox_int bit) `Happy_GHC_Exts.iShiftRA#` 5#))) (bit `Prelude.mod` 32)
  where unbox_int (Happy_GHC_Exts.I# x) = x

data HappyAddr = HappyA# Happy_GHC_Exts.Addr#

-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state ERROR_TOK tk st sts stk@(x `HappyStk` _) =
     let i = GET_ERROR_TOKEN(x) in
-- trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons st sts) stk

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons st sts) (MK_TOKEN(tk) `HappyStk` stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn ERROR_TOK tk st sts stk
     = happyFail [] ERROR_TOK tk st sts stk
happySpecReduce_0 nt fn j tk st sts stk
     = happyGoto nt j tk st (HappyCons st sts) (fn `HappyStk` stk)

happySpecReduce_1 i fn ERROR_TOK tk st sts stk
     = happyFail [] ERROR_TOK tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(HappyCons st _) (v1 `HappyStk` stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn ERROR_TOK tk st sts stk
     = happyFail [] ERROR_TOK tk st sts stk
happySpecReduce_2 nt fn j tk _
  (HappyCons _ sts@(HappyCons st _))
  (v1 `HappyStk` v2 `HappyStk` stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn ERROR_TOK tk st sts stk
     = happyFail [] ERROR_TOK tk st sts stk
happySpecReduce_3 nt fn j tk _
  (HappyCons _ (HappyCons _ sts@(HappyCons st _)))
  (v1 `HappyStk` v2 `HappyStk` v3 `HappyStk` stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn ERROR_TOK tk st sts stk
     = happyFail [] ERROR_TOK tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop MINUS(k,(1# :: Happy_Int)) sts of
         sts1@(HappyCons st1 _) ->
                let r = fn stk in -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn ERROR_TOK tk st sts stk
     = happyFail [] ERROR_TOK tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons st sts) of
        sts1@(HappyCons st1 _) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk)
                     (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn ERROR_TOK tk st sts stk
     = happyFail [] ERROR_TOK tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons st sts) of
        sts1@(HappyCons st1 _) ->
          let drop_stk = happyDropStk k stk
              off = happyAdjustOffset (happyIndexOffAddr happyGotoOffsets st1)
              off_i = PLUS(off, nt)
              new_state = happyIndexOffAddr happyTable off_i
          in
            happyThen1 (fn stk tk)
                       (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l               = l
happyDrop n  (HappyCons _ t) = happyDrop MINUS(n,(1# :: Happy_Int)) t

happyDropStk 0# l                 = l
happyDropStk n  (x `HappyStk` xs) = happyDropStk MINUS(n,(1#::Happy_Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

happyGoto nt j tk st =
   DEBUG_TRACE(", goto state " ++ show (Happy_GHC_Exts.I# new_state) ++ "\n")
   happyDoAction j tk new_state
  where new_state = happyIndexGotoTable nt st

-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist ERROR_TOK tk old_st _ stk@(x `HappyStk` _) =
     let i = GET_ERROR_TOKEN(x) in
--      trace "failing" $
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st (HappyCons action sts)
                               (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        happyDoAction ERROR_TOK tk action sts (saved_tok`HappyStk`stk)
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk action sts stk =
-- trace "entering error recovery" $
        happyDoAction ERROR_TOK tk action sts (MK_ERROR_TOKEN(i) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions

happyTcHack :: Happy_Int -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}

-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
