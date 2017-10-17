/****************************************************************************
 VendorID.h

 Created: David A. Hoatson, December 2000
	
 Copyright � 2000 Lynx Studio Technology, Inc.

 This software contains the valuable TRADE SECRETS and CONFIDENTIAL INFORMATION 
 of Lynx Studio Technology, Inc. The software is protected under copyright 
 laws as an unpublished work of Lynx Studio Technology, Inc.  Notice is 
 for informational purposes only and does not imply publication.  The user 
 of this software may make copies of the software for use with products 
 manufactured by Lynx Studio Technology, Inc. or under license from 
 Lynx Studio Technology, Inc. and for no other use.

 THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
 KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
 PURPOSE.

 Environment: 

 4 spaces per tab

 Revision History
 
 When      Who  Description
 --------- ---  ------------------------------------------------------------
****************************************************************************/

#ifndef _VENDORID_H
#define _VENDORID_H

typedef struct
{
	USHORT	usVendorID;
	char *	pszName;
} PCIVENDORINFO, *PPCIVENDORINFO;

PCIVENDORINFO	gPCIVendorInfo[] = 
{
	{ 0x0000, "Gammagraphx, Inc." },
	{ 0x001A, "Ascend Communications, Inc." },
	{ 0x0033, "Paradyne Corp." },
	{ 0x003D, "Lockheed Martin Corp" },
	{ 0x0070, "Hauppauge Computer Works Inc." },
	{ 0x0100, "Ncipher Corp. Ltd" },
	{ 0x0123, "General Dynamics" },
	{ 0x0675, "Dynalink" },
	{ 0x0A89, "BREA Technologies Inc." },
	{ 0x0E11, "Compaq Computer Corp." },
	{ 0x1000, "LSI Logic" },
	{ 0x1001, "Kolter Electronic - Germany" },
	{ 0x1002, "ATI Technologies" },
	{ 0x1003, "ULSI" },
	{ 0x1004, "VLSI Technology" },
	{ 0x1005, "Avance Logic Inc." },
	{ 0x1006, "Reply Group" },
	{ 0x1007, "Netframe Systems" },
	{ 0x1008, "Epson" },
	{ 0x100A, "Phoenix Technologies Ltd." },
	{ 0x100B, "National Semiconductor" },
	{ 0x100C, "Tseng Labs" },
	{ 0x100D, "AST Research" },
	{ 0x100E, "Weitek" },
	{ 0x1010, "Video Logic Ltd." },
	{ 0x1011, "Digital Equipment Corporation" },
	{ 0x1012, "Micronics Computers Inc." },
	{ 0x1013, "Cirrus Logic" },
	{ 0x1014, "IBM" },
	{ 0x1015, "LSI Logic Corp of Canada" },
	{ 0x1016, "Fujitsu ICL Computers" },
	{ 0x1017, "Spea Software AG" },
	{ 0x1018, "Unisys Systems" },
	{ 0x1019, "Elitegroup Computer Sys" },
	{ 0x101A, "NCR/AT&T GIS" },
	{ 0x101B, "Vitesse Semiconductor" },
	{ 0x101C, "Western Digital" },
	{ 0x101E, "American Megatrends Inc." },
	{ 0x101F, "PictureTel Corp." },
	{ 0x1020, "Hitachi Computer Electronics" },
	{ 0x1021, "Oki Electric Industry" },
	{ 0x1022, "Advanced Micro Devices" },
	{ 0x1023, "Trident Microsystems" },
	{ 0x1024, "Zenith Data Systems" },
	{ 0x1025, "Acer Incorporated" },
	{ 0x1028, "Dell Computer Corporation" },
	{ 0x1029, "Siemens Nixdorf AG" },
	{ 0x102A, "LSI Logic Headland Div" },
	{ 0x102B, "Matrox" },
	{ 0x102C, "Chips And Technologies" },
	{ 0x102D, "Wyse Technologies" },
	{ 0x102E, "Olivetti Advanced Technology" },
	{ 0x102F, "Toshiba America" },
	{ 0x1030, "TMC Research" },
	{ 0x1031, "miro Computer Products AG" },
	{ 0x1032, "Compaq" },
	{ 0x1033, "NEC Corporation" },
	{ 0x1034, "Burndy Corporation" },
	{ 0x1035, "Computer&Communication Research Lab" },
	{ 0x1036, "Future Domain" },
	{ 0x1037, "Hitachi Micro Systems Inc" },
	{ 0x1038, "AMP Incorporated" },
	{ 0x1039, "Silicon Integrated System" },
	{ 0x103A, "Seiko Epson Corporation" },
	{ 0x103B, "Tatung Corp. Of America" },
	{ 0x103C, "Hewlett-Packard Company" },
	{ 0x103E, "Solliday Engineering" },
	{ 0x103F, "Logic Modeling" },
	{ 0x1040, "Kubota Pacific Computer Inc." },
	{ 0x1041, "Computrend" },
	{ 0x1042, "PC Technology" },
	{ 0x1043, "Asustek Computer Inc." },
	{ 0x1044, "Distributed Processing Tech" },
	{ 0x1045, "OPTi Inc." },
	{ 0x1046, "IPC Corporation LTD" },
	{ 0x1047, "Genoa Systems Corp." },
	{ 0x1048, "ELSA AG" },
	{ 0x1049, "Fountain Technology" },
	{ 0x104A, "ST Microelectronics" },
	{ 0x104B, "Mylex Corporation" },
	{ 0x104C, "Texas Instruments" },
	{ 0x104D, "Sony Corporation" },
	{ 0x104E, "Oak Technology" },
	{ 0x104F, "Co-Time Computer Ltd." },
	{ 0x1050, "Winbond Electronics Corp." },
	{ 0x1051, "Anigma Corp." },
	{ 0x1052, "Young Micro Systems" },
	{ 0x1054, "Hitachi LTD" },
	{ 0x1055, "EFAR Microsystems" },
	{ 0x1056, "ICL" },
	{ 0x1057, "Motorola" },
	{ 0x1058, "Electronics & Telecommunication Res" },
	{ 0x1059, "Teknor Microsystems" },
	{ 0x105A, "Promise Technology" },
	{ 0x105B, "Foxconn International" },
	{ 0x105C, "Wipro Infotech Limited" },
	{ 0x105D, "Number Nine Visual Technology" },
	{ 0x105E, "Vtech Engineering Canada Ltd." },
	{ 0x105F, "Infotronic America Inc." },
	{ 0x1060, "United Microelectronics" },
	{ 0x1061, "8x8 Inc." },
	{ 0x1062, "Maspar Computer Corp." },
	{ 0x1063, "Ocean Office Automation" },
	{ 0x1064, "Alcatel Cit" },
	{ 0x1065, "Texas Microsystems" },
	{ 0x1066, "Picopower Technology" },
	{ 0x1067, "Mitsubishi Electronics" },
	{ 0x1068, "Diversified Technology" },
	{ 0x1069, "Mylex Corporation" },
	{ 0x106A, "Aten Research Inc." },
	{ 0x106B, "Apple Computer Inc." },
	{ 0x106C, "Hyundai Electronics America" },
	{ 0x106D, "Sequent" },
	{ 0x106E, "DFI Inc." },
	{ 0x106F, "City Gate Development LTD" },
	{ 0x1070, "Daewoo Telecom Ltd." },
	{ 0x1071, "Mitac" },
	{ 0x1072, "GIT Co. Ltd." },
	{ 0x1073, "Yamaha Corporation" },
	{ 0x1074, "Nexgen Microsysteme" },
	{ 0x1075, "Advanced Integration Research" },
	{ 0x1076, "Chaintech Computer Co. Ltd." },
	{ 0x1077, "Q Logic" },
	{ 0x1078, "Cyrix Corporation" },
	{ 0x1079, "I-Bus" },
	{ 0x107A, "Networth" },
	{ 0x107B, "Gateway 2000" },
	{ 0x107C, "Goldstar Co. Ltd." },
	{ 0x107D, "Leadtek Research" },
	{ 0x107E, "Interphase Corporation" },
	{ 0x107F, "Data Technology Corporation" },
	{ 0x1080, "Contaq Microsystems" },
	{ 0x1081, "Supermac Technology Inc." },
	{ 0x1082, "EFA Corporation Of America" },
	{ 0x1083, "Forex Computer Corporation" },
	{ 0x1084, "Parador" },
	{ 0x1085, "Tulip Computers Int'l BV" },
	{ 0x1086, "J. Bond Computer Systems" },
	{ 0x1087, "Cache Computer" },
	{ 0x1088, "Microcomputer Systems (M) Son" },
	{ 0x1089, "Data General Corporation" },
	{ 0x108A, "Bit3 Computer" },
	{ 0x108C, "Elonex PLC c/o Oakleigh Systems Inc." },
	{ 0x108D, "Olicom" },
	{ 0x108E, "Sun Microsystems" },
	{ 0x108F, "Systemsoft Corporation" },
	{ 0x1090, "Encore Computer Corporation" },
	{ 0x1091, "Intergraph Corporation" },
	{ 0x1092, "Diamond Computer Systems" },
	{ 0x1093, "National Instruments" },
	{ 0x1094, "First Int'l Computers" },
	{ 0x1095, "CMD Technology Inc." },
	{ 0x1096, "Alacron" },
	{ 0x1097, "Appian Graphics" },
	{ 0x1098, "Quantum Designs Ltd." },
	{ 0x1099, "Samsung Electronics Co. Ltd." },
	{ 0x109A, "Packard Bell" },
	{ 0x109B, "Gemlight Computer Ltd." },
	{ 0x109C, "Megachips Corporation" },
	{ 0x109D, "Zida Technologies Ltd." },
	{ 0x109E, "Brooktree Corporation" },
	{ 0x109F, "Trigem Computer Inc." },
	{ 0x10A0, "Meidensha Corporation" },
	{ 0x10A1, "Juko Electronics Inc. Ltd." },
	{ 0x10A2, "Quantum Corporation" },
	{ 0x10A3, "Everex Systems Inc." },
	{ 0x10A4, "Globe Manufacturing Sales" },
	{ 0x10A5, "Racal Interlan" },
	{ 0x10A6, "Informtech Industrial Ltd." },
	{ 0x10A7, "Benchmarq Microelectronics" },
	{ 0x10A8, "Sierra Semiconductor" },
	{ 0x10A9, "Silicon Graphics" },
	{ 0x10AA, "ACC Microelectronics" },
	{ 0x10AB, "Digicom" },
	{ 0x10AC, "Honeywell IASD" },
	{ 0x10AD, "Symphony Labs" },
	{ 0x10AE, "Cornerstone Technology" },
	{ 0x10AF, "Micro Computer Systems Inc." },
	{ 0x10B0, "Cardexpert Technology" },
	{ 0x10B1, "Cabletron Systems Inc." },
	{ 0x10B2, "Raytheon Company" },
	{ 0x10B3, "Databook Inc." },
	{ 0x10B4, "STB Systems" },
	{ 0x10B5, "PLX Technology" },
	{ 0x10B6, "Madge Networks" },
	{ 0x10B7, "3Com Corporation" },
	{ 0x10B8, "Standard Microsystems Corporation" },
	{ 0x10B9, "Acer Labs Inc." },
	{ 0x10BA, "Mitsubishi Electronics Corp." },
	{ 0x10BB, "Dapha Electronics Corporation" },
	{ 0x10BC, "Advanced Logic Research Inc." },
	{ 0x10BD, "Surecom Technology" },
	{ 0x10BE, "Tsenglabs International Corp." },
	{ 0x10BF, "MOST Corp." },
	{ 0x10C0, "Boca Research Inc." },
	{ 0x10C1, "ICM Corp. Ltd." },
	{ 0x10C2, "Auspex Systems Inc." },
	{ 0x10C3, "Samsung Semiconductors" },
	{ 0x10C4, "Award Software Int'l Inc." },
	{ 0x10C5, "Xerox Corporation" },
	{ 0x10C6, "Rambus Inc." },
	{ 0x10C7, "Media Vision" },
	{ 0x10C8, "Neomagic Corporation" },
	{ 0x10C9, "Dataexpert Corporation" },
	{ 0x10CA, "Fujitsu" },
	{ 0x10CB, "Omron Corporation" },
	{ 0x10CC, "Mentor Arc Inc." },
	{ 0x10CD, "Advanced System Products" },
	{ 0x10CE, "Radius Inc." },
	{ 0x10CF, "Citicorp TTI" },
	{ 0x10D0, "Fujitsu Limited" },
	{ 0x10D1, "Future+ Systems" },
	{ 0x10D2, "Molex Incorporated" },
	{ 0x10D3, "Jabil Circuit Inc." },
	{ 0x10D4, "Hualon Microelectronics" },
	{ 0x10D5, "Autologic Inc." },
	{ 0x10D6, "Cetia" },
	{ 0x10D7, "BCM Advanced Research" },
	{ 0x10D8, "Advanced Peripherals Labs" },
	{ 0x10D9, "Macronix International Co. Ltd." },
	{ 0x10DA, "Thomas-Conrad Corporation" },
	{ 0x10DB, "Rohm Research" },
	{ 0x10DC, "CERN-European Lab. for Particle Physics" },
	{ 0x10DD, "Evans & Sutherland" },
	{ 0x10DE, "Nvidia Corporation" },
	{ 0x10DF, "Emulex Corporation" },
	{ 0x10E0, "Integrated Micro Solutions" },
	{ 0x10E1, "Tekram Technology Corp. Ltd." },
	{ 0x10E2, "Aptix Corporation" },
	{ 0x10E3, "Tundra Semiconductor Corp." },
	{ 0x10E4, "Tandem Computers" },
	{ 0x10E5, "Micro Industries Corporation" },
	{ 0x10E6, "Gainbery Computer Products Inc." },
	{ 0x10E7, "Vadem" },
	{ 0x10E8, "Applied Micro Circuits Corp." },
	{ 0x10E9, "Alps Electronic Corp. Ltd." },
	{ 0x10EA, "Integraphics Systems" },
	{ 0x10EB, "Artist Graphics" },
	{ 0x10EC, "Realtek Semiconductor" },
	{ 0x10ED, "Ascii Corporation" },
	{ 0x10EE, "Xilinx Corporation" },
	{ 0x10EF, "Racore Computer Products" },
	{ 0x10F0, "Peritek Corporation" },
	{ 0x10F1, "Tyan Computer" },
	{ 0x10F2, "Achme Computer Inc." },
	{ 0x10F3, "Alaris Inc." },
	{ 0x10F4, "S-Mos Systems" },
	{ 0x10F5, "NKK Corporation" },
	{ 0x10F6, "Creative Electronic Systems SA" },
	{ 0x10F7, "Matsushita Electric Industrial Corp." },
	{ 0x10F8, "Altos India Ltd." },
	{ 0x10F9, "PC Direct" },
	{ 0x10FA, "Truevision" },
	{ 0x10FB, "Thesys Microelectronic's" },
	{ 0x10FC, "I-O Data Device Inc." },
	{ 0x10FD, "Soyo Technology Corp. Ltd." },
	{ 0x10FE, "Fast Electronic GmbH" },
	{ 0x10FF, "Ncube" },
	{ 0x1100, "Jazz Multimedia" },
	{ 0x1101, "Initio Corporation" },
	{ 0x1102, "Creative Labs" },
	{ 0x1103, "HighPoint Technologies Inc." },
	{ 0x1104, "Rasterops" },
	{ 0x1105, "Sigma Designs Inc." },
	{ 0x1106, "VIA Technologies Inc" },
	{ 0x1107, "Stratus Computer" },
	{ 0x1108, "Proteon Inc." },
	{ 0x1109, "Cogent Data Technologies" },
	{ 0x110A, "Infineon Technologies" },
	{ 0x110B, "Chromatic Research Inc" },
	{ 0x110C, "Mini-Max Technology Inc." },
	{ 0x110D, "ZNYX Corporation" },
	{ 0x110E, "CPU Technology" },
	{ 0x110F, "Ross Technology" },
	{ 0x1110, "Powerhouse Systems" },
	{ 0x1111, "Santa Cruz Operation" },
	{ 0x1112, "Osicom Technologies Inc." },
	{ 0x1113, "Accton Technology Corporation" },
	{ 0x1114, "Atmel Corp." },
	{ 0x1115, "Dupont Pixel Systems Ltd." },
	{ 0x1116, "Data Translation" },
	{ 0x1117, "Datacube Inc." },
	{ 0x1118, "Berg Electronics" },
	{ 0x1119, "Vortex Computersysteme GmbH" },
	{ 0x111A, "Efficent Networks" },
	{ 0x111B, "Teledyne Electronic Systems" },
	{ 0x111C, "Tricord Systems Inc." },
	{ 0x111D, "Integrated Device Technology Inc." },
	{ 0x111E, "Eldec Corp." },
	{ 0x111F, "Precision Digital Images" },
	{ 0x1120, "EMC Corp." },
	{ 0x1121, "Zilog" },
	{ 0x1122, "Multi-Tech Systems Inc." },
	{ 0x1123, "Excellent Design Inc." },
	{ 0x1124, "Leutron Vision AG" },
	{ 0x1125, "Eurocore/Vigra" },
	{ 0x1126, "Vigra" },
	{ 0x1127, "FORE Systems" },
	{ 0x1129, "Firmworks" },
	{ 0x112A, "Hermes Electronics Co. Ltd." },
	{ 0x112B, "Linotype - Hell AG" },
	{ 0x112C, "Zenith Data Systems" },
	{ 0x112D, "Ravicad" },
	{ 0x112E, "Infomedia" },
	{ 0x112F, "Imaging Technology" },
	{ 0x1130, "Computervision" },
	{ 0x1131, "Philips Semiconductors" },
	{ 0x1132, "Mitel Corp." },
	{ 0x1133, "Eicon Technology Corporation" },
	{ 0x1134, "Mercury Computer Systems Inc." },
	{ 0x1135, "Fuji Xerox Co Ltd" },
	{ 0x1136, "Momentum Data Systems" },
	{ 0x1137, "Cisco Systems Inc" },
	{ 0x1138, "Ziatech Corporation" },
	{ 0x1139, "Dynamic Pictures Inc" },
	{ 0x113A, "FWB Inc" },
	{ 0x113B, "Network Computing Devices" },
	{ 0x113C, "Cyclone Microsystems" },
	{ 0x113D, "Leading Edge Products Inc" },
	{ 0x113E, "Sanyo Electric Co" },
	{ 0x113F, "Equinox Systems" },
	{ 0x1140, "Intervoice Inc" },
	{ 0x1141, "Crest Microsystem Inc" },
	{ 0x1142, "Alliance Semiconductor CA - USA" },
	{ 0x1143, "Netpower Inc" },
	{ 0x1144, "Cincinnati Milacron" },
	{ 0x1145, "Workbit Corp" },
	{ 0x1146, "Force Computers" },
	{ 0x1147, "Interface Corp" },
	{ 0x1148, "Schneider & Koch" },
	{ 0x1149, "Win System Corporation" },
	{ 0x114A, "VMIC" },
	{ 0x114B, "Canopus Co. Ltd" },
	{ 0x114C, "Annabooks" },
	{ 0x114D, "IC Corporation" },
	{ 0x114E, "Nikon Systems Inc" },
	{ 0x114F, "Digi International" },
	{ 0x1150, "Thinking Machines Corporation" },
	{ 0x1151, "JAE Electronics Inc." },
	{ 0x1152, "Megatek" },
	{ 0x1153, "Land Win Electronic Corp" },
	{ 0x1154, "Melco Inc" },
	{ 0x1155, "Pine Technology Ltd" },
	{ 0x1156, "Periscope Engineering" },
	{ 0x1157, "Avsys Corporation" },
	{ 0x1158, "Voarx R&D Inc" },
	{ 0x1159, "Mutech" },
	{ 0x115A, "Harlequin Ltd" },
	{ 0x115B, "Parallax Graphics" },
	{ 0x115C, "Photron Ltd." },
	{ 0x115D, "Xircom" },
	{ 0x115E, "Peer Protocols Inc" },
	{ 0x115F, "Maxtor Corporation" },
	{ 0x1160, "Megasoft Inc" },
	{ 0x1161, "PFU Ltd" },
	{ 0x1162, "OA Laboratory Co Ltd" },
	{ 0x1163, "Rendition Inc" },
	{ 0x1164, "Advanced Peripherals Tech" },
	{ 0x1165, "Imagraph Corporation" },
	{ 0x1166, "Pequr Technology / Ross Computer Corp" },
	{ 0x1167, "Mutoh Industries Inc" },
	{ 0x1168, "Thine Electronics Inc" },
	{ 0x1169, "Centre f/Dev. of Adv. Computing" },
	{ 0x116A, "Polaris Communications" },
	{ 0x116B, "Connectware Inc" },
	{ 0x116C, "Intelligent Resources" },
	{ 0x116E, "Electronics for Imaging" },
	{ 0x116F, "Workstation Technology" },
	{ 0x1170, "Inventec Corporation" },
	{ 0x1171, "Loughborough Sound Images" },
	{ 0x1172, "Altera Corporation" },
	{ 0x1173, "Adobe Systems" },
	{ 0x1174, "Bridgeport Machines" },
	{ 0x1175, "Mitron Computer Inc." },
	{ 0x1176, "SBE" },
	{ 0x1177, "Silicon Engineering" },
	{ 0x1178, "Alfa Inc" },
	{ 0x1179, "Toshiba America Info Systems" },
	{ 0x117A, "A-Trend Technology" },
	{ 0x117B, "LG Electronics Inc." },
	{ 0x117C, "Atto Technology" },
	{ 0x117D, "Becton & Dickinson" },
	{ 0x117E, "T/R Systems" },
	{ 0x117F, "Integrated Circuit Systems" },
	{ 0x1180, "Ricoh Co Ltd" },
	{ 0x1181, "Telmatics International" },
	{ 0x1183, "Fujikura Ltd" },
	{ 0x1184, "Forks Inc" },
	{ 0x1185, "Dataworld" },
	{ 0x1186, "D-Link System Inc" },
	{ 0x1187, "Advanced Technology Laboratories" },
	{ 0x1188, "Shima Seiki Manufacturing Ltd." },
	{ 0x1189, "Matsushita Electronics" },
	{ 0x118A, "Hilevel Technology" },
	{ 0x118B, "Hypertec Pty Ltd" },
	{ 0x118C, "Corollary Inc" },
	{ 0x118D, "BitFlow Inc" },
	{ 0x118E, "Hermstedt GmbH" },
	{ 0x118F, "Green Logic" },
	{ 0x1190, "Tripace" },
	{ 0x1191, "ACARD Technology" },
	{ 0x1192, "Densan Co. Ltd" },
	{ 0x1193, "Zeitnet Inc." },
	{ 0x1194, "Toucan Technology" },
	{ 0x1195, "Ratoc System Inc" },
	{ 0x1196, "Hytec Electronics Ltd" },
	{ 0x1197, "Gage Applied Sciences Inc." },
	{ 0x1198, "Lambda Systems Inc" },
	{ 0x1199, "Attachmate Corp." },
	{ 0x119A, "Mind Share Inc." },
	{ 0x119B, "Omega Micro Inc." },
	{ 0x119C, "Information Technology Inst." },
	{ 0x119D, "Bug Sapporo Japan" },
	{ 0x119E, "Fujitsu" },
	{ 0x119F, "Bull Hn Information Systems" },
	{ 0x11A0, "Convex Computer Corporation" },
	{ 0x11A1, "Hamamatsu Photonics K.K." },
	{ 0x11A2, "Sierra Research and Technology" },
	{ 0x11A3, "Deuretzbacher GmbH & Co. Eng. KG" },
	{ 0x11A4, "Barco" },
	{ 0x11A5, "MicroUnity Systems Engineering Inc." },
	{ 0x11A6, "Pure Data" },
	{ 0x11A7, "Power Computing Corp." },
	{ 0x11A8, "Systech Corp." },
	{ 0x11A9, "InnoSys Inc." },
	{ 0x11AA, "Actel" },
	{ 0x11AB, "Galileo Technology Ltd." },
	{ 0x11AC, "Canon Information Systems" },
	{ 0x11AD, "Lite-On Communications Inc" },
	{ 0x11AE, "Scitex Corporation Ltd" },
	{ 0x11AF, "Avid Technology Inc." },
	{ 0x11B0, "V3 Semiconductor Inc." },
	{ 0x11B1, "Apricot Computers" },
	{ 0x11B2, "Eastman Kodak" },
	{ 0x11B3, "Barr Systems Inc." },
	{ 0x11B4, "Leitch Technology International" },
	{ 0x11B5, "Radstone Technology Plc" },
	{ 0x11B6, "United Video Corp" },
	{ 0x11B7, "Motorola" },
	{ 0x11B8, "Xpoint Technologies Inc" },
	{ 0x11B9, "Pathlight Technology Inc." },
	{ 0x11BA, "Videotron Corp" },
	{ 0x11BB, "Pyramid Technology" },
	{ 0x11BC, "Network Peripherals Inc" },
	{ 0x11BD, "Pinnacle Systems Inc." },
	{ 0x11BE, "International Microcircuits Inc" },
	{ 0x11BF, "Astrodesign Inc." },
	{ 0x11C0, "Hewlett-Packard" },
	{ 0x11C1, "AT&T Microelectronics" },
	{ 0x11C2, "Sand Microelectronics" },
	{ 0x11C3, "NEC Corporation" },
	{ 0x11C4, "Document Technologies Ind." },
	{ 0x11C5, "Shiva Corporatin" },
	{ 0x11C6, "Dainippon Screen Mfg. Co" },
	{ 0x11C7, "D.C.M. Data Systems" },
	{ 0x11C8, "Dolphin Interconnect Solutions" },
	{ 0x11C9, "MAGMA" },
	{ 0x11CA, "LSI Systems Inc" },
	{ 0x11CB, "Specialix International Ltd." },
	{ 0x11CC, "Michels & Kleberhoff Computer GmbH" },
	{ 0x11CD, "HAL Computer Systems Inc." },
	{ 0x11CE, "Primary Rate Inc" },
	{ 0x11CF, "Pioneer Electronic Corporation" },
	{ 0x11D0, "Loral Frederal Systems - Manassas" },
	{ 0x11D1, "AuraVision Corporation" },
	{ 0x11D2, "Intercom Inc." },
	{ 0x11D3, "Trancell Systems Inc" },
	{ 0x11D4, "Analog Devices" },
	{ 0x11D5, "Ikon Corp" },
	{ 0x11D6, "Tekelec Technologies" },
	{ 0x11D7, "Trenton Terminals Inc" },
	{ 0x11D8, "Image Technologies Development" },
	{ 0x11D9, "Tec Corporation" },
	{ 0x11DA, "Novell" },
	{ 0x11DB, "Sega Enterprises Ltd" },
	{ 0x11DC, "Questra Corp" },
	{ 0x11DD, "Crosfield Electronics Ltd" },
	{ 0x11DE, "Zoran Corporation" },
	{ 0x11DF, "New Wave Pdg" },
	{ 0x11E0, "Cray Communications A/S" },
	{ 0x11E1, "Gec Plessey Semi Inc" },
	{ 0x11E2, "Samsung Information Systems America" },
	{ 0x11E3, "Quicklogic Corp" },
	{ 0x11E4, "Second Wave Inc" },
	{ 0x11E5, "IIX Consulting" },
	{ 0x11E6, "Mitsui-Zosen System Research" },
	{ 0x11E7, "Toshiba America Elec. Co" },
	{ 0x11E8, "Digital Processing Systems Inc" },
	{ 0x11E9, "Highwater Designs Ltd" },
	{ 0x11EA, "Elsag Bailey" },
	{ 0x11EB, "Formation Inc" },
	{ 0x11EC, "Coreco Inc" },
	{ 0x11ED, "Mediamatics" },
	{ 0x11EE, "Dome Imaging Systems Inc" },
	{ 0x11EF, "Nicolet Technologies BV" },
	{ 0x11F0, "Compu-Shack GmbH" },
	{ 0x11F1, "Symbios Logic Inc" },
	{ 0x11F2, "Picture Tel Japan KK" },
	{ 0x11F3, "Keithley Metrabyte" },
	{ 0x11F4, "Kinetic Systems Corporation" },
	{ 0x11F5, "Computing Devices Intl" },
	{ 0x11F6, "Powermatic Data Systems Ltd" },
	{ 0x11F7, "Scientific Atlanta" },
	{ 0x11F8, "PMC-Sierra Inc." },
	{ 0x11F9, "I-Cube Inc" },
	{ 0x11FA, "Kasan Electronics Co Ltd" },
	{ 0x11FB, "Datel Inc" },
	{ 0x11FC, "Silicon Magic" },
	{ 0x11FD, "High Street Consultants" },
	{ 0x11FE, "Comtrol Corp" },
	{ 0x11FF, "Scion Corp" },
	{ 0x1200, "CSS Corp" },
	{ 0x1201, "Vista Controls Corp" },
	{ 0x1202, "Network General Corp" },
	{ 0x1203, "Bayer Corporation Agfa Div" },
	{ 0x1204, "Lattice Semiconductor Corp" },
	{ 0x1205, "Array Corp" },
	{ 0x1206, "Amdahl Corp" },
	{ 0x1208, "Parsytec GmbH" },
	{ 0x1209, "Sci Systems Inc" },
	{ 0x120A, "Synaptel" },
	{ 0x120B, "Adaptive Solutions" },
	{ 0x120D, "Compression Labs Inc." },
	{ 0x120E, "Cyclades Corporation" },
	{ 0x120F, "Essential Communications" },
	{ 0x1210, "Hyperparallel Technologies" },
	{ 0x1211, "Braintech Inc" },
	{ 0x1212, "Kingston Technology Corp" },
	{ 0x1213, "Applied Intelligent Systems Inc" },
	{ 0x1214, "Performance Technologies Inc" },
	{ 0x1215, "Interware Co Ltd" },
	{ 0x1216, "Purup-Eskofot A/S" },
	{ 0x1217, "O2Micro Inc" },
	{ 0x1218, "Hybricon Corp" },
	{ 0x1219, "First Virtual Corp" },
	{ 0x121A, "3dfx Interactive Inc" },
	{ 0x121B, "Advanced Telecommunications Modules" },
	{ 0x121C, "Nippon Texa Co Ltd" },
	{ 0x121D, "Lippert Automationstechnik GmbH" },
	{ 0x121E, "CSPI" },
	{ 0x121F, "Arcus Technology Inc" },
	{ 0x1220, "Ariel Corporation" },
	{ 0x1221, "Contec Co Ltd" },
	{ 0x1222, "Ancor Communications Inc" },
	{ 0x1223, "Heurikon/Computer Products" },
	{ 0x1224, "Interactive Images" },
	{ 0x1225, "Power I/O Inc." },
	{ 0x1227, "Tech-Source" },
	{ 0x1228, "Norsk Elektro Optikk A/S" },
	{ 0x1229, "Data Kinesis Inc." },
	{ 0x122A, "Integrated Telecom" },
	{ 0x122B, "LG Industrial Systems Co. Ltd." },
	{ 0x122C, "Sican GmbH" },
	{ 0x122D, "Aztech System Ltd" },
	{ 0x122E, "Xyratex" },
	{ 0x122F, "Andrew Corp." },
	{ 0x1230, "Fishcamp Engineering" },
	{ 0x1231, "Woodward McCoach Inc." },
	{ 0x1232, "GPT Ltd." },
	{ 0x1233, "Bus-Tech Inc." },
	{ 0x1234, "Technical Corp" },
	{ 0x1235, "Risq Modular Systems Inc." },
	{ 0x1236, "Sigma Designs Corp." },
	{ 0x1237, "Alta Technology Corp." },
	{ 0x1238, "Adtran" },
	{ 0x1239, "The 3DO Company" },
	{ 0x123A, "Visicom Laboratories Inc." },
	{ 0x123B, "Seeq Technology Inc." },
	{ 0x123C, "Century Systems Inc." },
	{ 0x123D, "Engineering Design Team Inc." },
	{ 0x123F, "C-Cube Microsystems" },
	{ 0x1240, "Marathon Technologies Corp." },
	{ 0x1241, "DSC Communications" },
	{ 0x1242, "Jaycor Network Inc." },
	{ 0x1243, "Delphax" },
	{ 0x1244, "AVM AUDIOVISUELLES MKTG & Computer GmbH" },
	{ 0x1245, "APD S.A." },
	{ 0x1246, "Dipix Technologies Inc" },
	{ 0x1247, "Xylon Research Inc." },
	{ 0x1248, "Central Data Corp." },
	{ 0x1249, "Samsung Electronics Co. Ltd." },
	{ 0x124A, "AEG Electrocom GmbH" },
	{ 0x124B, "GreenSpring Computers" },
	{ 0x124C, "Solitron Technologies Inc." },
	{ 0x124D, "Stallion Technologies" },
	{ 0x124E, "Cylink" },
	{ 0x124F, "Infortrend Technology Inc" },
	{ 0x1250, "Hitachi Microcomputer System Ltd." },
	{ 0x1251, "VLSI Solution OY" },
	{ 0x1253, "Guzik Technical Enterprises" },
	{ 0x1254, "Linear Systems Ltd." },
	{ 0x1255, "Optibase Ltd." },
	{ 0x1256, "Perceptive Solutions Inc." },
	{ 0x1257, "Vertex Networks Inc." },
	{ 0x1258, "Gilbarco Inc." },
	{ 0x1259, "Allied Telesyn International" },
	{ 0x125A, "ABB Power Systems" },
	{ 0x125B, "Asix Electronics Corp." },
	{ 0x125C, "Aurora Technologies Inc." },
	{ 0x125D, "ESS Technology" },
	{ 0x125E, "Specialvideo Engineering SRL" },
	{ 0x125F, "Concurrent Technologies Inc." },
	{ 0x1260, "Harris Semiconductor" },
	{ 0x1261, "Matsushita-Kotobuki Electronics Indu" },
	{ 0x1262, "ES Computer Co. Ltd." },
	{ 0x1263, "Sonic Solutions" },
	{ 0x1264, "Aval Nagasaki Corp." },
	{ 0x1265, "Casio Computer Co. Ltd." },
	{ 0x1266, "Microdyne Corp." },
	{ 0x1267, "S.A. Telecommunications" },
	{ 0x1268, "Tektronix" },
	{ 0x1269, "Thomson-CSF/TTM" },
	{ 0x126A, "Lexmark International Inc." },
	{ 0x126B, "Adax Inc." },
	{ 0x126C, "Northern Telecom" },
	{ 0x126D, "Splash Technology Inc." },
	{ 0x126E, "Sumitomo Metal Industries Ltd." },
	{ 0x126F, "Silicon Motion" },
	{ 0x1270, "Olympus Optical Co. Ltd." },
	{ 0x1271, "GW Instruments" },
	{ 0x1272, "Telematics International" },
	{ 0x1273, "Hughes Network Systems" },
	{ 0x1274, "Ensoniq" },
	{ 0x1275, "Network Appliance" },
	{ 0x1276, "Switched Network Technologies Inc." },
	{ 0x1277, "Comstream" },
	{ 0x1278, "Transtech Parallel Systems" },
	{ 0x1279, "Transmeta Corp." },
	{ 0x127A, "Conexant Systems" },
	{ 0x127B, "Pixera Corp" },
	{ 0x127C, "Crosspoint Solutions Inc." },
	{ 0x127D, "Vela Research" },
	{ 0x127E, "Winnov L.P." },
	{ 0x127F, "Fujifilm" },
	{ 0x1280, "Photoscript Group Ltd." },
	{ 0x1281, "Yokogawa Electronic Corp." },
	{ 0x1282, "Davicom Semiconductor Inc." },
	{ 0x1283, "Integrated Technology Express Inc." },
	{ 0x1284, "Sahara Networks Inc." },
	{ 0x1285, "Platform Technologies Inc." },
	{ 0x1286, "Mazet GmbH" },
	{ 0x1287, "LuxSonor Inc." },
	{ 0x1288, "Timestep Corp." },
	{ 0x1289, "AVC Technology Inc." },
	{ 0x128A, "Asante Technologies Inc." },
	{ 0x128B, "Transwitch Corp." },
	{ 0x128C, "Retix Corp." },
	{ 0x128D, "G2 Networks Inc." },
	{ 0x128E, "Samho Multi Tech Ltd." },
	{ 0x128F, "Tateno Dennou Inc." },
	{ 0x1290, "Sord Computer Corp." },
	{ 0x1291, "NCS Computer Italia" },
	{ 0x1292, "Tritech Microelectronics Intl PTE" },
	{ 0x1293, "Media Reality Technology" },
	{ 0x1294, "Rhetorex Inc." },
	{ 0x1295, "Imagenation Corp." },
	{ 0x1296, "Kofax Image Products" },
	{ 0x1297, "Holco Enterprise" },
	{ 0x1298, "Spellcaster Telecommunications Inc." },
	{ 0x1299, "Knowledge Technology Laboratories" },
	{ 0x129A, "VMETRO" },
	{ 0x129B, "Image Access" },
	{ 0x129D, "CompCore Multimedia Inc." },
	{ 0x129E, "Victor Co. of Japan Ltd." },
	{ 0x129F, "OEC Medical Systems Inc." },
	{ 0x12A0, "Allen Bradley Co." },
	{ 0x12A1, "Simpact Inc" },
	{ 0x12A2, "NewGen Systems Corp." },
	{ 0x12A3, "Lucent Technologies" },
	{ 0x12A4, "NTT Electronics Technology Co." },
	{ 0x12A5, "Vision Dynamics Ltd." },
	{ 0x12A6, "Scalable Networks Inc." },
	{ 0x12A7, "AMO GmbH" },
	{ 0x12A8, "News Datacom" },
	{ 0x12A9, "Xiotech Corp." },
	{ 0x12AA, "SDL Communications Inc." },
	{ 0x12AB, "Yuan Yuan Enterprise Co. Ltd." },
	{ 0x12AC, "MeasureX Corp." },
	{ 0x12AD, "Multidata GmbH" },
	{ 0x12AE, "Alteon Networks Inc." },
	{ 0x12AF, "TDK USA Corp." },
	{ 0x12B0, "Jorge Scientific Corp." },
	{ 0x12B1, "GammaLink" },
	{ 0x12B2, "General Signal Networks" },
	{ 0x12B3, "Inter-Face Co. Ltd." },
	{ 0x12B4, "Future Tel Inc." },
	{ 0x12B5, "Granite Systems Inc." },
	{ 0x12B6, "Natural Microsystems" },
	{ 0x12B7, "Acumen" },
	{ 0x12B8, "Korg" },
	{ 0x12B9, "US Robotics" },
	{ 0x12BA, "Bittware Research Systems Inc" },
	{ 0x12BB, "Nippon Unisoft Corp." },
	{ 0x12BC, "Array Microsystems" },
	{ 0x12BD, "Computerm Corp." },
	{ 0x12BE, "Anchor Chips Inc." },
	{ 0x12BF, "Fujifilm Microdevices" },
	{ 0x12C0, "Infimed" },
	{ 0x12C1, "GMM Research Corp." },
	{ 0x12C2, "Mentec Ltd." },
	{ 0x12C3, "Holtek Microelectronics Inc." },
	{ 0x12C4, "Connect Tech Inc." },
	{ 0x12C5, "Picture Elements Inc." },
	{ 0x12C6, "Mitani Corp." },
	{ 0x12C7, "Dialogic Corp." },
	{ 0x12C8, "G Force Co. Ltd." },
	{ 0x12C9, "Gigi Operations" },
	{ 0x12CA, "Integrated Computing Engines, Inc." },
	{ 0x12CB, "Antex Electronics Corp." },
	{ 0x12CC, "Pluto Technologies International" },
	{ 0x12CD, "Aims Lab" },
	{ 0x12CE, "Netspeed Inc." },
	{ 0x12CF, "Prophet Systems Inc." },
	{ 0x12D0, "GDE Systems Inc." },
	{ 0x12D1, "PsiTech" },
	{ 0x12D2, "NVidia / SGS Thomson" },
	{ 0x12D3, "Vingmed Sound A/S" },
	{ 0x12D4, "DGM & S" },
	{ 0x12D5, "Equator Technologies" },
	{ 0x12D6, "Analogic Corp." },
	{ 0x12D7, "Biotronic SRL" },
	{ 0x12D8, "Pericom Semiconductor" },
	{ 0x12D9, "Aculab Plc." },
	{ 0x12DA, "TrueTime" },
	{ 0x12DB, "Annapolis Micro Systems Inc." },
	{ 0x12DC, "Symicron Computer Communication Ltd." },
	{ 0x12DD, "Management Graphics Inc." },
	{ 0x12DE, "Rainbow Technologies" },
	{ 0x12DF, "SBS Technologies Inc." },
	{ 0x12E0, "Chase Research PLC" },
	{ 0x12E1, "Nintendo Co. Ltd." },
	{ 0x12E2, "Datum Inc. Bancomm-Timing Division" },
	{ 0x12E3, "Imation Corp. - Medical Imaging Syst" },
	{ 0x12E4, "Brooktrout Technology Inc." },
	{ 0x12E6, "Cirel Systems" },
	{ 0x12E7, "Sebring Systems Inc" },
	{ 0x12E8, "CRISC Corp." },
	{ 0x12E9, "GE Spacenet" },
	{ 0x12EA, "Zuken" },
	{ 0x12EB, "Aureal Semiconductor" },
	{ 0x12EC, "3A International Inc." },
	{ 0x12ED, "Optivision Inc." },
	{ 0x12EE, "Orange Micro, Inc." },
	{ 0x12EF, "Vienna Systems" },
	{ 0x12F0, "Pentek" },
	{ 0x12F1, "Sorenson Vision Inc." },
	{ 0x12F2, "Gammagraphx Inc." },
	{ 0x12F4, "Megatel" },
	{ 0x12F5, "Forks" },
	{ 0x12F6, "Dawson France" },
	{ 0x12F7, "Cognex" },
	{ 0x12F8, "Electronic-Design GmbH" },
	{ 0x12F9, "FourFold Technologies" },
	{ 0x12FB, "Spectrum Signal Processing" },
	{ 0x12FC, "Capital Equipment Corp" },
	{ 0x12FE, "ESD Electronic System Design GmbH" },
	{ 0x1304, "Juniper Networks Inc." },
	{ 0x1307, "ComputerBoards" },
	{ 0x1308, "Jato Technologies Inc." },
	{ 0x130A, "Mitsubishi Electric Microcomputer" },
	{ 0x130B, "Colorgraphic Communications Corp" },
	{ 0x130F, "Advanet Inc." },
	{ 0x1310, "Gespac" },
	{ 0x1312, "Robotic Vision Systems Incorporated" },
	{ 0x1313, "Yaskawa Electric Co." },
	{ 0x1316, "Teradyne Inc." },
	{ 0x1317, "Admtek Inc" },
	{ 0x1318, "Packet Engines, Inc." },
	{ 0x1319, "Forte Media, Inc." },
	{ 0x131f, "SIIG" },
	{ 0x1325, "Salix Technologies Inc" },
	{ 0x1326, "Seachange International" },
	{ 0x1331, "RadiSys Corporation" },
	{ 0x1335, "Videomail Inc." },
	{ 0x133D, "Prisa Networks" },
	{ 0x133F, "SCM Microsystems" },
	{ 0x1342, "Promax Systems Inc" },
	{ 0x1344, "Micron Technology Inc" },
	{ 0x1347, "Odetics" },
	{ 0x134A, "DTC Technology Corp." },
	{ 0x134B, "ARK Research Corp." },
	{ 0x134C, "Chori Joho System Co. Ltd" },
	{ 0x134D, "PCTEL Inc." },
	{ 0x135A, "Brain Boxes Limited" },
	{ 0x135B, "Giganet Inc." },
	{ 0x135C, "Quatech Inc" },
	{ 0x135D, "ABB Network Partner AB" },
	{ 0x135E, "Sealevel Systems Inc." },
	{ 0x135F, "I-Data International A-S" },
	{ 0x1360, "Meinberg Funkuhren" },
	{ 0x1361, "Soliton Systems K.K." },
	{ 0x1363, "Phoenix Technologies Ltd" },
	{ 0x1367, "Hitachi Zosen Corporation" },
	{ 0x1368, "Skyware Corporation" },
	{ 0x1369, "Digigram" },
	{ 0x136B, "Kawasaki Steel Corporation" },
	{ 0x136C, "Adtek System Science Co Ltd" },
	{ 0x1375, "Boeing - Sunnyvale" },
	{ 0x1377, "GMBH" },
	{ 0x137A, "Mark Of The Unicorn Inc" },
	{ 0x137B, "PPT Vision" },
	{ 0x137C, "Iwatsu Electric Co Ltd" },
	{ 0x137D, "Dynachip Corporation" },
	{ 0x137E, "Patriot Scientific Corp." },
	{ 0x1380, "Sanritz Automation Co LTC" },
	{ 0x1381, "Brains Co. Ltd" },
	{ 0x1384, "Stellar Semiconductor Inc" },
	{ 0x1385, "Netgear" },
	{ 0x1387, "Systran Corp" },
	{ 0x1388, "Hitachi Information Technology Co Ltd" },
	{ 0x1389, "Applicom International" },
	{ 0x138B, "Tokimec Inc" },
	{ 0x138E, "Basler GMBH" },
	{ 0x138F, "Patapsco Designs Inc" },
	{ 0x1390, "Concept Development Inc." },
	{ 0x1393, "Moxa Technologies Co Ltd" },
	{ 0x1395, "Ambicom Inc" },
	{ 0x1396, "Cipher Systems Inc" },
	{ 0x1397, "Cologne Chip Designs GmbH" },
	{ 0x1398, "Clarion Co. Ltd" },
	{ 0x139A, "Alacritech Inc" },
	{ 0x139D, "Xstreams PLC/ EPL Limited" },
	{ 0x139E, "Echostar Data Networks" },
	{ 0x13A0, "Crystal Group Inc" },
	{ 0x13A1, "Kawasaki Heavy Industries Ltd" },
	{ 0x13A4, "Rascom Inc" },
	{ 0x13A7, "Teles AG" },
	{ 0x13A8, "Exar Corp." },
	{ 0x13A9, "Siemens Medical Systems Ultrasound Group" },
	{ 0x13AA, "Nortel Networks - BWA Division" },
	{ 0x13AF, "T.Sqware" },
	{ 0x13B1, "Tamura Corporation" },
	{ 0x13B4, "Wellbean Co Inc" },
	{ 0x13B5, "ARM Ltd" },
	{ 0x13B6, "DLoG GMBH" },
	{ 0x13B8, "Nokia Telecommunications OY" },
	{ 0x13BF, "Sharewave Inc" },
	{ 0x13C0, "Microgate Corp." },
	{ 0x13C1, "3ware Inc." },
	{ 0x13C2, "Technotrend Systemtechnik GMBH" },
	{ 0x13C3, "Janz Computer AG" },
	{ 0x13C7, "Blue Chip Technology Ltd" },
	{ 0x13CC, "Metheus Corporation" },
	{ 0x13CF, "Studio Audio & Video Ltd" },
	{ 0x13D0, "B2C2 Inc" },
	{ 0x13D1, "Abocom Systems Inc" },
	{ 0x13D4, "Graphics Microsystems Inc" },
	{ 0x13D6, "K.I. Technology Co Ltd" },
	{ 0x13D7, "Toshiba Engineering Corporation" },
	{ 0x13D8, "Phobos Corporation" },
	{ 0x13D9, "Apex Inc" },
	{ 0x13DC, "Netboost Corporation" },
	{ 0x13DE, "ABB Robotics Products AB" },
	{ 0x13DF, "E-Tech Inc." },
	{ 0x13E0, "GVC Corporation" },
	{ 0x13E3, "Nest Inc" },
	{ 0x13E4, "Calculex Inc" },
	{ 0x13E5, "Telesoft Design Ltd" },
	{ 0x13E9, "Intraserver Technology Inc" },
	{ 0x13EA, "Dallas Semiconductor" },
	{ 0x13F0, "Sundance Technology Inc" },
	{ 0x13F1, "OCE - Industries S.A." },
	{ 0x13F4, "Troika Networks Inc" },
	{ 0x13F6, "C-Media Electronics Inc." },
	{ 0x13F9, "NTT Advanced Technology Corp." },
	{ 0x13FA, "Pentland Systems Ltd." },
	{ 0x13FB, "Aydin Corp" },
	{ 0x13FD, "Micro Science Inc" },
	{ 0x1400, "ARTX Inc" },
	{ 0x1402, "Meilhaus Electronic GmbH Germany" },
	{ 0x1404, "Fundamental Software Inc" },
	{ 0x1406, "Oc� Printing Systems" },
	{ 0x1407, "Lava Computer MFG Inc." },
	{ 0x1408, "Aloka Co. Ltd" },
	{ 0x1409, "eTIMedia Technology Co Ltd" },
	{ 0x140A, "DSP Research Inc" },
	{ 0x140B, "Ramix Inc" },
	{ 0x140D, "Matsushita Electric Works Ltd" },
	{ 0x140F, "Salient Systems Corp" },
	{ 0x1412, "IC Ensemble, Inc." },
	{ 0x1413, "Addonics" },
	{ 0x1415, "Oxford Semiconductor Ltd" },
	{ 0x1418, "Kyushu Electronics Systems Inc" },
	{ 0x1419, "Excel Switching Corp" },
	{ 0x141B, "Zoom Telephonics Inc" },
	{ 0x141E, "Fanuc Co. Ltd" },
	{ 0x141F, "Visiontech Ltd" },
	{ 0x1420, "Psion Dacom PLC" },
	{ 0x1425, "ASIC Designers Inc" },
	{ 0x1428, "Edec Co Ltd" },
	{ 0x1429, "Unex Technology Corp." },
	{ 0x142A, "Kingmax Technology Inc" },
	{ 0x142B, "Radiolan" },
	{ 0x142C, "Minton Optic Industry Co Ltd" },
	{ 0x142D, "Pixstream Inc" },
	{ 0x1430, "ITT Aerospace/Communications Division" },
	{ 0x1433, "Eltec Elektronik AG" },
	{ 0x1436, "CIS Technology Inc" },
	{ 0x1437, "Nissin Inc Co" },
	{ 0x1438, "Atmel-Dream" },
	{ 0x143F, "Lightwell Co Ltd - Zax Division" },
	{ 0x1441, "Agie SA." },
	{ 0x1445, "Logical Co Ltd" },
	{ 0x1446, "Graphin Co. Ltd" },
	{ 0x1447, "Aim GMBH" },
	{ 0x1448, "Alesis Studio" },
	{ 0x144A, "Adlink Technology" },
	{ 0x144B, "Loronix Information Systems, Inc." },
	{ 0x144D, "Samsung Electronics Co Ltd" },
	{ 0x1450, "Octave Communications Ind." },
	{ 0x1451, "SP3D Chip Design GMBH" },
	{ 0x1453, "Mycom Inc" },
	{ 0x1455, "Logic Plus PLUS Inc" },
	{ 0x1458, "Giga-Byte Technologies" },
	{ 0x145C, "Cryptek" },
	{ 0x145F, "Baldor Electric Company" },
	{ 0x1460, "Dynarc Inc" },
	{ 0x1462, "Micro-Star International Co Ltd" },
	{ 0x1463, "Fast Corporation" },
	{ 0x1464, "Interactive Circuits & Systems Ltd" },
	{ 0x1465, "GN Nettest Telecom Div." },
	{ 0x1468, "Ambit Microsystems Corp." },
	{ 0x1469, "Cleveland Motion Controls" },
	{ 0x146C, "Ruby Tech Corp." },
	{ 0x146D, "Tachyon Inc." },
	{ 0x146E, "WMS Gaming" },
	{ 0x1471, "Integrated Telecom Express Inc" },
	{ 0x1473, "Zapex Technologies Inc" },
	{ 0x1474, "Doug Carson & Associates" },
	{ 0x1477, "Net Insight" },
	{ 0x1478, "Diatrend Corporation" },
	{ 0x147B, "Abit Computer Corp." },
	{ 0x147F, "Nihon Unisys Ltd." },
	{ 0x1482, "Isytec - Integrierte Systemtechnik Gmbh" },
	{ 0x1483, "Labway Coporation" },
	{ 0x1485, "Erma - Electronic GMBH" },
	{ 0x1489, "KYE Systems Corporation" },
	{ 0x148A, "Opto 22" },
	{ 0x148B, "Innomedialogic Inc." },
	{ 0x148D, "Digicom Systems Inc." },
	{ 0x148E, "OSI Plus Corporation" },
	{ 0x148F, "Plant Equipment Inc." },
	{ 0x1490, "TC Labs Pty Ltd." },
	{ 0x1493, "Maker Communications" },
	{ 0x1495, "Tokai Communications Industry Co. Ltd" },
	{ 0x1496, "Joytech Computer Co. Ltd." },
	{ 0x1497, "SMA Regelsysteme GMBH" },
	{ 0x1499, "Micro-Technology Co Ltd" },
	{ 0x149B, "Seiko Instruments Inc" },
	{ 0x149E, "Mapletree Networks Inc." },
	{ 0x149F, "Lectron Co Ltd" },
	{ 0x14A0, "Softing GMBH" },
	{ 0x14A2, "Millennium Engineering Inc" },
	{ 0x14A4, "GVC/BCM Advanced Research" },
	{ 0x14A5, "Xionics Document Technologies Inc." },
	{ 0x14A9, "Hivertec Inc." },
	{ 0x14AB, "Mentor Graphics Corp." },
	{ 0x14B1, "Nextcom K.K." },
	{ 0x14B3, "Xpeed Inc." },
	{ 0x14B4, "Philips Business Electronics B.V." },
	{ 0x14B6, "Quantum Data Corp." },
	{ 0x14B7, "Proxim Inc." },
	{ 0x14B9, "Aironet Wireless Communication" },
	{ 0x14BA, "Internix Inc." },
	{ 0x14BB, "Semtech Corporation" },
	{ 0x14BE, "L3 Communications" },
	{ 0x14C1, "Myricom Inc." },
	{ 0x14C2, "DTK Computer" },
	{ 0x14C4, "Iwasaki Information Systems Co Ltd" },
	{ 0x14C5, "ABB Automation Products AB" },
	{ 0x14C6, "Data Race Inc" },
	{ 0x14C7, "Modular Technology Ltd." },
	{ 0x14C9, "Odin Telesystems Inc" },
	{ 0x14CB, "Billionton Systems Inc./Cadmus Micro Inc" },
	{ 0x14CD, "Universal Scientific Ind." },
	{ 0x14CF, "TEK Microsystems Inc." },
	{ 0x14D2, "Oxford Semiconductor" },
	{ 0x14D4, "Panacom Technology Corporation" },
	{ 0x14D5, "Nitsuko Corporation" },
	{ 0x14D6, "Accusys Inc" },
	{ 0x14D7, "Hirakawa Hewtech Corp" },
	{ 0x14D8, "Hopf Elektronik GMBH" },
	{ 0x14D9, "Alpha Processor Inc" },
	{ 0x14DB, "Avlab Technology Inc." },
	{ 0x14DC, "Amplicon Liveline Inc." },
	{ 0x14DD, "Imodl Inc." },
	{ 0x14DE, "Applied Integration Corporation" },
	{ 0x14E3, "Amtelco" },
	{ 0x14E4, "Broadcom Corporation" },
	{ 0x14EB, "Seiko Epson Corporation" },
	{ 0x14EC, "Acqiris" },
	{ 0x14ED, "Datakinetics Ltd" },
	{ 0x14EF, "Carry Computer Eng. Co Ltd" },
	{ 0x14f1, "Conexant Systems, Inc." },
	{ 0x14F2, "Mobility Electronics, Inc." },
	{ 0x14F4, "Tokyo Electronic Industry Co. Ltd." },
	{ 0x14F5, "Sopac Ltd" },
	{ 0x14F6, "Coyote Technologies LLC" },
	{ 0x14F7, "Wolf Technology Inc" },
	{ 0x14F8, "Audiocodes Inc" },
	{ 0x14F9, "AG Communications" },
	{ 0x14FB, "Transas Marine (UK) Ltd" },
	{ 0x14FC, "Quadrics Supercomputers World" },
	{ 0x14FD, "Japan Computer Industry Inc." },
	{ 0x14FE, "Archtek Telecom Corp." },
	{ 0x14FF, "Twinhead International Corp." },
	{ 0x1500, "DELTA Electronics, Inc." },
	{ 0x1501, "Banksoft Canada Ltd" },
	{ 0x1502, "Mitsubishi Electric Logistics Support Co" },
	{ 0x1503, "Kawasaki LSI USA Inc" },
	{ 0x1504, "Kaiser Electronics" },
	{ 0x1506, "Chameleon Systems Inc" },
	{ 0x1507, "Htec Ltd." },
	{ 0x1509, "First International Computer Inc" },
	{ 0x150B, "Yamashita Systems Corp" },
	{ 0x150C, "Kyopal Co Ltd" },
	{ 0x150D, "Warpspped Inc" },
	{ 0x150E, "C-Port Corporation" },
	{ 0x150F, "Intec GMBH" },
	{ 0x1510, "Behavior Tech Computer Corp" },
	{ 0x1511, "Centillium Technology Corp" },
	{ 0x1512, "Rosun Technologies Inc" },
	{ 0x1513, "Raychem" },
	{ 0x1514, "TFL LAN Inc" },
	{ 0x1515, "ICS Advent" },
	{ 0x1516, "Myson Technology Inc" },
	{ 0x1517, "Echotek Corporation" },
	{ 0x1518, "PEP Modular Computers GMBH" },
	{ 0x1519, "Telefon Aktiebolaget LM Ericsson" },
	{ 0x151A, "Globetek Inc." },
	{ 0x151B, "Combox Ltd" },
	{ 0x151C, "Digital Audio Labs Inc" },
	{ 0x151D, "Fujitsu Computer Products Of America" },
	{ 0x151E, "Matrix Corp." },
	{ 0x151F, "Topic Semiconductor Corp" },
	{ 0x1520, "Chaplet System Inc" },
	{ 0x1521, "Bell Corporation" },
	{ 0x1522, "Mainpine Limited" },
	{ 0x1523, "Music Semiconductors" },
	{ 0x1524, "ENE Technology Inc" },
	{ 0x1525, "Impact Technologies" },
	{ 0x1526, "ISS Inc" },
	{ 0x1527, "Solectron" },
	{ 0x1528, "Acksys" },
	{ 0x1529, "American Microsystems Inc" },
	{ 0x152A, "Quickturn Design Systems" },
	{ 0x152B, "Flytech Technology Co Ltd" },
	{ 0x152C, "Macraigor Systems LLC" },
	{ 0x152D, "Quanta Computer Inc" },
	{ 0x152E, "Melec Inc" },
	{ 0x152F, "Philips - Crypto" },
	{ 0x1532, "Echelon Corporation" },
	{ 0x1533, "Baltimore" },
	{ 0x1534, "Road Corporation" },
	{ 0x1535, "Evergreen Technologies Inc" },
	{ 0x1537, "Datalex Communcations" },
	{ 0x1538, "Aralion Inc." },
	{ 0x1539, "Atelier Informatiques et Electronique Et" },
	{ 0x153A, "ONO Sokki" },
	{ 0x153B, "Terratec Electronic GMBH" },
	{ 0x153C, "Antal Electronic" },
	{ 0x153D, "Filanet Corporation" },
	{ 0x153E, "Techwell Inc" },
	{ 0x153F, "MIPS Denmark" },
	{ 0x1540, "Provideo Multimedia Co Ltd" },
	{ 0x1541, "Telocity Inc." },
	{ 0x1542, "Vivid Technology Inc" },
	{ 0x1543, "Silicon Laboratories" },
	{ 0x1544, "DCM Data Systems" },
	{ 0x1545, "Visiontek" },
	{ 0x1546, "IOI Technology Corp." },
	{ 0x1547, "Mitutoyo Corporation" },
	{ 0x1548, "Jet Propulsion Laboratory" },
	{ 0x1549, "Interconnect Systems Solutions" },
	{ 0x154A, "Max Technologies Inc." },
	{ 0x154B, "Computex Co Ltd" },
	{ 0x154C, "Visual Technology Inc." },
	{ 0x154D, "PAN International Industrial Corp" },
	{ 0x154E, "Servotest Ltd" },
	{ 0x154F, "Stratabeam Technology" },
	{ 0x1550, "Open Network Co Ltd" },
	{ 0x1551, "Smart Electronic Development GMBH" },
	{ 0x1552, "Racal Airtech Ltd" },
	{ 0x1553, "Chicony Electronics Co Ltd" },
	{ 0x1554, "Prolink Microsystems Corp." },
	{ 0x1556, "PLD Applications" },
	{ 0x1557, "Mediastar Co. Ltd" },
	{ 0x1558, "Clevo/Kapok Computer" },
	{ 0x1559, "SI Logic Ltd" },
	{ 0x155A, "Innomedia Inc" },
	{ 0x155B, "Protac International Corp" },
	{ 0x155C, "Cemax-Icon Inc" },
	{ 0x155D, "MAC System Co Ltd" },
	{ 0x155E, "LP Elektronik GMBH" },
	{ 0x155F, "Perle Systems Limited" },
	{ 0x1560, "Terayon Communications Systems" },
	{ 0x1561, "Viewgraphics Inc" },
	{ 0x1562, "Symbol Technologies" },
	{ 0x1563, "A-Trend Technology Co Ltd" },
	{ 0x1564, "Yamakatsu Electronics Industry Co Ltd" },
	{ 0x1565, "Biostar Microtech Intl Corp" },
	{ 0x1566, "Ardent Technologies Inc" },
	{ 0x1567, "Jungsoft" },
	{ 0x1568, "DDK Electronics Inc" },
	{ 0x1569, "Palit Microsystems Inc" },
	{ 0x156A, "Avtec Systems" },
	{ 0x156B, "2wire Inc" },
	{ 0x156C, "Vidac Electronics GMBH" },
	{ 0x156D, "Alpha-Top Corp" },
	{ 0x156E, "Alfa Inc." },
	{ 0x156F, "M-Systems Flash Disk Pioneers Ltd" },
	{ 0x1570, "Lecroy Corporation" },
	{ 0x1571, "Contemporary Controls" },
	{ 0x1572, "Otis Elevator Company" },
	{ 0x1573, "Lattice - Vantis" },
	{ 0x1574, "Fairchild Semiconductor" },
	{ 0x1575, "Voltaire Advanced Data Security Ltd" },
	{ 0x1576, "Viewcast Com" },
	{ 0x1578, "Hitt" },
	{ 0x1579, "Dual Technology Corporation" },
	{ 0x157A, "Japan Elecronics Ind. Inc" },
	{ 0x157B, "Star Multimedia Corp." },
	{ 0x157C, "Eurosoft (UK)" },
	{ 0x157D, "Gemflex Networks" },
	{ 0x157E, "Transition Networks" },
	{ 0x157F, "PX Instruments Technology Ltd" },
	{ 0x1580, "Primex Aerospace Co." },
	{ 0x1581, "SEH Computertechnik GMBH" },
	{ 0x1582, "Cytec Corporation" },
	{ 0x1583, "Inet Technologies Inc" },
	{ 0x1584, "Uniwill Computer Corp." },
	{ 0x1585, "Marconi Commerce Systems SRL" },
	{ 0x1586, "Lancast Inc" },
	{ 0x1587, "Konica Corporation" },
	{ 0x1588, "Solidum Systems Corp" },
	{ 0x1589, "Atlantek Microsystems Pty Ltd" },
	{ 0x158A, "Digalog Systems Inc" },
	{ 0x158B, "Allied Data Technologies" },
	{ 0x158C, "Hitachi Semiconductor & Devices Sales Co" },
	{ 0x158D, "Point Multimedia Systems" },
	{ 0x158E, "Lara Technology Inc" },
	{ 0x158F, "Ditect Coop" },
	{ 0x1590, "3pardata Inc." },
	{ 0x1591, "ARN" },
	{ 0x1592, "Syba Tech Ltd." },
	{ 0x1593, "Bops Inc" },
	{ 0x1594, "Netgame Ltd" },
	{ 0x1595, "Diva Systems Corp." },
	{ 0x1596, "Folsom Research Inc" },
	{ 0x1597, "Memec Design Services" },
	{ 0x1598, "Granite Microsystems" },
	{ 0x1599, "Delta Electronics Inc" },
	{ 0x159A, "General Instrument" },
	{ 0x159B, "Faraday Technology Corp" },
	{ 0x159C, "Stratus Computer Systems" },
	{ 0x159D, "Ningbo Harrison Electronics Co Ltd" },
	{ 0x159E, "A-Max Technology Co Ltd" },
	{ 0x159F, "Galea Network Security" },
	{ 0x15A0, "Compumaster SRL" },
	{ 0x15A1, "Geocast Network Systems Inc" },
	{ 0x15A2, "Catalyst Enterprises Inc" },
	{ 0x15A3, "Italtel" },
	{ 0x15A4, "X-Net OY" },
	{ 0x15A5, "Toyota MACS Inc" },
	{ 0x15A6, "Sunlight Ultrasound Technologies Ltd" },
	{ 0x15A7, "SSE Telecom Inc" },
	{ 0x15A8, "Shanghai Communications Technologies Cen" },
	{ 0x15AA, "Moreton Bay" },
	{ 0x15AB, "Bluesteel Networks Inc" },
	{ 0x15AC, "North Atlantic Instruments" },
	{ 0x15AD, "VMware Inc." },
	{ 0x15AE, "Amersham Pharmacia Biotech" },
	{ 0x15B0, "Zoltrix International Limited" },
	{ 0x15B1, "Source Technology Inc" },
	{ 0x15B2, "Mosaid Technologies Inc." },
	{ 0x15B3, "Mellanox Technology" },
	{ 0x15B4, "CCI/Triad" },
	{ 0x15B5, "Cimetrics Inc" },
	{ 0x15B6, "Texas Memory Systems Inc" },
	{ 0x15B7, "Sandisk Corp." },
	{ 0x15B8, "Addi-Data GMBH" },
	{ 0x15B9, "Maestro Digital Communications" },
	{ 0x15BA, "Impacct Technology Corp" },
	{ 0x15BB, "Portwell Inc" },
	{ 0x15BC, "Agilent Technologies" },
	{ 0x15BD, "DFI Inc." },
	{ 0x15BE, "Sola Electronics" },
	{ 0x15BF, "High Tech Computer Corp (HTC)" },
	{ 0x15C0, "BVM Limited" },
	{ 0x15C1, "Quantel" },
	{ 0x15C2, "Newer Technology Inc" },
	{ 0x15C3, "Taiwan Mycomp Co Ltd" },
	{ 0x15C4, "EVSX Inc" },
	{ 0x15C5, "Procomp Informatics Ltd" },
	{ 0x15C6, "Technical University Of Budapest" },
	{ 0x15C7, "Tateyama System Laboratory Co Ltd" },
	{ 0x15C8, "Penta Media Co. Ltd" },
	{ 0x15C9, "Serome Technology Inc" },
	{ 0x15CA, "Bitboys OY" },
	{ 0x15CB, "AG Electronics Ltd" },
	{ 0x15CC, "Hotrail Inc." },
	{ 0x15CD, "Dreamtech Co Ltd" },
	{ 0x15CE, "Genrad Inc." },
	{ 0x15CF, "Hilscher GMBH" },
	{ 0x15D1, "Infineon Technologies AG" },
	{ 0x15D2, "FIC (First International Computer Inc)" },
	{ 0x15D3, "NDS Technologies Israel Ltd" },
	{ 0x15D4, "Iwill Corporation" },
	{ 0x15D5, "Tatung Co." },
	{ 0x15D6, "Entridia Corporation" },
	{ 0x15D7, "Rockwell-Collins Inc" },
	{ 0x15D8, "Cybernetics Technology Co Ltd" },
	{ 0x15D9, "Super Micro Computer Inc" },
	{ 0x15DA, "Cyberfirm Inc." },
	{ 0x15DB, "Applied Computing Systems Inc." },
	{ 0x15DC, "Litronic Inc." },
	{ 0x15DD, "Sigmatel Inc." },
	{ 0x15DE, "Malleable Technologies Inc" },
	{ 0x15DF, "Infinilink Corp." },
	{ 0x15E0, "Cacheflow Inc" },
	{ 0x15E1, "Voice Technologies Group" },
	{ 0x15E2, "Quicknet Technologies Inc" },
	{ 0x15E3, "Networth Technologies Inc" },
	{ 0x15E4, "VSN Systemen BV" },
	{ 0x15E5, "Valley Technologies Inc" },
	{ 0x15E6, "Agere Inc." },
	{ 0x15E7, "GET Engineering Corp." },
	{ 0x15E8, "National Datacomm Corp." },
	{ 0x15E9, "Pacific Digital Corp." },
	{ 0x15EA, "Tokyo Denshi Sekei K.K." },
	{ 0x15EB, "Drsearch GMBH" },
	{ 0x15EC, "Beckhoff GMBH" },
	{ 0x15ED, "Macrolink Inc" },
	{ 0x15EE, "IN Win Development Inc." },
	{ 0x15EF, "Intelligent Paradigm Inc" },
	{ 0x15F0, "B-Tree Systems Inc" },
	{ 0x15F1, "Times N Systems Inc" },
	{ 0x15F2, "Diagnostic Instruments Inc" },
	{ 0x15F3, "Digitmedia Corp." },
	{ 0x15F4, "Valuesoft" },
	{ 0x15F5, "Power Micro Research" },
	{ 0x15F6, "Extreme Packet Device Inc" },
	{ 0x15F7, "Banctec" },
	{ 0x15F8, "Koga Electronics Co" },
	{ 0x15F9, "Zenith Electronics Corporation" },
	{ 0x15FA, "J.P. Axzam Corporation" },
	{ 0x15FB, "Zilog Inc." },
	{ 0x15FC, "Techsan Electronics Co Ltd" },
	{ 0x15FD, "N-Cubed.Net" },
	{ 0x15FE, "Kinpo Electronics Inc" },
	{ 0x15FF, "Fastpoint Technologies Inc." },
	{ 0x1600, "Northrop Grumman - Canada Ltd" },
	{ 0x1601, "Tenta Technology" },
	{ 0x1602, "Prosys-TEC Inc." },
	{ 0x1603, "Nokia Wireless Business Communications" },
	{ 0x1604, "Central System Research Co Ltd" },
	{ 0x1605, "Pairgain Technologies" },
	{ 0x1606, "Europop AG" },
	{ 0x1607, "Lava Semiconductor Manufacturing Inc." },
	{ 0x1608, "Automated Wagering International" },
	{ 0x1609, "Sciemetric Instruments Inc" },
	{ 0x160A, "Kollmorgen Servotronix" },
	{ 0x160B, "Onkyo Corp." },
	{ 0x160C, "Oregon Micro Systems Inc." },
	{ 0x160D, "Aaeon Electronics Inc" },
	{ 0x160E, "CML Emergency Services" },
	{ 0x160F, "ITEC Co Ltd" },
	{ 0x1610, "Tottori Sanyo Electric Co Ltd" },
	{ 0x1611, "Bel Fuse Inc." },
	{ 0x1612, "Telesynergy Research Inc." },
	{ 0x1613, "System Craft Inc." },
	{ 0x1614, "Jace Tech Inc." },
	{ 0x1615, "Equus Computer Systems Inc" },
	{ 0x1616, "Iotech Inc." },
	{ 0x1617, "Rapidstream Inc" },
	{ 0x1618, "Esec SA" },
	{ 0x1619, "FarSite Communications Limited" },
	{ 0x161A, "Wvinten Ltd" },
	{ 0x161B, "Mobilian Israel Ltd" },
	{ 0x161C, "Berkshire Products" },
	{ 0x161D, "Gatec" },
	{ 0x161E, "Kyoei Sangyo Co Ltd" },
	{ 0x161F, "Arima Computer Co" },
	{ 0x1620, "Sigmacom Co Ltd" },
	{ 0x1621, "Lynx Studio Technology Inc" },
	{ 0x1622, "Nokia Home Communications" },
	{ 0x1623, "KRF Tech Ltd" },
	{ 0x1624, "CE Infosys GMBH" },
	{ 0x1625, "Warp Nine Engineering" },
	{ 0x1626, "TDK Semiconductor Corp." },
	{ 0x1627, "BCom Electronics Inc" },
	{ 0x1629, "Kongsberg Spacetec a.s." },
	{ 0x162A, "Sejin Computerland Co Ltd" },
	{ 0x162B, "Shanghai Bell Company Limited" },
	{ 0x162C, "C&H Technologies Inc" },
	{ 0x162D, "Reprosoft Co Ltd" },
	{ 0x162E, "Margi Systems Inc" },
	{ 0x162F, "Rohde & Schwarz GMBH & Co KG" },
	{ 0x1630, "Sky Computers Inc" },
	{ 0x1631, "NEC Computer International" },
	{ 0x1632, "Verisys Inc" },
	{ 0x1633, "Adac Corporation" },
	{ 0x1634, "Visionglobal Network Corp." },
	{ 0x1635, "Decros" },
	{ 0x1636, "Jean Company Ltd" },
	{ 0x1637, "NSI" },
	{ 0x1638, "Eumitcom Technology Inc" },
	{ 0x163A, "Air Prime Inc" },
	{ 0x163B, "Glotrex Co Ltd" },
	{ 0x163C, "Smart Link" },
	{ 0x163D, "Heidelberg Digital LLC" },
	{ 0x163E, "3dpower" },
	{ 0x163F, "Renishaw PLC" },
	{ 0x1640, "Intelliworxx Inc" },
	{ 0x1641, "MKNet Corporation" },
	{ 0x1642, "Bitland" },
	{ 0x1643, "Hajime Industries Ltd" },
	{ 0x1644, "Western Avionics Ltd" },
	{ 0x1645, "Quick-Serv. Computer Co. Ltd" },
	{ 0x1646, "Nippon Systemware Co Ltd" },
	{ 0x1647, "Hertz Systemtechnik GMBH" },
	{ 0x1648, "MeltDown Systems LLC" },
	{ 0x1649, "Jupiter Systems" },
	{ 0x164A, "Aiwa Co. Ltd" },
	{ 0x164C, "Department Of Defense" },
	{ 0x164D, "Ishoni Networks" },
	{ 0x164E, "Micrel Inc." },
	{ 0x164F, "Datavoice (Pty) Ltd." },
	{ 0x1650, "Admore Technology Inc." },
	{ 0x1651, "Chaparral Network Storage" },
	{ 0x1652, "Spectrum Digital Inc." },
	{ 0x1653, "Nature Worldwide Technology Corp" },
	{ 0x1654, "Sonicwall Inc" },
	{ 0x1655, "Dazzle Multimedia Inc." },
	{ 0x1656, "Insyde Software Corp" },
	{ 0x1657, "Brocade Communications Systems" },
	{ 0x1658, "Med Associates Inc." },
	{ 0x1659, "Shiba Denshi Systems Inc." },
	{ 0x165A, "Epix Inc." },
	{ 0x165B, "Real-Time Digital Inc." },
	{ 0x165C, "Gidel Ltd." },
	{ 0x165D, "Hsing Tech. Enterprise Co. Ltd." },
	{ 0x165E, "Hyunju Computer Co. Ltd." },
	{ 0x165F, "Add One Company" },
	{ 0x1660, "Network Security Technologies Inc. (Net" },
	{ 0x1661, "Worldspace Corp." },
	{ 0x1662, "Int Labs" },
	{ 0x1663, "Elmec Inc. Ltd." },
	{ 0x1664, "Fastfame Technology Co. Ltd." },
	{ 0x1665, "Edax Inc." },
	{ 0x1666, "Norpak Corporation" },
	{ 0x1667, "CoSystems Inc." },
	{ 0x166A, "Komatsu Ltd." },
	{ 0x166B, "Supernet Inc." },
	{ 0x166C, "Shade Ltd." },
	{ 0x166D, "Sibyte Inc." },
	{ 0x166E, "Schneider Automation Inc." },
	{ 0x166F, "Televox Software Inc." },
	{ 0x1670, "Rearden Steel" },
	{ 0x1671, "Atan Technology Inc." },
	{ 0x1672, "Unitec Co. Ltd." },
	{ 0x1673, "Connex" },
	{ 0x1675, "Square Wave Technology" },
	{ 0x1676, "Emachines Inc." },
	{ 0x1677, "Bernecker + Rainer" },
	{ 0x1678, "INH Semiconductor" },
	{ 0x1679, "Tokyo Electron Device Ltd." },
	{ 0x16AE, "SafeNet Inc." },
	{ 0x1813, "Ambient Technologies Inc" },
	{ 0x1A08, "Sierra Semiconductor" },
	{ 0x1B13, "Jaton Corporation" },
	{ 0x1C1C, "Symphony" },
	{ 0x1D44, "Distributed Processing Technology" },
	{ 0x1DE1, "Tekram" },
	{ 0x2001, "Temporal Research Ltd" },
	{ 0x2348, "Racore" },
	{ 0x2646, "Kingston Technology Co." },
	{ 0x270F, "ChainTech Computer Co. Ltd." },
	{ 0x2EC1, "Zenic Inc" },
	{ 0x3000, "Hansol Electronics Inc." },
	{ 0x3142, "Post Impressions Systems" },
	{ 0x3388, "Hint Corp." },
	{ 0x3411, "Quantum Designs (H.K.) Inc." },
	{ 0x3513, "ARCOM Control Systems Ltd." },
	{ 0x38EF, "4links" },
	{ 0x3D3D, "3Dlabs, Inc. Ltd" },
	{ 0x4005, "Avance Logic Inc." },
	{ 0x4033, "Addtron Technology Co., Inc." },
	{ 0x4143, "Digital Equipment Corp." },
	{ 0x416C, "Aladdin Knowledge Systems" },
	{ 0x4444, "ICompression Inc." },
	{ 0x4468, "Bridgeport Machines" },
	{ 0x4594, "Cogetec Informatique Inc." },
	{ 0x45FB, "Baldor Electric Company" },
	{ 0x4680, "UMAX Computer Corp." },
	{ 0x4843, "Hercules Computer Technology" },
	{ 0x4943, "Growth Networks" },
	{ 0x4954, "Integral Technologies" },
	{ 0x4978, "Axil Computer Inc." },
	{ 0x4A14, "NetVin" },
	{ 0x4B10, "Buslogic Inc" },
	{ 0x4C48, "Lung Hwa Electronics" },
	{ 0x4C53, "SBS-OR Industrial Computers" },
	{ 0x4CA1, "Seanix Technology Inc" },
	{ 0x4D51, "Mediaq Inc." },
	{ 0x4D54, "Microtechnica Co Ltd" },
	{ 0x4DDC, "ILC Data Device Corp." },
	{ 0x5053, "TBS/Voyetra Technologies" },
	{ 0x5136, "S S Technologies" },
	{ 0x5143, "Qualcomm Inc." },
	{ 0x5145, "ENSONIQ" },
	{ 0x5301, "Alliance Semicondutor Corp." },
	{ 0x5333, "S3 Incorporated" },
	{ 0x544C, "Teralogic Inc" },
	{ 0x5455, "Technische Universtiaet Berlin" },
	{ 0x5519, "Cnet Technoliges, Inc." },
	{ 0x5555, "Genroco Inc." },
	{ 0x5700, "Netpower" },
	{ 0x6356, "UltraStor" },
	{ 0x6374, "c't Magazin f_r Computertechnik" },
	{ 0x6409, "Logitec Corp." },
	{ 0x6666, "Decision Computer International Co." },
	{ 0x7604, "O.N. Electric Co. Ltd." },
	{ 0x7747, "DaoGuo Technology Co.,Ltd" },
	{ 0x7BDE, "MIDAC Corporation" },
	{ 0x7FED, "PowerTV" },
	{ 0x8001, "Beyertone AG - Germany" },
	{ 0x8008, "QUANCOM Informationssysteme GmbH" },
	{ 0x8086, "Intel Corporation" },
	{ 0x8800, "Trigem Computer" },
	{ 0x8866, "T-Square Design Inc." },
	{ 0x8888, "Silicon Magic" },
	{ 0x8E0E, "Computone Corporation" },
	{ 0x8E2E, "KTI" },
	{ 0x9004, "Adaptec" },
	{ 0x9005, "Adaptec" },
	{ 0x907F, "Atronics" },
	{ 0x919A, "Gigapixel Corp" },
	{ 0x9412, "Holtek" },
	{ 0x9699, "Omni Media Technology Inc." },
	{ 0x9902, "Starbridge Technologies Inc" },
	{ 0xA0A0, "Aopen Inc." },
	{ 0xA0F1, "Unisys Corporation" },
	{ 0xA200, "NEC Corp." },
	{ 0xA259, "Hewlett Packard" },
	{ 0xA25B, "Hewlett Packard GmbH PL24-MKT" },
	{ 0xA304, "Sony" },
	{ 0xA727, "3com Corporation" },
	{ 0xAA42, "Scitex Digital Video" },
	{ 0xAC1E, "Digital Receiver Technology Inc" },
	{ 0xB1B3, "Shiva Europe Ltd." },
	{ 0xB894, "Brown & Sharpe Mfg. Co." },
	{ 0xC001, "TSI Telsys" },
	{ 0xC0A9, "Micron/Crucial Technology" },
	{ 0xC0DE, "Motorola" },
	{ 0xC0FE, "Motion Engineering Inc." },
	{ 0xC622, "Hudson Soft Co Ltd" },
	{ 0xCA50, "Varian Australia Pty. Ltd." },
	{ 0xCAFE, "Chrysalis-ITS" },
	{ 0xCCCC, "Catapult Communications" },
	{ 0xD4D4, "DY4 Systems Inc." },
	{ 0xD84D, "Exsys" },
	{ 0xDC93, "Dawicontrol" },
	{ 0xdead, "Indigita Corporation" },
	{ 0xE000, "Winbond" },
	{ 0xE159, "Tiger Jet Network Inc" },
	{ 0xE4BF, "EKF Elektronik GMBH" },
	{ 0xEA01, "Eagle Technology" },
	{ 0xECC0, "Echo Corporation" },
	{ 0xEDD8, "ARK Logic, Inc" },
	{ 0xF5F5, "F5 Networks Inc." },
	{ 0xFA57, "Fast Search & Transfer ASA" },
	{ 0xFEDA, "Epigram Inc" },
	{ 0xFFFE, "VMware Inc." },
	{ 0xFFFF, "ILLEGITIMATE VENDOR ID" }
};

#endif
