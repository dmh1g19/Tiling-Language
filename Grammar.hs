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
happyExpList = Happy_Data_Array.listArray (0,347) ([63488,17807,31074,64,32768,7,0,0,0,0,64,0,0,0,0,0,0,0,0,61456,34,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,512,0,0,0,0,0,0,32,36856,25157,16505,0,1920,0,0,0,4,0,63488,17807,31074,64,32768,7,0,0,1024,0,0,0,0,0,0,512,0,0,0,0,8192,0,0,0,0,0,2,0,0,1024,0,0,24576,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,2,0,0,0,0,32,36856,25157,16505,0,1920,0,0,0,0,0,0,0,0,0,0,0,0,0,49152,12,0,0,0,0,0,512,0,0,0,0,8192,0,0,0,0,0,4,0,0,0,0,64,0,0,32768,12033,2,0,0,0,0,8192,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,512,0,0,0,0,8192,63488,17807,31074,64,32768,7,0,2048,0,0,0,0,32768,0,0,0,0,16384,0,0,0,63488,17807,31074,64,32768,7,32768,0,4096,8944,0,36856,25157,16505,0,1920,0,0,4096,61456,34,0,16,0,0,0,0,0,0,32,0,0,0,0,512,0,0,0,0,0,0,1,63488,17807,31074,64,32768,32775,22783,38436,1031,0,120,36856,25157,16505,0,1920,65408,9304,1942,4,30720,63488,17807,31074,64,32768,32775,22783,38436,1031,0,120,36856,25157,16505,0,1920,0,0,0,0,32,0,0,0,0,527,0,0,0,0,8208,0,0,0,0,2816,2,0,0,0,36864,32,0,0,0,0,512,0,0,0,0,8944,0,36856,25157,16505,0,1920,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,512,0,0,0,0,8192,63488,17807,31074,64,32768,7,0,0,6144,8944,0,0,0,2048,0,0,0,0,0,61456,290,0,0,24,0,0,32768,22783,38436,1031,0,120,36856,25157,16505,0,1920,0,0,0,61464,34,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,63488,17807,31074,64,32768,32775,22783,38436,1031,0,120,36856,25157,16505,0,1920,65408,9304,1942,4,30720,0,0,0,1,0,0,8192,0,4096,8944,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,2,0,0,0,0,0,4096,0,0,0,0,8192,0,0,0,0,0,1024,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,63488,17807,31074,64,32768,7,0,0,4352,8944,0,0,0,32768,12033,2,0,0,0,0,0,0,0,0,0,0,0,0,24576,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,0,1,0,0,0,0,2,0,12033,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,63488,17807,31074,64,32768,7,0,16,4096,8944,0,36856,25157,16505,0,1920,0,0,0,61457,34,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","exp","listCell","cellList","cellsl","listTile","tileList","tile","type","Tile","Base","Int","Bool","TileList","CellList","cells","tiles","import","as","width","length","repeat","while","end","if","then","else","print","take","size","from","reflect","on","row","col","expand","shrink","by","rotate","CW","ACW","get","neg","and","or","file","do","'['","']'","'{'","'}'","'|'","'('","')'","';'","':'","'-&'","'+&'","'&&'","'||'","'-*'","'+*'","'/'","'*'","'+'","'-'","'='","'<'","'>'","'>='","'<='","'=='","'!='","'.'","','","'0'","'1'","True","False","var","int","%eof"]
        bit_start = st * 84
        bit_end = (st + 1) * 84
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..83]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (12) = happyShift action_5
action_0 (13) = happyShift action_6
action_0 (14) = happyShift action_7
action_0 (15) = happyShift action_8
action_0 (16) = happyShift action_9
action_0 (17) = happyShift action_10
action_0 (18) = happyShift action_11
action_0 (19) = happyShift action_12
action_0 (20) = happyShift action_13
action_0 (24) = happyShift action_14
action_0 (25) = happyShift action_15
action_0 (27) = happyShift action_16
action_0 (31) = happyShift action_17
action_0 (34) = happyShift action_18
action_0 (38) = happyShift action_19
action_0 (39) = happyShift action_20
action_0 (41) = happyShift action_21
action_0 (44) = happyShift action_22
action_0 (45) = happyShift action_23
action_0 (46) = happyShift action_24
action_0 (47) = happyShift action_25
action_0 (55) = happyShift action_26
action_0 (80) = happyShift action_27
action_0 (81) = happyShift action_28
action_0 (82) = happyShift action_29
action_0 (83) = happyShift action_2
action_0 (4) = happyGoto action_3
action_0 (11) = happyGoto action_4
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (83) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (57) = happyShift action_52
action_3 (65) = happyShift action_53
action_3 (66) = happyShift action_54
action_3 (67) = happyShift action_55
action_3 (68) = happyShift action_56
action_3 (70) = happyShift action_57
action_3 (74) = happyShift action_58
action_3 (84) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (82) = happyShift action_51
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_49

action_6 _ = happyReduce_50

action_7 _ = happyReduce_48

action_8 _ = happyReduce_51

action_9 _ = happyReduce_53

action_10 _ = happyReduce_52

action_11 (58) = happyShift action_50
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (58) = happyShift action_49
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (82) = happyShift action_48
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (12) = happyShift action_5
action_14 (13) = happyShift action_6
action_14 (14) = happyShift action_7
action_14 (15) = happyShift action_8
action_14 (16) = happyShift action_9
action_14 (17) = happyShift action_10
action_14 (18) = happyShift action_11
action_14 (19) = happyShift action_12
action_14 (20) = happyShift action_13
action_14 (24) = happyShift action_14
action_14 (25) = happyShift action_15
action_14 (27) = happyShift action_16
action_14 (31) = happyShift action_17
action_14 (34) = happyShift action_18
action_14 (38) = happyShift action_19
action_14 (39) = happyShift action_20
action_14 (41) = happyShift action_21
action_14 (44) = happyShift action_22
action_14 (45) = happyShift action_23
action_14 (46) = happyShift action_24
action_14 (47) = happyShift action_25
action_14 (55) = happyShift action_26
action_14 (80) = happyShift action_27
action_14 (81) = happyShift action_28
action_14 (82) = happyShift action_29
action_14 (83) = happyShift action_2
action_14 (4) = happyGoto action_47
action_14 (11) = happyGoto action_4
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (55) = happyShift action_46
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (12) = happyShift action_5
action_16 (13) = happyShift action_6
action_16 (14) = happyShift action_7
action_16 (15) = happyShift action_8
action_16 (16) = happyShift action_9
action_16 (17) = happyShift action_10
action_16 (18) = happyShift action_11
action_16 (19) = happyShift action_12
action_16 (20) = happyShift action_13
action_16 (24) = happyShift action_14
action_16 (25) = happyShift action_15
action_16 (27) = happyShift action_16
action_16 (31) = happyShift action_17
action_16 (34) = happyShift action_18
action_16 (38) = happyShift action_19
action_16 (39) = happyShift action_20
action_16 (41) = happyShift action_21
action_16 (44) = happyShift action_22
action_16 (45) = happyShift action_23
action_16 (46) = happyShift action_24
action_16 (47) = happyShift action_25
action_16 (55) = happyShift action_26
action_16 (80) = happyShift action_27
action_16 (81) = happyShift action_28
action_16 (82) = happyShift action_29
action_16 (83) = happyShift action_2
action_16 (4) = happyGoto action_45
action_16 (11) = happyGoto action_4
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (55) = happyShift action_44
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (82) = happyShift action_43
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (82) = happyShift action_42
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (82) = happyShift action_41
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (55) = happyShift action_40
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (22) = happyShift action_38
action_22 (23) = happyShift action_39
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (82) = happyShift action_37
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (82) = happyShift action_36
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (82) = happyShift action_35
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (12) = happyShift action_5
action_26 (13) = happyShift action_6
action_26 (14) = happyShift action_7
action_26 (15) = happyShift action_8
action_26 (16) = happyShift action_9
action_26 (17) = happyShift action_10
action_26 (18) = happyShift action_11
action_26 (19) = happyShift action_12
action_26 (20) = happyShift action_13
action_26 (24) = happyShift action_14
action_26 (25) = happyShift action_15
action_26 (27) = happyShift action_16
action_26 (31) = happyShift action_17
action_26 (34) = happyShift action_18
action_26 (38) = happyShift action_19
action_26 (39) = happyShift action_20
action_26 (41) = happyShift action_21
action_26 (44) = happyShift action_22
action_26 (45) = happyShift action_23
action_26 (46) = happyShift action_24
action_26 (47) = happyShift action_25
action_26 (55) = happyShift action_26
action_26 (80) = happyShift action_27
action_26 (81) = happyShift action_28
action_26 (82) = happyShift action_29
action_26 (83) = happyShift action_2
action_26 (4) = happyGoto action_34
action_26 (11) = happyGoto action_4
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_3

action_28 _ = happyReduce_4

action_29 (59) = happyShift action_30
action_29 (60) = happyShift action_31
action_29 (63) = happyShift action_32
action_29 (64) = happyShift action_33
action_29 _ = happyReduce_2

action_30 (82) = happyShift action_88
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (82) = happyShift action_87
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (83) = happyShift action_86
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (83) = happyShift action_85
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (56) = happyShift action_84
action_34 (57) = happyShift action_52
action_34 (65) = happyShift action_53
action_34 (66) = happyShift action_54
action_34 (67) = happyShift action_55
action_34 (68) = happyShift action_56
action_34 (70) = happyShift action_57
action_34 (74) = happyShift action_58
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (82) = happyShift action_83
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (82) = happyShift action_82
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_34

action_38 (82) = happyShift action_81
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (82) = happyShift action_80
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (12) = happyShift action_5
action_40 (13) = happyShift action_6
action_40 (14) = happyShift action_7
action_40 (15) = happyShift action_8
action_40 (16) = happyShift action_9
action_40 (17) = happyShift action_10
action_40 (18) = happyShift action_11
action_40 (19) = happyShift action_12
action_40 (20) = happyShift action_13
action_40 (24) = happyShift action_14
action_40 (25) = happyShift action_15
action_40 (27) = happyShift action_16
action_40 (31) = happyShift action_17
action_40 (34) = happyShift action_18
action_40 (38) = happyShift action_19
action_40 (39) = happyShift action_20
action_40 (41) = happyShift action_21
action_40 (44) = happyShift action_22
action_40 (45) = happyShift action_23
action_40 (46) = happyShift action_24
action_40 (47) = happyShift action_25
action_40 (55) = happyShift action_26
action_40 (80) = happyShift action_27
action_40 (81) = happyShift action_28
action_40 (82) = happyShift action_29
action_40 (83) = happyShift action_2
action_40 (4) = happyGoto action_79
action_40 (11) = happyGoto action_4
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (40) = happyShift action_78
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (40) = happyShift action_77
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (35) = happyShift action_76
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (12) = happyShift action_5
action_44 (13) = happyShift action_6
action_44 (14) = happyShift action_7
action_44 (15) = happyShift action_8
action_44 (16) = happyShift action_9
action_44 (17) = happyShift action_10
action_44 (18) = happyShift action_11
action_44 (19) = happyShift action_12
action_44 (20) = happyShift action_13
action_44 (24) = happyShift action_14
action_44 (25) = happyShift action_15
action_44 (27) = happyShift action_16
action_44 (31) = happyShift action_17
action_44 (34) = happyShift action_18
action_44 (38) = happyShift action_19
action_44 (39) = happyShift action_20
action_44 (41) = happyShift action_21
action_44 (44) = happyShift action_22
action_44 (45) = happyShift action_23
action_44 (46) = happyShift action_24
action_44 (47) = happyShift action_25
action_44 (55) = happyShift action_26
action_44 (80) = happyShift action_27
action_44 (81) = happyShift action_28
action_44 (82) = happyShift action_29
action_44 (83) = happyShift action_2
action_44 (4) = happyGoto action_75
action_44 (11) = happyGoto action_4
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (28) = happyShift action_74
action_45 (57) = happyShift action_52
action_45 (65) = happyShift action_53
action_45 (66) = happyShift action_54
action_45 (67) = happyShift action_55
action_45 (68) = happyShift action_56
action_45 (70) = happyShift action_57
action_45 (74) = happyShift action_58
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (12) = happyShift action_5
action_46 (13) = happyShift action_6
action_46 (14) = happyShift action_7
action_46 (15) = happyShift action_8
action_46 (16) = happyShift action_9
action_46 (17) = happyShift action_10
action_46 (18) = happyShift action_11
action_46 (19) = happyShift action_12
action_46 (20) = happyShift action_13
action_46 (24) = happyShift action_14
action_46 (25) = happyShift action_15
action_46 (27) = happyShift action_16
action_46 (31) = happyShift action_17
action_46 (34) = happyShift action_18
action_46 (38) = happyShift action_19
action_46 (39) = happyShift action_20
action_46 (41) = happyShift action_21
action_46 (44) = happyShift action_22
action_46 (45) = happyShift action_23
action_46 (46) = happyShift action_24
action_46 (47) = happyShift action_25
action_46 (55) = happyShift action_26
action_46 (80) = happyShift action_27
action_46 (81) = happyShift action_28
action_46 (82) = happyShift action_29
action_46 (83) = happyShift action_2
action_46 (4) = happyGoto action_73
action_46 (11) = happyGoto action_4
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (49) = happyShift action_72
action_47 (57) = happyShift action_52
action_47 (65) = happyShift action_53
action_47 (66) = happyShift action_54
action_47 (67) = happyShift action_55
action_47 (68) = happyShift action_56
action_47 (70) = happyShift action_57
action_47 (74) = happyShift action_58
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (21) = happyShift action_71
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (50) = happyShift action_70
action_49 (8) = happyGoto action_69
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (50) = happyShift action_68
action_50 (5) = happyGoto action_67
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (69) = happyShift action_66
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (12) = happyShift action_5
action_52 (13) = happyShift action_6
action_52 (14) = happyShift action_7
action_52 (15) = happyShift action_8
action_52 (16) = happyShift action_9
action_52 (17) = happyShift action_10
action_52 (18) = happyShift action_11
action_52 (19) = happyShift action_12
action_52 (20) = happyShift action_13
action_52 (24) = happyShift action_14
action_52 (25) = happyShift action_15
action_52 (27) = happyShift action_16
action_52 (31) = happyShift action_17
action_52 (34) = happyShift action_18
action_52 (38) = happyShift action_19
action_52 (39) = happyShift action_20
action_52 (41) = happyShift action_21
action_52 (44) = happyShift action_22
action_52 (45) = happyShift action_23
action_52 (46) = happyShift action_24
action_52 (47) = happyShift action_25
action_52 (55) = happyShift action_26
action_52 (80) = happyShift action_27
action_52 (81) = happyShift action_28
action_52 (82) = happyShift action_29
action_52 (83) = happyShift action_2
action_52 (4) = happyGoto action_65
action_52 (11) = happyGoto action_4
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (12) = happyShift action_5
action_53 (13) = happyShift action_6
action_53 (14) = happyShift action_7
action_53 (15) = happyShift action_8
action_53 (16) = happyShift action_9
action_53 (17) = happyShift action_10
action_53 (18) = happyShift action_11
action_53 (19) = happyShift action_12
action_53 (20) = happyShift action_13
action_53 (24) = happyShift action_14
action_53 (25) = happyShift action_15
action_53 (27) = happyShift action_16
action_53 (31) = happyShift action_17
action_53 (34) = happyShift action_18
action_53 (38) = happyShift action_19
action_53 (39) = happyShift action_20
action_53 (41) = happyShift action_21
action_53 (44) = happyShift action_22
action_53 (45) = happyShift action_23
action_53 (46) = happyShift action_24
action_53 (47) = happyShift action_25
action_53 (55) = happyShift action_26
action_53 (80) = happyShift action_27
action_53 (81) = happyShift action_28
action_53 (82) = happyShift action_29
action_53 (83) = happyShift action_2
action_53 (4) = happyGoto action_64
action_53 (11) = happyGoto action_4
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (12) = happyShift action_5
action_54 (13) = happyShift action_6
action_54 (14) = happyShift action_7
action_54 (15) = happyShift action_8
action_54 (16) = happyShift action_9
action_54 (17) = happyShift action_10
action_54 (18) = happyShift action_11
action_54 (19) = happyShift action_12
action_54 (20) = happyShift action_13
action_54 (24) = happyShift action_14
action_54 (25) = happyShift action_15
action_54 (27) = happyShift action_16
action_54 (31) = happyShift action_17
action_54 (34) = happyShift action_18
action_54 (38) = happyShift action_19
action_54 (39) = happyShift action_20
action_54 (41) = happyShift action_21
action_54 (44) = happyShift action_22
action_54 (45) = happyShift action_23
action_54 (46) = happyShift action_24
action_54 (47) = happyShift action_25
action_54 (55) = happyShift action_26
action_54 (80) = happyShift action_27
action_54 (81) = happyShift action_28
action_54 (82) = happyShift action_29
action_54 (83) = happyShift action_2
action_54 (4) = happyGoto action_63
action_54 (11) = happyGoto action_4
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (12) = happyShift action_5
action_55 (13) = happyShift action_6
action_55 (14) = happyShift action_7
action_55 (15) = happyShift action_8
action_55 (16) = happyShift action_9
action_55 (17) = happyShift action_10
action_55 (18) = happyShift action_11
action_55 (19) = happyShift action_12
action_55 (20) = happyShift action_13
action_55 (24) = happyShift action_14
action_55 (25) = happyShift action_15
action_55 (27) = happyShift action_16
action_55 (31) = happyShift action_17
action_55 (34) = happyShift action_18
action_55 (38) = happyShift action_19
action_55 (39) = happyShift action_20
action_55 (41) = happyShift action_21
action_55 (44) = happyShift action_22
action_55 (45) = happyShift action_23
action_55 (46) = happyShift action_24
action_55 (47) = happyShift action_25
action_55 (55) = happyShift action_26
action_55 (80) = happyShift action_27
action_55 (81) = happyShift action_28
action_55 (82) = happyShift action_29
action_55 (83) = happyShift action_2
action_55 (4) = happyGoto action_62
action_55 (11) = happyGoto action_4
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (12) = happyShift action_5
action_56 (13) = happyShift action_6
action_56 (14) = happyShift action_7
action_56 (15) = happyShift action_8
action_56 (16) = happyShift action_9
action_56 (17) = happyShift action_10
action_56 (18) = happyShift action_11
action_56 (19) = happyShift action_12
action_56 (20) = happyShift action_13
action_56 (24) = happyShift action_14
action_56 (25) = happyShift action_15
action_56 (27) = happyShift action_16
action_56 (31) = happyShift action_17
action_56 (34) = happyShift action_18
action_56 (38) = happyShift action_19
action_56 (39) = happyShift action_20
action_56 (41) = happyShift action_21
action_56 (44) = happyShift action_22
action_56 (45) = happyShift action_23
action_56 (46) = happyShift action_24
action_56 (47) = happyShift action_25
action_56 (55) = happyShift action_26
action_56 (80) = happyShift action_27
action_56 (81) = happyShift action_28
action_56 (82) = happyShift action_29
action_56 (83) = happyShift action_2
action_56 (4) = happyGoto action_61
action_56 (11) = happyGoto action_4
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (12) = happyShift action_5
action_57 (13) = happyShift action_6
action_57 (14) = happyShift action_7
action_57 (15) = happyShift action_8
action_57 (16) = happyShift action_9
action_57 (17) = happyShift action_10
action_57 (18) = happyShift action_11
action_57 (19) = happyShift action_12
action_57 (20) = happyShift action_13
action_57 (24) = happyShift action_14
action_57 (25) = happyShift action_15
action_57 (27) = happyShift action_16
action_57 (31) = happyShift action_17
action_57 (34) = happyShift action_18
action_57 (38) = happyShift action_19
action_57 (39) = happyShift action_20
action_57 (41) = happyShift action_21
action_57 (44) = happyShift action_22
action_57 (45) = happyShift action_23
action_57 (46) = happyShift action_24
action_57 (47) = happyShift action_25
action_57 (55) = happyShift action_26
action_57 (80) = happyShift action_27
action_57 (81) = happyShift action_28
action_57 (82) = happyShift action_29
action_57 (83) = happyShift action_2
action_57 (4) = happyGoto action_60
action_57 (11) = happyGoto action_4
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (12) = happyShift action_5
action_58 (13) = happyShift action_6
action_58 (14) = happyShift action_7
action_58 (15) = happyShift action_8
action_58 (16) = happyShift action_9
action_58 (17) = happyShift action_10
action_58 (18) = happyShift action_11
action_58 (19) = happyShift action_12
action_58 (20) = happyShift action_13
action_58 (24) = happyShift action_14
action_58 (25) = happyShift action_15
action_58 (27) = happyShift action_16
action_58 (31) = happyShift action_17
action_58 (34) = happyShift action_18
action_58 (38) = happyShift action_19
action_58 (39) = happyShift action_20
action_58 (41) = happyShift action_21
action_58 (44) = happyShift action_22
action_58 (45) = happyShift action_23
action_58 (46) = happyShift action_24
action_58 (47) = happyShift action_25
action_58 (55) = happyShift action_26
action_58 (80) = happyShift action_27
action_58 (81) = happyShift action_28
action_58 (82) = happyShift action_29
action_58 (83) = happyShift action_2
action_58 (4) = happyGoto action_59
action_58 (11) = happyGoto action_4
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (74) = happyShift action_58
action_59 _ = happyReduce_6

action_60 (65) = happyShift action_53
action_60 (66) = happyShift action_54
action_60 (67) = happyShift action_55
action_60 (68) = happyShift action_56
action_60 (74) = happyShift action_58
action_60 _ = happyReduce_5

action_61 (65) = happyShift action_53
action_61 (74) = happyShift action_58
action_61 _ = happyReduce_10

action_62 (65) = happyShift action_53
action_62 (66) = happyShift action_54
action_62 (68) = happyShift action_56
action_62 (74) = happyShift action_58
action_62 _ = happyReduce_8

action_63 (65) = happyShift action_53
action_63 (68) = happyShift action_56
action_63 (74) = happyShift action_58
action_63 _ = happyReduce_9

action_64 (74) = happyShift action_58
action_64 _ = happyReduce_11

action_65 (65) = happyShift action_53
action_65 (66) = happyShift action_54
action_65 (67) = happyShift action_55
action_65 (68) = happyShift action_56
action_65 (70) = happyShift action_57
action_65 (74) = happyShift action_58
action_65 _ = happyReduce_15

action_66 (12) = happyShift action_5
action_66 (13) = happyShift action_6
action_66 (14) = happyShift action_7
action_66 (15) = happyShift action_8
action_66 (16) = happyShift action_9
action_66 (17) = happyShift action_10
action_66 (18) = happyShift action_11
action_66 (19) = happyShift action_12
action_66 (20) = happyShift action_13
action_66 (24) = happyShift action_14
action_66 (25) = happyShift action_15
action_66 (27) = happyShift action_16
action_66 (31) = happyShift action_17
action_66 (34) = happyShift action_18
action_66 (38) = happyShift action_19
action_66 (39) = happyShift action_20
action_66 (41) = happyShift action_21
action_66 (44) = happyShift action_22
action_66 (45) = happyShift action_23
action_66 (46) = happyShift action_24
action_66 (47) = happyShift action_25
action_66 (55) = happyShift action_26
action_66 (80) = happyShift action_27
action_66 (81) = happyShift action_28
action_66 (82) = happyShift action_29
action_66 (83) = happyShift action_2
action_66 (4) = happyGoto action_105
action_66 (11) = happyGoto action_4
action_66 _ = happyFail (happyExpListPerState 66)

action_67 _ = happyReduce_19

action_68 (83) = happyShift action_104
action_68 (6) = happyGoto action_102
action_68 (7) = happyGoto action_103
action_68 _ = happyReduce_40

action_69 _ = happyReduce_20

action_70 (82) = happyShift action_101
action_70 (9) = happyGoto action_99
action_70 (10) = happyGoto action_100
action_70 _ = happyReduce_46

action_71 (82) = happyShift action_98
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (12) = happyShift action_5
action_72 (13) = happyShift action_6
action_72 (14) = happyShift action_7
action_72 (15) = happyShift action_8
action_72 (16) = happyShift action_9
action_72 (17) = happyShift action_10
action_72 (18) = happyShift action_11
action_72 (19) = happyShift action_12
action_72 (20) = happyShift action_13
action_72 (24) = happyShift action_14
action_72 (25) = happyShift action_15
action_72 (27) = happyShift action_16
action_72 (31) = happyShift action_17
action_72 (34) = happyShift action_18
action_72 (38) = happyShift action_19
action_72 (39) = happyShift action_20
action_72 (41) = happyShift action_21
action_72 (44) = happyShift action_22
action_72 (45) = happyShift action_23
action_72 (46) = happyShift action_24
action_72 (47) = happyShift action_25
action_72 (55) = happyShift action_26
action_72 (80) = happyShift action_27
action_72 (81) = happyShift action_28
action_72 (82) = happyShift action_29
action_72 (83) = happyShift action_2
action_72 (4) = happyGoto action_97
action_72 (11) = happyGoto action_4
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (56) = happyShift action_96
action_73 (57) = happyShift action_52
action_73 (65) = happyShift action_53
action_73 (66) = happyShift action_54
action_73 (67) = happyShift action_55
action_73 (68) = happyShift action_56
action_73 (70) = happyShift action_57
action_73 (74) = happyShift action_58
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (52) = happyShift action_95
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (57) = happyShift action_52
action_75 (65) = happyShift action_53
action_75 (66) = happyShift action_54
action_75 (67) = happyShift action_55
action_75 (68) = happyShift action_56
action_75 (70) = happyShift action_57
action_75 (74) = happyShift action_58
action_75 (77) = happyShift action_94
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (36) = happyShift action_92
action_76 (37) = happyShift action_93
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (12) = happyShift action_5
action_77 (13) = happyShift action_6
action_77 (14) = happyShift action_7
action_77 (15) = happyShift action_8
action_77 (16) = happyShift action_9
action_77 (17) = happyShift action_10
action_77 (18) = happyShift action_11
action_77 (19) = happyShift action_12
action_77 (20) = happyShift action_13
action_77 (24) = happyShift action_14
action_77 (25) = happyShift action_15
action_77 (27) = happyShift action_16
action_77 (31) = happyShift action_17
action_77 (34) = happyShift action_18
action_77 (38) = happyShift action_19
action_77 (39) = happyShift action_20
action_77 (41) = happyShift action_21
action_77 (44) = happyShift action_22
action_77 (45) = happyShift action_23
action_77 (46) = happyShift action_24
action_77 (47) = happyShift action_25
action_77 (55) = happyShift action_26
action_77 (80) = happyShift action_27
action_77 (81) = happyShift action_28
action_77 (82) = happyShift action_29
action_77 (83) = happyShift action_2
action_77 (4) = happyGoto action_91
action_77 (11) = happyGoto action_4
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (12) = happyShift action_5
action_78 (13) = happyShift action_6
action_78 (14) = happyShift action_7
action_78 (15) = happyShift action_8
action_78 (16) = happyShift action_9
action_78 (17) = happyShift action_10
action_78 (18) = happyShift action_11
action_78 (19) = happyShift action_12
action_78 (20) = happyShift action_13
action_78 (24) = happyShift action_14
action_78 (25) = happyShift action_15
action_78 (27) = happyShift action_16
action_78 (31) = happyShift action_17
action_78 (34) = happyShift action_18
action_78 (38) = happyShift action_19
action_78 (39) = happyShift action_20
action_78 (41) = happyShift action_21
action_78 (44) = happyShift action_22
action_78 (45) = happyShift action_23
action_78 (46) = happyShift action_24
action_78 (47) = happyShift action_25
action_78 (55) = happyShift action_26
action_78 (80) = happyShift action_27
action_78 (81) = happyShift action_28
action_78 (82) = happyShift action_29
action_78 (83) = happyShift action_2
action_78 (4) = happyGoto action_90
action_78 (11) = happyGoto action_4
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (56) = happyShift action_89
action_79 (57) = happyShift action_52
action_79 (65) = happyShift action_53
action_79 (66) = happyShift action_54
action_79 (67) = happyShift action_55
action_79 (68) = happyShift action_56
action_79 (70) = happyShift action_57
action_79 (74) = happyShift action_58
action_79 _ = happyFail (happyExpListPerState 79)

action_80 _ = happyReduce_21

action_81 _ = happyReduce_22

action_82 _ = happyReduce_35

action_83 _ = happyReduce_36

action_84 _ = happyReduce_16

action_85 _ = happyReduce_33

action_86 _ = happyReduce_32

action_87 _ = happyReduce_31

action_88 _ = happyReduce_30

action_89 (82) = happyShift action_117
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (57) = happyShift action_52
action_90 (65) = happyShift action_53
action_90 (66) = happyShift action_54
action_90 (67) = happyShift action_55
action_90 (68) = happyShift action_56
action_90 (70) = happyShift action_57
action_90 (74) = happyShift action_58
action_90 _ = happyReduce_24

action_91 (57) = happyShift action_52
action_91 (65) = happyShift action_53
action_91 (66) = happyShift action_54
action_91 (67) = happyShift action_55
action_91 (68) = happyShift action_56
action_91 (70) = happyShift action_57
action_91 (74) = happyShift action_58
action_91 _ = happyReduce_23

action_92 (12) = happyShift action_5
action_92 (13) = happyShift action_6
action_92 (14) = happyShift action_7
action_92 (15) = happyShift action_8
action_92 (16) = happyShift action_9
action_92 (17) = happyShift action_10
action_92 (18) = happyShift action_11
action_92 (19) = happyShift action_12
action_92 (20) = happyShift action_13
action_92 (24) = happyShift action_14
action_92 (25) = happyShift action_15
action_92 (27) = happyShift action_16
action_92 (31) = happyShift action_17
action_92 (34) = happyShift action_18
action_92 (38) = happyShift action_19
action_92 (39) = happyShift action_20
action_92 (41) = happyShift action_21
action_92 (44) = happyShift action_22
action_92 (45) = happyShift action_23
action_92 (46) = happyShift action_24
action_92 (47) = happyShift action_25
action_92 (55) = happyShift action_26
action_92 (80) = happyShift action_27
action_92 (81) = happyShift action_28
action_92 (82) = happyShift action_29
action_92 (83) = happyShift action_2
action_92 (4) = happyGoto action_116
action_92 (11) = happyGoto action_4
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (12) = happyShift action_5
action_93 (13) = happyShift action_6
action_93 (14) = happyShift action_7
action_93 (15) = happyShift action_8
action_93 (16) = happyShift action_9
action_93 (17) = happyShift action_10
action_93 (18) = happyShift action_11
action_93 (19) = happyShift action_12
action_93 (20) = happyShift action_13
action_93 (24) = happyShift action_14
action_93 (25) = happyShift action_15
action_93 (27) = happyShift action_16
action_93 (31) = happyShift action_17
action_93 (34) = happyShift action_18
action_93 (38) = happyShift action_19
action_93 (39) = happyShift action_20
action_93 (41) = happyShift action_21
action_93 (44) = happyShift action_22
action_93 (45) = happyShift action_23
action_93 (46) = happyShift action_24
action_93 (47) = happyShift action_25
action_93 (55) = happyShift action_26
action_93 (80) = happyShift action_27
action_93 (81) = happyShift action_28
action_93 (82) = happyShift action_29
action_93 (83) = happyShift action_2
action_93 (4) = happyGoto action_115
action_93 (11) = happyGoto action_4
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (12) = happyShift action_5
action_94 (13) = happyShift action_6
action_94 (14) = happyShift action_7
action_94 (15) = happyShift action_8
action_94 (16) = happyShift action_9
action_94 (17) = happyShift action_10
action_94 (18) = happyShift action_11
action_94 (19) = happyShift action_12
action_94 (20) = happyShift action_13
action_94 (24) = happyShift action_14
action_94 (25) = happyShift action_15
action_94 (27) = happyShift action_16
action_94 (31) = happyShift action_17
action_94 (34) = happyShift action_18
action_94 (38) = happyShift action_19
action_94 (39) = happyShift action_20
action_94 (41) = happyShift action_21
action_94 (44) = happyShift action_22
action_94 (45) = happyShift action_23
action_94 (46) = happyShift action_24
action_94 (47) = happyShift action_25
action_94 (55) = happyShift action_26
action_94 (80) = happyShift action_27
action_94 (81) = happyShift action_28
action_94 (82) = happyShift action_29
action_94 (83) = happyShift action_2
action_94 (4) = happyGoto action_114
action_94 (11) = happyGoto action_4
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (12) = happyShift action_5
action_95 (13) = happyShift action_6
action_95 (14) = happyShift action_7
action_95 (15) = happyShift action_8
action_95 (16) = happyShift action_9
action_95 (17) = happyShift action_10
action_95 (18) = happyShift action_11
action_95 (19) = happyShift action_12
action_95 (20) = happyShift action_13
action_95 (24) = happyShift action_14
action_95 (25) = happyShift action_15
action_95 (27) = happyShift action_16
action_95 (31) = happyShift action_17
action_95 (34) = happyShift action_18
action_95 (38) = happyShift action_19
action_95 (39) = happyShift action_20
action_95 (41) = happyShift action_21
action_95 (44) = happyShift action_22
action_95 (45) = happyShift action_23
action_95 (46) = happyShift action_24
action_95 (47) = happyShift action_25
action_95 (55) = happyShift action_26
action_95 (80) = happyShift action_27
action_95 (81) = happyShift action_28
action_95 (82) = happyShift action_29
action_95 (83) = happyShift action_2
action_95 (4) = happyGoto action_113
action_95 (11) = happyGoto action_4
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (49) = happyShift action_112
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (26) = happyShift action_111
action_97 (57) = happyShift action_52
action_97 (65) = happyShift action_53
action_97 (66) = happyShift action_54
action_97 (67) = happyShift action_55
action_97 (68) = happyShift action_56
action_97 (70) = happyShift action_57
action_97 (74) = happyShift action_58
action_97 _ = happyFail (happyExpListPerState 97)

action_98 _ = happyReduce_29

action_99 (51) = happyShift action_110
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (54) = happyShift action_109
action_100 _ = happyReduce_44

action_101 _ = happyReduce_47

action_102 (51) = happyShift action_108
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (54) = happyShift action_107
action_103 _ = happyReduce_38

action_104 (77) = happyShift action_106
action_104 _ = happyReduce_41

action_105 (74) = happyShift action_58
action_105 _ = happyReduce_7

action_106 (83) = happyShift action_104
action_106 (7) = happyGoto action_125
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (83) = happyShift action_104
action_107 (6) = happyGoto action_124
action_107 (7) = happyGoto action_103
action_107 _ = happyReduce_40

action_108 _ = happyReduce_37

action_109 (82) = happyShift action_101
action_109 (9) = happyGoto action_123
action_109 (10) = happyGoto action_100
action_109 _ = happyReduce_46

action_110 _ = happyReduce_43

action_111 _ = happyReduce_17

action_112 (12) = happyShift action_5
action_112 (13) = happyShift action_6
action_112 (14) = happyShift action_7
action_112 (15) = happyShift action_8
action_112 (16) = happyShift action_9
action_112 (17) = happyShift action_10
action_112 (18) = happyShift action_11
action_112 (19) = happyShift action_12
action_112 (20) = happyShift action_13
action_112 (24) = happyShift action_14
action_112 (25) = happyShift action_15
action_112 (27) = happyShift action_16
action_112 (31) = happyShift action_17
action_112 (34) = happyShift action_18
action_112 (38) = happyShift action_19
action_112 (39) = happyShift action_20
action_112 (41) = happyShift action_21
action_112 (44) = happyShift action_22
action_112 (45) = happyShift action_23
action_112 (46) = happyShift action_24
action_112 (47) = happyShift action_25
action_112 (55) = happyShift action_26
action_112 (80) = happyShift action_27
action_112 (81) = happyShift action_28
action_112 (82) = happyShift action_29
action_112 (83) = happyShift action_2
action_112 (4) = happyGoto action_122
action_112 (11) = happyGoto action_4
action_112 _ = happyFail (happyExpListPerState 112)

action_113 (53) = happyShift action_121
action_113 (57) = happyShift action_52
action_113 (65) = happyShift action_53
action_113 (66) = happyShift action_54
action_113 (67) = happyShift action_55
action_113 (68) = happyShift action_56
action_113 (70) = happyShift action_57
action_113 (74) = happyShift action_58
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (56) = happyShift action_120
action_114 (57) = happyShift action_52
action_114 (65) = happyShift action_53
action_114 (66) = happyShift action_54
action_114 (67) = happyShift action_55
action_114 (68) = happyShift action_56
action_114 (70) = happyShift action_57
action_114 (74) = happyShift action_58
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (57) = happyShift action_52
action_115 (65) = happyShift action_53
action_115 (66) = happyShift action_54
action_115 (67) = happyShift action_55
action_115 (68) = happyShift action_56
action_115 (70) = happyShift action_57
action_115 (74) = happyShift action_58
action_115 _ = happyReduce_28

action_116 (57) = happyShift action_52
action_116 (65) = happyShift action_53
action_116 (66) = happyShift action_54
action_116 (67) = happyShift action_55
action_116 (68) = happyShift action_56
action_116 (70) = happyShift action_57
action_116 (74) = happyShift action_58
action_116 _ = happyReduce_27

action_117 (42) = happyShift action_118
action_117 (43) = happyShift action_119
action_117 _ = happyFail (happyExpListPerState 117)

action_118 _ = happyReduce_25

action_119 _ = happyReduce_26

action_120 (32) = happyShift action_128
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (29) = happyShift action_127
action_121 _ = happyReduce_14

action_122 (26) = happyShift action_126
action_122 (57) = happyShift action_52
action_122 (65) = happyShift action_53
action_122 (66) = happyShift action_54
action_122 (67) = happyShift action_55
action_122 (68) = happyShift action_56
action_122 (70) = happyShift action_57
action_122 (74) = happyShift action_58
action_122 _ = happyFail (happyExpListPerState 122)

action_123 _ = happyReduce_45

action_124 _ = happyReduce_39

action_125 _ = happyReduce_42

action_126 _ = happyReduce_18

action_127 (52) = happyShift action_130
action_127 _ = happyFail (happyExpListPerState 127)

action_128 (12) = happyShift action_5
action_128 (13) = happyShift action_6
action_128 (14) = happyShift action_7
action_128 (15) = happyShift action_8
action_128 (16) = happyShift action_9
action_128 (17) = happyShift action_10
action_128 (18) = happyShift action_11
action_128 (19) = happyShift action_12
action_128 (20) = happyShift action_13
action_128 (24) = happyShift action_14
action_128 (25) = happyShift action_15
action_128 (27) = happyShift action_16
action_128 (31) = happyShift action_17
action_128 (34) = happyShift action_18
action_128 (38) = happyShift action_19
action_128 (39) = happyShift action_20
action_128 (41) = happyShift action_21
action_128 (44) = happyShift action_22
action_128 (45) = happyShift action_23
action_128 (46) = happyShift action_24
action_128 (47) = happyShift action_25
action_128 (55) = happyShift action_26
action_128 (80) = happyShift action_27
action_128 (81) = happyShift action_28
action_128 (82) = happyShift action_29
action_128 (83) = happyShift action_2
action_128 (4) = happyGoto action_129
action_128 (11) = happyGoto action_4
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (33) = happyShift action_132
action_129 (57) = happyShift action_52
action_129 (65) = happyShift action_53
action_129 (66) = happyShift action_54
action_129 (67) = happyShift action_55
action_129 (68) = happyShift action_56
action_129 (70) = happyShift action_57
action_129 (74) = happyShift action_58
action_129 _ = happyFail (happyExpListPerState 129)

action_130 (12) = happyShift action_5
action_130 (13) = happyShift action_6
action_130 (14) = happyShift action_7
action_130 (15) = happyShift action_8
action_130 (16) = happyShift action_9
action_130 (17) = happyShift action_10
action_130 (18) = happyShift action_11
action_130 (19) = happyShift action_12
action_130 (20) = happyShift action_13
action_130 (24) = happyShift action_14
action_130 (25) = happyShift action_15
action_130 (27) = happyShift action_16
action_130 (31) = happyShift action_17
action_130 (34) = happyShift action_18
action_130 (38) = happyShift action_19
action_130 (39) = happyShift action_20
action_130 (41) = happyShift action_21
action_130 (44) = happyShift action_22
action_130 (45) = happyShift action_23
action_130 (46) = happyShift action_24
action_130 (47) = happyShift action_25
action_130 (55) = happyShift action_26
action_130 (80) = happyShift action_27
action_130 (81) = happyShift action_28
action_130 (82) = happyShift action_29
action_130 (83) = happyShift action_2
action_130 (4) = happyGoto action_131
action_130 (11) = happyGoto action_4
action_130 _ = happyFail (happyExpListPerState 130)

action_131 (53) = happyShift action_134
action_131 (57) = happyShift action_52
action_131 (65) = happyShift action_53
action_131 (66) = happyShift action_54
action_131 (67) = happyShift action_55
action_131 (68) = happyShift action_56
action_131 (70) = happyShift action_57
action_131 (74) = happyShift action_58
action_131 _ = happyFail (happyExpListPerState 131)

action_132 (82) = happyShift action_133
action_132 _ = happyFail (happyExpListPerState 132)

action_133 _ = happyReduce_12

action_134 _ = happyReduce_13

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyTerminal (TokenInteger _ happy_var_1))
	 =  HappyAbsSyn4
		 (TmInt happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyTerminal (TokenIdentifier _ happy_var_1))
	 =  HappyAbsSyn4
		 (TmVar happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 _
	 =  HappyAbsSyn4
		 (TmTrue
	)

happyReduce_4 = happySpecReduce_1  4 happyReduction_4
happyReduction_4 _
	 =  HappyAbsSyn4
		 (TmFalse
	)

happyReduce_5 = happySpecReduce_3  4 happyReduction_5
happyReduction_5 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (TmComLT happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  4 happyReduction_6
happyReduction_6 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (TmComEQ happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happyReduce 4 4 happyReduction_7
happyReduction_7 ((HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdentifier _ happy_var_2)) `HappyStk`
	(HappyAbsSyn11  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmTypeAssign happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_3  4 happyReduction_8
happyReduction_8 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (TmPlus happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  4 happyReduction_9
happyReduction_9 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (TmTimes happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  4 happyReduction_10
happyReduction_10 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (TmMinus happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  4 happyReduction_11
happyReduction_11 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (TmDiv happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happyReduce 10 4 happyReduction_12
happyReduction_12 ((HappyTerminal (TokenIdentifier _ happy_var_10)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmTake happy_var_3 happy_var_5 happy_var_8 happy_var_10
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 10 4 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_9) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmIfThenElse happy_var_2 happy_var_5 happy_var_9
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 6 4 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmIfThen happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_3  4 happyReduction_15
happyReduction_15 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (TmCont happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  4 happyReduction_16
happyReduction_16 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happyReduce 5 4 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmIterRepeat happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 7 4 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmIterWhile happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_3  4 happyReduction_19
happyReduction_19 (HappyAbsSyn5  happy_var_3)
	_
	_
	 =  HappyAbsSyn4
		 (TmCellList happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  4 happyReduction_20
happyReduction_20 (HappyAbsSyn8  happy_var_3)
	_
	_
	 =  HappyAbsSyn4
		 (TmTileList happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  4 happyReduction_21
happyReduction_21 (HappyTerminal (TokenIdentifier _ happy_var_3))
	_
	_
	 =  HappyAbsSyn4
		 (TmGetLength happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  4 happyReduction_22
happyReduction_22 (HappyTerminal (TokenIdentifier _ happy_var_3))
	_
	_
	 =  HappyAbsSyn4
		 (TmGetWidth happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happyReduce 4 4 happyReduction_23
happyReduction_23 ((HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdentifier _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmExpand happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 4 4 happyReduction_24
happyReduction_24 ((HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdentifier _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmShrink happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_25 = happyReduce 6 4 happyReduction_25
happyReduction_25 (_ `HappyStk`
	(HappyTerminal (TokenIdentifier _ happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmRotateCW happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_26 = happyReduce 6 4 happyReduction_26
happyReduction_26 (_ `HappyStk`
	(HappyTerminal (TokenIdentifier _ happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmRotateACW happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_27 = happyReduce 5 4 happyReduction_27
happyReduction_27 ((HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdentifier _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmReflectRow happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_28 = happyReduce 5 4 happyReduction_28
happyReduction_28 ((HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdentifier _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmReflectCol happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_29 = happyReduce 4 4 happyReduction_29
happyReduction_29 ((HappyTerminal (TokenIdentifier _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdentifier _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmImport happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_30 = happySpecReduce_3  4 happyReduction_30
happyReduction_30 (HappyTerminal (TokenIdentifier _ happy_var_3))
	_
	(HappyTerminal (TokenIdentifier _ happy_var_1))
	 =  HappyAbsSyn4
		 (TmAppendH happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  4 happyReduction_31
happyReduction_31 (HappyTerminal (TokenIdentifier _ happy_var_3))
	_
	(HappyTerminal (TokenIdentifier _ happy_var_1))
	 =  HappyAbsSyn4
		 (TmAppendV happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  4 happyReduction_32
happyReduction_32 (HappyTerminal (TokenInteger _ happy_var_3))
	_
	(HappyTerminal (TokenIdentifier _ happy_var_1))
	 =  HappyAbsSyn4
		 (TmRepeatH happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  4 happyReduction_33
happyReduction_33 (HappyTerminal (TokenInteger _ happy_var_3))
	_
	(HappyTerminal (TokenIdentifier _ happy_var_1))
	 =  HappyAbsSyn4
		 (TmRepeatV happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_2  4 happyReduction_34
happyReduction_34 (HappyTerminal (TokenIdentifier _ happy_var_2))
	_
	 =  HappyAbsSyn4
		 (TmNeg happy_var_2
	)
happyReduction_34 _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  4 happyReduction_35
happyReduction_35 (HappyTerminal (TokenIdentifier _ happy_var_3))
	(HappyTerminal (TokenIdentifier _ happy_var_2))
	_
	 =  HappyAbsSyn4
		 (TmAnd happy_var_2 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  4 happyReduction_36
happyReduction_36 (HappyTerminal (TokenIdentifier _ happy_var_3))
	(HappyTerminal (TokenIdentifier _ happy_var_2))
	_
	 =  HappyAbsSyn4
		 (TmOr happy_var_2 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  5 happyReduction_37
happyReduction_37 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  6 happyReduction_38
happyReduction_38 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  6 happyReduction_39
happyReduction_39 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 : happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_0  6 happyReduction_40
happyReduction_40  =  HappyAbsSyn6
		 ([]
	)

happyReduce_41 = happySpecReduce_1  7 happyReduction_41
happyReduction_41 (HappyTerminal (TokenInteger _ happy_var_1))
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  7 happyReduction_42
happyReduction_42 (HappyAbsSyn7  happy_var_3)
	_
	(HappyTerminal (TokenInteger _ happy_var_1))
	 =  HappyAbsSyn7
		 (happy_var_1 : happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  8 happyReduction_43
happyReduction_43 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (happy_var_2
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  9 happyReduction_44
happyReduction_44 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  9 happyReduction_45
happyReduction_45 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 : happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_0  9 happyReduction_46
happyReduction_46  =  HappyAbsSyn9
		 ([]
	)

happyReduce_47 = happySpecReduce_1  10 happyReduction_47
happyReduction_47 (HappyTerminal (TokenIdentifier _ happy_var_1))
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  11 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn11
		 (IntType
	)

happyReduce_49 = happySpecReduce_1  11 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn11
		 (TileType
	)

happyReduce_50 = happySpecReduce_1  11 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn11
		 (BaseType
	)

happyReduce_51 = happySpecReduce_1  11 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn11
		 (BoolType
	)

happyReduce_52 = happySpecReduce_1  11 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn11
		 (CellListType
	)

happyReduce_53 = happySpecReduce_1  11 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn11
		 (TileListType
	)

happyNewToken action sts stk [] =
	action 84 84 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenTypeTile _ -> cont 12;
	TokenTypeBase _ -> cont 13;
	TokenTypeInt _ -> cont 14;
	TokenTypeBool _ -> cont 15;
	TokenTileListType _ -> cont 16;
	TokenCellListType _ -> cont 17;
	TokenCells _ -> cont 18;
	TokenTiles _ -> cont 19;
	TokenImport _ -> cont 20;
	TokenAs _ -> cont 21;
	TokenWidth _ -> cont 22;
	TokenLength _ -> cont 23;
	TokenRepeat _ -> cont 24;
	TokenWhile _ -> cont 25;
	TokenEnd _ -> cont 26;
	TokenIf _ -> cont 27;
	TokenThen _ -> cont 28;
	TokenElse _ -> cont 29;
	TokenPrint _ -> cont 30;
	TokenTake _ -> cont 31;
	TokenSize _ -> cont 32;
	TokenFrom _ -> cont 33;
	TokenReflect _ -> cont 34;
	TokenOn _ -> cont 35;
	TokenRow _ -> cont 36;
	TokenCol _ -> cont 37;
	TokenExpand _ -> cont 38;
	TokenShrink _ -> cont 39;
	TokenBy _ -> cont 40;
	TokenRotate _ -> cont 41;
	TokenDirCw _ -> cont 42;
	TokenDirAcw _ -> cont 43;
	TokenGet _ -> cont 44;
	TokenNeg _ -> cont 45;
	TokenAnd _ -> cont 46;
	TokenOr _ -> cont 47;
	TokenFile _ -> cont 48;
	TokenDo _ -> cont 49;
	TokenLBracket _ -> cont 50;
	TokenRBracket _ -> cont 51;
	TokenLCurBracket _ -> cont 52;
	TokenRCurBracket _ -> cont 53;
	TokenBar _ -> cont 54;
	TokenLParen _ -> cont 55;
	TokenRParen _ -> cont 56;
	TokenSem _ -> cont 57;
	TokenColon _ -> cont 58;
	TokenAppHor _ -> cont 59;
	TokenAppVer _ -> cont 60;
	TokenAndOp _ -> cont 61;
	TokenOrOp _ -> cont 62;
	TokenMulHor _ -> cont 63;
	TokenMulVer _ -> cont 64;
	TokenDiv _ -> cont 65;
	TokenMul _ -> cont 66;
	TokenPlus _ -> cont 67;
	TokenMinus _ -> cont 68;
	TokenAssign _ -> cont 69;
	TokenLT _ -> cont 70;
	TokenGT _ -> cont 71;
	TokenGTE _ -> cont 72;
	TokenLTE _ -> cont 73;
	TokenEQ _ -> cont 74;
	TokenNEQ _ -> cont 75;
	TokenDot _ -> cont 76;
	TokenComma _ -> cont 77;
	TokenBlank _ -> cont 78;
	TokenFilled _ -> cont 79;
	TokenTrue _ -> cont 80;
	TokenFalse _ -> cont 81;
	TokenIdentifier _ happy_dollar_dollar -> cont 82;
	TokenInteger _ happy_dollar_dollar -> cont 83;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 84 tk tks = happyError' (tks, explist)
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
          | TileType 
          | BaseType 
          | BoolType
          | CellListType
          | TileListType
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
             | TmExp Exp
             | TmComLTEQ Exp Exp
             | TmComEQ Exp Exp
             | TmTypeAssign Type String Exp 
             | TmImport String String
             | TmPrint String
             | TmIterRepeat Exp Exp
             | TmIterWhile Exp Exp
             | TmIfThenElse Exp Exp Exp
             | TmIfThen Exp Exp
             | TmNumExpr Exp
             | TmCellList [[Int]]
             | TmTileList [String]
             | TmAppendH String String
             | TmAppendV String String
             | TmVar String
             | TmTrue 
             | TmFalse
             | TmFilled
             | TmBlank
             | TmTake Exp Exp Exp String
             | TmReflectRow String Exp 
             | TmReflectCol String Exp 
             | TmExpand String Exp
             | TmShrink String Exp
             | TmNeg String
             | TmAnd String String
             | TmOr String String
             | TmRepeatH String Int
             | TmRepeatV String Int
             | TmRotateCW Exp String 
             | TmRotateACW Exp String
             | TmComNOT Exp Exp
             | TmCont Exp Exp
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
