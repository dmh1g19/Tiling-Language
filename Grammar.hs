{-# OPTIONS_GHC -w #-}
module Grammar where
import Token
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.11

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,382) ([55296,9816,970,2,1536,36224,41573,8252,0,96,0,0,2048,0,0,0,0,38912,1015,0,0,0,0,512,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,512,36224,41573,8252,0,96,22744,51750,515,0,32774,25997,15522,32,24576,0,0,0,0,512,36224,41573,8252,0,96,0,0,0,0,2,0,0,0,8192,55296,9816,970,2,1536,24576,0,0,0,0,0,0,0,0,2,0,0,0,8192,0,0,0,0,512,0,0,8196,0,96,0,0,24576,134,0,0,0,0,0,55296,9816,970,2,1536,0,0,32768,0,0,0,0,0,0,2,0,0,0,8192,55296,9816,970,2,1536,36224,41573,8252,0,96,22744,51750,515,0,6,0,0,38976,1015,0,0,0,0,0,0,0,0,0,32,0,0,0,0,2,0,0,0,0,0,0,0,0,512,0,0,0,0,32,0,0,0,0,2,0,64,0,0,0,16384,0,0,0,36224,41573,8252,0,96,0,0,0,0,0,2048,0,0,0,0,0,2048,0,0,0,0,128,0,0,256,0,0,0,0,0,0,1,0,0,0,0,32768,0,0,0,8196,0,96,0,16384,512,0,6,0,1024,32,24576,0,0,64,2,1536,0,0,8196,0,96,0,16384,512,0,6,0,1024,32,24576,0,0,64,2,1536,0,0,8196,0,96,0,16384,512,0,6,0,1024,32,24576,0,0,64,2,1536,0,0,0,0,0,0,0,32768,121,0,0,0,38912,7,0,0,0,31104,0,0,0,0,1944,0,0,0,32768,121,0,0,0,38912,7,0,0,0,6144,0,0,0,0,384,0,0,0,0,0,0,0,0,0,0,0,0,0,30720,0,0,0,0,1936,0,22744,51750,515,0,6,0,0,0,0,0,0,0,0,384,0,0,0,0,32,22744,51750,515,0,32774,25997,15522,32,24576,0,0,16384,0,0,0,128,0,0,0,0,384,0,0,32768,25997,15522,32,24576,0,0,48,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,25997,15522,32,24576,55296,9816,970,2,1536,36224,41573,8252,0,96,22744,51750,515,0,32774,26509,15522,32,24576,55296,9848,970,2,1536,0,0,0,0,0,0,0,32,0,0,0,0,16,0,0,0,0,0,384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,36224,41573,10300,0,96,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,1,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,22744,51750,515,0,32774,25997,15522,40,24576,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","stmts","exp","numExpr","listCell","cellList","cellsl","cell","type","Base","Int","Bool","cells","import","as","width","length","repeat","while","end","if","then","else","print","take","size","from","reflect","on","row","col","expand","by","rotate","CW","ACW","get","neg","and","or","file","do","'['","']'","'{'","'}'","'|'","'('","')'","';'","':'","'-&'","'+&'","'&&'","'||'","'-*'","'+*'","'/'","'*'","'+'","'-'","'='","'<'","'>'","'>='","'<='","'=='","'!='","'.'","'0'","'1'","var","int","%eof"]
        bit_start = st * 76
        bit_end = (st + 1) * 76
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..75]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (12) = happyShift action_5
action_0 (13) = happyShift action_6
action_0 (15) = happyShift action_7
action_0 (16) = happyShift action_8
action_0 (20) = happyShift action_9
action_0 (21) = happyShift action_10
action_0 (23) = happyShift action_11
action_0 (26) = happyShift action_12
action_0 (27) = happyShift action_13
action_0 (30) = happyShift action_14
action_0 (34) = happyShift action_15
action_0 (36) = happyShift action_16
action_0 (39) = happyShift action_17
action_0 (40) = happyShift action_18
action_0 (41) = happyShift action_19
action_0 (42) = happyShift action_20
action_0 (50) = happyShift action_21
action_0 (74) = happyShift action_22
action_0 (75) = happyShift action_23
action_0 (4) = happyGoto action_24
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 (11) = happyGoto action_4
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (12) = happyShift action_5
action_1 (13) = happyShift action_6
action_1 (15) = happyShift action_7
action_1 (16) = happyShift action_8
action_1 (20) = happyShift action_9
action_1 (21) = happyShift action_10
action_1 (23) = happyShift action_11
action_1 (26) = happyShift action_12
action_1 (27) = happyShift action_13
action_1 (30) = happyShift action_14
action_1 (34) = happyShift action_15
action_1 (36) = happyShift action_16
action_1 (39) = happyShift action_17
action_1 (40) = happyShift action_18
action_1 (41) = happyShift action_19
action_1 (42) = happyShift action_20
action_1 (50) = happyShift action_21
action_1 (74) = happyShift action_22
action_1 (75) = happyShift action_23
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (11) = happyGoto action_4
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (52) = happyShift action_61
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (56) = happyShift action_49
action_3 (57) = happyShift action_50
action_3 (60) = happyShift action_51
action_3 (61) = happyShift action_52
action_3 (62) = happyShift action_53
action_3 (63) = happyShift action_54
action_3 (65) = happyShift action_55
action_3 (66) = happyShift action_56
action_3 (67) = happyShift action_57
action_3 (68) = happyShift action_58
action_3 (69) = happyShift action_59
action_3 (70) = happyShift action_60
action_3 _ = happyReduce_3

action_4 (74) = happyShift action_48
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_52

action_6 _ = happyReduce_51

action_7 (53) = happyShift action_47
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (74) = happyShift action_46
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (12) = happyShift action_5
action_9 (13) = happyShift action_6
action_9 (15) = happyShift action_7
action_9 (16) = happyShift action_8
action_9 (20) = happyShift action_9
action_9 (21) = happyShift action_10
action_9 (23) = happyShift action_11
action_9 (26) = happyShift action_12
action_9 (27) = happyShift action_13
action_9 (30) = happyShift action_14
action_9 (34) = happyShift action_15
action_9 (36) = happyShift action_16
action_9 (39) = happyShift action_17
action_9 (40) = happyShift action_18
action_9 (41) = happyShift action_19
action_9 (42) = happyShift action_20
action_9 (50) = happyShift action_21
action_9 (74) = happyShift action_22
action_9 (75) = happyShift action_23
action_9 (5) = happyGoto action_45
action_9 (6) = happyGoto action_3
action_9 (11) = happyGoto action_4
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (12) = happyShift action_5
action_10 (13) = happyShift action_6
action_10 (15) = happyShift action_7
action_10 (16) = happyShift action_8
action_10 (20) = happyShift action_9
action_10 (21) = happyShift action_10
action_10 (23) = happyShift action_11
action_10 (26) = happyShift action_12
action_10 (27) = happyShift action_13
action_10 (30) = happyShift action_14
action_10 (34) = happyShift action_15
action_10 (36) = happyShift action_16
action_10 (39) = happyShift action_17
action_10 (40) = happyShift action_18
action_10 (41) = happyShift action_19
action_10 (42) = happyShift action_20
action_10 (50) = happyShift action_21
action_10 (74) = happyShift action_22
action_10 (75) = happyShift action_23
action_10 (5) = happyGoto action_44
action_10 (6) = happyGoto action_3
action_10 (11) = happyGoto action_4
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (12) = happyShift action_5
action_11 (13) = happyShift action_6
action_11 (15) = happyShift action_7
action_11 (16) = happyShift action_8
action_11 (20) = happyShift action_9
action_11 (21) = happyShift action_10
action_11 (23) = happyShift action_11
action_11 (26) = happyShift action_12
action_11 (27) = happyShift action_13
action_11 (30) = happyShift action_14
action_11 (34) = happyShift action_15
action_11 (36) = happyShift action_16
action_11 (39) = happyShift action_17
action_11 (40) = happyShift action_18
action_11 (41) = happyShift action_19
action_11 (42) = happyShift action_20
action_11 (50) = happyShift action_21
action_11 (74) = happyShift action_22
action_11 (75) = happyShift action_23
action_11 (5) = happyGoto action_43
action_11 (6) = happyGoto action_3
action_11 (11) = happyGoto action_4
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (74) = happyShift action_42
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (12) = happyShift action_5
action_13 (13) = happyShift action_6
action_13 (15) = happyShift action_7
action_13 (16) = happyShift action_8
action_13 (20) = happyShift action_9
action_13 (21) = happyShift action_10
action_13 (23) = happyShift action_11
action_13 (26) = happyShift action_12
action_13 (27) = happyShift action_13
action_13 (30) = happyShift action_14
action_13 (34) = happyShift action_15
action_13 (36) = happyShift action_16
action_13 (39) = happyShift action_17
action_13 (40) = happyShift action_18
action_13 (41) = happyShift action_19
action_13 (42) = happyShift action_20
action_13 (50) = happyShift action_21
action_13 (74) = happyShift action_22
action_13 (75) = happyShift action_23
action_13 (5) = happyGoto action_41
action_13 (6) = happyGoto action_3
action_13 (11) = happyGoto action_4
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (74) = happyShift action_40
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (74) = happyShift action_39
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (12) = happyShift action_5
action_16 (13) = happyShift action_6
action_16 (15) = happyShift action_7
action_16 (16) = happyShift action_8
action_16 (20) = happyShift action_9
action_16 (21) = happyShift action_10
action_16 (23) = happyShift action_11
action_16 (26) = happyShift action_12
action_16 (27) = happyShift action_13
action_16 (30) = happyShift action_14
action_16 (34) = happyShift action_15
action_16 (36) = happyShift action_16
action_16 (39) = happyShift action_17
action_16 (40) = happyShift action_18
action_16 (41) = happyShift action_19
action_16 (42) = happyShift action_20
action_16 (50) = happyShift action_21
action_16 (74) = happyShift action_22
action_16 (75) = happyShift action_23
action_16 (5) = happyGoto action_38
action_16 (6) = happyGoto action_3
action_16 (11) = happyGoto action_4
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (18) = happyShift action_36
action_17 (19) = happyShift action_37
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (74) = happyShift action_35
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (74) = happyShift action_34
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (74) = happyShift action_33
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (39) = happyShift action_17
action_21 (50) = happyShift action_21
action_21 (74) = happyShift action_32
action_21 (75) = happyShift action_23
action_21 (6) = happyGoto action_31
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (54) = happyShift action_26
action_22 (55) = happyShift action_27
action_22 (58) = happyShift action_28
action_22 (59) = happyShift action_29
action_22 (64) = happyShift action_30
action_22 _ = happyReduce_42

action_23 _ = happyReduce_41

action_24 (12) = happyShift action_5
action_24 (13) = happyShift action_6
action_24 (15) = happyShift action_7
action_24 (16) = happyShift action_8
action_24 (20) = happyShift action_9
action_24 (21) = happyShift action_10
action_24 (23) = happyShift action_11
action_24 (26) = happyShift action_12
action_24 (27) = happyShift action_13
action_24 (30) = happyShift action_14
action_24 (34) = happyShift action_15
action_24 (36) = happyShift action_16
action_24 (39) = happyShift action_17
action_24 (40) = happyShift action_18
action_24 (41) = happyShift action_19
action_24 (42) = happyShift action_20
action_24 (50) = happyShift action_21
action_24 (74) = happyShift action_22
action_24 (75) = happyShift action_23
action_24 (76) = happyAccept
action_24 (5) = happyGoto action_25
action_24 (6) = happyGoto action_3
action_24 (11) = happyGoto action_4
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (52) = happyShift action_95
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (74) = happyShift action_94
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (74) = happyShift action_93
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (12) = happyShift action_5
action_28 (13) = happyShift action_6
action_28 (15) = happyShift action_7
action_28 (16) = happyShift action_8
action_28 (20) = happyShift action_9
action_28 (21) = happyShift action_10
action_28 (23) = happyShift action_11
action_28 (26) = happyShift action_12
action_28 (27) = happyShift action_13
action_28 (30) = happyShift action_14
action_28 (34) = happyShift action_15
action_28 (36) = happyShift action_16
action_28 (39) = happyShift action_17
action_28 (40) = happyShift action_18
action_28 (41) = happyShift action_19
action_28 (42) = happyShift action_20
action_28 (50) = happyShift action_21
action_28 (74) = happyShift action_22
action_28 (75) = happyShift action_23
action_28 (5) = happyGoto action_92
action_28 (6) = happyGoto action_3
action_28 (11) = happyGoto action_4
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (12) = happyShift action_5
action_29 (13) = happyShift action_6
action_29 (15) = happyShift action_7
action_29 (16) = happyShift action_8
action_29 (20) = happyShift action_9
action_29 (21) = happyShift action_10
action_29 (23) = happyShift action_11
action_29 (26) = happyShift action_12
action_29 (27) = happyShift action_13
action_29 (30) = happyShift action_14
action_29 (34) = happyShift action_15
action_29 (36) = happyShift action_16
action_29 (39) = happyShift action_17
action_29 (40) = happyShift action_18
action_29 (41) = happyShift action_19
action_29 (42) = happyShift action_20
action_29 (50) = happyShift action_21
action_29 (74) = happyShift action_22
action_29 (75) = happyShift action_23
action_29 (5) = happyGoto action_91
action_29 (6) = happyGoto action_3
action_29 (11) = happyGoto action_4
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (12) = happyShift action_5
action_30 (13) = happyShift action_6
action_30 (15) = happyShift action_7
action_30 (16) = happyShift action_8
action_30 (20) = happyShift action_9
action_30 (21) = happyShift action_10
action_30 (23) = happyShift action_11
action_30 (26) = happyShift action_12
action_30 (27) = happyShift action_13
action_30 (30) = happyShift action_14
action_30 (34) = happyShift action_15
action_30 (36) = happyShift action_16
action_30 (39) = happyShift action_17
action_30 (40) = happyShift action_18
action_30 (41) = happyShift action_19
action_30 (42) = happyShift action_20
action_30 (50) = happyShift action_21
action_30 (74) = happyShift action_22
action_30 (75) = happyShift action_23
action_30 (5) = happyGoto action_90
action_30 (6) = happyGoto action_3
action_30 (11) = happyGoto action_4
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (51) = happyShift action_89
action_31 (56) = happyShift action_49
action_31 (57) = happyShift action_50
action_31 (60) = happyShift action_51
action_31 (61) = happyShift action_52
action_31 (62) = happyShift action_53
action_31 (63) = happyShift action_54
action_31 (65) = happyShift action_55
action_31 (66) = happyShift action_56
action_31 (67) = happyShift action_57
action_31 (68) = happyShift action_58
action_31 (69) = happyShift action_59
action_31 (70) = happyShift action_60
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_42

action_33 (74) = happyShift action_88
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (74) = happyShift action_87
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_21

action_36 (74) = happyShift action_86
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (74) = happyShift action_85
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (74) = happyShift action_84
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (35) = happyShift action_83
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (31) = happyShift action_82
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (12) = happyShift action_5
action_41 (13) = happyShift action_6
action_41 (15) = happyShift action_7
action_41 (16) = happyShift action_8
action_41 (20) = happyShift action_9
action_41 (21) = happyShift action_10
action_41 (23) = happyShift action_11
action_41 (26) = happyShift action_12
action_41 (27) = happyShift action_13
action_41 (30) = happyShift action_14
action_41 (34) = happyShift action_15
action_41 (36) = happyShift action_16
action_41 (39) = happyShift action_17
action_41 (40) = happyShift action_18
action_41 (41) = happyShift action_19
action_41 (42) = happyShift action_20
action_41 (50) = happyShift action_21
action_41 (74) = happyShift action_22
action_41 (75) = happyShift action_23
action_41 (5) = happyGoto action_81
action_41 (6) = happyGoto action_3
action_41 (11) = happyGoto action_4
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_7

action_43 (24) = happyShift action_80
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (44) = happyShift action_79
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (44) = happyShift action_78
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (17) = happyShift action_77
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (45) = happyShift action_76
action_47 (7) = happyGoto action_75
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (64) = happyShift action_74
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (39) = happyShift action_17
action_49 (50) = happyShift action_21
action_49 (74) = happyShift action_32
action_49 (75) = happyShift action_23
action_49 (6) = happyGoto action_73
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (39) = happyShift action_17
action_50 (50) = happyShift action_21
action_50 (74) = happyShift action_32
action_50 (75) = happyShift action_23
action_50 (6) = happyGoto action_72
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (39) = happyShift action_17
action_51 (50) = happyShift action_21
action_51 (74) = happyShift action_32
action_51 (75) = happyShift action_23
action_51 (6) = happyGoto action_71
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (39) = happyShift action_17
action_52 (50) = happyShift action_21
action_52 (74) = happyShift action_32
action_52 (75) = happyShift action_23
action_52 (6) = happyGoto action_70
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (39) = happyShift action_17
action_53 (50) = happyShift action_21
action_53 (74) = happyShift action_32
action_53 (75) = happyShift action_23
action_53 (6) = happyGoto action_69
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (39) = happyShift action_17
action_54 (50) = happyShift action_21
action_54 (74) = happyShift action_32
action_54 (75) = happyShift action_23
action_54 (6) = happyGoto action_68
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (39) = happyShift action_17
action_55 (50) = happyShift action_21
action_55 (74) = happyShift action_32
action_55 (75) = happyShift action_23
action_55 (6) = happyGoto action_67
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (39) = happyShift action_17
action_56 (50) = happyShift action_21
action_56 (74) = happyShift action_32
action_56 (75) = happyShift action_23
action_56 (6) = happyGoto action_66
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (39) = happyShift action_17
action_57 (50) = happyShift action_21
action_57 (74) = happyShift action_32
action_57 (75) = happyShift action_23
action_57 (6) = happyGoto action_65
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (39) = happyShift action_17
action_58 (50) = happyShift action_21
action_58 (74) = happyShift action_32
action_58 (75) = happyShift action_23
action_58 (6) = happyGoto action_64
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (39) = happyShift action_17
action_59 (50) = happyShift action_21
action_59 (74) = happyShift action_32
action_59 (75) = happyShift action_23
action_59 (6) = happyGoto action_63
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (39) = happyShift action_17
action_60 (50) = happyShift action_21
action_60 (74) = happyShift action_32
action_60 (75) = happyShift action_23
action_60 (6) = happyGoto action_62
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_1

action_62 (56) = happyShift action_49
action_62 (57) = happyShift action_50
action_62 (60) = happyShift action_51
action_62 (61) = happyShift action_52
action_62 (62) = happyShift action_53
action_62 (63) = happyShift action_54
action_62 (65) = happyFail []
action_62 (66) = happyFail []
action_62 (67) = happyFail []
action_62 (68) = happyFail []
action_62 (69) = happyFail []
action_62 (70) = happyFail []
action_62 _ = happyReduce_37

action_63 (56) = happyShift action_49
action_63 (57) = happyShift action_50
action_63 (60) = happyShift action_51
action_63 (61) = happyShift action_52
action_63 (62) = happyShift action_53
action_63 (63) = happyShift action_54
action_63 (65) = happyFail []
action_63 (66) = happyFail []
action_63 (67) = happyFail []
action_63 (68) = happyFail []
action_63 (69) = happyFail []
action_63 (70) = happyFail []
action_63 _ = happyReduce_36

action_64 (56) = happyShift action_49
action_64 (57) = happyShift action_50
action_64 (60) = happyShift action_51
action_64 (61) = happyShift action_52
action_64 (62) = happyShift action_53
action_64 (63) = happyShift action_54
action_64 (65) = happyFail []
action_64 (66) = happyFail []
action_64 (67) = happyFail []
action_64 (68) = happyFail []
action_64 (69) = happyFail []
action_64 (70) = happyFail []
action_64 _ = happyReduce_35

action_65 (56) = happyShift action_49
action_65 (57) = happyShift action_50
action_65 (60) = happyShift action_51
action_65 (61) = happyShift action_52
action_65 (62) = happyShift action_53
action_65 (63) = happyShift action_54
action_65 (65) = happyFail []
action_65 (66) = happyFail []
action_65 (67) = happyFail []
action_65 (68) = happyFail []
action_65 (69) = happyFail []
action_65 (70) = happyFail []
action_65 _ = happyReduce_34

action_66 (56) = happyShift action_49
action_66 (57) = happyShift action_50
action_66 (60) = happyShift action_51
action_66 (61) = happyShift action_52
action_66 (62) = happyShift action_53
action_66 (63) = happyShift action_54
action_66 (65) = happyFail []
action_66 (66) = happyFail []
action_66 (67) = happyFail []
action_66 (68) = happyFail []
action_66 (69) = happyFail []
action_66 (70) = happyFail []
action_66 _ = happyReduce_33

action_67 (56) = happyShift action_49
action_67 (57) = happyShift action_50
action_67 (60) = happyShift action_51
action_67 (61) = happyShift action_52
action_67 (62) = happyShift action_53
action_67 (63) = happyShift action_54
action_67 (65) = happyFail []
action_67 (66) = happyFail []
action_67 (67) = happyFail []
action_67 (68) = happyFail []
action_67 (69) = happyFail []
action_67 (70) = happyFail []
action_67 _ = happyReduce_32

action_68 (60) = happyShift action_51
action_68 (61) = happyShift action_52
action_68 _ = happyReduce_29

action_69 (60) = happyShift action_51
action_69 (61) = happyShift action_52
action_69 _ = happyReduce_28

action_70 _ = happyReduce_27

action_71 _ = happyReduce_26

action_72 (60) = happyShift action_51
action_72 (61) = happyShift action_52
action_72 (62) = happyShift action_53
action_72 (63) = happyShift action_54
action_72 _ = happyReduce_31

action_73 (57) = happyShift action_50
action_73 (60) = happyShift action_51
action_73 (61) = happyShift action_52
action_73 (62) = happyShift action_53
action_73 (63) = happyShift action_54
action_73 _ = happyReduce_30

action_74 (12) = happyShift action_5
action_74 (13) = happyShift action_6
action_74 (15) = happyShift action_7
action_74 (16) = happyShift action_8
action_74 (20) = happyShift action_9
action_74 (21) = happyShift action_10
action_74 (23) = happyShift action_11
action_74 (26) = happyShift action_12
action_74 (27) = happyShift action_13
action_74 (30) = happyShift action_14
action_74 (34) = happyShift action_15
action_74 (36) = happyShift action_16
action_74 (39) = happyShift action_17
action_74 (40) = happyShift action_18
action_74 (41) = happyShift action_19
action_74 (42) = happyShift action_20
action_74 (50) = happyShift action_21
action_74 (74) = happyShift action_22
action_74 (75) = happyShift action_23
action_74 (5) = happyGoto action_111
action_74 (6) = happyGoto action_3
action_74 (11) = happyGoto action_4
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_12

action_76 (72) = happyShift action_109
action_76 (73) = happyShift action_110
action_76 (8) = happyGoto action_106
action_76 (9) = happyGoto action_107
action_76 (10) = happyGoto action_108
action_76 _ = happyReduce_46

action_77 (74) = happyShift action_105
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (12) = happyShift action_5
action_78 (13) = happyShift action_6
action_78 (15) = happyShift action_7
action_78 (16) = happyShift action_8
action_78 (20) = happyShift action_9
action_78 (21) = happyShift action_10
action_78 (23) = happyShift action_11
action_78 (26) = happyShift action_12
action_78 (27) = happyShift action_13
action_78 (30) = happyShift action_14
action_78 (34) = happyShift action_15
action_78 (36) = happyShift action_16
action_78 (39) = happyShift action_17
action_78 (40) = happyShift action_18
action_78 (41) = happyShift action_19
action_78 (42) = happyShift action_20
action_78 (50) = happyShift action_21
action_78 (74) = happyShift action_22
action_78 (75) = happyShift action_23
action_78 (4) = happyGoto action_104
action_78 (5) = happyGoto action_2
action_78 (6) = happyGoto action_3
action_78 (11) = happyGoto action_4
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (12) = happyShift action_5
action_79 (13) = happyShift action_6
action_79 (15) = happyShift action_7
action_79 (16) = happyShift action_8
action_79 (20) = happyShift action_9
action_79 (21) = happyShift action_10
action_79 (23) = happyShift action_11
action_79 (26) = happyShift action_12
action_79 (27) = happyShift action_13
action_79 (30) = happyShift action_14
action_79 (34) = happyShift action_15
action_79 (36) = happyShift action_16
action_79 (39) = happyShift action_17
action_79 (40) = happyShift action_18
action_79 (41) = happyShift action_19
action_79 (42) = happyShift action_20
action_79 (50) = happyShift action_21
action_79 (74) = happyShift action_22
action_79 (75) = happyShift action_23
action_79 (4) = happyGoto action_103
action_79 (5) = happyGoto action_2
action_79 (6) = happyGoto action_3
action_79 (11) = happyGoto action_4
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (47) = happyShift action_102
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (28) = happyShift action_101
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (32) = happyShift action_99
action_82 (33) = happyShift action_100
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (12) = happyShift action_5
action_83 (13) = happyShift action_6
action_83 (15) = happyShift action_7
action_83 (16) = happyShift action_8
action_83 (20) = happyShift action_9
action_83 (21) = happyShift action_10
action_83 (23) = happyShift action_11
action_83 (26) = happyShift action_12
action_83 (27) = happyShift action_13
action_83 (30) = happyShift action_14
action_83 (34) = happyShift action_15
action_83 (36) = happyShift action_16
action_83 (39) = happyShift action_17
action_83 (40) = happyShift action_18
action_83 (41) = happyShift action_19
action_83 (42) = happyShift action_20
action_83 (50) = happyShift action_21
action_83 (74) = happyShift action_22
action_83 (75) = happyShift action_23
action_83 (5) = happyGoto action_98
action_83 (6) = happyGoto action_3
action_83 (11) = happyGoto action_4
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (37) = happyShift action_96
action_84 (38) = happyShift action_97
action_84 _ = happyFail (happyExpListPerState 84)

action_85 _ = happyReduce_39

action_86 _ = happyReduce_40

action_87 _ = happyReduce_22

action_88 _ = happyReduce_23

action_89 _ = happyReduce_38

action_90 _ = happyReduce_5

action_91 _ = happyReduce_25

action_92 _ = happyReduce_24

action_93 _ = happyReduce_14

action_94 _ = happyReduce_13

action_95 _ = happyReduce_2

action_96 _ = happyReduce_16

action_97 _ = happyReduce_17

action_98 _ = happyReduce_20

action_99 (12) = happyShift action_5
action_99 (13) = happyShift action_6
action_99 (15) = happyShift action_7
action_99 (16) = happyShift action_8
action_99 (20) = happyShift action_9
action_99 (21) = happyShift action_10
action_99 (23) = happyShift action_11
action_99 (26) = happyShift action_12
action_99 (27) = happyShift action_13
action_99 (30) = happyShift action_14
action_99 (34) = happyShift action_15
action_99 (36) = happyShift action_16
action_99 (39) = happyShift action_17
action_99 (40) = happyShift action_18
action_99 (41) = happyShift action_19
action_99 (42) = happyShift action_20
action_99 (50) = happyShift action_21
action_99 (74) = happyShift action_22
action_99 (75) = happyShift action_23
action_99 (5) = happyGoto action_120
action_99 (6) = happyGoto action_3
action_99 (11) = happyGoto action_4
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (12) = happyShift action_5
action_100 (13) = happyShift action_6
action_100 (15) = happyShift action_7
action_100 (16) = happyShift action_8
action_100 (20) = happyShift action_9
action_100 (21) = happyShift action_10
action_100 (23) = happyShift action_11
action_100 (26) = happyShift action_12
action_100 (27) = happyShift action_13
action_100 (30) = happyShift action_14
action_100 (34) = happyShift action_15
action_100 (36) = happyShift action_16
action_100 (39) = happyShift action_17
action_100 (40) = happyShift action_18
action_100 (41) = happyShift action_19
action_100 (42) = happyShift action_20
action_100 (50) = happyShift action_21
action_100 (74) = happyShift action_22
action_100 (75) = happyShift action_23
action_100 (5) = happyGoto action_119
action_100 (6) = happyGoto action_3
action_100 (11) = happyGoto action_4
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (12) = happyShift action_5
action_101 (13) = happyShift action_6
action_101 (15) = happyShift action_7
action_101 (16) = happyShift action_8
action_101 (20) = happyShift action_9
action_101 (21) = happyShift action_10
action_101 (23) = happyShift action_11
action_101 (26) = happyShift action_12
action_101 (27) = happyShift action_13
action_101 (30) = happyShift action_14
action_101 (34) = happyShift action_15
action_101 (36) = happyShift action_16
action_101 (39) = happyShift action_17
action_101 (40) = happyShift action_18
action_101 (41) = happyShift action_19
action_101 (42) = happyShift action_20
action_101 (50) = happyShift action_21
action_101 (74) = happyShift action_22
action_101 (75) = happyShift action_23
action_101 (5) = happyGoto action_118
action_101 (6) = happyGoto action_3
action_101 (11) = happyGoto action_4
action_101 _ = happyFail (happyExpListPerState 101)

action_102 (12) = happyShift action_5
action_102 (13) = happyShift action_6
action_102 (15) = happyShift action_7
action_102 (16) = happyShift action_8
action_102 (20) = happyShift action_9
action_102 (21) = happyShift action_10
action_102 (23) = happyShift action_11
action_102 (26) = happyShift action_12
action_102 (27) = happyShift action_13
action_102 (30) = happyShift action_14
action_102 (34) = happyShift action_15
action_102 (36) = happyShift action_16
action_102 (39) = happyShift action_17
action_102 (40) = happyShift action_18
action_102 (41) = happyShift action_19
action_102 (42) = happyShift action_20
action_102 (50) = happyShift action_21
action_102 (74) = happyShift action_22
action_102 (75) = happyShift action_23
action_102 (4) = happyGoto action_117
action_102 (5) = happyGoto action_2
action_102 (6) = happyGoto action_3
action_102 (11) = happyGoto action_4
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (12) = happyShift action_5
action_103 (13) = happyShift action_6
action_103 (15) = happyShift action_7
action_103 (16) = happyShift action_8
action_103 (20) = happyShift action_9
action_103 (21) = happyShift action_10
action_103 (22) = happyShift action_116
action_103 (23) = happyShift action_11
action_103 (26) = happyShift action_12
action_103 (27) = happyShift action_13
action_103 (30) = happyShift action_14
action_103 (34) = happyShift action_15
action_103 (36) = happyShift action_16
action_103 (39) = happyShift action_17
action_103 (40) = happyShift action_18
action_103 (41) = happyShift action_19
action_103 (42) = happyShift action_20
action_103 (50) = happyShift action_21
action_103 (74) = happyShift action_22
action_103 (75) = happyShift action_23
action_103 (5) = happyGoto action_25
action_103 (6) = happyGoto action_3
action_103 (11) = happyGoto action_4
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (12) = happyShift action_5
action_104 (13) = happyShift action_6
action_104 (15) = happyShift action_7
action_104 (16) = happyShift action_8
action_104 (20) = happyShift action_9
action_104 (21) = happyShift action_10
action_104 (22) = happyShift action_115
action_104 (23) = happyShift action_11
action_104 (26) = happyShift action_12
action_104 (27) = happyShift action_13
action_104 (30) = happyShift action_14
action_104 (34) = happyShift action_15
action_104 (36) = happyShift action_16
action_104 (39) = happyShift action_17
action_104 (40) = happyShift action_18
action_104 (41) = happyShift action_19
action_104 (42) = happyShift action_20
action_104 (50) = happyShift action_21
action_104 (74) = happyShift action_22
action_104 (75) = happyShift action_23
action_104 (5) = happyGoto action_25
action_104 (6) = happyGoto action_3
action_104 (11) = happyGoto action_4
action_104 _ = happyFail (happyExpListPerState 104)

action_105 _ = happyReduce_6

action_106 (46) = happyShift action_114
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (49) = happyShift action_113
action_107 _ = happyReduce_44

action_108 (72) = happyShift action_109
action_108 (73) = happyShift action_110
action_108 (9) = happyGoto action_112
action_108 (10) = happyGoto action_108
action_108 _ = happyReduce_47

action_109 _ = happyReduce_49

action_110 _ = happyReduce_50

action_111 _ = happyReduce_4

action_112 _ = happyReduce_48

action_113 (72) = happyShift action_109
action_113 (73) = happyShift action_110
action_113 (8) = happyGoto action_123
action_113 (9) = happyGoto action_107
action_113 (10) = happyGoto action_108
action_113 _ = happyReduce_46

action_114 _ = happyReduce_43

action_115 _ = happyReduce_8

action_116 _ = happyReduce_9

action_117 (12) = happyShift action_5
action_117 (13) = happyShift action_6
action_117 (15) = happyShift action_7
action_117 (16) = happyShift action_8
action_117 (20) = happyShift action_9
action_117 (21) = happyShift action_10
action_117 (23) = happyShift action_11
action_117 (26) = happyShift action_12
action_117 (27) = happyShift action_13
action_117 (30) = happyShift action_14
action_117 (34) = happyShift action_15
action_117 (36) = happyShift action_16
action_117 (39) = happyShift action_17
action_117 (40) = happyShift action_18
action_117 (41) = happyShift action_19
action_117 (42) = happyShift action_20
action_117 (48) = happyShift action_122
action_117 (50) = happyShift action_21
action_117 (74) = happyShift action_22
action_117 (75) = happyShift action_23
action_117 (5) = happyGoto action_25
action_117 (6) = happyGoto action_3
action_117 (11) = happyGoto action_4
action_117 _ = happyFail (happyExpListPerState 117)

action_118 (29) = happyShift action_121
action_118 _ = happyFail (happyExpListPerState 118)

action_119 _ = happyReduce_19

action_120 _ = happyReduce_18

action_121 (74) = happyShift action_125
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (25) = happyShift action_124
action_122 _ = happyReduce_11

action_123 _ = happyReduce_45

action_124 (47) = happyShift action_126
action_124 _ = happyFail (happyExpListPerState 124)

action_125 _ = happyReduce_15

action_126 (12) = happyShift action_5
action_126 (13) = happyShift action_6
action_126 (15) = happyShift action_7
action_126 (16) = happyShift action_8
action_126 (20) = happyShift action_9
action_126 (21) = happyShift action_10
action_126 (23) = happyShift action_11
action_126 (26) = happyShift action_12
action_126 (27) = happyShift action_13
action_126 (30) = happyShift action_14
action_126 (34) = happyShift action_15
action_126 (36) = happyShift action_16
action_126 (39) = happyShift action_17
action_126 (40) = happyShift action_18
action_126 (41) = happyShift action_19
action_126 (42) = happyShift action_20
action_126 (50) = happyShift action_21
action_126 (74) = happyShift action_22
action_126 (75) = happyShift action_23
action_126 (4) = happyGoto action_127
action_126 (5) = happyGoto action_2
action_126 (6) = happyGoto action_3
action_126 (11) = happyGoto action_4
action_126 _ = happyFail (happyExpListPerState 126)

action_127 (12) = happyShift action_5
action_127 (13) = happyShift action_6
action_127 (15) = happyShift action_7
action_127 (16) = happyShift action_8
action_127 (20) = happyShift action_9
action_127 (21) = happyShift action_10
action_127 (23) = happyShift action_11
action_127 (26) = happyShift action_12
action_127 (27) = happyShift action_13
action_127 (30) = happyShift action_14
action_127 (34) = happyShift action_15
action_127 (36) = happyShift action_16
action_127 (39) = happyShift action_17
action_127 (40) = happyShift action_18
action_127 (41) = happyShift action_19
action_127 (42) = happyShift action_20
action_127 (48) = happyShift action_128
action_127 (50) = happyShift action_21
action_127 (74) = happyShift action_22
action_127 (75) = happyShift action_23
action_127 (5) = happyGoto action_25
action_127 (6) = happyGoto action_3
action_127 (11) = happyGoto action_4
action_127 _ = happyFail (happyExpListPerState 127)

action_128 _ = happyReduce_10

happyReduce_1 = happySpecReduce_2  4 happyReduction_1
happyReduction_1 _
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (TmStmt happy_var_1
	)
happyReduction_1 _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_3  4 happyReduction_2
happyReduction_2 _
	(HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (TmStmts happy_var_2 happy_var_1
	)
happyReduction_2 _ _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happyReduce 4 5 happyReduction_4
happyReduction_4 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdentifier _ happy_var_2)) `HappyStk`
	(HappyAbsSyn11  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (TmTypeAssign happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_5 = happySpecReduce_3  5 happyReduction_5
happyReduction_5 (HappyAbsSyn5  happy_var_3)
	_
	(HappyTerminal (TokenIdentifier _ happy_var_1))
	 =  HappyAbsSyn5
		 (TmAssign happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happyReduce 4 5 happyReduction_6
happyReduction_6 ((HappyTerminal (TokenIdentifier _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdentifier _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (TmImport happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_7 = happySpecReduce_2  5 happyReduction_7
happyReduction_7 (HappyTerminal (TokenIdentifier _ happy_var_2))
	_
	 =  HappyAbsSyn5
		 (TmPrint happy_var_2
	)
happyReduction_7 _ _  = notHappyAtAll 

happyReduce_8 = happyReduce 5 5 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (TmIterRepeat happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 5 5 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (TmIterWhile happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 10 5 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_9) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (TmIfThenElse happy_var_2 happy_var_5 happy_var_9
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 6 5 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (TmIfThen happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_3  5 happyReduction_12
happyReduction_12 (HappyAbsSyn7  happy_var_3)
	_
	_
	 =  HappyAbsSyn5
		 (TmCellList happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  5 happyReduction_13
happyReduction_13 (HappyTerminal (TokenIdentifier _ happy_var_3))
	_
	(HappyTerminal (TokenIdentifier _ happy_var_1))
	 =  HappyAbsSyn5
		 (TmAppendH happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  5 happyReduction_14
happyReduction_14 (HappyTerminal (TokenIdentifier _ happy_var_3))
	_
	(HappyTerminal (TokenIdentifier _ happy_var_1))
	 =  HappyAbsSyn5
		 (TmAppendV happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happyReduce 7 5 happyReduction_15
happyReduction_15 ((HappyTerminal (TokenIdentifier _ happy_var_7)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (TmTake happy_var_2 happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 4 5 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyTerminal (TokenIdentifier _ happy_var_3)) `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (TmRotateCW happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 4 5 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyTerminal (TokenIdentifier _ happy_var_3)) `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (TmRotateACW happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 5 5 happyReduction_18
happyReduction_18 ((HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdentifier _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (TmReflectRow happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 5 5 happyReduction_19
happyReduction_19 ((HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdentifier _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (TmReflectCol happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 4 5 happyReduction_20
happyReduction_20 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdentifier _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (TmExpand happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_21 = happySpecReduce_2  5 happyReduction_21
happyReduction_21 (HappyTerminal (TokenIdentifier _ happy_var_2))
	_
	 =  HappyAbsSyn5
		 (TmNeg happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  5 happyReduction_22
happyReduction_22 (HappyTerminal (TokenIdentifier _ happy_var_3))
	(HappyTerminal (TokenIdentifier _ happy_var_2))
	_
	 =  HappyAbsSyn5
		 (TmAnd happy_var_2 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  5 happyReduction_23
happyReduction_23 (HappyTerminal (TokenIdentifier _ happy_var_3))
	(HappyTerminal (TokenIdentifier _ happy_var_2))
	_
	 =  HappyAbsSyn5
		 (TmOr happy_var_2 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  5 happyReduction_24
happyReduction_24 (HappyAbsSyn5  happy_var_3)
	_
	(HappyTerminal (TokenIdentifier _ happy_var_1))
	 =  HappyAbsSyn5
		 (TmRepeatH happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  5 happyReduction_25
happyReduction_25 (HappyAbsSyn5  happy_var_3)
	_
	(HappyTerminal (TokenIdentifier _ happy_var_1))
	 =  HappyAbsSyn5
		 (TmRepeatV happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  6 happyReduction_26
happyReduction_26 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmDiv happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  6 happyReduction_27
happyReduction_27 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmTimes happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  6 happyReduction_28
happyReduction_28 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmPlus happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  6 happyReduction_29
happyReduction_29 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmMinus happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  6 happyReduction_30
happyReduction_30 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmAndOp happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  6 happyReduction_31
happyReduction_31 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmOrOp happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  6 happyReduction_32
happyReduction_32 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmComLT happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  6 happyReduction_33
happyReduction_33 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmComGT happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  6 happyReduction_34
happyReduction_34 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmComGTEQ happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  6 happyReduction_35
happyReduction_35 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmComLTEQ happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  6 happyReduction_36
happyReduction_36 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmComEQ happy_var_1 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  6 happyReduction_37
happyReduction_37 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmComNOT happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  6 happyReduction_38
happyReduction_38 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (TmParen happy_var_2
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  6 happyReduction_39
happyReduction_39 (HappyTerminal (TokenIdentifier _ happy_var_3))
	_
	_
	 =  HappyAbsSyn6
		 (TmGetLength happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  6 happyReduction_40
happyReduction_40 (HappyTerminal (TokenIdentifier _ happy_var_3))
	_
	_
	 =  HappyAbsSyn6
		 (TmGetWidth happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  6 happyReduction_41
happyReduction_41 (HappyTerminal (TokenInteger _ happy_var_1))
	 =  HappyAbsSyn6
		 (TmInt happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  6 happyReduction_42
happyReduction_42 (HappyTerminal (TokenIdentifier _ happy_var_1))
	 =  HappyAbsSyn6
		 (TmVar happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  7 happyReduction_43
happyReduction_43 _
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (happy_var_2
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  8 happyReduction_44
happyReduction_44 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  8 happyReduction_45
happyReduction_45 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 : happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_0  8 happyReduction_46
happyReduction_46  =  HappyAbsSyn8
		 ([]
	)

happyReduce_47 = happySpecReduce_1  9 happyReduction_47
happyReduction_47 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_2  9 happyReduction_48
happyReduction_48 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 : happy_var_2
	)
happyReduction_48 _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_1  10 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn10
		 (TmBlank
	)

happyReduce_50 = happySpecReduce_1  10 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn10
		 (TmFilled
	)

happyReduce_51 = happySpecReduce_1  11 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn11
		 (IntType
	)

happyReduce_52 = happySpecReduce_1  11 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn11
		 (BaseType
	)

happyNewToken action sts stk [] =
	action 76 76 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenTypeBase _ -> cont 12;
	TokenTypeInt _ -> cont 13;
	TokenTypeBool _ -> cont 14;
	TokenCells _ -> cont 15;
	TokenImport _ -> cont 16;
	TokenAs _ -> cont 17;
	TokenWidth _ -> cont 18;
	TokenLength _ -> cont 19;
	TokenRepeat _ -> cont 20;
	TokenWhile _ -> cont 21;
	TokenEnd _ -> cont 22;
	TokenIf _ -> cont 23;
	TokenThen _ -> cont 24;
	TokenElse _ -> cont 25;
	TokenPrint _ -> cont 26;
	TokenTake _ -> cont 27;
	TokenSize _ -> cont 28;
	TokenFrom _ -> cont 29;
	TokenReflect _ -> cont 30;
	TokenOn _ -> cont 31;
	TokenRow _ -> cont 32;
	TokenCol _ -> cont 33;
	TokenExpand _ -> cont 34;
	TokenBy _ -> cont 35;
	TokenRotate _ -> cont 36;
	TokenDirCw _ -> cont 37;
	TokenDirAcw _ -> cont 38;
	TokenGet _ -> cont 39;
	TokenNeg _ -> cont 40;
	TokenAnd _ -> cont 41;
	TokenOr _ -> cont 42;
	TokenFile _ -> cont 43;
	TokenDo _ -> cont 44;
	TokenLBracket _ -> cont 45;
	TokenRBracket _ -> cont 46;
	TokenLCurBracket _ -> cont 47;
	TokenRCurBracket _ -> cont 48;
	TokenBar _ -> cont 49;
	TokenLParen _ -> cont 50;
	TokenRParen _ -> cont 51;
	TokenSem _ -> cont 52;
	TokenColon _ -> cont 53;
	TokenAppHor _ -> cont 54;
	TokenAppVer _ -> cont 55;
	TokenAndOp _ -> cont 56;
	TokenOrOp _ -> cont 57;
	TokenMulHor _ -> cont 58;
	TokenMulVer _ -> cont 59;
	TokenDiv _ -> cont 60;
	TokenMul _ -> cont 61;
	TokenPlus _ -> cont 62;
	TokenMinus _ -> cont 63;
	TokenAssign _ -> cont 64;
	TokenLT _ -> cont 65;
	TokenGT _ -> cont 66;
	TokenGTE _ -> cont 67;
	TokenLTE _ -> cont 68;
	TokenEQ _ -> cont 69;
	TokenNEQ _ -> cont 70;
	TokenDot _ -> cont 71;
	TokenBlank _ -> cont 72;
	TokenFilled _ -> cont 73;
	TokenIdentifier _ happy_dollar_dollar -> cont 74;
	TokenInteger _ happy_dollar_dollar -> cont 75;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 76 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parseCalc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error." 
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t) ++ "\n")

data Type = IntType
          | BaseType
          | BoolType
          | NoType
  deriving (Show, Eq, Ord)

data Exp = TmDiv Exp Exp
             | TmTimes Exp Exp
             | TmPlus Exp Exp
             | TmMinus Exp Exp
             | TmParen Exp
             | TmGetLength String
             | TmGetWidth String
             | TmInt Int
             | TmAndOp Exp Exp
             | TmOrOp Exp Exp
             | TmComLT Exp Exp
             | TmComGT Exp Exp
             | TmComGTEQ Exp Exp
             | TmComLTEQ Exp Exp
             | TmComEQ Exp Exp
             | TmTypeAssign Type String Exp 
             | TmAssign String Exp
             | TmImport String String
             | TmPrint String
             | TmIterRepeat Exp Exp
             | TmIterWhile Exp Exp
             | TmIfThenElse Exp Exp Exp
             | TmIfThen Exp Exp
             | TmCellList [[Exp]]
             | TmAppendH String String
             | TmAppendV String String
             | TmVar String
             | TmBool Bool
             | TmFilled
             | TmBlank
             | TmTake Exp Exp Exp String
             | TmReflectRow String Exp 
             | TmReflectCol String Exp 
             | TmExpand String Exp
             | TmNeg String
             | TmAnd String String
             | TmOr String String
             | TmRepeatH String Exp
             | TmRepeatV String Exp
             | TmRotateCW Exp String 
             | TmRotateACW Exp String
             | TmComNOT Exp Exp
             | TmStmt Exp
             | TmStmts Exp Exp
  deriving (Show, Eq, Ord)
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}







# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "/usr/lib/ghc/include/ghcversion.h" #-}















{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "/tmp/ghc8336_0/ghc_2.h" #-}
































































































































































































{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 









{-# LINE 43 "templates/GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList







{-# LINE 65 "templates/GenericTemplate.hs" #-}

{-# LINE 75 "templates/GenericTemplate.hs" #-}

{-# LINE 84 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 137 "templates/GenericTemplate.hs" #-}

{-# LINE 147 "templates/GenericTemplate.hs" #-}
indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
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
     = case happyDrop (k - ((1) :: Int)) sts of
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





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 267 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 333 "templates/GenericTemplate.hs" #-}
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
