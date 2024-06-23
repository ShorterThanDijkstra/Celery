{-# OPTIONS_GHC -w #-}
{-# LANGUAGE DeriveFoldable #-}
module Parser (parseStr) where

import Data.ByteString.Lazy.Char8 (ByteString, pack)
import Data.Maybe (fromJust)
import Data.Monoid (First (..))
import Data.List (find)

import qualified Lexer as L
import Program
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t14 t15 t16 t17 t18 t19 t20 t21 t22
	= HappyTerminal (L.RangedToken)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 (Name L.Range)
	| HappyAbsSyn5 (Type L.Range)
	| HappyAbsSyn7 (Argument L.Range)
	| HappyAbsSyn8 (Dec L.Range)
	| HappyAbsSyn9 (Program L.Range)
	| HappyAbsSyn10 (Exp L.Range)
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,453) ([0,0,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,0,128,0,0,0,0,0,0,0,0,1,4096,0,4,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,4096,0,0,64,22528,56,0,0,0,0,0,0,1,2048,0,1803,0,4,34688,3,512,49152,450,0,0,0,0,0,0,0,0,0,0,0,35808,11264,0,0,0,128,0,0,1024,0,0,0,0,0,64,0,0,0,8190,0,32768,7,176,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,48640,49160,2,0,1119,352,0,12160,45058,0,49152,65431,127,0,35808,11264,0,0,0,288,0,0,32768,0,0,0,0,0,0,8192,0,0,32768,0,0,0,512,0,64,22528,56,0,0,512,0,16,5632,14,0,0,0,0,4,34176,3,0,0,0,0,65024,31,0,0,0,1,0,0,256,0,49152,5119,0,0,0,8,0,8952,3840,0,0,0,2,0,0,256,0,0,32768,0,0,0,64,0,0,8192,0,0,0,16,0,0,2048,0,0,0,4,0,0,512,0,0,0,1,0,0,0,0,0,16384,0,0,1536,0,0,53248,1023,0,0,0,0,0,8952,2816,0,31744,32785,5,0,2238,704,0,24320,24580,1,32768,559,176,0,6080,22529,0,57344,139,44,0,17904,5632,0,63488,34,11,0,4476,1408,0,48640,49160,2,0,1119,352,0,12160,45058,0,0,0,0,0,49152,1023,0,0,65504,0,0,61440,63,0,0,120,0,0,15360,0,0,0,30,0,0,3840,0,0,32768,7,0,0,960,0,0,0,0,0,0,0,0,0,24576,0,0,0,48,0,0,1119,352,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,48640,49160,2,0,0,0,0,0,16384,8,0,0,1024,0,0,0,0,0,65504,1,0,63488,255,0,31744,32785,5,0,64512,63,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCelery","name","type","typeAnnotation","argument","dec","prog","exp","expapp","expif","atom","many__argument__","many__dec__","optional__typeAnnotation__","sepBy__exp__','__","sepBy__type__','__","manyRev__argument__","manyRev__dec__","sepByRev__exp__','__","sepByRev__type__','__","identifier","string","integer","boolean","let","in","if","then","else","'+'","'-'","'*'","'/'","'='","'<>'","'<'","'<='","'>'","'>='","'&'","'|'","'#('","'('","')'","'['","']'","','","':'","'->'","'Int'","'String'","'Bool'","%eof"]
        bit_start = st Prelude.* 55
        bit_end = (st Prelude.+ 1) Prelude.* 55
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..54]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (9) = happyGoto action_3
action_0 (15) = happyGoto action_4
action_0 (20) = happyGoto action_5
action_0 _ = happyReduce_63

action_1 (23) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (55) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_15

action_5 (27) = happyShift action_7
action_5 (8) = happyGoto action_6
action_5 _ = happyReduce_56

action_6 _ = happyReduce_64

action_7 (23) = happyShift action_2
action_7 (4) = happyGoto action_8
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (14) = happyGoto action_9
action_8 (19) = happyGoto action_10
action_8 _ = happyReduce_61

action_9 (50) = happyShift action_16
action_9 (6) = happyGoto action_14
action_9 (16) = happyGoto action_15
action_9 _ = happyReduce_57

action_10 (23) = happyShift action_2
action_10 (45) = happyShift action_13
action_10 (4) = happyGoto action_11
action_10 (7) = happyGoto action_12
action_10 _ = happyReduce_55

action_11 _ = happyReduce_13

action_12 _ = happyReduce_62

action_13 (23) = happyShift action_2
action_13 (4) = happyGoto action_26
action_13 _ = happyFail (happyExpListPerState 13)

action_14 _ = happyReduce_58

action_15 (36) = happyShift action_25
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (23) = happyShift action_2
action_16 (44) = happyShift action_19
action_16 (45) = happyShift action_20
action_16 (47) = happyShift action_21
action_16 (52) = happyShift action_22
action_16 (53) = happyShift action_23
action_16 (54) = happyShift action_24
action_16 (4) = happyGoto action_17
action_16 (5) = happyGoto action_18
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_2

action_18 (51) = happyShift action_48
action_18 _ = happyReduce_11

action_19 (23) = happyShift action_2
action_19 (44) = happyShift action_19
action_19 (45) = happyShift action_20
action_19 (47) = happyShift action_21
action_19 (52) = happyShift action_22
action_19 (53) = happyShift action_23
action_19 (54) = happyShift action_24
action_19 (4) = happyGoto action_17
action_19 (5) = happyGoto action_45
action_19 (18) = happyGoto action_46
action_19 (22) = happyGoto action_47
action_19 _ = happyReduce_72

action_20 (23) = happyShift action_2
action_20 (44) = happyShift action_19
action_20 (45) = happyShift action_20
action_20 (46) = happyShift action_44
action_20 (47) = happyShift action_21
action_20 (52) = happyShift action_22
action_20 (53) = happyShift action_23
action_20 (54) = happyShift action_24
action_20 (4) = happyGoto action_17
action_20 (5) = happyGoto action_43
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (23) = happyShift action_2
action_21 (44) = happyShift action_19
action_21 (45) = happyShift action_20
action_21 (47) = happyShift action_21
action_21 (52) = happyShift action_22
action_21 (53) = happyShift action_23
action_21 (54) = happyShift action_24
action_21 (4) = happyGoto action_17
action_21 (5) = happyGoto action_42
action_21 _ = happyFail (happyExpListPerState 21)

action_22 _ = happyReduce_4

action_23 _ = happyReduce_5

action_24 _ = happyReduce_3

action_25 (23) = happyShift action_2
action_25 (24) = happyShift action_34
action_25 (25) = happyShift action_35
action_25 (26) = happyShift action_36
action_25 (27) = happyShift action_7
action_25 (29) = happyShift action_37
action_25 (33) = happyShift action_38
action_25 (44) = happyShift action_39
action_25 (45) = happyShift action_40
action_25 (47) = happyShift action_41
action_25 (4) = happyGoto action_28
action_25 (8) = happyGoto action_29
action_25 (10) = happyGoto action_30
action_25 (11) = happyGoto action_31
action_25 (12) = happyGoto action_32
action_25 (13) = happyGoto action_33
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (50) = happyShift action_16
action_26 (6) = happyGoto action_14
action_26 (16) = happyGoto action_27
action_26 _ = happyReduce_57

action_27 (46) = happyShift action_88
action_27 _ = happyFail (happyExpListPerState 27)

action_28 _ = happyReduce_36

action_29 (28) = happyShift action_87
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (32) = happyShift action_75
action_30 (33) = happyShift action_76
action_30 (34) = happyShift action_77
action_30 (35) = happyShift action_78
action_30 (36) = happyShift action_79
action_30 (37) = happyShift action_80
action_30 (38) = happyShift action_81
action_30 (39) = happyShift action_82
action_30 (40) = happyShift action_83
action_30 (41) = happyShift action_84
action_30 (42) = happyShift action_85
action_30 (43) = happyShift action_86
action_30 _ = happyReduce_14

action_31 (23) = happyShift action_2
action_31 (24) = happyShift action_34
action_31 (25) = happyShift action_35
action_31 (26) = happyShift action_36
action_31 (44) = happyShift action_39
action_31 (45) = happyShift action_40
action_31 (47) = happyShift action_41
action_31 (4) = happyGoto action_28
action_31 (13) = happyGoto action_74
action_31 _ = happyReduce_16

action_32 _ = happyReduce_17

action_33 _ = happyReduce_33

action_34 _ = happyReduce_37

action_35 _ = happyReduce_35

action_36 _ = happyReduce_38

action_37 (23) = happyShift action_2
action_37 (24) = happyShift action_34
action_37 (25) = happyShift action_35
action_37 (26) = happyShift action_36
action_37 (27) = happyShift action_7
action_37 (29) = happyShift action_37
action_37 (33) = happyShift action_38
action_37 (44) = happyShift action_39
action_37 (45) = happyShift action_40
action_37 (47) = happyShift action_41
action_37 (4) = happyGoto action_28
action_37 (8) = happyGoto action_29
action_37 (10) = happyGoto action_73
action_37 (11) = happyGoto action_31
action_37 (12) = happyGoto action_32
action_37 (13) = happyGoto action_33
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (23) = happyShift action_2
action_38 (24) = happyShift action_34
action_38 (25) = happyShift action_35
action_38 (26) = happyShift action_36
action_38 (27) = happyShift action_7
action_38 (29) = happyShift action_37
action_38 (33) = happyShift action_38
action_38 (44) = happyShift action_39
action_38 (45) = happyShift action_40
action_38 (47) = happyShift action_41
action_38 (4) = happyGoto action_28
action_38 (8) = happyGoto action_29
action_38 (10) = happyGoto action_72
action_38 (11) = happyGoto action_31
action_38 (12) = happyGoto action_32
action_38 (13) = happyGoto action_33
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (23) = happyShift action_2
action_39 (24) = happyShift action_34
action_39 (25) = happyShift action_35
action_39 (26) = happyShift action_36
action_39 (27) = happyShift action_7
action_39 (29) = happyShift action_37
action_39 (33) = happyShift action_38
action_39 (44) = happyShift action_39
action_39 (45) = happyShift action_40
action_39 (47) = happyShift action_41
action_39 (4) = happyGoto action_28
action_39 (8) = happyGoto action_29
action_39 (10) = happyGoto action_54
action_39 (11) = happyGoto action_31
action_39 (12) = happyGoto action_32
action_39 (13) = happyGoto action_33
action_39 (17) = happyGoto action_71
action_39 (21) = happyGoto action_56
action_39 _ = happyReduce_68

action_40 (23) = happyShift action_2
action_40 (24) = happyShift action_34
action_40 (25) = happyShift action_35
action_40 (26) = happyShift action_36
action_40 (27) = happyShift action_7
action_40 (29) = happyShift action_37
action_40 (32) = happyShift action_58
action_40 (33) = happyShift action_59
action_40 (34) = happyShift action_60
action_40 (35) = happyShift action_61
action_40 (36) = happyShift action_62
action_40 (37) = happyShift action_63
action_40 (38) = happyShift action_64
action_40 (39) = happyShift action_65
action_40 (40) = happyShift action_66
action_40 (41) = happyShift action_67
action_40 (42) = happyShift action_68
action_40 (43) = happyShift action_69
action_40 (44) = happyShift action_39
action_40 (45) = happyShift action_40
action_40 (46) = happyShift action_70
action_40 (47) = happyShift action_41
action_40 (4) = happyGoto action_28
action_40 (8) = happyGoto action_29
action_40 (10) = happyGoto action_57
action_40 (11) = happyGoto action_31
action_40 (12) = happyGoto action_32
action_40 (13) = happyGoto action_33
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (23) = happyShift action_2
action_41 (24) = happyShift action_34
action_41 (25) = happyShift action_35
action_41 (26) = happyShift action_36
action_41 (27) = happyShift action_7
action_41 (29) = happyShift action_37
action_41 (33) = happyShift action_38
action_41 (44) = happyShift action_39
action_41 (45) = happyShift action_40
action_41 (47) = happyShift action_41
action_41 (4) = happyGoto action_28
action_41 (8) = happyGoto action_29
action_41 (10) = happyGoto action_54
action_41 (11) = happyGoto action_31
action_41 (12) = happyGoto action_32
action_41 (13) = happyGoto action_33
action_41 (17) = happyGoto action_55
action_41 (21) = happyGoto action_56
action_41 _ = happyReduce_68

action_42 (48) = happyShift action_53
action_42 (51) = happyShift action_48
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (51) = happyShift action_52
action_43 _ = happyFail (happyExpListPerState 43)

action_44 _ = happyReduce_6

action_45 (51) = happyShift action_48
action_45 _ = happyReduce_71

action_46 (46) = happyShift action_51
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (49) = happyShift action_50
action_47 _ = happyReduce_60

action_48 (23) = happyShift action_2
action_48 (44) = happyShift action_19
action_48 (45) = happyShift action_20
action_48 (47) = happyShift action_21
action_48 (52) = happyShift action_22
action_48 (53) = happyShift action_23
action_48 (54) = happyShift action_24
action_48 (4) = happyGoto action_17
action_48 (5) = happyGoto action_49
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (51) = happyShift action_48
action_49 _ = happyReduce_9

action_50 (23) = happyShift action_2
action_50 (44) = happyShift action_19
action_50 (45) = happyShift action_20
action_50 (47) = happyShift action_21
action_50 (52) = happyShift action_22
action_50 (53) = happyShift action_23
action_50 (54) = happyShift action_24
action_50 (4) = happyGoto action_17
action_50 (5) = happyGoto action_120
action_50 _ = happyReduce_70

action_51 _ = happyReduce_7

action_52 (23) = happyShift action_2
action_52 (44) = happyShift action_19
action_52 (45) = happyShift action_20
action_52 (47) = happyShift action_21
action_52 (52) = happyShift action_22
action_52 (53) = happyShift action_23
action_52 (54) = happyShift action_24
action_52 (4) = happyGoto action_17
action_52 (5) = happyGoto action_119
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_8

action_54 (32) = happyShift action_75
action_54 (33) = happyShift action_76
action_54 (34) = happyShift action_77
action_54 (35) = happyShift action_78
action_54 (36) = happyShift action_79
action_54 (37) = happyShift action_80
action_54 (38) = happyShift action_81
action_54 (39) = happyShift action_82
action_54 (40) = happyShift action_83
action_54 (41) = happyShift action_84
action_54 (42) = happyShift action_85
action_54 (43) = happyShift action_86
action_54 _ = happyReduce_67

action_55 (48) = happyShift action_118
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (49) = happyShift action_117
action_56 _ = happyReduce_59

action_57 (32) = happyShift action_75
action_57 (33) = happyShift action_76
action_57 (34) = happyShift action_77
action_57 (35) = happyShift action_78
action_57 (36) = happyShift action_79
action_57 (37) = happyShift action_80
action_57 (38) = happyShift action_81
action_57 (39) = happyShift action_82
action_57 (40) = happyShift action_83
action_57 (41) = happyShift action_84
action_57 (42) = happyShift action_85
action_57 (43) = happyShift action_86
action_57 (46) = happyShift action_116
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (46) = happyShift action_115
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (23) = happyShift action_2
action_59 (24) = happyShift action_34
action_59 (25) = happyShift action_35
action_59 (26) = happyShift action_36
action_59 (27) = happyShift action_7
action_59 (29) = happyShift action_37
action_59 (33) = happyShift action_38
action_59 (44) = happyShift action_39
action_59 (45) = happyShift action_40
action_59 (46) = happyShift action_114
action_59 (47) = happyShift action_41
action_59 (4) = happyGoto action_28
action_59 (8) = happyGoto action_29
action_59 (10) = happyGoto action_72
action_59 (11) = happyGoto action_31
action_59 (12) = happyGoto action_32
action_59 (13) = happyGoto action_33
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (46) = happyShift action_113
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (46) = happyShift action_112
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (46) = happyShift action_111
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (46) = happyShift action_110
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (46) = happyShift action_109
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (46) = happyShift action_108
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (46) = happyShift action_107
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (46) = happyShift action_106
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (46) = happyShift action_105
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (46) = happyShift action_104
action_69 _ = happyFail (happyExpListPerState 69)

action_70 _ = happyReduce_42

action_71 (46) = happyShift action_103
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (34) = happyShift action_77
action_72 (35) = happyShift action_78
action_72 _ = happyReduce_18

action_73 (30) = happyShift action_102
action_73 (32) = happyShift action_75
action_73 (33) = happyShift action_76
action_73 (34) = happyShift action_77
action_73 (35) = happyShift action_78
action_73 (36) = happyShift action_79
action_73 (37) = happyShift action_80
action_73 (38) = happyShift action_81
action_73 (39) = happyShift action_82
action_73 (40) = happyShift action_83
action_73 (41) = happyShift action_84
action_73 (42) = happyShift action_85
action_73 (43) = happyShift action_86
action_73 _ = happyFail (happyExpListPerState 73)

action_74 _ = happyReduce_32

action_75 (23) = happyShift action_2
action_75 (24) = happyShift action_34
action_75 (25) = happyShift action_35
action_75 (26) = happyShift action_36
action_75 (27) = happyShift action_7
action_75 (29) = happyShift action_37
action_75 (33) = happyShift action_38
action_75 (44) = happyShift action_39
action_75 (45) = happyShift action_40
action_75 (47) = happyShift action_41
action_75 (4) = happyGoto action_28
action_75 (8) = happyGoto action_29
action_75 (10) = happyGoto action_101
action_75 (11) = happyGoto action_31
action_75 (12) = happyGoto action_32
action_75 (13) = happyGoto action_33
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (23) = happyShift action_2
action_76 (24) = happyShift action_34
action_76 (25) = happyShift action_35
action_76 (26) = happyShift action_36
action_76 (27) = happyShift action_7
action_76 (29) = happyShift action_37
action_76 (33) = happyShift action_38
action_76 (44) = happyShift action_39
action_76 (45) = happyShift action_40
action_76 (47) = happyShift action_41
action_76 (4) = happyGoto action_28
action_76 (8) = happyGoto action_29
action_76 (10) = happyGoto action_100
action_76 (11) = happyGoto action_31
action_76 (12) = happyGoto action_32
action_76 (13) = happyGoto action_33
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (23) = happyShift action_2
action_77 (24) = happyShift action_34
action_77 (25) = happyShift action_35
action_77 (26) = happyShift action_36
action_77 (27) = happyShift action_7
action_77 (29) = happyShift action_37
action_77 (33) = happyShift action_38
action_77 (44) = happyShift action_39
action_77 (45) = happyShift action_40
action_77 (47) = happyShift action_41
action_77 (4) = happyGoto action_28
action_77 (8) = happyGoto action_29
action_77 (10) = happyGoto action_99
action_77 (11) = happyGoto action_31
action_77 (12) = happyGoto action_32
action_77 (13) = happyGoto action_33
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (23) = happyShift action_2
action_78 (24) = happyShift action_34
action_78 (25) = happyShift action_35
action_78 (26) = happyShift action_36
action_78 (27) = happyShift action_7
action_78 (29) = happyShift action_37
action_78 (33) = happyShift action_38
action_78 (44) = happyShift action_39
action_78 (45) = happyShift action_40
action_78 (47) = happyShift action_41
action_78 (4) = happyGoto action_28
action_78 (8) = happyGoto action_29
action_78 (10) = happyGoto action_98
action_78 (11) = happyGoto action_31
action_78 (12) = happyGoto action_32
action_78 (13) = happyGoto action_33
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (23) = happyShift action_2
action_79 (24) = happyShift action_34
action_79 (25) = happyShift action_35
action_79 (26) = happyShift action_36
action_79 (27) = happyShift action_7
action_79 (29) = happyShift action_37
action_79 (33) = happyShift action_38
action_79 (44) = happyShift action_39
action_79 (45) = happyShift action_40
action_79 (47) = happyShift action_41
action_79 (4) = happyGoto action_28
action_79 (8) = happyGoto action_29
action_79 (10) = happyGoto action_97
action_79 (11) = happyGoto action_31
action_79 (12) = happyGoto action_32
action_79 (13) = happyGoto action_33
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (23) = happyShift action_2
action_80 (24) = happyShift action_34
action_80 (25) = happyShift action_35
action_80 (26) = happyShift action_36
action_80 (27) = happyShift action_7
action_80 (29) = happyShift action_37
action_80 (33) = happyShift action_38
action_80 (44) = happyShift action_39
action_80 (45) = happyShift action_40
action_80 (47) = happyShift action_41
action_80 (4) = happyGoto action_28
action_80 (8) = happyGoto action_29
action_80 (10) = happyGoto action_96
action_80 (11) = happyGoto action_31
action_80 (12) = happyGoto action_32
action_80 (13) = happyGoto action_33
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (23) = happyShift action_2
action_81 (24) = happyShift action_34
action_81 (25) = happyShift action_35
action_81 (26) = happyShift action_36
action_81 (27) = happyShift action_7
action_81 (29) = happyShift action_37
action_81 (33) = happyShift action_38
action_81 (44) = happyShift action_39
action_81 (45) = happyShift action_40
action_81 (47) = happyShift action_41
action_81 (4) = happyGoto action_28
action_81 (8) = happyGoto action_29
action_81 (10) = happyGoto action_95
action_81 (11) = happyGoto action_31
action_81 (12) = happyGoto action_32
action_81 (13) = happyGoto action_33
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (23) = happyShift action_2
action_82 (24) = happyShift action_34
action_82 (25) = happyShift action_35
action_82 (26) = happyShift action_36
action_82 (27) = happyShift action_7
action_82 (29) = happyShift action_37
action_82 (33) = happyShift action_38
action_82 (44) = happyShift action_39
action_82 (45) = happyShift action_40
action_82 (47) = happyShift action_41
action_82 (4) = happyGoto action_28
action_82 (8) = happyGoto action_29
action_82 (10) = happyGoto action_94
action_82 (11) = happyGoto action_31
action_82 (12) = happyGoto action_32
action_82 (13) = happyGoto action_33
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (23) = happyShift action_2
action_83 (24) = happyShift action_34
action_83 (25) = happyShift action_35
action_83 (26) = happyShift action_36
action_83 (27) = happyShift action_7
action_83 (29) = happyShift action_37
action_83 (33) = happyShift action_38
action_83 (44) = happyShift action_39
action_83 (45) = happyShift action_40
action_83 (47) = happyShift action_41
action_83 (4) = happyGoto action_28
action_83 (8) = happyGoto action_29
action_83 (10) = happyGoto action_93
action_83 (11) = happyGoto action_31
action_83 (12) = happyGoto action_32
action_83 (13) = happyGoto action_33
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (23) = happyShift action_2
action_84 (24) = happyShift action_34
action_84 (25) = happyShift action_35
action_84 (26) = happyShift action_36
action_84 (27) = happyShift action_7
action_84 (29) = happyShift action_37
action_84 (33) = happyShift action_38
action_84 (44) = happyShift action_39
action_84 (45) = happyShift action_40
action_84 (47) = happyShift action_41
action_84 (4) = happyGoto action_28
action_84 (8) = happyGoto action_29
action_84 (10) = happyGoto action_92
action_84 (11) = happyGoto action_31
action_84 (12) = happyGoto action_32
action_84 (13) = happyGoto action_33
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (23) = happyShift action_2
action_85 (24) = happyShift action_34
action_85 (25) = happyShift action_35
action_85 (26) = happyShift action_36
action_85 (27) = happyShift action_7
action_85 (29) = happyShift action_37
action_85 (33) = happyShift action_38
action_85 (44) = happyShift action_39
action_85 (45) = happyShift action_40
action_85 (47) = happyShift action_41
action_85 (4) = happyGoto action_28
action_85 (8) = happyGoto action_29
action_85 (10) = happyGoto action_91
action_85 (11) = happyGoto action_31
action_85 (12) = happyGoto action_32
action_85 (13) = happyGoto action_33
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (23) = happyShift action_2
action_86 (24) = happyShift action_34
action_86 (25) = happyShift action_35
action_86 (26) = happyShift action_36
action_86 (27) = happyShift action_7
action_86 (29) = happyShift action_37
action_86 (33) = happyShift action_38
action_86 (44) = happyShift action_39
action_86 (45) = happyShift action_40
action_86 (47) = happyShift action_41
action_86 (4) = happyGoto action_28
action_86 (8) = happyGoto action_29
action_86 (10) = happyGoto action_90
action_86 (11) = happyGoto action_31
action_86 (12) = happyGoto action_32
action_86 (13) = happyGoto action_33
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (23) = happyShift action_2
action_87 (24) = happyShift action_34
action_87 (25) = happyShift action_35
action_87 (26) = happyShift action_36
action_87 (27) = happyShift action_7
action_87 (29) = happyShift action_37
action_87 (33) = happyShift action_38
action_87 (44) = happyShift action_39
action_87 (45) = happyShift action_40
action_87 (47) = happyShift action_41
action_87 (4) = happyGoto action_28
action_87 (8) = happyGoto action_29
action_87 (10) = happyGoto action_89
action_87 (11) = happyGoto action_31
action_87 (12) = happyGoto action_32
action_87 (13) = happyGoto action_33
action_87 _ = happyFail (happyExpListPerState 87)

action_88 _ = happyReduce_12

action_89 (32) = happyShift action_75
action_89 (33) = happyShift action_76
action_89 (34) = happyShift action_77
action_89 (35) = happyShift action_78
action_89 (36) = happyShift action_79
action_89 (37) = happyShift action_80
action_89 (38) = happyShift action_81
action_89 (39) = happyShift action_82
action_89 (40) = happyShift action_83
action_89 (41) = happyShift action_84
action_89 (42) = happyShift action_85
action_89 (43) = happyShift action_86
action_89 _ = happyReduce_31

action_90 (32) = happyShift action_75
action_90 (33) = happyShift action_76
action_90 (34) = happyShift action_77
action_90 (35) = happyShift action_78
action_90 (36) = happyShift action_79
action_90 (37) = happyShift action_80
action_90 (38) = happyShift action_81
action_90 (39) = happyShift action_82
action_90 (40) = happyShift action_83
action_90 (41) = happyShift action_84
action_90 (42) = happyShift action_85
action_90 _ = happyReduce_30

action_91 (32) = happyShift action_75
action_91 (33) = happyShift action_76
action_91 (34) = happyShift action_77
action_91 (35) = happyShift action_78
action_91 (36) = happyShift action_79
action_91 (37) = happyShift action_80
action_91 (38) = happyShift action_81
action_91 (39) = happyShift action_82
action_91 (40) = happyShift action_83
action_91 (41) = happyShift action_84
action_91 _ = happyReduce_29

action_92 (32) = happyShift action_75
action_92 (33) = happyShift action_76
action_92 (34) = happyShift action_77
action_92 (35) = happyShift action_78
action_92 (36) = happyFail []
action_92 (37) = happyFail []
action_92 (38) = happyFail []
action_92 (39) = happyFail []
action_92 (40) = happyFail []
action_92 (41) = happyFail []
action_92 _ = happyReduce_28

action_93 (32) = happyShift action_75
action_93 (33) = happyShift action_76
action_93 (34) = happyShift action_77
action_93 (35) = happyShift action_78
action_93 (36) = happyFail []
action_93 (37) = happyFail []
action_93 (38) = happyFail []
action_93 (39) = happyFail []
action_93 (40) = happyFail []
action_93 (41) = happyFail []
action_93 _ = happyReduce_27

action_94 (32) = happyShift action_75
action_94 (33) = happyShift action_76
action_94 (34) = happyShift action_77
action_94 (35) = happyShift action_78
action_94 (36) = happyFail []
action_94 (37) = happyFail []
action_94 (38) = happyFail []
action_94 (39) = happyFail []
action_94 (40) = happyFail []
action_94 (41) = happyFail []
action_94 _ = happyReduce_26

action_95 (32) = happyShift action_75
action_95 (33) = happyShift action_76
action_95 (34) = happyShift action_77
action_95 (35) = happyShift action_78
action_95 (36) = happyFail []
action_95 (37) = happyFail []
action_95 (38) = happyFail []
action_95 (39) = happyFail []
action_95 (40) = happyFail []
action_95 (41) = happyFail []
action_95 _ = happyReduce_25

action_96 (32) = happyShift action_75
action_96 (33) = happyShift action_76
action_96 (34) = happyShift action_77
action_96 (35) = happyShift action_78
action_96 (36) = happyFail []
action_96 (37) = happyFail []
action_96 (38) = happyFail []
action_96 (39) = happyFail []
action_96 (40) = happyFail []
action_96 (41) = happyFail []
action_96 _ = happyReduce_24

action_97 (32) = happyShift action_75
action_97 (33) = happyShift action_76
action_97 (34) = happyShift action_77
action_97 (35) = happyShift action_78
action_97 (36) = happyFail []
action_97 (37) = happyFail []
action_97 (38) = happyFail []
action_97 (39) = happyFail []
action_97 (40) = happyFail []
action_97 (41) = happyFail []
action_97 _ = happyReduce_23

action_98 _ = happyReduce_22

action_99 _ = happyReduce_21

action_100 (34) = happyShift action_77
action_100 (35) = happyShift action_78
action_100 _ = happyReduce_20

action_101 (34) = happyShift action_77
action_101 (35) = happyShift action_78
action_101 _ = happyReduce_19

action_102 (23) = happyShift action_2
action_102 (24) = happyShift action_34
action_102 (25) = happyShift action_35
action_102 (26) = happyShift action_36
action_102 (27) = happyShift action_7
action_102 (29) = happyShift action_37
action_102 (33) = happyShift action_38
action_102 (44) = happyShift action_39
action_102 (45) = happyShift action_40
action_102 (47) = happyShift action_41
action_102 (4) = happyGoto action_28
action_102 (8) = happyGoto action_29
action_102 (10) = happyGoto action_123
action_102 (11) = happyGoto action_31
action_102 (12) = happyGoto action_32
action_102 (13) = happyGoto action_33
action_102 _ = happyFail (happyExpListPerState 102)

action_103 _ = happyReduce_39

action_104 _ = happyReduce_54

action_105 _ = happyReduce_53

action_106 _ = happyReduce_52

action_107 _ = happyReduce_51

action_108 _ = happyReduce_50

action_109 _ = happyReduce_49

action_110 _ = happyReduce_48

action_111 _ = happyReduce_47

action_112 _ = happyReduce_46

action_113 _ = happyReduce_45

action_114 _ = happyReduce_44

action_115 _ = happyReduce_43

action_116 _ = happyReduce_41

action_117 (23) = happyShift action_2
action_117 (24) = happyShift action_34
action_117 (25) = happyShift action_35
action_117 (26) = happyShift action_36
action_117 (27) = happyShift action_7
action_117 (29) = happyShift action_37
action_117 (33) = happyShift action_38
action_117 (44) = happyShift action_39
action_117 (45) = happyShift action_40
action_117 (47) = happyShift action_41
action_117 (4) = happyGoto action_28
action_117 (8) = happyGoto action_29
action_117 (10) = happyGoto action_122
action_117 (11) = happyGoto action_31
action_117 (12) = happyGoto action_32
action_117 (13) = happyGoto action_33
action_117 _ = happyReduce_66

action_118 _ = happyReduce_40

action_119 (46) = happyShift action_121
action_119 (51) = happyShift action_48
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (51) = happyShift action_48
action_120 _ = happyReduce_69

action_121 _ = happyReduce_10

action_122 (32) = happyShift action_75
action_122 (33) = happyShift action_76
action_122 (34) = happyShift action_77
action_122 (35) = happyShift action_78
action_122 (36) = happyShift action_79
action_122 (37) = happyShift action_80
action_122 (38) = happyShift action_81
action_122 (39) = happyShift action_82
action_122 (40) = happyShift action_83
action_122 (41) = happyShift action_84
action_122 (42) = happyShift action_85
action_122 (43) = happyShift action_86
action_122 _ = happyReduce_65

action_123 (31) = happyShift action_124
action_123 (32) = happyShift action_75
action_123 (33) = happyShift action_76
action_123 (34) = happyShift action_77
action_123 (35) = happyShift action_78
action_123 (36) = happyShift action_79
action_123 (37) = happyShift action_80
action_123 (38) = happyShift action_81
action_123 (39) = happyShift action_82
action_123 (40) = happyShift action_83
action_123 (41) = happyShift action_84
action_123 (42) = happyShift action_85
action_123 (43) = happyShift action_86
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (23) = happyShift action_2
action_124 (24) = happyShift action_34
action_124 (25) = happyShift action_35
action_124 (26) = happyShift action_36
action_124 (27) = happyShift action_7
action_124 (29) = happyShift action_37
action_124 (33) = happyShift action_38
action_124 (44) = happyShift action_39
action_124 (45) = happyShift action_40
action_124 (47) = happyShift action_41
action_124 (4) = happyGoto action_28
action_124 (8) = happyGoto action_29
action_124 (10) = happyGoto action_125
action_124 (11) = happyGoto action_31
action_124 (12) = happyGoto action_32
action_124 (13) = happyGoto action_33
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (32) = happyShift action_75
action_125 (33) = happyShift action_76
action_125 (34) = happyShift action_77
action_125 (35) = happyShift action_78
action_125 (36) = happyShift action_79
action_125 (37) = happyShift action_80
action_125 (38) = happyShift action_81
action_125 (39) = happyShift action_82
action_125 (40) = happyShift action_83
action_125 (41) = happyShift action_84
action_125 (42) = happyShift action_85
action_125 (43) = happyShift action_86
action_125 _ = happyReduce_34

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn4
		 (unTok happy_var_1 (\range (L.Identifier name) -> Name range name)
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn5
		 (TVar (info happy_var_1) happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  5 happyReduction_3
happyReduction_3 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn5
		 (TBool (L.rtRange happy_var_1)
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  5 happyReduction_4
happyReduction_4 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn5
		 (TInt (L.rtRange happy_var_1)
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  5 happyReduction_5
happyReduction_5 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn5
		 (TString (L.rtRange happy_var_1)
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_2  5 happyReduction_6
happyReduction_6 (HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn5
		 (TUnit (L.rtRange happy_var_1 <-> L.rtRange happy_var_2)
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  5 happyReduction_7
happyReduction_7 (HappyTerminal happy_var_3)
	(HappyAbsSyn18  happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn5
		 (TTuple (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) happy_var_2
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  5 happyReduction_8
happyReduction_8 (HappyTerminal happy_var_3)
	(HappyAbsSyn5  happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn5
		 (TList (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) happy_var_2
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  5 happyReduction_9
happyReduction_9 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (TArrow (info happy_var_1 <-> info happy_var_3) happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happyReduce 5 5 happyReduction_10
happyReduction_10 ((HappyTerminal happy_var_5) `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (TArrow (L.rtRange happy_var_1 <-> L.rtRange happy_var_5) happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_11 = happySpecReduce_2  6 happyReduction_11
happyReduction_11 (HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happyReduce 4 7 happyReduction_12
happyReduction_12 ((HappyTerminal happy_var_4) `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Argument (L.rtRange happy_var_1 <-> L.rtRange happy_var_4) happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_13 = happySpecReduce_1  7 happyReduction_13
happyReduction_13 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn7
		 (Argument (info happy_var_1) happy_var_1 Nothing
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happyReduce 6 8 happyReduction_14
happyReduction_14 ((HappyAbsSyn10  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_4) `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Dec (L.rtRange happy_var_1 <-> info happy_var_6) happy_var_2 happy_var_3 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_1  9 happyReduction_15
happyReduction_15 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn9
		 (mkProgram happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  10 happyReduction_16
happyReduction_16 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  10 happyReduction_17
happyReduction_17 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_2  10 happyReduction_18
happyReduction_18 (HappyAbsSyn10  happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (ENeg (L.rtRange happy_var_1 <-> info happy_var_2) happy_var_2
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  10 happyReduction_19
happyReduction_19 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EBinOp (info happy_var_1 <-> info happy_var_3) happy_var_1 (Plus (L.rtRange happy_var_2)) happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  10 happyReduction_20
happyReduction_20 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EBinOp (info happy_var_1 <-> info happy_var_3) happy_var_1 (Minus (L.rtRange happy_var_2)) happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  10 happyReduction_21
happyReduction_21 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EBinOp (info happy_var_1 <-> info happy_var_3) happy_var_1 (Times (L.rtRange happy_var_2)) happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  10 happyReduction_22
happyReduction_22 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EBinOp (info happy_var_1 <-> info happy_var_3) happy_var_1 (Divide (L.rtRange happy_var_2)) happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  10 happyReduction_23
happyReduction_23 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EBinOp (info happy_var_1 <-> info happy_var_3) happy_var_1 (Eq (L.rtRange happy_var_2)) happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  10 happyReduction_24
happyReduction_24 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EBinOp (info happy_var_1 <-> info happy_var_3) happy_var_1 (Neq (L.rtRange happy_var_2)) happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  10 happyReduction_25
happyReduction_25 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EBinOp (info happy_var_1 <-> info happy_var_3) happy_var_1 (Lt (L.rtRange happy_var_2)) happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  10 happyReduction_26
happyReduction_26 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EBinOp (info happy_var_1 <-> info happy_var_3) happy_var_1 (Le (L.rtRange happy_var_2)) happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  10 happyReduction_27
happyReduction_27 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EBinOp (info happy_var_1 <-> info happy_var_3) happy_var_1 (Gt (L.rtRange happy_var_2)) happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  10 happyReduction_28
happyReduction_28 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EBinOp (info happy_var_1 <-> info happy_var_3) happy_var_1 (Ge (L.rtRange happy_var_2)) happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  10 happyReduction_29
happyReduction_29 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EBinOp (info happy_var_1 <-> info happy_var_3) happy_var_1 (And (L.rtRange happy_var_2)) happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  10 happyReduction_30
happyReduction_30 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EBinOp (info happy_var_1 <-> info happy_var_3) happy_var_1 (Or (L.rtRange happy_var_2)) happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  10 happyReduction_31
happyReduction_31 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn10
		 (ELetIn (info happy_var_1 <-> info happy_var_3) happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_2  11 happyReduction_32
happyReduction_32 (HappyAbsSyn10  happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EApp (info happy_var_1 <-> info happy_var_2) happy_var_1 happy_var_2
	)
happyReduction_32 _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  11 happyReduction_33
happyReduction_33 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happyReduce 6 12 happyReduction_34
happyReduction_34 ((HappyAbsSyn10  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (EIfThenElse (L.rtRange happy_var_1 <-> info happy_var_6) happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_35 = happySpecReduce_1  13 happyReduction_35
happyReduction_35 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (unTok happy_var_1 (\range (L.Integer int) -> EInt range int)
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  13 happyReduction_36
happyReduction_36 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn10
		 (EVar (info happy_var_1) happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  13 happyReduction_37
happyReduction_37 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (unTok happy_var_1 (\range (L.String string) -> EString range string)
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  13 happyReduction_38
happyReduction_38 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (unTok happy_var_1 (\range (L.Boolean b) -> EBool range b)
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  13 happyReduction_39
happyReduction_39 (HappyTerminal happy_var_3)
	(HappyAbsSyn17  happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (ETuple (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) happy_var_2
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  13 happyReduction_40
happyReduction_40 (HappyTerminal happy_var_3)
	(HappyAbsSyn17  happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EList (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) happy_var_2
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  13 happyReduction_41
happyReduction_41 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (happy_var_2
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_2  13 happyReduction_42
happyReduction_42 (HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EUnit (L.rtRange happy_var_1 <-> L.rtRange happy_var_2)
	)
happyReduction_42 _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  13 happyReduction_43
happyReduction_43 (HappyTerminal happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EOp (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) (Plus (L.rtRange happy_var_2))
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  13 happyReduction_44
happyReduction_44 (HappyTerminal happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EOp (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) (Minus (L.rtRange happy_var_2))
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  13 happyReduction_45
happyReduction_45 (HappyTerminal happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EOp (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) (Times (L.rtRange happy_var_2))
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  13 happyReduction_46
happyReduction_46 (HappyTerminal happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EOp (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) (Divide (L.rtRange happy_var_2))
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  13 happyReduction_47
happyReduction_47 (HappyTerminal happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EOp (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) (Eq (L.rtRange happy_var_2))
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  13 happyReduction_48
happyReduction_48 (HappyTerminal happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EOp (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) (Neq (L.rtRange happy_var_2))
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  13 happyReduction_49
happyReduction_49 (HappyTerminal happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EOp (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) (Lt (L.rtRange happy_var_2))
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  13 happyReduction_50
happyReduction_50 (HappyTerminal happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EOp (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) (Le (L.rtRange happy_var_2))
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  13 happyReduction_51
happyReduction_51 (HappyTerminal happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EOp (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) (Gt (L.rtRange happy_var_2))
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_3  13 happyReduction_52
happyReduction_52 (HappyTerminal happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EOp (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) (Ge (L.rtRange happy_var_2))
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_3  13 happyReduction_53
happyReduction_53 (HappyTerminal happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EOp (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) (And (L.rtRange happy_var_2))
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_3  13 happyReduction_54
happyReduction_54 (HappyTerminal happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EOp (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) (Or (L.rtRange happy_var_2))
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  14 happyReduction_55
happyReduction_55 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn14
		 (reverse happy_var_1
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_1  15 happyReduction_56
happyReduction_56 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn15
		 (reverse happy_var_1
	)
happyReduction_56 _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_0  16 happyReduction_57
happyReduction_57  =  HappyAbsSyn16
		 (Nothing
	)

happyReduce_58 = happySpecReduce_1  16 happyReduction_58
happyReduction_58 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn16
		 (Just happy_var_1
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  17 happyReduction_59
happyReduction_59 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn17
		 (reverse happy_var_1
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_1  18 happyReduction_60
happyReduction_60 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn18
		 (reverse happy_var_1
	)
happyReduction_60 _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_0  19 happyReduction_61
happyReduction_61  =  HappyAbsSyn19
		 ([]
	)

happyReduce_62 = happySpecReduce_2  19 happyReduction_62
happyReduction_62 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_2 : happy_var_1
	)
happyReduction_62 _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_0  20 happyReduction_63
happyReduction_63  =  HappyAbsSyn20
		 ([]
	)

happyReduce_64 = happySpecReduce_2  20 happyReduction_64
happyReduction_64 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (happy_var_2 : happy_var_1
	)
happyReduction_64 _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_3  21 happyReduction_65
happyReduction_65 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (happy_var_3 : happy_var_1
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_2  21 happyReduction_66
happyReduction_66 _
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (happy_var_1
	)
happyReduction_66 _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_1  21 happyReduction_67
happyReduction_67 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn21
		 ([happy_var_1]
	)
happyReduction_67 _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_0  21 happyReduction_68
happyReduction_68  =  HappyAbsSyn21
		 ([]
	)

happyReduce_69 = happySpecReduce_3  22 happyReduction_69
happyReduction_69 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_3 : happy_var_1
	)
happyReduction_69 _ _ _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_2  22 happyReduction_70
happyReduction_70 _
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1
	)
happyReduction_70 _ _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_1  22 happyReduction_71
happyReduction_71 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn22
		 ([happy_var_1]
	)
happyReduction_71 _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_0  22 happyReduction_72
happyReduction_72  =  HappyAbsSyn22
		 ([]
	)

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	L.RangedToken L.EOF _ -> action 55 55 tk (HappyState action) sts stk;
	L.RangedToken (L.Identifier _) _ -> cont 23;
	L.RangedToken (L.String _) _ -> cont 24;
	L.RangedToken (L.Integer _) _ -> cont 25;
	L.RangedToken (L.Boolean _) _ -> cont 26;
	L.RangedToken L.Let _ -> cont 27;
	L.RangedToken L.In _ -> cont 28;
	L.RangedToken L.If _ -> cont 29;
	L.RangedToken L.Then _ -> cont 30;
	L.RangedToken L.Else _ -> cont 31;
	L.RangedToken L.Plus _ -> cont 32;
	L.RangedToken L.Minus _ -> cont 33;
	L.RangedToken L.Times _ -> cont 34;
	L.RangedToken L.Divide _ -> cont 35;
	L.RangedToken L.Eq _ -> cont 36;
	L.RangedToken L.Neq _ -> cont 37;
	L.RangedToken L.Lt _ -> cont 38;
	L.RangedToken L.Le _ -> cont 39;
	L.RangedToken L.Gt _ -> cont 40;
	L.RangedToken L.Ge _ -> cont 41;
	L.RangedToken L.And _ -> cont 42;
	L.RangedToken L.Or _ -> cont 43;
	L.RangedToken L.LHashPar _ -> cont 44;
	L.RangedToken L.LPar _ -> cont 45;
	L.RangedToken L.RPar _ -> cont 46;
	L.RangedToken L.LBrack _ -> cont 47;
	L.RangedToken L.RBrack _ -> cont 48;
	L.RangedToken L.Comma _ -> cont 49;
	L.RangedToken L.Colon _ -> cont 50;
	L.RangedToken L.Arrow _ -> cont 51;
	L.RangedToken L.IntTypeToken _ -> cont 52;
	L.RangedToken L.StringTypeToken _ -> cont 53;
	L.RangedToken L.BoolTypeToken _ -> cont 54;
	_ -> happyError' (tk, [])
	})

happyError_ explist 55 tk = happyError' (tk, explist)
happyError_ explist _ tk = happyError' (tk, explist)

happyThen :: () => L.Alex a -> (a -> L.Alex b) -> L.Alex b
happyThen = (>>=)
happyReturn :: () => a -> L.Alex a
happyReturn = (pure)
happyThen1 :: () => L.Alex a -> (a -> L.Alex b) -> L.Alex b
happyThen1 = happyThen
happyReturn1 :: () => a -> L.Alex a
happyReturn1 = happyReturn
happyError' :: () => ((L.RangedToken), [Prelude.String]) -> L.Alex a
happyError' tk = (\(tokens, _) -> parseError tokens) tk
parseCelery = happySomeParser where
 happySomeParser = happyThen (happyParse action_0) (\x -> case x of {HappyAbsSyn9 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: L.RangedToken -> L.Alex a
parseError _ = do
  (L.AlexPn _ line column, _, str, _) <- L.alexGetInput
  L.alexError $ "Parse error at line " <> show line <> ", column " <> show column <> " : " <> show str

lexer :: (L.RangedToken -> L.Alex a) -> L.Alex a
lexer = (=<< L.alexMonadScan)

-- | Build a simple node by extracting its token type and range.
unTok :: L.RangedToken -> (L.Range -> L.Token -> a) -> a
unTok (L.RangedToken tok range) ctor = ctor range tok

validMain :: Dec L.Range -> Bool
validMain (Dec _ (Name _ name) args ty _) = name == pack "main" && validMainArgs args && validMainType ty
  where validMainArgs [] = True
        validMainArgs [Argument _ _ (Just (TList _ (TString _)))] = True
        validMainArgs [Argument _ _ Nothing] = True
        validMainArgs _ = False
        
        validMainType Nothing = True
        validMainType (Just (TUnit _)) = True
        validMainType _ = False

mkProgram :: [Dec L.Range] -> Program L.Range
mkProgram decs = let fst = head decs
                     lst = last decs
                     range = info fst <-> info lst
                 in  let main' = find validMain decs
                     in case main' of 
                          Nothing -> error  "parse failed: expect a main function"
                          Just (main'') -> Program range (filter (/=main'') decs) main''
-- | Unsafely extracts the the metainformation field of a node.
info :: Foldable f => f a -> a
info = fromJust . getFirst . foldMap pure

-- | Performs the union of two ranges by creating a new range starting at the
-- start position of the first range, and stopping at the stop position of the
-- second range.
-- Invariant: The LHS range starts before the RHS range.
(<->) :: L.Range -> L.Range -> L.Range
L.Range a1 _ <-> L.Range _ b2 = L.Range a1 b2

parseStr :: String -> Either String (Program L.Range)
parseStr str = L.runAlex (pack str) parseCelery
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































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
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







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
