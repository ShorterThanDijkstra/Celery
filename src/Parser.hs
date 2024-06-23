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
happyExpList = Happy_Data_Array.listArray (0,425) ([0,0,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,0,128,0,0,0,0,0,0,0,0,1,4096,0,4,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,4096,0,0,64,22528,56,0,0,0,0,0,0,1,2048,0,1803,0,0,512,0,512,49152,450,0,0,0,0,0,0,0,0,0,0,0,35808,11264,0,0,0,128,0,0,1024,0,0,0,0,0,64,0,0,0,8190,0,32768,7,176,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,48640,49160,2,0,1119,352,0,12160,45058,0,49152,65431,127,0,35808,11264,0,0,0,288,0,0,0,0,0,0,64,0,0,256,0,0,0,4,32768,0,28848,0,0,0,4,8192,0,7212,0,0,0,0,0,0,0,0,63488,127,0,0,0,4,0,0,1024,0,0,20479,0,0,0,32,0,35808,15360,0,0,0,8,0,0,1024,0,0,0,2,0,0,256,0,0,32768,0,0,0,64,0,0,8192,0,0,0,16,0,0,2048,0,0,0,4,0,0,0,0,0,0,1,0,6144,0,0,16384,4095,0,0,0,0,0,35808,11264,0,61440,69,22,0,8952,2816,0,31744,32785,5,0,2238,704,0,24320,24580,1,32768,559,176,0,6080,22529,0,57344,139,44,0,17904,5632,0,63488,34,11,0,4476,1408,0,48640,49160,2,0,0,0,0,0,4095,0,0,65408,3,0,49152,255,0,0,480,0,0,61440,0,0,0,120,0,0,15360,0,0,0,30,0,0,3840,0,0,0,0,0,0,0,0,0,32768,1,0,0,192,0,0,4476,1408,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63488,34,11,0,0,0,0,0,0,32,0,65024,31,0,32768,4095,0,49152,279,88,0,49152,1023,0,0
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
action_0 _ = happyReduce_62

action_1 (23) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (55) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_14

action_5 (27) = happyShift action_7
action_5 (8) = happyGoto action_6
action_5 _ = happyReduce_55

action_6 _ = happyReduce_63

action_7 (23) = happyShift action_2
action_7 (4) = happyGoto action_8
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (14) = happyGoto action_9
action_8 (19) = happyGoto action_10
action_8 _ = happyReduce_60

action_9 (50) = happyShift action_16
action_9 (6) = happyGoto action_14
action_9 (16) = happyGoto action_15
action_9 _ = happyReduce_56

action_10 (23) = happyShift action_2
action_10 (45) = happyShift action_13
action_10 (4) = happyGoto action_11
action_10 (7) = happyGoto action_12
action_10 _ = happyReduce_54

action_11 _ = happyReduce_12

action_12 _ = happyReduce_61

action_13 (23) = happyShift action_2
action_13 (4) = happyGoto action_26
action_13 _ = happyFail (happyExpListPerState 13)

action_14 _ = happyReduce_57

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

action_18 (51) = happyShift action_47
action_18 _ = happyReduce_10

action_19 (23) = happyShift action_2
action_19 (44) = happyShift action_19
action_19 (45) = happyShift action_20
action_19 (47) = happyShift action_21
action_19 (52) = happyShift action_22
action_19 (53) = happyShift action_23
action_19 (54) = happyShift action_24
action_19 (4) = happyGoto action_17
action_19 (5) = happyGoto action_44
action_19 (18) = happyGoto action_45
action_19 (22) = happyGoto action_46
action_19 _ = happyReduce_71

action_20 (46) = happyShift action_43
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
action_26 _ = happyReduce_56

action_27 (46) = happyShift action_86
action_27 _ = happyFail (happyExpListPerState 27)

action_28 _ = happyReduce_35

action_29 (28) = happyShift action_85
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (32) = happyShift action_73
action_30 (33) = happyShift action_74
action_30 (34) = happyShift action_75
action_30 (35) = happyShift action_76
action_30 (36) = happyShift action_77
action_30 (37) = happyShift action_78
action_30 (38) = happyShift action_79
action_30 (39) = happyShift action_80
action_30 (40) = happyShift action_81
action_30 (41) = happyShift action_82
action_30 (42) = happyShift action_83
action_30 (43) = happyShift action_84
action_30 _ = happyReduce_13

action_31 (23) = happyShift action_2
action_31 (24) = happyShift action_34
action_31 (25) = happyShift action_35
action_31 (26) = happyShift action_36
action_31 (44) = happyShift action_39
action_31 (45) = happyShift action_40
action_31 (47) = happyShift action_41
action_31 (4) = happyGoto action_28
action_31 (13) = happyGoto action_72
action_31 _ = happyReduce_15

action_32 _ = happyReduce_16

action_33 _ = happyReduce_32

action_34 _ = happyReduce_36

action_35 _ = happyReduce_34

action_36 _ = happyReduce_37

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
action_37 (10) = happyGoto action_71
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
action_38 (10) = happyGoto action_70
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
action_39 (10) = happyGoto action_52
action_39 (11) = happyGoto action_31
action_39 (12) = happyGoto action_32
action_39 (13) = happyGoto action_33
action_39 (17) = happyGoto action_69
action_39 (21) = happyGoto action_54
action_39 _ = happyReduce_67

action_40 (23) = happyShift action_2
action_40 (24) = happyShift action_34
action_40 (25) = happyShift action_35
action_40 (26) = happyShift action_36
action_40 (27) = happyShift action_7
action_40 (29) = happyShift action_37
action_40 (32) = happyShift action_56
action_40 (33) = happyShift action_57
action_40 (34) = happyShift action_58
action_40 (35) = happyShift action_59
action_40 (36) = happyShift action_60
action_40 (37) = happyShift action_61
action_40 (38) = happyShift action_62
action_40 (39) = happyShift action_63
action_40 (40) = happyShift action_64
action_40 (41) = happyShift action_65
action_40 (42) = happyShift action_66
action_40 (43) = happyShift action_67
action_40 (44) = happyShift action_39
action_40 (45) = happyShift action_40
action_40 (46) = happyShift action_68
action_40 (47) = happyShift action_41
action_40 (4) = happyGoto action_28
action_40 (8) = happyGoto action_29
action_40 (10) = happyGoto action_55
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
action_41 (10) = happyGoto action_52
action_41 (11) = happyGoto action_31
action_41 (12) = happyGoto action_32
action_41 (13) = happyGoto action_33
action_41 (17) = happyGoto action_53
action_41 (21) = happyGoto action_54
action_41 _ = happyReduce_67

action_42 (48) = happyShift action_51
action_42 (51) = happyShift action_47
action_42 _ = happyFail (happyExpListPerState 42)

action_43 _ = happyReduce_6

action_44 (51) = happyShift action_47
action_44 _ = happyReduce_70

action_45 (46) = happyShift action_50
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (49) = happyShift action_49
action_46 _ = happyReduce_59

action_47 (23) = happyShift action_2
action_47 (44) = happyShift action_19
action_47 (45) = happyShift action_20
action_47 (47) = happyShift action_21
action_47 (52) = happyShift action_22
action_47 (53) = happyShift action_23
action_47 (54) = happyShift action_24
action_47 (4) = happyGoto action_17
action_47 (5) = happyGoto action_48
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (51) = happyShift action_47
action_48 _ = happyReduce_9

action_49 (23) = happyShift action_2
action_49 (44) = happyShift action_19
action_49 (45) = happyShift action_20
action_49 (47) = happyShift action_21
action_49 (52) = happyShift action_22
action_49 (53) = happyShift action_23
action_49 (54) = happyShift action_24
action_49 (4) = happyGoto action_17
action_49 (5) = happyGoto action_117
action_49 _ = happyReduce_69

action_50 _ = happyReduce_7

action_51 _ = happyReduce_8

action_52 (32) = happyShift action_73
action_52 (33) = happyShift action_74
action_52 (34) = happyShift action_75
action_52 (35) = happyShift action_76
action_52 (36) = happyShift action_77
action_52 (37) = happyShift action_78
action_52 (38) = happyShift action_79
action_52 (39) = happyShift action_80
action_52 (40) = happyShift action_81
action_52 (41) = happyShift action_82
action_52 (42) = happyShift action_83
action_52 (43) = happyShift action_84
action_52 _ = happyReduce_66

action_53 (48) = happyShift action_116
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (49) = happyShift action_115
action_54 _ = happyReduce_58

action_55 (32) = happyShift action_73
action_55 (33) = happyShift action_74
action_55 (34) = happyShift action_75
action_55 (35) = happyShift action_76
action_55 (36) = happyShift action_77
action_55 (37) = happyShift action_78
action_55 (38) = happyShift action_79
action_55 (39) = happyShift action_80
action_55 (40) = happyShift action_81
action_55 (41) = happyShift action_82
action_55 (42) = happyShift action_83
action_55 (43) = happyShift action_84
action_55 (46) = happyShift action_114
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (46) = happyShift action_113
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (23) = happyShift action_2
action_57 (24) = happyShift action_34
action_57 (25) = happyShift action_35
action_57 (26) = happyShift action_36
action_57 (27) = happyShift action_7
action_57 (29) = happyShift action_37
action_57 (33) = happyShift action_38
action_57 (44) = happyShift action_39
action_57 (45) = happyShift action_40
action_57 (46) = happyShift action_112
action_57 (47) = happyShift action_41
action_57 (4) = happyGoto action_28
action_57 (8) = happyGoto action_29
action_57 (10) = happyGoto action_70
action_57 (11) = happyGoto action_31
action_57 (12) = happyGoto action_32
action_57 (13) = happyGoto action_33
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (46) = happyShift action_111
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (46) = happyShift action_110
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (46) = happyShift action_109
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (46) = happyShift action_108
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (46) = happyShift action_107
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (46) = happyShift action_106
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (46) = happyShift action_105
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (46) = happyShift action_104
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (46) = happyShift action_103
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (46) = happyShift action_102
action_67 _ = happyFail (happyExpListPerState 67)

action_68 _ = happyReduce_41

action_69 (46) = happyShift action_101
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (34) = happyShift action_75
action_70 (35) = happyShift action_76
action_70 _ = happyReduce_17

action_71 (30) = happyShift action_100
action_71 (32) = happyShift action_73
action_71 (33) = happyShift action_74
action_71 (34) = happyShift action_75
action_71 (35) = happyShift action_76
action_71 (36) = happyShift action_77
action_71 (37) = happyShift action_78
action_71 (38) = happyShift action_79
action_71 (39) = happyShift action_80
action_71 (40) = happyShift action_81
action_71 (41) = happyShift action_82
action_71 (42) = happyShift action_83
action_71 (43) = happyShift action_84
action_71 _ = happyFail (happyExpListPerState 71)

action_72 _ = happyReduce_31

action_73 (23) = happyShift action_2
action_73 (24) = happyShift action_34
action_73 (25) = happyShift action_35
action_73 (26) = happyShift action_36
action_73 (27) = happyShift action_7
action_73 (29) = happyShift action_37
action_73 (33) = happyShift action_38
action_73 (44) = happyShift action_39
action_73 (45) = happyShift action_40
action_73 (47) = happyShift action_41
action_73 (4) = happyGoto action_28
action_73 (8) = happyGoto action_29
action_73 (10) = happyGoto action_99
action_73 (11) = happyGoto action_31
action_73 (12) = happyGoto action_32
action_73 (13) = happyGoto action_33
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (23) = happyShift action_2
action_74 (24) = happyShift action_34
action_74 (25) = happyShift action_35
action_74 (26) = happyShift action_36
action_74 (27) = happyShift action_7
action_74 (29) = happyShift action_37
action_74 (33) = happyShift action_38
action_74 (44) = happyShift action_39
action_74 (45) = happyShift action_40
action_74 (47) = happyShift action_41
action_74 (4) = happyGoto action_28
action_74 (8) = happyGoto action_29
action_74 (10) = happyGoto action_98
action_74 (11) = happyGoto action_31
action_74 (12) = happyGoto action_32
action_74 (13) = happyGoto action_33
action_74 _ = happyFail (happyExpListPerState 74)

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
action_75 (10) = happyGoto action_97
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
action_76 (10) = happyGoto action_96
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
action_77 (10) = happyGoto action_95
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
action_78 (10) = happyGoto action_94
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
action_79 (10) = happyGoto action_93
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
action_80 (10) = happyGoto action_92
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
action_81 (10) = happyGoto action_91
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
action_82 (10) = happyGoto action_90
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
action_83 (10) = happyGoto action_89
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
action_84 (10) = happyGoto action_88
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
action_85 (10) = happyGoto action_87
action_85 (11) = happyGoto action_31
action_85 (12) = happyGoto action_32
action_85 (13) = happyGoto action_33
action_85 _ = happyFail (happyExpListPerState 85)

action_86 _ = happyReduce_11

action_87 (32) = happyShift action_73
action_87 (33) = happyShift action_74
action_87 (34) = happyShift action_75
action_87 (35) = happyShift action_76
action_87 (36) = happyShift action_77
action_87 (37) = happyShift action_78
action_87 (38) = happyShift action_79
action_87 (39) = happyShift action_80
action_87 (40) = happyShift action_81
action_87 (41) = happyShift action_82
action_87 (42) = happyShift action_83
action_87 (43) = happyShift action_84
action_87 _ = happyReduce_30

action_88 (32) = happyShift action_73
action_88 (33) = happyShift action_74
action_88 (34) = happyShift action_75
action_88 (35) = happyShift action_76
action_88 (36) = happyShift action_77
action_88 (37) = happyShift action_78
action_88 (38) = happyShift action_79
action_88 (39) = happyShift action_80
action_88 (40) = happyShift action_81
action_88 (41) = happyShift action_82
action_88 (42) = happyShift action_83
action_88 _ = happyReduce_29

action_89 (32) = happyShift action_73
action_89 (33) = happyShift action_74
action_89 (34) = happyShift action_75
action_89 (35) = happyShift action_76
action_89 (36) = happyShift action_77
action_89 (37) = happyShift action_78
action_89 (38) = happyShift action_79
action_89 (39) = happyShift action_80
action_89 (40) = happyShift action_81
action_89 (41) = happyShift action_82
action_89 _ = happyReduce_28

action_90 (32) = happyShift action_73
action_90 (33) = happyShift action_74
action_90 (34) = happyShift action_75
action_90 (35) = happyShift action_76
action_90 (36) = happyFail []
action_90 (37) = happyFail []
action_90 (38) = happyFail []
action_90 (39) = happyFail []
action_90 (40) = happyFail []
action_90 (41) = happyFail []
action_90 _ = happyReduce_27

action_91 (32) = happyShift action_73
action_91 (33) = happyShift action_74
action_91 (34) = happyShift action_75
action_91 (35) = happyShift action_76
action_91 (36) = happyFail []
action_91 (37) = happyFail []
action_91 (38) = happyFail []
action_91 (39) = happyFail []
action_91 (40) = happyFail []
action_91 (41) = happyFail []
action_91 _ = happyReduce_26

action_92 (32) = happyShift action_73
action_92 (33) = happyShift action_74
action_92 (34) = happyShift action_75
action_92 (35) = happyShift action_76
action_92 (36) = happyFail []
action_92 (37) = happyFail []
action_92 (38) = happyFail []
action_92 (39) = happyFail []
action_92 (40) = happyFail []
action_92 (41) = happyFail []
action_92 _ = happyReduce_25

action_93 (32) = happyShift action_73
action_93 (33) = happyShift action_74
action_93 (34) = happyShift action_75
action_93 (35) = happyShift action_76
action_93 (36) = happyFail []
action_93 (37) = happyFail []
action_93 (38) = happyFail []
action_93 (39) = happyFail []
action_93 (40) = happyFail []
action_93 (41) = happyFail []
action_93 _ = happyReduce_24

action_94 (32) = happyShift action_73
action_94 (33) = happyShift action_74
action_94 (34) = happyShift action_75
action_94 (35) = happyShift action_76
action_94 (36) = happyFail []
action_94 (37) = happyFail []
action_94 (38) = happyFail []
action_94 (39) = happyFail []
action_94 (40) = happyFail []
action_94 (41) = happyFail []
action_94 _ = happyReduce_23

action_95 (32) = happyShift action_73
action_95 (33) = happyShift action_74
action_95 (34) = happyShift action_75
action_95 (35) = happyShift action_76
action_95 (36) = happyFail []
action_95 (37) = happyFail []
action_95 (38) = happyFail []
action_95 (39) = happyFail []
action_95 (40) = happyFail []
action_95 (41) = happyFail []
action_95 _ = happyReduce_22

action_96 _ = happyReduce_21

action_97 _ = happyReduce_20

action_98 (34) = happyShift action_75
action_98 (35) = happyShift action_76
action_98 _ = happyReduce_19

action_99 (34) = happyShift action_75
action_99 (35) = happyShift action_76
action_99 _ = happyReduce_18

action_100 (23) = happyShift action_2
action_100 (24) = happyShift action_34
action_100 (25) = happyShift action_35
action_100 (26) = happyShift action_36
action_100 (27) = happyShift action_7
action_100 (29) = happyShift action_37
action_100 (33) = happyShift action_38
action_100 (44) = happyShift action_39
action_100 (45) = happyShift action_40
action_100 (47) = happyShift action_41
action_100 (4) = happyGoto action_28
action_100 (8) = happyGoto action_29
action_100 (10) = happyGoto action_119
action_100 (11) = happyGoto action_31
action_100 (12) = happyGoto action_32
action_100 (13) = happyGoto action_33
action_100 _ = happyFail (happyExpListPerState 100)

action_101 _ = happyReduce_38

action_102 _ = happyReduce_53

action_103 _ = happyReduce_52

action_104 _ = happyReduce_51

action_105 _ = happyReduce_50

action_106 _ = happyReduce_49

action_107 _ = happyReduce_48

action_108 _ = happyReduce_47

action_109 _ = happyReduce_46

action_110 _ = happyReduce_45

action_111 _ = happyReduce_44

action_112 _ = happyReduce_43

action_113 _ = happyReduce_42

action_114 _ = happyReduce_40

action_115 (23) = happyShift action_2
action_115 (24) = happyShift action_34
action_115 (25) = happyShift action_35
action_115 (26) = happyShift action_36
action_115 (27) = happyShift action_7
action_115 (29) = happyShift action_37
action_115 (33) = happyShift action_38
action_115 (44) = happyShift action_39
action_115 (45) = happyShift action_40
action_115 (47) = happyShift action_41
action_115 (4) = happyGoto action_28
action_115 (8) = happyGoto action_29
action_115 (10) = happyGoto action_118
action_115 (11) = happyGoto action_31
action_115 (12) = happyGoto action_32
action_115 (13) = happyGoto action_33
action_115 _ = happyReduce_65

action_116 _ = happyReduce_39

action_117 (51) = happyShift action_47
action_117 _ = happyReduce_68

action_118 (32) = happyShift action_73
action_118 (33) = happyShift action_74
action_118 (34) = happyShift action_75
action_118 (35) = happyShift action_76
action_118 (36) = happyShift action_77
action_118 (37) = happyShift action_78
action_118 (38) = happyShift action_79
action_118 (39) = happyShift action_80
action_118 (40) = happyShift action_81
action_118 (41) = happyShift action_82
action_118 (42) = happyShift action_83
action_118 (43) = happyShift action_84
action_118 _ = happyReduce_64

action_119 (31) = happyShift action_120
action_119 (32) = happyShift action_73
action_119 (33) = happyShift action_74
action_119 (34) = happyShift action_75
action_119 (35) = happyShift action_76
action_119 (36) = happyShift action_77
action_119 (37) = happyShift action_78
action_119 (38) = happyShift action_79
action_119 (39) = happyShift action_80
action_119 (40) = happyShift action_81
action_119 (41) = happyShift action_82
action_119 (42) = happyShift action_83
action_119 (43) = happyShift action_84
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (23) = happyShift action_2
action_120 (24) = happyShift action_34
action_120 (25) = happyShift action_35
action_120 (26) = happyShift action_36
action_120 (27) = happyShift action_7
action_120 (29) = happyShift action_37
action_120 (33) = happyShift action_38
action_120 (44) = happyShift action_39
action_120 (45) = happyShift action_40
action_120 (47) = happyShift action_41
action_120 (4) = happyGoto action_28
action_120 (8) = happyGoto action_29
action_120 (10) = happyGoto action_121
action_120 (11) = happyGoto action_31
action_120 (12) = happyGoto action_32
action_120 (13) = happyGoto action_33
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (32) = happyShift action_73
action_121 (33) = happyShift action_74
action_121 (34) = happyShift action_75
action_121 (35) = happyShift action_76
action_121 (36) = happyShift action_77
action_121 (37) = happyShift action_78
action_121 (38) = happyShift action_79
action_121 (39) = happyShift action_80
action_121 (40) = happyShift action_81
action_121 (41) = happyShift action_82
action_121 (42) = happyShift action_83
action_121 (43) = happyShift action_84
action_121 _ = happyReduce_33

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

happyReduce_10 = happySpecReduce_2  6 happyReduction_10
happyReduction_10 (HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happyReduce 4 7 happyReduction_11
happyReduction_11 ((HappyTerminal happy_var_4) `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Argument (L.rtRange happy_var_1 <-> L.rtRange happy_var_4) happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_1  7 happyReduction_12
happyReduction_12 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn7
		 (Argument (info happy_var_1) happy_var_1 Nothing
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happyReduce 6 8 happyReduction_13
happyReduction_13 ((HappyAbsSyn10  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_4) `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Dec (L.rtRange happy_var_1 <-> info happy_var_6) happy_var_2 happy_var_3 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_1  9 happyReduction_14
happyReduction_14 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn9
		 (mkProgram happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  10 happyReduction_15
happyReduction_15 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  10 happyReduction_16
happyReduction_16 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_2  10 happyReduction_17
happyReduction_17 (HappyAbsSyn10  happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (ENeg (L.rtRange happy_var_1 <-> info happy_var_2) happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  10 happyReduction_18
happyReduction_18 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EBinOp (info happy_var_1 <-> info happy_var_3) happy_var_1 (Plus (L.rtRange happy_var_2)) happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  10 happyReduction_19
happyReduction_19 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EBinOp (info happy_var_1 <-> info happy_var_3) happy_var_1 (Minus (L.rtRange happy_var_2)) happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  10 happyReduction_20
happyReduction_20 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EBinOp (info happy_var_1 <-> info happy_var_3) happy_var_1 (Times (L.rtRange happy_var_2)) happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  10 happyReduction_21
happyReduction_21 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EBinOp (info happy_var_1 <-> info happy_var_3) happy_var_1 (Divide (L.rtRange happy_var_2)) happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  10 happyReduction_22
happyReduction_22 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EBinOp (info happy_var_1 <-> info happy_var_3) happy_var_1 (Eq (L.rtRange happy_var_2)) happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  10 happyReduction_23
happyReduction_23 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EBinOp (info happy_var_1 <-> info happy_var_3) happy_var_1 (Neq (L.rtRange happy_var_2)) happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  10 happyReduction_24
happyReduction_24 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EBinOp (info happy_var_1 <-> info happy_var_3) happy_var_1 (Lt (L.rtRange happy_var_2)) happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  10 happyReduction_25
happyReduction_25 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EBinOp (info happy_var_1 <-> info happy_var_3) happy_var_1 (Le (L.rtRange happy_var_2)) happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  10 happyReduction_26
happyReduction_26 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EBinOp (info happy_var_1 <-> info happy_var_3) happy_var_1 (Gt (L.rtRange happy_var_2)) happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  10 happyReduction_27
happyReduction_27 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EBinOp (info happy_var_1 <-> info happy_var_3) happy_var_1 (Ge (L.rtRange happy_var_2)) happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  10 happyReduction_28
happyReduction_28 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EBinOp (info happy_var_1 <-> info happy_var_3) happy_var_1 (And (L.rtRange happy_var_2)) happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  10 happyReduction_29
happyReduction_29 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EBinOp (info happy_var_1 <-> info happy_var_3) happy_var_1 (Or (L.rtRange happy_var_2)) happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  10 happyReduction_30
happyReduction_30 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn10
		 (ELetIn (info happy_var_1 <-> info happy_var_3) happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_2  11 happyReduction_31
happyReduction_31 (HappyAbsSyn10  happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (EApp (info happy_var_1 <-> info happy_var_2) happy_var_1 happy_var_2
	)
happyReduction_31 _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  11 happyReduction_32
happyReduction_32 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happyReduce 6 12 happyReduction_33
happyReduction_33 ((HappyAbsSyn10  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (EIfThenElse (L.rtRange happy_var_1 <-> info happy_var_6) happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_34 = happySpecReduce_1  13 happyReduction_34
happyReduction_34 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (unTok happy_var_1 (\range (L.Integer int) -> EInt range int)
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  13 happyReduction_35
happyReduction_35 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn10
		 (EVar (info happy_var_1) happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  13 happyReduction_36
happyReduction_36 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (unTok happy_var_1 (\range (L.String string) -> EString range string)
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  13 happyReduction_37
happyReduction_37 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (unTok happy_var_1 (\range (L.Boolean b) -> EBool range b)
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  13 happyReduction_38
happyReduction_38 (HappyTerminal happy_var_3)
	(HappyAbsSyn17  happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (ETuple (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) happy_var_2
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  13 happyReduction_39
happyReduction_39 (HappyTerminal happy_var_3)
	(HappyAbsSyn17  happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EList (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) happy_var_2
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  13 happyReduction_40
happyReduction_40 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (happy_var_2
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_2  13 happyReduction_41
happyReduction_41 (HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EUnit (L.rtRange happy_var_1 <-> L.rtRange happy_var_2)
	)
happyReduction_41 _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  13 happyReduction_42
happyReduction_42 (HappyTerminal happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EOp (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) (Plus (L.rtRange happy_var_2))
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  13 happyReduction_43
happyReduction_43 (HappyTerminal happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EOp (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) (Minus (L.rtRange happy_var_2))
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  13 happyReduction_44
happyReduction_44 (HappyTerminal happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EOp (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) (Times (L.rtRange happy_var_2))
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  13 happyReduction_45
happyReduction_45 (HappyTerminal happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EOp (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) (Divide (L.rtRange happy_var_2))
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  13 happyReduction_46
happyReduction_46 (HappyTerminal happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EOp (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) (Eq (L.rtRange happy_var_2))
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  13 happyReduction_47
happyReduction_47 (HappyTerminal happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EOp (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) (Neq (L.rtRange happy_var_2))
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  13 happyReduction_48
happyReduction_48 (HappyTerminal happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EOp (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) (Lt (L.rtRange happy_var_2))
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  13 happyReduction_49
happyReduction_49 (HappyTerminal happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EOp (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) (Le (L.rtRange happy_var_2))
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  13 happyReduction_50
happyReduction_50 (HappyTerminal happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EOp (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) (Gt (L.rtRange happy_var_2))
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  13 happyReduction_51
happyReduction_51 (HappyTerminal happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EOp (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) (Ge (L.rtRange happy_var_2))
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_3  13 happyReduction_52
happyReduction_52 (HappyTerminal happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EOp (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) (And (L.rtRange happy_var_2))
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_3  13 happyReduction_53
happyReduction_53 (HappyTerminal happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EOp (L.rtRange happy_var_1 <-> L.rtRange happy_var_3) (Or (L.rtRange happy_var_2))
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_1  14 happyReduction_54
happyReduction_54 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn14
		 (reverse happy_var_1
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  15 happyReduction_55
happyReduction_55 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn15
		 (reverse happy_var_1
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_0  16 happyReduction_56
happyReduction_56  =  HappyAbsSyn16
		 (Nothing
	)

happyReduce_57 = happySpecReduce_1  16 happyReduction_57
happyReduction_57 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn16
		 (Just happy_var_1
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_1  17 happyReduction_58
happyReduction_58 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn17
		 (reverse happy_var_1
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  18 happyReduction_59
happyReduction_59 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn18
		 (reverse happy_var_1
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_0  19 happyReduction_60
happyReduction_60  =  HappyAbsSyn19
		 ([]
	)

happyReduce_61 = happySpecReduce_2  19 happyReduction_61
happyReduction_61 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_2 : happy_var_1
	)
happyReduction_61 _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_0  20 happyReduction_62
happyReduction_62  =  HappyAbsSyn20
		 ([]
	)

happyReduce_63 = happySpecReduce_2  20 happyReduction_63
happyReduction_63 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (happy_var_2 : happy_var_1
	)
happyReduction_63 _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  21 happyReduction_64
happyReduction_64 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (happy_var_3 : happy_var_1
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_2  21 happyReduction_65
happyReduction_65 _
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (happy_var_1
	)
happyReduction_65 _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_1  21 happyReduction_66
happyReduction_66 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn21
		 ([happy_var_1]
	)
happyReduction_66 _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_0  21 happyReduction_67
happyReduction_67  =  HappyAbsSyn21
		 ([]
	)

happyReduce_68 = happySpecReduce_3  22 happyReduction_68
happyReduction_68 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_3 : happy_var_1
	)
happyReduction_68 _ _ _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_2  22 happyReduction_69
happyReduction_69 _
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1
	)
happyReduction_69 _ _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_1  22 happyReduction_70
happyReduction_70 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn22
		 ([happy_var_1]
	)
happyReduction_70 _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_0  22 happyReduction_71
happyReduction_71  =  HappyAbsSyn22
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
  (L.AlexPn _ line column, _, _, _) <- L.alexGetInput
  L.alexError $ "Parse error at line " <> show line <> ", column " <> show column

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
