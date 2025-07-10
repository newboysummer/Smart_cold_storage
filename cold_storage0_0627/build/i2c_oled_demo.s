
i2c_oled_demo.elf:     file format elf32-loongarch
i2c_oled_demo.elf


Disassembly of section .text:

1c000000 <_start>:
_start():
1c000000:	0015000d 	move	$r13,$r0
1c000004:	50002000 	b	32(0x20) # 1c000024 <LoopCopyDataInit>

1c000008 <CopyDataInit>:
CopyDataInit():
1c000008:	143800cf 	lu12i.w	$r15,114694(0x1c006)
1c00000c:	038e81ef 	ori	$r15,$r15,0x3a0
1c000010:	001035f0 	add.w	$r16,$r15,$r13
1c000014:	2880020f 	ld.w	$r15,$r16,0
1c000018:	00103590 	add.w	$r16,$r12,$r13
1c00001c:	2980020f 	st.w	$r15,$r16,0
1c000020:	028011ad 	addi.w	$r13,$r13,4(0x4)

1c000024 <LoopCopyDataInit>:
LoopCopyDataInit():
1c000024:	1500002c 	lu12i.w	$r12,-524287(0x80001)
1c000028:	0380018c 	ori	$r12,$r12,0x0
1c00002c:	1500002f 	lu12i.w	$r15,-524287(0x80001)
1c000030:	038051ef 	ori	$r15,$r15,0x14
1c000034:	0010358e 	add.w	$r14,$r12,$r13
1c000038:	5fffd1cf 	bne	$r14,$r15,-48(0x3ffd0) # 1c000008 <CopyDataInit>
1c00003c:	1500000c 	lu12i.w	$r12,-524288(0x80000)
1c000040:	0380018c 	ori	$r12,$r12,0x0
1c000044:	1500000d 	lu12i.w	$r13,-524288(0x80000)
1c000048:	038031ad 	ori	$r13,$r13,0xc
1c00004c:	580011ac 	beq	$r13,$r12,16(0x10) # 1c00005c <cpu_init_start>

1c000050 <LoopFillZerobss>:
LoopFillZerobss():
1c000050:	29800180 	st.w	$r0,$r12,0
1c000054:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c000058:	5ffff9ac 	bne	$r13,$r12,-8(0x3fff8) # 1c000050 <LoopFillZerobss>

1c00005c <cpu_init_start>:
cpu_init_start():
1c00005c:	1438002c 	lu12i.w	$r12,114689(0x1c001)
1c000060:	0400302c 	csrwr	$r12,0xc
1c000064:	0015000c 	move	$r12,$r0
1c000068:	0400102c 	csrwr	$r12,0x4
1c00006c:	1400002c 	lu12i.w	$r12,1(0x1)
1c000070:	03bffd8c 	ori	$r12,$r12,0xfff
1c000074:	0400118c 	csrxchg	$r12,$r12,0x4
1c000078:	15ffe3ec 	lu12i.w	$r12,-225(0xfff1f)
1c00007c:	03bffd8c 	ori	$r12,$r12,0xfff
1c000080:	0406442c 	csrwr	$r12,0x191
1c000084:	14eca06c 	lu12i.w	$r12,484611(0x76503)
1c000088:	0388418c 	ori	$r12,$r12,0x210
1c00008c:	0406402c 	csrwr	$r12,0x190
1c000090:	0380200c 	ori	$r12,$r0,0x8
1c000094:	04000180 	csrxchg	$r0,$r12,0x0
1c000098:	15000023 	lu12i.w	$r3,-524287(0x80001)
1c00009c:	03bdf063 	ori	$r3,$r3,0xf7c
1c0000a0:	54132400 	bl	4900(0x1324) # 1c0013c4 <bsp_init>
1c0000a4:	03400000 	andi	$r0,$r0,0x0
1c0000a8:	4c000020 	jirl	$r0,$r1,0

1c0000ac <cpu_wait>:
cpu_wait():
1c0000ac:	06488000 	idle	0x0
1c0000b0:	4c000020 	jirl	$r0,$r1,0
	...

1c000800 <m4_flash_4k>:
m4_flash_4k():
1c000800:	140007ec 	lu12i.w	$r12,63(0x3f)
1c000804:	03be018c 	ori	$r12,$r12,0xf80
1c000808:	157fcc0d 	lu12i.w	$r13,-262560(0xbfe60)
1c00080c:	0014b08c 	and	$r12,$r4,$r12
1c000810:	038061af 	ori	$r15,$r13,0x18
1c000814:	02804010 	addi.w	$r16,$r0,16(0x10)
1c000818:	1540000e 	lu12i.w	$r14,-393216(0xa0000)
1c00081c:	298001f0 	st.w	$r16,$r15,0
1c000820:	0015398e 	or	$r14,$r12,$r14
1c000824:	298001ae 	st.w	$r14,$r13,0
1c000828:	1480000f 	lu12i.w	$r15,262144(0x40000)
1c00082c:	14b54aae 	lu12i.w	$r14,371285(0x5aa55)
1c000830:	0396a9ce 	ori	$r14,$r14,0x5aa
1c000834:	298001af 	st.w	$r15,$r13,0
1c000838:	15c0000f 	lu12i.w	$r15,-131072(0xe0000)
1c00083c:	2980008e 	st.w	$r14,$r4,0
1c000840:	00153d8c 	or	$r12,$r12,$r15
1c000844:	298001ac 	st.w	$r12,$r13,0
1c000848:	4c000020 	jirl	$r0,$r1,0
	...

1c001000 <DEFAULT_INT_HANDLER>:
DEFAULT_INT_HANDLER():
1c001000:	0400c435 	csrwr	$r21,0x31
1c001004:	15000055 	lu12i.w	$r21,-524286(0x80002)
1c001008:	29bff2ac 	st.w	$r12,$r21,-4(0xffc)
1c00100c:	29bfe2ad 	st.w	$r13,$r21,-8(0xff8)
1c001010:	29bfd2ae 	st.w	$r14,$r21,-12(0xff4)
1c001014:	29bfc2af 	st.w	$r15,$r21,-16(0xff0)
1c001018:	29bfb2b0 	st.w	$r16,$r21,-20(0xfec)
1c00101c:	29bfa2b1 	st.w	$r17,$r21,-24(0xfe8)
1c001020:	29bf92b2 	st.w	$r18,$r21,-28(0xfe4)
1c001024:	29bf82b3 	st.w	$r19,$r21,-32(0xfe0)
1c001028:	29bf72b4 	st.w	$r20,$r21,-36(0xfdc)
1c00102c:	29bed2a4 	st.w	$r4,$r21,-76(0xfb4)
1c001030:	29bec2a5 	st.w	$r5,$r21,-80(0xfb0)
1c001034:	29beb2a6 	st.w	$r6,$r21,-84(0xfac)
1c001038:	29bea2a7 	st.w	$r7,$r21,-88(0xfa8)
1c00103c:	29be92a8 	st.w	$r8,$r21,-92(0xfa4)
1c001040:	29be82a9 	st.w	$r9,$r21,-96(0xfa0)
1c001044:	29be72aa 	st.w	$r10,$r21,-100(0xf9c)
1c001048:	29be62ab 	st.w	$r11,$r21,-104(0xf98)
1c00104c:	29be52a1 	st.w	$r1,$r21,-108(0xf94)
1c001050:	29be42a3 	st.w	$r3,$r21,-112(0xf90)
1c001054:	0400140c 	csrrd	$r12,0x5
1c001058:	036ef18d 	andi	$r13,$r12,0xbbc
1c00105c:	400065a0 	beqz	$r13,100(0x64) # 1c0010c0 <exception_core_check>

1c001060 <exception_pmu>:
exception_pmu():
1c001060:	0340118d 	andi	$r13,$r12,0x4
1c001064:	44002da0 	bnez	$r13,44(0x2c) # 1c001090 <wake_label>
1c001068:	0340218d 	andi	$r13,$r12,0x8
1c00106c:	44002da0 	bnez	$r13,44(0x2c) # 1c001098 <touch_label>
1c001070:	0340418d 	andi	$r13,$r12,0x10
1c001074:	44002da0 	bnez	$r13,44(0x2c) # 1c0010a0 <uart2_label>
1c001078:	0340818d 	andi	$r13,$r12,0x20
1c00107c:	44002da0 	bnez	$r13,44(0x2c) # 1c0010a8 <bcc_label>
1c001080:	0342018d 	andi	$r13,$r12,0x80
1c001084:	44002da0 	bnez	$r13,44(0x2c) # 1c0010b0 <exint_label>
1c001088:	0360018d 	andi	$r13,$r12,0x800
1c00108c:	44002da0 	bnez	$r13,44(0x2c) # 1c0010b8 <timer_label>

1c001090 <wake_label>:
wake_label():
1c001090:	543ad800 	bl	15064(0x3ad8) # 1c004b68 <TIMER_WAKE_INT>
1c001094:	50003c00 	b	60(0x3c) # 1c0010d0 <exception_exit>

1c001098 <touch_label>:
touch_label():
1c001098:	543b2000 	bl	15136(0x3b20) # 1c004bb8 <TOUCH>
1c00109c:	50003400 	b	52(0x34) # 1c0010d0 <exception_exit>

1c0010a0 <uart2_label>:
uart2_label():
1c0010a0:	543bac00 	bl	15276(0x3bac) # 1c004c4c <UART2_INT>
1c0010a4:	50002c00 	b	44(0x2c) # 1c0010d0 <exception_exit>

1c0010a8 <bcc_label>:
bcc_label():
1c0010a8:	543be000 	bl	15328(0x3be0) # 1c004c88 <BAT_FAIL>
1c0010ac:	50002400 	b	36(0x24) # 1c0010d0 <exception_exit>

1c0010b0 <exint_label>:
exint_label():
1c0010b0:	543a0000 	bl	14848(0x3a00) # 1c004ab0 <ext_handler>
1c0010b4:	50001c00 	b	28(0x1c) # 1c0010d0 <exception_exit>

1c0010b8 <timer_label>:
timer_label():
1c0010b8:	543d5400 	bl	15700(0x3d54) # 1c004e0c <TIMER_HANDLER>
1c0010bc:	50001400 	b	20(0x14) # 1c0010d0 <exception_exit>

1c0010c0 <exception_core_check>:
exception_core_check():
1c0010c0:	0341018d 	andi	$r13,$r12,0x40
1c0010c4:	40000da0 	beqz	$r13,12(0xc) # 1c0010d0 <exception_exit>
1c0010c8:	543c9800 	bl	15512(0x3c98) # 1c004d60 <intc_handler>
1c0010cc:	50000400 	b	4(0x4) # 1c0010d0 <exception_exit>

1c0010d0 <exception_exit>:
exception_exit():
1c0010d0:	15000055 	lu12i.w	$r21,-524286(0x80002)
1c0010d4:	28bff2ac 	ld.w	$r12,$r21,-4(0xffc)
1c0010d8:	28bfe2ad 	ld.w	$r13,$r21,-8(0xff8)
1c0010dc:	28bfd2ae 	ld.w	$r14,$r21,-12(0xff4)
1c0010e0:	28bfc2af 	ld.w	$r15,$r21,-16(0xff0)
1c0010e4:	28bfb2b0 	ld.w	$r16,$r21,-20(0xfec)
1c0010e8:	28bfa2b1 	ld.w	$r17,$r21,-24(0xfe8)
1c0010ec:	28bf92b2 	ld.w	$r18,$r21,-28(0xfe4)
1c0010f0:	28bf82b3 	ld.w	$r19,$r21,-32(0xfe0)
1c0010f4:	28bf72b4 	ld.w	$r20,$r21,-36(0xfdc)
1c0010f8:	28bed2a4 	ld.w	$r4,$r21,-76(0xfb4)
1c0010fc:	28bec2a5 	ld.w	$r5,$r21,-80(0xfb0)
1c001100:	28beb2a6 	ld.w	$r6,$r21,-84(0xfac)
1c001104:	28bea2a7 	ld.w	$r7,$r21,-88(0xfa8)
1c001108:	28be92a8 	ld.w	$r8,$r21,-92(0xfa4)
1c00110c:	28be82a9 	ld.w	$r9,$r21,-96(0xfa0)
1c001110:	28be72aa 	ld.w	$r10,$r21,-100(0xf9c)
1c001114:	28be62ab 	ld.w	$r11,$r21,-104(0xf98)
1c001118:	28be52a1 	ld.w	$r1,$r21,-108(0xf94)
1c00111c:	28be42a3 	ld.w	$r3,$r21,-112(0xf90)
1c001120:	0400c415 	csrrd	$r21,0x31
1c001124:	06483800 	ertn

1c001128 <serial_out>:
serial_out():
1c001128:	157fd008 	lu12i.w	$r8,-262528(0xbfe80)
1c00112c:	2a001508 	ld.bu	$r8,$r8,5(0x5)
1c001130:	03408108 	andi	$r8,$r8,0x20
1c001134:	43fff51f 	beqz	$r8,-12(0x7ffff4) # 1c001128 <serial_out>
1c001138:	157fd00c 	lu12i.w	$r12,-262528(0xbfe80)
1c00113c:	29000184 	st.b	$r4,$r12,0
1c001140:	4c000020 	jirl	$r0,$r1,0

1c001144 <outputaddr>:
outputaddr():
1c001144:	02bff063 	addi.w	$r3,$r3,-4(0xffc)
1c001148:	29800061 	st.w	$r1,$r3,0
1c00114c:	1cc80006 	pcaddu12i	$r6,409600(0x64000)
1c001150:	28bae0c6 	ld.w	$r6,$r6,-328(0xeb8)
1c001154:	15e0000d 	lu12i.w	$r13,-65536(0xf0000)
1c001158:	0380200e 	ori	$r14,$r0,0x8
1c00115c:	0380700f 	ori	$r15,$r0,0x1c
1c001160:	03800085 	ori	$r5,$r4,0x0
1c001164:	58002dc0 	beq	$r14,$r0,44(0x2c) # 1c001190 <outputaddr+0x4c>
1c001168:	0014b4ac 	and	$r12,$r5,$r13
1c00116c:	0017bd8c 	srl.w	$r12,$r12,$r15
1c001170:	0010198c 	add.w	$r12,$r12,$r6
1c001174:	2a000190 	ld.bu	$r16,$r12,0
1c001178:	03800204 	ori	$r4,$r16,0x0
1c00117c:	57ffafff 	bl	-84(0xfffffac) # 1c001128 <serial_out>
1c001180:	004491ad 	srli.w	$r13,$r13,0x4
1c001184:	02bff1ef 	addi.w	$r15,$r15,-4(0xffc)
1c001188:	02bffdce 	addi.w	$r14,$r14,-1(0xfff)
1c00118c:	53ffdbff 	b	-40(0xfffffd8) # 1c001164 <outputaddr+0x20>
1c001190:	03802804 	ori	$r4,$r0,0xa
1c001194:	57ff97ff 	bl	-108(0xfffff94) # 1c001128 <serial_out>
1c001198:	28800061 	ld.w	$r1,$r3,0
1c00119c:	02801063 	addi.w	$r3,$r3,4(0x4)
1c0011a0:	4c000020 	jirl	$r0,$r1,0

1c0011a4 <outputstring>:
outputstring():
1c0011a4:	00150089 	move	$r9,$r4
1c0011a8:	2a00012c 	ld.bu	$r12,$r9,0
1c0011ac:	58002580 	beq	$r12,$r0,36(0x24) # 1c0011d0 <outputstring+0x2c>
1c0011b0:	157fd008 	lu12i.w	$r8,-262528(0xbfe80)
1c0011b4:	2a001508 	ld.bu	$r8,$r8,5(0x5)
1c0011b8:	03408108 	andi	$r8,$r8,0x20
1c0011bc:	43fff51f 	beqz	$r8,-12(0x7ffff4) # 1c0011b0 <outputstring+0xc>
1c0011c0:	157fd007 	lu12i.w	$r7,-262528(0xbfe80)
1c0011c4:	290000ec 	st.b	$r12,$r7,0
1c0011c8:	02800529 	addi.w	$r9,$r9,1(0x1)
1c0011cc:	53ffdfff 	b	-36(0xfffffdc) # 1c0011a8 <outputstring+0x4>
1c0011d0:	157fd008 	lu12i.w	$r8,-262528(0xbfe80)
1c0011d4:	2a001508 	ld.bu	$r8,$r8,5(0x5)
1c0011d8:	03410108 	andi	$r8,$r8,0x40
1c0011dc:	43fff51f 	beqz	$r8,-12(0x7ffff4) # 1c0011d0 <outputstring+0x2c>
1c0011e0:	4c000020 	jirl	$r0,$r1,0

1c0011e4 <cpu_sleep>:
cpu_sleep():
1c0011e4:	0400c435 	csrwr	$r21,0x31
1c0011e8:	15000055 	lu12i.w	$r21,-524286(0x80002)
1c0011ec:	29bff2ac 	st.w	$r12,$r21,-4(0xffc)
1c0011f0:	29bfe2ad 	st.w	$r13,$r21,-8(0xff8)
1c0011f4:	29bfd2ae 	st.w	$r14,$r21,-12(0xff4)
1c0011f8:	29bfc2af 	st.w	$r15,$r21,-16(0xff0)
1c0011fc:	29bfb2b0 	st.w	$r16,$r21,-20(0xfec)
1c001200:	29bfa2b1 	st.w	$r17,$r21,-24(0xfe8)
1c001204:	29bf92b2 	st.w	$r18,$r21,-28(0xfe4)
1c001208:	29bf82b3 	st.w	$r19,$r21,-32(0xfe0)
1c00120c:	29bf72b4 	st.w	$r20,$r21,-36(0xfdc)
1c001210:	29bf62b7 	st.w	$r23,$r21,-40(0xfd8)
1c001214:	29bf52b8 	st.w	$r24,$r21,-44(0xfd4)
1c001218:	29bf42b9 	st.w	$r25,$r21,-48(0xfd0)
1c00121c:	29bf32ba 	st.w	$r26,$r21,-52(0xfcc)
1c001220:	29bf22bb 	st.w	$r27,$r21,-56(0xfc8)
1c001224:	29bf12bc 	st.w	$r28,$r21,-60(0xfc4)
1c001228:	29bf02bd 	st.w	$r29,$r21,-64(0xfc0)
1c00122c:	29bef2be 	st.w	$r30,$r21,-68(0xfbc)
1c001230:	29bee2bf 	st.w	$r31,$r21,-72(0xfb8)
1c001234:	29bed2a4 	st.w	$r4,$r21,-76(0xfb4)
1c001238:	29bec2a5 	st.w	$r5,$r21,-80(0xfb0)
1c00123c:	29beb2a6 	st.w	$r6,$r21,-84(0xfac)
1c001240:	29bea2a7 	st.w	$r7,$r21,-88(0xfa8)
1c001244:	29be92a8 	st.w	$r8,$r21,-92(0xfa4)
1c001248:	29be82a9 	st.w	$r9,$r21,-96(0xfa0)
1c00124c:	29be72aa 	st.w	$r10,$r21,-100(0xf9c)
1c001250:	29be62ab 	st.w	$r11,$r21,-104(0xf98)
1c001254:	29be52a1 	st.w	$r1,$r21,-108(0xf94)
1c001258:	29be42a3 	st.w	$r3,$r21,-112(0xf90)
1c00125c:	29be32a2 	st.w	$r2,$r21,-116(0xf8c)
1c001260:	29be22b6 	st.w	$r22,$r21,-120(0xf88)
1c001264:	028002ac 	addi.w	$r12,$r21,0
1c001268:	0400c415 	csrrd	$r21,0x31
1c00126c:	29be1195 	st.w	$r21,$r12,-124(0xf84)
1c001270:	38720000 	dbar	0x0
1c001274:	157fd60d 	lu12i.w	$r13,-262480(0xbfeb0)
1c001278:	2880f1ac 	ld.w	$r12,$r13,60(0x3c)
1c00127c:	0340058c 	andi	$r12,$r12,0x1
1c001280:	43fff99f 	beqz	$r12,-8(0x7ffff8) # 1c001278 <cpu_sleep+0x94>
1c001284:	2980f1ac 	st.w	$r12,$r13,60(0x3c)
1c001288:	06488000 	idle	0x0

1c00128c <wakeup_reset>:
wakeup_reset():
1c00128c:	1cc80004 	pcaddu12i	$r4,409600(0x64000)
1c001290:	28b60084 	ld.w	$r4,$r4,-640(0xd80)
1c001294:	57ff13ff 	bl	-240(0xfffff10) # 1c0011a4 <outputstring>
1c001298:	15000055 	lu12i.w	$r21,-524286(0x80002)
1c00129c:	28bff2ac 	ld.w	$r12,$r21,-4(0xffc)
1c0012a0:	28bfe2ad 	ld.w	$r13,$r21,-8(0xff8)
1c0012a4:	28bfd2ae 	ld.w	$r14,$r21,-12(0xff4)
1c0012a8:	28bfc2af 	ld.w	$r15,$r21,-16(0xff0)
1c0012ac:	28bfb2b0 	ld.w	$r16,$r21,-20(0xfec)
1c0012b0:	28bfa2b1 	ld.w	$r17,$r21,-24(0xfe8)
1c0012b4:	28bf92b2 	ld.w	$r18,$r21,-28(0xfe4)
1c0012b8:	28bf82b3 	ld.w	$r19,$r21,-32(0xfe0)
1c0012bc:	28bf72b4 	ld.w	$r20,$r21,-36(0xfdc)
1c0012c0:	28bf62b7 	ld.w	$r23,$r21,-40(0xfd8)
1c0012c4:	28bf52b8 	ld.w	$r24,$r21,-44(0xfd4)
1c0012c8:	28bf42b9 	ld.w	$r25,$r21,-48(0xfd0)
1c0012cc:	28bf32ba 	ld.w	$r26,$r21,-52(0xfcc)
1c0012d0:	28bf22bb 	ld.w	$r27,$r21,-56(0xfc8)
1c0012d4:	28bf12bc 	ld.w	$r28,$r21,-60(0xfc4)
1c0012d8:	28bf02bd 	ld.w	$r29,$r21,-64(0xfc0)
1c0012dc:	28bef2be 	ld.w	$r30,$r21,-68(0xfbc)
1c0012e0:	28bee2bf 	ld.w	$r31,$r21,-72(0xfb8)
1c0012e4:	28bed2a4 	ld.w	$r4,$r21,-76(0xfb4)
1c0012e8:	28bec2a5 	ld.w	$r5,$r21,-80(0xfb0)
1c0012ec:	28beb2a6 	ld.w	$r6,$r21,-84(0xfac)
1c0012f0:	28bea2a7 	ld.w	$r7,$r21,-88(0xfa8)
1c0012f4:	28be92a8 	ld.w	$r8,$r21,-92(0xfa4)
1c0012f8:	28be82a9 	ld.w	$r9,$r21,-96(0xfa0)
1c0012fc:	28be72aa 	ld.w	$r10,$r21,-100(0xf9c)
1c001300:	28be62ab 	ld.w	$r11,$r21,-104(0xf98)
1c001304:	28be52a1 	ld.w	$r1,$r21,-108(0xf94)
1c001308:	28be42a3 	ld.w	$r3,$r21,-112(0xf90)
1c00130c:	28be32a2 	ld.w	$r2,$r21,-116(0xf8c)
1c001310:	28be22b6 	ld.w	$r22,$r21,-120(0xf88)
1c001314:	28be12b5 	ld.w	$r21,$r21,-124(0xf84)
1c001318:	0400c42c 	csrwr	$r12,0x31
1c00131c:	0380100c 	ori	$r12,$r0,0x4
1c001320:	0400018c 	csrxchg	$r12,$r12,0x0
1c001324:	0400c40c 	csrrd	$r12,0x31
1c001328:	4c000020 	jirl	$r0,$r1,0

1c00132c <GPIOInit>:
GPIOInit():
1c00132c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c001330:	29803061 	st.w	$r1,$r3,12(0xc)
1c001334:	29802076 	st.w	$r22,$r3,8(0x8)
1c001338:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00133c:	02800406 	addi.w	$r6,$r0,1(0x1)
1c001340:	140001ec 	lu12i.w	$r12,15(0xf)
1c001344:	03bffd85 	ori	$r5,$r12,0xfff
1c001348:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00134c:	03804184 	ori	$r4,$r12,0x10
1c001350:	54017000 	bl	368(0x170) # 1c0014c0 <AFIO_RemapConfig>
1c001354:	02800406 	addi.w	$r6,$r0,1(0x1)
1c001358:	140001ec 	lu12i.w	$r12,15(0xf)
1c00135c:	03bffd85 	ori	$r5,$r12,0xfff
1c001360:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c001364:	03805184 	ori	$r4,$r12,0x14
1c001368:	54015800 	bl	344(0x158) # 1c0014c0 <AFIO_RemapConfig>
1c00136c:	02800406 	addi.w	$r6,$r0,1(0x1)
1c001370:	140001ec 	lu12i.w	$r12,15(0xf)
1c001374:	03bcfd85 	ori	$r5,$r12,0xf3f
1c001378:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00137c:	03806184 	ori	$r4,$r12,0x18
1c001380:	54014000 	bl	320(0x140) # 1c0014c0 <AFIO_RemapConfig>
1c001384:	02800406 	addi.w	$r6,$r0,1(0x1)
1c001388:	02830005 	addi.w	$r5,$r0,192(0xc0)
1c00138c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c001390:	03806184 	ori	$r4,$r12,0x18
1c001394:	54012c00 	bl	300(0x12c) # 1c0014c0 <AFIO_RemapConfig>
1c001398:	02800406 	addi.w	$r6,$r0,1(0x1)
1c00139c:	140001ec 	lu12i.w	$r12,15(0xf)
1c0013a0:	03bffd85 	ori	$r5,$r12,0xfff
1c0013a4:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0013a8:	03807184 	ori	$r4,$r12,0x1c
1c0013ac:	54011400 	bl	276(0x114) # 1c0014c0 <AFIO_RemapConfig>
1c0013b0:	03400000 	andi	$r0,$r0,0x0
1c0013b4:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0013b8:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0013bc:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0013c0:	4c000020 	jirl	$r0,$r1,0

1c0013c4 <bsp_init>:
bsp_init():
1c0013c4:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0013c8:	29807061 	st.w	$r1,$r3,28(0x1c)
1c0013cc:	29806076 	st.w	$r22,$r3,24(0x18)
1c0013d0:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0013d4:	541e0000 	bl	7680(0x1e00) # 1c0031d4 <DisableInt>
1c0013d8:	541d6000 	bl	7520(0x1d60) # 1c003138 <SystemClockInit>
1c0013dc:	57ff53ff 	bl	-176(0xfffff50) # 1c00132c <GPIOInit>
1c0013e0:	5423fc00 	bl	9212(0x23fc) # 1c0037dc <WdgInit>
1c0013e4:	02802004 	addi.w	$r4,$r0,8(0x8)
1c0013e8:	54233c00 	bl	9020(0x233c) # 1c003724 <WDG_SetWatchDog>
1c0013ec:	1400038c 	lu12i.w	$r12,28(0x1c)
1c0013f0:	03880184 	ori	$r4,$r12,0x200
1c0013f4:	54165400 	bl	5716(0x1654) # 1c002a48 <Uart1_init>
1c0013f8:	541fd000 	bl	8144(0x1fd0) # 1c0033c8 <ls1x_logo>
1c0013fc:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c001400:	0380118c 	ori	$r12,$r12,0x4
1c001404:	2880018e 	ld.w	$r14,$r12,0
1c001408:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00140c:	0380118c 	ori	$r12,$r12,0x4
1c001410:	1404000d 	lu12i.w	$r13,8192(0x2000)
1c001414:	001535cd 	or	$r13,$r14,$r13
1c001418:	2980018d 	st.w	$r13,$r12,0
1c00141c:	541ddc00 	bl	7644(0x1ddc) # 1c0031f8 <EnableInt>
1c001420:	54207000 	bl	8304(0x2070) # 1c003490 <open_count>
1c001424:	02801804 	addi.w	$r4,$r0,6(0x6)
1c001428:	541e3800 	bl	7736(0x1e38) # 1c003260 <Wake_Set>
1c00142c:	54238400 	bl	9092(0x2384) # 1c0037b0 <WDG_DogFeed>
1c001430:	541edc00 	bl	7900(0x1edc) # 1c00330c <PMU_GetRstRrc>
1c001434:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c001438:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00143c:	44003180 	bnez	$r12,48(0x30) # 1c00146c <bsp_init+0xa8>
1c001440:	1c000084 	pcaddu12i	$r4,4(0x4)
1c001444:	028ef084 	addi.w	$r4,$r4,956(0x3bc)
1c001448:	5409d000 	bl	2512(0x9d0) # 1c001e18 <myprintf>
1c00144c:	541f2c00 	bl	7980(0x1f2c) # 1c003378 <PMU_GetBootSpiStatus>
1c001450:	0015008c 	move	$r12,$r4
1c001454:	40001180 	beqz	$r12,16(0x10) # 1c001464 <bsp_init+0xa0>
1c001458:	1c000084 	pcaddu12i	$r4,4(0x4)
1c00145c:	028ed084 	addi.w	$r4,$r4,948(0x3b4)
1c001460:	5409b800 	bl	2488(0x9b8) # 1c001e18 <myprintf>
1c001464:	5439e000 	bl	14816(0x39e0) # 1c004e44 <main>
1c001468:	50004000 	b	64(0x40) # 1c0014a8 <bsp_init+0xe4>
1c00146c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c001470:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c001474:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c00148c <bsp_init+0xc8>
1c001478:	1c000084 	pcaddu12i	$r4,4(0x4)
1c00147c:	028e8084 	addi.w	$r4,$r4,928(0x3a0)
1c001480:	54099800 	bl	2456(0x998) # 1c001e18 <myprintf>
1c001484:	5439c000 	bl	14784(0x39c0) # 1c004e44 <main>
1c001488:	50002000 	b	32(0x20) # 1c0014a8 <bsp_init+0xe4>
1c00148c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c001490:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c001494:	5c0015ac 	bne	$r13,$r12,20(0x14) # 1c0014a8 <bsp_init+0xe4>
1c001498:	1c000084 	pcaddu12i	$r4,4(0x4)
1c00149c:	028e4084 	addi.w	$r4,$r4,912(0x390)
1c0014a0:	54097800 	bl	2424(0x978) # 1c001e18 <myprintf>
1c0014a4:	57fd43ff 	bl	-704(0xffffd40) # 1c0011e4 <cpu_sleep>
1c0014a8:	0015000c 	move	$r12,$r0
1c0014ac:	00150184 	move	$r4,$r12
1c0014b0:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c0014b4:	28806076 	ld.w	$r22,$r3,24(0x18)
1c0014b8:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0014bc:	4c000020 	jirl	$r0,$r1,0

1c0014c0 <AFIO_RemapConfig>:
AFIO_RemapConfig():
1c0014c0:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0014c4:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c0014c8:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c0014cc:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c0014d0:	001500ac 	move	$r12,$r5
1c0014d4:	29bf52c6 	st.w	$r6,$r22,-44(0xfd4)
1c0014d8:	297f6acc 	st.h	$r12,$r22,-38(0xfda)
1c0014dc:	29bf92c0 	st.w	$r0,$r22,-28(0xfe4)
1c0014e0:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c0014e4:	29bf82c0 	st.w	$r0,$r22,-32(0xfe0)
1c0014e8:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0014ec:	2880018c 	ld.w	$r12,$r12,0
1c0014f0:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0014f4:	293faec0 	st.b	$r0,$r22,-21(0xfeb)
1c0014f8:	50006c00 	b	108(0x6c) # 1c001564 <AFIO_RemapConfig+0xa4>
1c0014fc:	2a7f6acd 	ld.hu	$r13,$r22,-38(0xfda)
1c001500:	2a3faecc 	ld.bu	$r12,$r22,-21(0xfeb)
1c001504:	001831ac 	sra.w	$r12,$r13,$r12
1c001508:	0340058c 	andi	$r12,$r12,0x1
1c00150c:	40004d80 	beqz	$r12,76(0x4c) # 1c001558 <AFIO_RemapConfig+0x98>
1c001510:	2a3faecc 	ld.bu	$r12,$r22,-21(0xfeb)
1c001514:	0040858c 	slli.w	$r12,$r12,0x1
1c001518:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c00151c:	02800c0d 	addi.w	$r13,$r0,3(0x3)
1c001520:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c001524:	001731ac 	sll.w	$r12,$r13,$r12
1c001528:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c00152c:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c001530:	0014300c 	nor	$r12,$r0,$r12
1c001534:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c001538:	0014b1ac 	and	$r12,$r13,$r12
1c00153c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001540:	28bf52cd 	ld.w	$r13,$r22,-44(0xfd4)
1c001544:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c001548:	001731ac 	sll.w	$r12,$r13,$r12
1c00154c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c001550:	001531ac 	or	$r12,$r13,$r12
1c001554:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001558:	2a3faecc 	ld.bu	$r12,$r22,-21(0xfeb)
1c00155c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001560:	293faecc 	st.b	$r12,$r22,-21(0xfeb)
1c001564:	2a3faecd 	ld.bu	$r13,$r22,-21(0xfeb)
1c001568:	02803c0c 	addi.w	$r12,$r0,15(0xf)
1c00156c:	6fff918d 	bgeu	$r12,$r13,-112(0x3ff90) # 1c0014fc <AFIO_RemapConfig+0x3c>
1c001570:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001574:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c001578:	2980018d 	st.w	$r13,$r12,0
1c00157c:	03400000 	andi	$r0,$r0,0x0
1c001580:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c001584:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c001588:	4c000020 	jirl	$r0,$r1,0

1c00158c <gpio_get_pin>:
gpio_get_pin():
1c00158c:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c001590:	29807076 	st.w	$r22,$r3,28(0x1c)
1c001594:	02808076 	addi.w	$r22,$r3,32(0x20)
1c001598:	0015008c 	move	$r12,$r4
1c00159c:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c0015a0:	2a3fbecd 	ld.bu	$r13,$r22,-17(0xfef)
1c0015a4:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0015a8:	0382018c 	ori	$r12,$r12,0x80
1c0015ac:	001031ac 	add.w	$r12,$r13,$r12
1c0015b0:	29000180 	st.b	$r0,$r12,0
1c0015b4:	2a3fbecd 	ld.bu	$r13,$r22,-17(0xfef)
1c0015b8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0015bc:	0382018c 	ori	$r12,$r12,0x80
1c0015c0:	001031ac 	add.w	$r12,$r13,$r12
1c0015c4:	2a00018c 	ld.bu	$r12,$r12,0
1c0015c8:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0015cc:	00150184 	move	$r4,$r12
1c0015d0:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c0015d4:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0015d8:	4c000020 	jirl	$r0,$r1,0

1c0015dc <gpio_write_pin>:
gpio_write_pin():
1c0015dc:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0015e0:	29807076 	st.w	$r22,$r3,28(0x1c)
1c0015e4:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0015e8:	0015008c 	move	$r12,$r4
1c0015ec:	001500ad 	move	$r13,$r5
1c0015f0:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c0015f4:	001501ac 	move	$r12,$r13
1c0015f8:	293fbacc 	st.b	$r12,$r22,-18(0xfee)
1c0015fc:	2a3fbacd 	ld.bu	$r13,$r22,-18(0xfee)
1c001600:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c001604:	5c0025ac 	bne	$r13,$r12,36(0x24) # 1c001628 <gpio_write_pin+0x4c>
1c001608:	2a3fbecd 	ld.bu	$r13,$r22,-17(0xfef)
1c00160c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c001610:	0382018c 	ori	$r12,$r12,0x80
1c001614:	001031ac 	add.w	$r12,$r13,$r12
1c001618:	0015018d 	move	$r13,$r12
1c00161c:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c001620:	290001ac 	st.b	$r12,$r13,0
1c001624:	50002000 	b	32(0x20) # 1c001644 <gpio_write_pin+0x68>
1c001628:	2a3fbecd 	ld.bu	$r13,$r22,-17(0xfef)
1c00162c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c001630:	0382018c 	ori	$r12,$r12,0x80
1c001634:	001031ac 	add.w	$r12,$r13,$r12
1c001638:	0015018d 	move	$r13,$r12
1c00163c:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c001640:	290001ac 	st.b	$r12,$r13,0
1c001644:	03400000 	andi	$r0,$r0,0x0
1c001648:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c00164c:	02808063 	addi.w	$r3,$r3,32(0x20)
1c001650:	4c000020 	jirl	$r0,$r1,0

1c001654 <gpio_pin_remap>:
gpio_pin_remap():
1c001654:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c001658:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c00165c:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c001660:	0015008c 	move	$r12,$r4
1c001664:	001500ad 	move	$r13,$r5
1c001668:	293f7ecc 	st.b	$r12,$r22,-33(0xfdf)
1c00166c:	001501ac 	move	$r12,$r13
1c001670:	293f7acc 	st.b	$r12,$r22,-34(0xfde)
1c001674:	2a3f7ecc 	ld.bu	$r12,$r22,-33(0xfdf)
1c001678:	0044918c 	srli.w	$r12,$r12,0x4
1c00167c:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001680:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001684:	2a3f7ecc 	ld.bu	$r12,$r22,-33(0xfdf)
1c001688:	03403d8c 	andi	$r12,$r12,0xf
1c00168c:	0040858c 	slli.w	$r12,$r12,0x1
1c001690:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001694:	2a3f7ecd 	ld.bu	$r13,$r22,-33(0xfdf)
1c001698:	0280fc0c 	addi.w	$r12,$r0,63(0x3f)
1c00169c:	6801b58d 	bltu	$r12,$r13,436(0x1b4) # 1c001850 <gpio_pin_remap+0x1fc>
1c0016a0:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0016a4:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0016a8:	580089ac 	beq	$r13,$r12,136(0x88) # 1c001730 <gpio_pin_remap+0xdc>
1c0016ac:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0016b0:	40002180 	beqz	$r12,32(0x20) # 1c0016d0 <gpio_pin_remap+0x7c>
1c0016b4:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0016b8:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c0016bc:	5800d5ac 	beq	$r13,$r12,212(0xd4) # 1c001790 <gpio_pin_remap+0x13c>
1c0016c0:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0016c4:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c0016c8:	580129ac 	beq	$r13,$r12,296(0x128) # 1c0017f0 <gpio_pin_remap+0x19c>
1c0016cc:	50018800 	b	392(0x188) # 1c001854 <gpio_pin_remap+0x200>
1c0016d0:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0016d4:	0380418c 	ori	$r12,$r12,0x10
1c0016d8:	2880018d 	ld.w	$r13,$r12,0
1c0016dc:	02800c0e 	addi.w	$r14,$r0,3(0x3)
1c0016e0:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0016e4:	001731cc 	sll.w	$r12,$r14,$r12
1c0016e8:	0014300c 	nor	$r12,$r0,$r12
1c0016ec:	0015018e 	move	$r14,$r12
1c0016f0:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0016f4:	0380418c 	ori	$r12,$r12,0x10
1c0016f8:	0014b9ad 	and	$r13,$r13,$r14
1c0016fc:	2980018d 	st.w	$r13,$r12,0
1c001700:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c001704:	0380418c 	ori	$r12,$r12,0x10
1c001708:	2880018d 	ld.w	$r13,$r12,0
1c00170c:	2a3f7ace 	ld.bu	$r14,$r22,-34(0xfde)
1c001710:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001714:	001731cc 	sll.w	$r12,$r14,$r12
1c001718:	0015018e 	move	$r14,$r12
1c00171c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c001720:	0380418c 	ori	$r12,$r12,0x10
1c001724:	001539ad 	or	$r13,$r13,$r14
1c001728:	2980018d 	st.w	$r13,$r12,0
1c00172c:	50012800 	b	296(0x128) # 1c001854 <gpio_pin_remap+0x200>
1c001730:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c001734:	0380518c 	ori	$r12,$r12,0x14
1c001738:	2880018d 	ld.w	$r13,$r12,0
1c00173c:	02800c0e 	addi.w	$r14,$r0,3(0x3)
1c001740:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001744:	001731cc 	sll.w	$r12,$r14,$r12
1c001748:	0014300c 	nor	$r12,$r0,$r12
1c00174c:	0015018e 	move	$r14,$r12
1c001750:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c001754:	0380518c 	ori	$r12,$r12,0x14
1c001758:	0014b9ad 	and	$r13,$r13,$r14
1c00175c:	2980018d 	st.w	$r13,$r12,0
1c001760:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c001764:	0380518c 	ori	$r12,$r12,0x14
1c001768:	2880018d 	ld.w	$r13,$r12,0
1c00176c:	2a3f7ace 	ld.bu	$r14,$r22,-34(0xfde)
1c001770:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001774:	001731cc 	sll.w	$r12,$r14,$r12
1c001778:	0015018e 	move	$r14,$r12
1c00177c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c001780:	0380518c 	ori	$r12,$r12,0x14
1c001784:	001539ad 	or	$r13,$r13,$r14
1c001788:	2980018d 	st.w	$r13,$r12,0
1c00178c:	5000c800 	b	200(0xc8) # 1c001854 <gpio_pin_remap+0x200>
1c001790:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c001794:	0380618c 	ori	$r12,$r12,0x18
1c001798:	2880018d 	ld.w	$r13,$r12,0
1c00179c:	02800c0e 	addi.w	$r14,$r0,3(0x3)
1c0017a0:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0017a4:	001731cc 	sll.w	$r12,$r14,$r12
1c0017a8:	0014300c 	nor	$r12,$r0,$r12
1c0017ac:	0015018e 	move	$r14,$r12
1c0017b0:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0017b4:	0380618c 	ori	$r12,$r12,0x18
1c0017b8:	0014b9ad 	and	$r13,$r13,$r14
1c0017bc:	2980018d 	st.w	$r13,$r12,0
1c0017c0:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0017c4:	0380618c 	ori	$r12,$r12,0x18
1c0017c8:	2880018d 	ld.w	$r13,$r12,0
1c0017cc:	2a3f7ace 	ld.bu	$r14,$r22,-34(0xfde)
1c0017d0:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0017d4:	001731cc 	sll.w	$r12,$r14,$r12
1c0017d8:	0015018e 	move	$r14,$r12
1c0017dc:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0017e0:	0380618c 	ori	$r12,$r12,0x18
1c0017e4:	001539ad 	or	$r13,$r13,$r14
1c0017e8:	2980018d 	st.w	$r13,$r12,0
1c0017ec:	50006800 	b	104(0x68) # 1c001854 <gpio_pin_remap+0x200>
1c0017f0:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0017f4:	0380718c 	ori	$r12,$r12,0x1c
1c0017f8:	2880018d 	ld.w	$r13,$r12,0
1c0017fc:	02800c0e 	addi.w	$r14,$r0,3(0x3)
1c001800:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001804:	001731cc 	sll.w	$r12,$r14,$r12
1c001808:	0014300c 	nor	$r12,$r0,$r12
1c00180c:	0015018e 	move	$r14,$r12
1c001810:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c001814:	0380718c 	ori	$r12,$r12,0x1c
1c001818:	0014b9ad 	and	$r13,$r13,$r14
1c00181c:	2980018d 	st.w	$r13,$r12,0
1c001820:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c001824:	0380718c 	ori	$r12,$r12,0x1c
1c001828:	2880018d 	ld.w	$r13,$r12,0
1c00182c:	2a3f7ace 	ld.bu	$r14,$r22,-34(0xfde)
1c001830:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001834:	001731cc 	sll.w	$r12,$r14,$r12
1c001838:	0015018e 	move	$r14,$r12
1c00183c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c001840:	0380718c 	ori	$r12,$r12,0x1c
1c001844:	001539ad 	or	$r13,$r13,$r14
1c001848:	2980018d 	st.w	$r13,$r12,0
1c00184c:	50000800 	b	8(0x8) # 1c001854 <gpio_pin_remap+0x200>
1c001850:	03400000 	andi	$r0,$r0,0x0
1c001854:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c001858:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c00185c:	4c000020 	jirl	$r0,$r1,0

1c001860 <gpio_set_direction>:
gpio_set_direction():
1c001860:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c001864:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c001868:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c00186c:	0015008c 	move	$r12,$r4
1c001870:	001500ad 	move	$r13,$r5
1c001874:	293f7ecc 	st.b	$r12,$r22,-33(0xfdf)
1c001878:	001501ac 	move	$r12,$r13
1c00187c:	293f7acc 	st.b	$r12,$r22,-34(0xfde)
1c001880:	2a3f7ecc 	ld.bu	$r12,$r22,-33(0xfdf)
1c001884:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001888:	2a3f7ecd 	ld.bu	$r13,$r22,-33(0xfdf)
1c00188c:	02807c0c 	addi.w	$r12,$r0,31(0x1f)
1c001890:	6800658d 	bltu	$r12,$r13,100(0x64) # 1c0018f4 <gpio_set_direction+0x94>
1c001894:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c001898:	0381018c 	ori	$r12,$r12,0x40
1c00189c:	2880018d 	ld.w	$r13,$r12,0
1c0018a0:	0280040e 	addi.w	$r14,$r0,1(0x1)
1c0018a4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0018a8:	001731cc 	sll.w	$r12,$r14,$r12
1c0018ac:	0014300c 	nor	$r12,$r0,$r12
1c0018b0:	0015018e 	move	$r14,$r12
1c0018b4:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0018b8:	0381018c 	ori	$r12,$r12,0x40
1c0018bc:	0014b9ad 	and	$r13,$r13,$r14
1c0018c0:	2980018d 	st.w	$r13,$r12,0
1c0018c4:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0018c8:	0381018c 	ori	$r12,$r12,0x40
1c0018cc:	2880018d 	ld.w	$r13,$r12,0
1c0018d0:	2a3f7ace 	ld.bu	$r14,$r22,-34(0xfde)
1c0018d4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0018d8:	001731cc 	sll.w	$r12,$r14,$r12
1c0018dc:	0015018e 	move	$r14,$r12
1c0018e0:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0018e4:	0381018c 	ori	$r12,$r12,0x40
1c0018e8:	001539ad 	or	$r13,$r13,$r14
1c0018ec:	2980018d 	st.w	$r13,$r12,0
1c0018f0:	50008c00 	b	140(0x8c) # 1c00197c <gpio_set_direction+0x11c>
1c0018f4:	2a3f7ecd 	ld.bu	$r13,$r22,-33(0xfdf)
1c0018f8:	02807c0c 	addi.w	$r12,$r0,31(0x1f)
1c0018fc:	6c007d8d 	bgeu	$r12,$r13,124(0x7c) # 1c001978 <gpio_set_direction+0x118>
1c001900:	2a3f7ecd 	ld.bu	$r13,$r22,-33(0xfdf)
1c001904:	0281000c 	addi.w	$r12,$r0,64(0x40)
1c001908:	6800718d 	bltu	$r12,$r13,112(0x70) # 1c001978 <gpio_set_direction+0x118>
1c00190c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001910:	02bf818c 	addi.w	$r12,$r12,-32(0xfe0)
1c001914:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001918:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00191c:	0381418c 	ori	$r12,$r12,0x50
1c001920:	2880018d 	ld.w	$r13,$r12,0
1c001924:	0280040e 	addi.w	$r14,$r0,1(0x1)
1c001928:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00192c:	001731cc 	sll.w	$r12,$r14,$r12
1c001930:	0014300c 	nor	$r12,$r0,$r12
1c001934:	0015018e 	move	$r14,$r12
1c001938:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00193c:	0381418c 	ori	$r12,$r12,0x50
1c001940:	0014b9ad 	and	$r13,$r13,$r14
1c001944:	2980018d 	st.w	$r13,$r12,0
1c001948:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00194c:	0381418c 	ori	$r12,$r12,0x50
1c001950:	2880018d 	ld.w	$r13,$r12,0
1c001954:	2a3f7ace 	ld.bu	$r14,$r22,-34(0xfde)
1c001958:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00195c:	001731cc 	sll.w	$r12,$r14,$r12
1c001960:	0015018e 	move	$r14,$r12
1c001964:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c001968:	0381418c 	ori	$r12,$r12,0x50
1c00196c:	001539ad 	or	$r13,$r13,$r14
1c001970:	2980018d 	st.w	$r13,$r12,0
1c001974:	50000800 	b	8(0x8) # 1c00197c <gpio_set_direction+0x11c>
1c001978:	03400000 	andi	$r0,$r0,0x0
1c00197c:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c001980:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c001984:	4c000020 	jirl	$r0,$r1,0

1c001988 <myputchar>:
myputchar():
1c001988:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c00198c:	29807061 	st.w	$r1,$r3,28(0x1c)
1c001990:	29806076 	st.w	$r22,$r3,24(0x18)
1c001994:	02808076 	addi.w	$r22,$r3,32(0x20)
1c001998:	0015008c 	move	$r12,$r4
1c00199c:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c0019a0:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c0019a4:	00150185 	move	$r5,$r12
1c0019a8:	157fd104 	lu12i.w	$r4,-262520(0xbfe88)
1c0019ac:	54102400 	bl	4132(0x1024) # 1c0029d0 <UART_SendData>
1c0019b0:	03400000 	andi	$r0,$r0,0x0
1c0019b4:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c0019b8:	28806076 	ld.w	$r22,$r3,24(0x18)
1c0019bc:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0019c0:	4c000020 	jirl	$r0,$r1,0

1c0019c4 <myputchar2>:
myputchar2():
1c0019c4:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0019c8:	29807061 	st.w	$r1,$r3,28(0x1c)
1c0019cc:	29806076 	st.w	$r22,$r3,24(0x18)
1c0019d0:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0019d4:	0015008c 	move	$r12,$r4
1c0019d8:	001500ad 	move	$r13,$r5
1c0019dc:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c0019e0:	001501ac 	move	$r12,$r13
1c0019e4:	293fbacc 	st.b	$r12,$r22,-18(0xfee)
1c0019e8:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c0019ec:	44001580 	bnez	$r12,20(0x14) # 1c001a00 <myputchar2+0x3c>
1c0019f0:	2a3fbacc 	ld.bu	$r12,$r22,-18(0xfee)
1c0019f4:	00150184 	move	$r4,$r12
1c0019f8:	54115000 	bl	4432(0x1150) # 1c002b48 <Uart0_send>
1c0019fc:	50003800 	b	56(0x38) # 1c001a34 <myputchar2+0x70>
1c001a00:	2a3fbecd 	ld.bu	$r13,$r22,-17(0xfef)
1c001a04:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c001a08:	5c0015ac 	bne	$r13,$r12,20(0x14) # 1c001a1c <myputchar2+0x58>
1c001a0c:	2a3fbacc 	ld.bu	$r12,$r22,-18(0xfee)
1c001a10:	00150184 	move	$r4,$r12
1c001a14:	54117000 	bl	4464(0x1170) # 1c002b84 <Uart1_send>
1c001a18:	50001c00 	b	28(0x1c) # 1c001a34 <myputchar2+0x70>
1c001a1c:	2a3fbecd 	ld.bu	$r13,$r22,-17(0xfef)
1c001a20:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c001a24:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c001a34 <myputchar2+0x70>
1c001a28:	2a3fbacc 	ld.bu	$r12,$r22,-18(0xfee)
1c001a2c:	00150184 	move	$r4,$r12
1c001a30:	54119000 	bl	4496(0x1190) # 1c002bc0 <Uart2_send>
1c001a34:	03400000 	andi	$r0,$r0,0x0
1c001a38:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c001a3c:	28806076 	ld.w	$r22,$r3,24(0x18)
1c001a40:	02808063 	addi.w	$r3,$r3,32(0x20)
1c001a44:	4c000020 	jirl	$r0,$r1,0

1c001a48 <printbase>:
printbase():
1c001a48:	02be4063 	addi.w	$r3,$r3,-112(0xf90)
1c001a4c:	2981b061 	st.w	$r1,$r3,108(0x6c)
1c001a50:	2981a076 	st.w	$r22,$r3,104(0x68)
1c001a54:	0281c076 	addi.w	$r22,$r3,112(0x70)
1c001a58:	29be72c4 	st.w	$r4,$r22,-100(0xf9c)
1c001a5c:	29be62c5 	st.w	$r5,$r22,-104(0xf98)
1c001a60:	29be52c6 	st.w	$r6,$r22,-108(0xf94)
1c001a64:	29be42c7 	st.w	$r7,$r22,-112(0xf90)
1c001a68:	28be42cc 	ld.w	$r12,$r22,-112(0xf90)
1c001a6c:	40002580 	beqz	$r12,36(0x24) # 1c001a90 <printbase+0x48>
1c001a70:	28be72cc 	ld.w	$r12,$r22,-100(0xf9c)
1c001a74:	64001d80 	bge	$r12,$r0,28(0x1c) # 1c001a90 <printbase+0x48>
1c001a78:	28be72cc 	ld.w	$r12,$r22,-100(0xf9c)
1c001a7c:	0011300c 	sub.w	$r12,$r0,$r12
1c001a80:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c001a84:	0280b404 	addi.w	$r4,$r0,45(0x2d)
1c001a88:	57ff03ff 	bl	-256(0xfffff00) # 1c001988 <myputchar>
1c001a8c:	50000c00 	b	12(0xc) # 1c001a98 <printbase+0x50>
1c001a90:	28be72cc 	ld.w	$r12,$r22,-100(0xf9c)
1c001a94:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c001a98:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c001a9c:	50005000 	b	80(0x50) # 1c001aec <printbase+0xa4>
1c001aa0:	28be52cc 	ld.w	$r12,$r22,-108(0xf94)
1c001aa4:	28bf92cd 	ld.w	$r13,$r22,-28(0xfe4)
1c001aa8:	0021b1ae 	mod.wu	$r14,$r13,$r12
1c001aac:	5c000980 	bne	$r12,$r0,8(0x8) # 1c001ab4 <printbase+0x6c>
1c001ab0:	002a0007 	break	0x7
1c001ab4:	00005dcc 	ext.w.b	$r12,$r14
1c001ab8:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c001abc:	02bfc2ce 	addi.w	$r14,$r22,-16(0xff0)
1c001ac0:	001035cd 	add.w	$r13,$r14,$r13
1c001ac4:	293ec1ac 	st.b	$r12,$r13,-80(0xfb0)
1c001ac8:	28be52cd 	ld.w	$r13,$r22,-108(0xf94)
1c001acc:	28bf92ce 	ld.w	$r14,$r22,-28(0xfe4)
1c001ad0:	002135cc 	div.wu	$r12,$r14,$r13
1c001ad4:	5c0009a0 	bne	$r13,$r0,8(0x8) # 1c001adc <printbase+0x94>
1c001ad8:	002a0007 	break	0x7
1c001adc:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c001ae0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001ae4:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001ae8:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001aec:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c001af0:	47ffb19f 	bnez	$r12,-80(0x7fffb0) # 1c001aa0 <printbase+0x58>
1c001af4:	28be62cc 	ld.w	$r12,$r22,-104(0xf98)
1c001af8:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c001afc:	28bfb2ce 	ld.w	$r14,$r22,-20(0xfec)
1c001b00:	001231ad 	slt	$r13,$r13,$r12
1c001b04:	0013b5ce 	masknez	$r14,$r14,$r13
1c001b08:	0013358c 	maskeqz	$r12,$r12,$r13
1c001b0c:	001531cc 	or	$r12,$r14,$r12
1c001b10:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001b14:	50007400 	b	116(0x74) # 1c001b88 <printbase+0x140>
1c001b18:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c001b1c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001b20:	60001d8d 	blt	$r12,$r13,28(0x1c) # 1c001b3c <printbase+0xf4>
1c001b24:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001b28:	02bffd8c 	addi.w	$r12,$r12,-1(0xfff)
1c001b2c:	02bfc2cd 	addi.w	$r13,$r22,-16(0xff0)
1c001b30:	001031ac 	add.w	$r12,$r13,$r12
1c001b34:	283ec18c 	ld.b	$r12,$r12,-80(0xfb0)
1c001b38:	50000800 	b	8(0x8) # 1c001b40 <printbase+0xf8>
1c001b3c:	0015000c 	move	$r12,$r0
1c001b40:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c001b44:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c001b48:	0280240c 	addi.w	$r12,$r0,9(0x9)
1c001b4c:	6000198d 	blt	$r12,$r13,24(0x18) # 1c001b64 <printbase+0x11c>
1c001b50:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c001b54:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001b58:	0280c18c 	addi.w	$r12,$r12,48(0x30)
1c001b5c:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001b60:	50001400 	b	20(0x14) # 1c001b74 <printbase+0x12c>
1c001b64:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c001b68:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001b6c:	02815d8c 	addi.w	$r12,$r12,87(0x57)
1c001b70:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001b74:	00150184 	move	$r4,$r12
1c001b78:	57fe13ff 	bl	-496(0xffffe10) # 1c001988 <myputchar>
1c001b7c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001b80:	02bffd8c 	addi.w	$r12,$r12,-1(0xfff)
1c001b84:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001b88:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001b8c:	63ff8c0c 	blt	$r0,$r12,-116(0x3ff8c) # 1c001b18 <printbase+0xd0>
1c001b90:	0015000c 	move	$r12,$r0
1c001b94:	00150184 	move	$r4,$r12
1c001b98:	2881b061 	ld.w	$r1,$r3,108(0x6c)
1c001b9c:	2881a076 	ld.w	$r22,$r3,104(0x68)
1c001ba0:	0281c063 	addi.w	$r3,$r3,112(0x70)
1c001ba4:	4c000020 	jirl	$r0,$r1,0

1c001ba8 <printbase2>:
printbase2():
1c001ba8:	02be0063 	addi.w	$r3,$r3,-128(0xf80)
1c001bac:	2981f061 	st.w	$r1,$r3,124(0x7c)
1c001bb0:	2981e076 	st.w	$r22,$r3,120(0x78)
1c001bb4:	02820076 	addi.w	$r22,$r3,128(0x80)
1c001bb8:	0015008c 	move	$r12,$r4
1c001bbc:	29be62c5 	st.w	$r5,$r22,-104(0xf98)
1c001bc0:	29be52c6 	st.w	$r6,$r22,-108(0xf94)
1c001bc4:	29be42c7 	st.w	$r7,$r22,-112(0xf90)
1c001bc8:	29be32c8 	st.w	$r8,$r22,-116(0xf8c)
1c001bcc:	293e7ecc 	st.b	$r12,$r22,-97(0xf9f)
1c001bd0:	28be32cc 	ld.w	$r12,$r22,-116(0xf8c)
1c001bd4:	40002d80 	beqz	$r12,44(0x2c) # 1c001c00 <printbase2+0x58>
1c001bd8:	28be62cc 	ld.w	$r12,$r22,-104(0xf98)
1c001bdc:	64002580 	bge	$r12,$r0,36(0x24) # 1c001c00 <printbase2+0x58>
1c001be0:	28be62cc 	ld.w	$r12,$r22,-104(0xf98)
1c001be4:	0011300c 	sub.w	$r12,$r0,$r12
1c001be8:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c001bec:	2a3e7ecc 	ld.bu	$r12,$r22,-97(0xf9f)
1c001bf0:	0280b405 	addi.w	$r5,$r0,45(0x2d)
1c001bf4:	00150184 	move	$r4,$r12
1c001bf8:	57fdcfff 	bl	-564(0xffffdcc) # 1c0019c4 <myputchar2>
1c001bfc:	50000c00 	b	12(0xc) # 1c001c08 <printbase2+0x60>
1c001c00:	28be62cc 	ld.w	$r12,$r22,-104(0xf98)
1c001c04:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c001c08:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c001c0c:	50005000 	b	80(0x50) # 1c001c5c <printbase2+0xb4>
1c001c10:	28be42cc 	ld.w	$r12,$r22,-112(0xf90)
1c001c14:	28bf92cd 	ld.w	$r13,$r22,-28(0xfe4)
1c001c18:	0021b1ae 	mod.wu	$r14,$r13,$r12
1c001c1c:	5c000980 	bne	$r12,$r0,8(0x8) # 1c001c24 <printbase2+0x7c>
1c001c20:	002a0007 	break	0x7
1c001c24:	00005dcc 	ext.w.b	$r12,$r14
1c001c28:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c001c2c:	02bfc2ce 	addi.w	$r14,$r22,-16(0xff0)
1c001c30:	001035cd 	add.w	$r13,$r14,$r13
1c001c34:	293ec1ac 	st.b	$r12,$r13,-80(0xfb0)
1c001c38:	28be42cd 	ld.w	$r13,$r22,-112(0xf90)
1c001c3c:	28bf92ce 	ld.w	$r14,$r22,-28(0xfe4)
1c001c40:	002135cc 	div.wu	$r12,$r14,$r13
1c001c44:	5c0009a0 	bne	$r13,$r0,8(0x8) # 1c001c4c <printbase2+0xa4>
1c001c48:	002a0007 	break	0x7
1c001c4c:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c001c50:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001c54:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001c58:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001c5c:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c001c60:	47ffb19f 	bnez	$r12,-80(0x7fffb0) # 1c001c10 <printbase2+0x68>
1c001c64:	28be52cc 	ld.w	$r12,$r22,-108(0xf94)
1c001c68:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c001c6c:	28bfb2ce 	ld.w	$r14,$r22,-20(0xfec)
1c001c70:	001231ad 	slt	$r13,$r13,$r12
1c001c74:	0013b5ce 	masknez	$r14,$r14,$r13
1c001c78:	0013358c 	maskeqz	$r12,$r12,$r13
1c001c7c:	001531cc 	or	$r12,$r14,$r12
1c001c80:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001c84:	50007c00 	b	124(0x7c) # 1c001d00 <printbase2+0x158>
1c001c88:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c001c8c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001c90:	60001d8d 	blt	$r12,$r13,28(0x1c) # 1c001cac <printbase2+0x104>
1c001c94:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001c98:	02bffd8c 	addi.w	$r12,$r12,-1(0xfff)
1c001c9c:	02bfc2cd 	addi.w	$r13,$r22,-16(0xff0)
1c001ca0:	001031ac 	add.w	$r12,$r13,$r12
1c001ca4:	283ec18c 	ld.b	$r12,$r12,-80(0xfb0)
1c001ca8:	50000800 	b	8(0x8) # 1c001cb0 <printbase2+0x108>
1c001cac:	0015000c 	move	$r12,$r0
1c001cb0:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c001cb4:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c001cb8:	0280240c 	addi.w	$r12,$r0,9(0x9)
1c001cbc:	6000198d 	blt	$r12,$r13,24(0x18) # 1c001cd4 <printbase2+0x12c>
1c001cc0:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c001cc4:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001cc8:	0280c18c 	addi.w	$r12,$r12,48(0x30)
1c001ccc:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001cd0:	50001400 	b	20(0x14) # 1c001ce4 <printbase2+0x13c>
1c001cd4:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c001cd8:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001cdc:	02815d8c 	addi.w	$r12,$r12,87(0x57)
1c001ce0:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001ce4:	2a3e7ecd 	ld.bu	$r13,$r22,-97(0xf9f)
1c001ce8:	00150185 	move	$r5,$r12
1c001cec:	001501a4 	move	$r4,$r13
1c001cf0:	57fcd7ff 	bl	-812(0xffffcd4) # 1c0019c4 <myputchar2>
1c001cf4:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001cf8:	02bffd8c 	addi.w	$r12,$r12,-1(0xfff)
1c001cfc:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001d00:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001d04:	63ff840c 	blt	$r0,$r12,-124(0x3ff84) # 1c001c88 <printbase2+0xe0>
1c001d08:	0015000c 	move	$r12,$r0
1c001d0c:	00150184 	move	$r4,$r12
1c001d10:	2881f061 	ld.w	$r1,$r3,124(0x7c)
1c001d14:	2881e076 	ld.w	$r22,$r3,120(0x78)
1c001d18:	02820063 	addi.w	$r3,$r3,128(0x80)
1c001d1c:	4c000020 	jirl	$r0,$r1,0

1c001d20 <puts>:
puts():
1c001d20:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c001d24:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c001d28:	2980a076 	st.w	$r22,$r3,40(0x28)
1c001d2c:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c001d30:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c001d34:	50003000 	b	48(0x30) # 1c001d64 <puts+0x44>
1c001d38:	283fbecd 	ld.b	$r13,$r22,-17(0xfef)
1c001d3c:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c001d40:	5c000dac 	bne	$r13,$r12,12(0xc) # 1c001d4c <puts+0x2c>
1c001d44:	02803404 	addi.w	$r4,$r0,13(0xd)
1c001d48:	57fc43ff 	bl	-960(0xffffc40) # 1c001988 <myputchar>
1c001d4c:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c001d50:	00150184 	move	$r4,$r12
1c001d54:	57fc37ff 	bl	-972(0xffffc34) # 1c001988 <myputchar>
1c001d58:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001d5c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001d60:	29bf72cc 	st.w	$r12,$r22,-36(0xfdc)
1c001d64:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001d68:	2a00018c 	ld.bu	$r12,$r12,0
1c001d6c:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c001d70:	283fbecc 	ld.b	$r12,$r22,-17(0xfef)
1c001d74:	47ffc59f 	bnez	$r12,-60(0x7fffc4) # 1c001d38 <puts+0x18>
1c001d78:	0015000c 	move	$r12,$r0
1c001d7c:	00150184 	move	$r4,$r12
1c001d80:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c001d84:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c001d88:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c001d8c:	4c000020 	jirl	$r0,$r1,0

1c001d90 <puts2>:
puts2():
1c001d90:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c001d94:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c001d98:	2980a076 	st.w	$r22,$r3,40(0x28)
1c001d9c:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c001da0:	0015008c 	move	$r12,$r4
1c001da4:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c001da8:	293f7ecc 	st.b	$r12,$r22,-33(0xfdf)
1c001dac:	50004000 	b	64(0x40) # 1c001dec <puts2+0x5c>
1c001db0:	283fbecd 	ld.b	$r13,$r22,-17(0xfef)
1c001db4:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c001db8:	5c0015ac 	bne	$r13,$r12,20(0x14) # 1c001dcc <puts2+0x3c>
1c001dbc:	2a3f7ecc 	ld.bu	$r12,$r22,-33(0xfdf)
1c001dc0:	02803405 	addi.w	$r5,$r0,13(0xd)
1c001dc4:	00150184 	move	$r4,$r12
1c001dc8:	57fbffff 	bl	-1028(0xffffbfc) # 1c0019c4 <myputchar2>
1c001dcc:	2a3fbecd 	ld.bu	$r13,$r22,-17(0xfef)
1c001dd0:	2a3f7ecc 	ld.bu	$r12,$r22,-33(0xfdf)
1c001dd4:	001501a5 	move	$r5,$r13
1c001dd8:	00150184 	move	$r4,$r12
1c001ddc:	57fbebff 	bl	-1048(0xffffbe8) # 1c0019c4 <myputchar2>
1c001de0:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c001de4:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001de8:	29bf62cc 	st.w	$r12,$r22,-40(0xfd8)
1c001dec:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c001df0:	2a00018c 	ld.bu	$r12,$r12,0
1c001df4:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c001df8:	283fbecc 	ld.b	$r12,$r22,-17(0xfef)
1c001dfc:	47ffb59f 	bnez	$r12,-76(0x7fffb4) # 1c001db0 <puts2+0x20>
1c001e00:	0015000c 	move	$r12,$r0
1c001e04:	00150184 	move	$r4,$r12
1c001e08:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c001e0c:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c001e10:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c001e14:	4c000020 	jirl	$r0,$r1,0

1c001e18 <myprintf>:
myprintf():
1c001e18:	02be8063 	addi.w	$r3,$r3,-96(0xfa0)
1c001e1c:	2980f061 	st.w	$r1,$r3,60(0x3c)
1c001e20:	2980e076 	st.w	$r22,$r3,56(0x38)
1c001e24:	02810076 	addi.w	$r22,$r3,64(0x40)
1c001e28:	29bf32c4 	st.w	$r4,$r22,-52(0xfcc)
1c001e2c:	298012c5 	st.w	$r5,$r22,4(0x4)
1c001e30:	298022c6 	st.w	$r6,$r22,8(0x8)
1c001e34:	298032c7 	st.w	$r7,$r22,12(0xc)
1c001e38:	298042c8 	st.w	$r8,$r22,16(0x10)
1c001e3c:	298052c9 	st.w	$r9,$r22,20(0x14)
1c001e40:	298062ca 	st.w	$r10,$r22,24(0x18)
1c001e44:	298072cb 	st.w	$r11,$r22,28(0x1c)
1c001e48:	028082cc 	addi.w	$r12,$r22,32(0x20)
1c001e4c:	02bf918c 	addi.w	$r12,$r12,-28(0xfe4)
1c001e50:	29bf72cc 	st.w	$r12,$r22,-36(0xfdc)
1c001e54:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001e58:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001e5c:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c001e60:	50033000 	b	816(0x330) # 1c002190 <myprintf+0x378>
1c001e64:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001e68:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c001e6c:	001031ac 	add.w	$r12,$r13,$r12
1c001e70:	2a00018c 	ld.bu	$r12,$r12,0
1c001e74:	293f8ecc 	st.b	$r12,$r22,-29(0xfe3)
1c001e78:	283f8ecd 	ld.b	$r13,$r22,-29(0xfe3)
1c001e7c:	0280940c 	addi.w	$r12,$r0,37(0x25)
1c001e80:	5c02e5ac 	bne	$r13,$r12,740(0x2e4) # 1c002164 <myprintf+0x34c>
1c001e84:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c001e88:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c001e8c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001e90:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001e94:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c001e98:	001031ac 	add.w	$r12,$r13,$r12
1c001e9c:	2800018c 	ld.b	$r12,$r12,0
1c001ea0:	02bf6d8c 	addi.w	$r12,$r12,-37(0xfdb)
1c001ea4:	02814c0d 	addi.w	$r13,$r0,83(0x53)
1c001ea8:	6802adac 	bltu	$r13,$r12,684(0x2ac) # 1c002154 <myprintf+0x33c>
1c001eac:	0040898d 	slli.w	$r13,$r12,0x2
1c001eb0:	1c00008c 	pcaddu12i	$r12,4(0x4)
1c001eb4:	02a6118c 	addi.w	$r12,$r12,-1660(0x984)
1c001eb8:	001031ac 	add.w	$r12,$r13,$r12
1c001ebc:	2880018c 	ld.w	$r12,$r12,0
1c001ec0:	4c000180 	jirl	$r0,$r12,0
1c001ec4:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001ec8:	2880018c 	ld.w	$r12,$r12,0
1c001ecc:	00150184 	move	$r4,$r12
1c001ed0:	57fe53ff 	bl	-432(0xffffe50) # 1c001d20 <puts>
1c001ed4:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001ed8:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c001edc:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001ee0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001ee4:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001ee8:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001eec:	50029800 	b	664(0x298) # 1c002184 <myprintf+0x36c>
1c001ef0:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001ef4:	2880018c 	ld.w	$r12,$r12,0
1c001ef8:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001efc:	00150184 	move	$r4,$r12
1c001f00:	57fa8bff 	bl	-1400(0xffffa88) # 1c001988 <myputchar>
1c001f04:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001f08:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c001f0c:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001f10:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001f14:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001f18:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001f1c:	50026800 	b	616(0x268) # 1c002184 <myprintf+0x36c>
1c001f20:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001f24:	2880018c 	ld.w	$r12,$r12,0
1c001f28:	00150007 	move	$r7,$r0
1c001f2c:	02802806 	addi.w	$r6,$r0,10(0xa)
1c001f30:	28bf92c5 	ld.w	$r5,$r22,-28(0xfe4)
1c001f34:	00150184 	move	$r4,$r12
1c001f38:	57fb13ff 	bl	-1264(0xffffb10) # 1c001a48 <printbase>
1c001f3c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001f40:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c001f44:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001f48:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001f4c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001f50:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001f54:	50023000 	b	560(0x230) # 1c002184 <myprintf+0x36c>
1c001f58:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001f5c:	2880018c 	ld.w	$r12,$r12,0
1c001f60:	02800407 	addi.w	$r7,$r0,1(0x1)
1c001f64:	02802806 	addi.w	$r6,$r0,10(0xa)
1c001f68:	28bf92c5 	ld.w	$r5,$r22,-28(0xfe4)
1c001f6c:	00150184 	move	$r4,$r12
1c001f70:	57fadbff 	bl	-1320(0xffffad8) # 1c001a48 <printbase>
1c001f74:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001f78:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c001f7c:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001f80:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001f84:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001f88:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001f8c:	5001f800 	b	504(0x1f8) # 1c002184 <myprintf+0x36c>
1c001f90:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001f94:	2880018c 	ld.w	$r12,$r12,0
1c001f98:	00150007 	move	$r7,$r0
1c001f9c:	02802006 	addi.w	$r6,$r0,8(0x8)
1c001fa0:	28bf92c5 	ld.w	$r5,$r22,-28(0xfe4)
1c001fa4:	00150184 	move	$r4,$r12
1c001fa8:	57faa3ff 	bl	-1376(0xffffaa0) # 1c001a48 <printbase>
1c001fac:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001fb0:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c001fb4:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001fb8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001fbc:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001fc0:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001fc4:	5001c000 	b	448(0x1c0) # 1c002184 <myprintf+0x36c>
1c001fc8:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001fcc:	2880018c 	ld.w	$r12,$r12,0
1c001fd0:	00150007 	move	$r7,$r0
1c001fd4:	02800806 	addi.w	$r6,$r0,2(0x2)
1c001fd8:	28bf92c5 	ld.w	$r5,$r22,-28(0xfe4)
1c001fdc:	00150184 	move	$r4,$r12
1c001fe0:	57fa6bff 	bl	-1432(0xffffa68) # 1c001a48 <printbase>
1c001fe4:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001fe8:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c001fec:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001ff0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001ff4:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001ff8:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001ffc:	50018800 	b	392(0x188) # 1c002184 <myprintf+0x36c>
1c002000:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002004:	2880018c 	ld.w	$r12,$r12,0
1c002008:	00150007 	move	$r7,$r0
1c00200c:	02804006 	addi.w	$r6,$r0,16(0x10)
1c002010:	28bf92c5 	ld.w	$r5,$r22,-28(0xfe4)
1c002014:	00150184 	move	$r4,$r12
1c002018:	57fa33ff 	bl	-1488(0xffffa30) # 1c001a48 <printbase>
1c00201c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002020:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c002024:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c002028:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00202c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002030:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c002034:	50015000 	b	336(0x150) # 1c002184 <myprintf+0x36c>
1c002038:	02809404 	addi.w	$r4,$r0,37(0x25)
1c00203c:	57f94fff 	bl	-1716(0xffff94c) # 1c001988 <myputchar>
1c002040:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002044:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002048:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c00204c:	50013800 	b	312(0x138) # 1c002184 <myprintf+0x36c>
1c002050:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002054:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002058:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c00205c:	29bf92c0 	st.w	$r0,$r22,-28(0xfe4)
1c002060:	50003c00 	b	60(0x3c) # 1c00209c <myprintf+0x284>
1c002064:	28bf92cd 	ld.w	$r13,$r22,-28(0xfe4)
1c002068:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c00206c:	001c31ad 	mul.w	$r13,$r13,$r12
1c002070:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002074:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002078:	28bf32ce 	ld.w	$r14,$r22,-52(0xfcc)
1c00207c:	001031cc 	add.w	$r12,$r14,$r12
1c002080:	2800018c 	ld.b	$r12,$r12,0
1c002084:	02bf418c 	addi.w	$r12,$r12,-48(0xfd0)
1c002088:	001031ac 	add.w	$r12,$r13,$r12
1c00208c:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c002090:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002094:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002098:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c00209c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0020a0:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0020a4:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c0020a8:	001031ac 	add.w	$r12,$r13,$r12
1c0020ac:	2800018d 	ld.b	$r13,$r12,0
1c0020b0:	0280c00c 	addi.w	$r12,$r0,48(0x30)
1c0020b4:	67fdd98d 	bge	$r12,$r13,-552(0x3fdd8) # 1c001e8c <myprintf+0x74>
1c0020b8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0020bc:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0020c0:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c0020c4:	001031ac 	add.w	$r12,$r13,$r12
1c0020c8:	2800018d 	ld.b	$r13,$r12,0
1c0020cc:	0280e40c 	addi.w	$r12,$r0,57(0x39)
1c0020d0:	67ff958d 	bge	$r12,$r13,-108(0x3ff94) # 1c002064 <myprintf+0x24c>
1c0020d4:	53fdbbff 	b	-584(0xffffdb8) # 1c001e8c <myprintf+0x74>
1c0020d8:	29bf92c0 	st.w	$r0,$r22,-28(0xfe4)
1c0020dc:	50003c00 	b	60(0x3c) # 1c002118 <myprintf+0x300>
1c0020e0:	28bf92cd 	ld.w	$r13,$r22,-28(0xfe4)
1c0020e4:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c0020e8:	001c31ad 	mul.w	$r13,$r13,$r12
1c0020ec:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0020f0:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0020f4:	28bf32ce 	ld.w	$r14,$r22,-52(0xfcc)
1c0020f8:	001031cc 	add.w	$r12,$r14,$r12
1c0020fc:	2800018c 	ld.b	$r12,$r12,0
1c002100:	02bf418c 	addi.w	$r12,$r12,-48(0xfd0)
1c002104:	001031ac 	add.w	$r12,$r13,$r12
1c002108:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c00210c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002110:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002114:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c002118:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00211c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002120:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c002124:	001031ac 	add.w	$r12,$r13,$r12
1c002128:	2800018d 	ld.b	$r13,$r12,0
1c00212c:	0280c00c 	addi.w	$r12,$r0,48(0x30)
1c002130:	67fd5d8d 	bge	$r12,$r13,-676(0x3fd5c) # 1c001e8c <myprintf+0x74>
1c002134:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002138:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c00213c:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c002140:	001031ac 	add.w	$r12,$r13,$r12
1c002144:	2800018d 	ld.b	$r13,$r12,0
1c002148:	0280e40c 	addi.w	$r12,$r0,57(0x39)
1c00214c:	67ff958d 	bge	$r12,$r13,-108(0x3ff94) # 1c0020e0 <myprintf+0x2c8>
1c002150:	53fd3fff 	b	-708(0xffffd3c) # 1c001e8c <myprintf+0x74>
1c002154:	02809404 	addi.w	$r4,$r0,37(0x25)
1c002158:	57f833ff 	bl	-2000(0xffff830) # 1c001988 <myputchar>
1c00215c:	03400000 	andi	$r0,$r0,0x0
1c002160:	50002400 	b	36(0x24) # 1c002184 <myprintf+0x36c>
1c002164:	283f8ecd 	ld.b	$r13,$r22,-29(0xfe3)
1c002168:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c00216c:	5c000dac 	bne	$r13,$r12,12(0xc) # 1c002178 <myprintf+0x360>
1c002170:	02803404 	addi.w	$r4,$r0,13(0xd)
1c002174:	57f817ff 	bl	-2028(0xffff814) # 1c001988 <myputchar>
1c002178:	2a3f8ecc 	ld.bu	$r12,$r22,-29(0xfe3)
1c00217c:	00150184 	move	$r4,$r12
1c002180:	57f80bff 	bl	-2040(0xffff808) # 1c001988 <myputchar>
1c002184:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002188:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c00218c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c002190:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002194:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c002198:	001031ac 	add.w	$r12,$r13,$r12
1c00219c:	2800018c 	ld.b	$r12,$r12,0
1c0021a0:	47fcc59f 	bnez	$r12,-828(0x7ffcc4) # 1c001e64 <myprintf+0x4c>
1c0021a4:	0015000c 	move	$r12,$r0
1c0021a8:	00150184 	move	$r4,$r12
1c0021ac:	2880f061 	ld.w	$r1,$r3,60(0x3c)
1c0021b0:	2880e076 	ld.w	$r22,$r3,56(0x38)
1c0021b4:	02818063 	addi.w	$r3,$r3,96(0x60)
1c0021b8:	4c000020 	jirl	$r0,$r1,0

1c0021bc <myprintf2>:
myprintf2():
1c0021bc:	02be8063 	addi.w	$r3,$r3,-96(0xfa0)
1c0021c0:	2980f061 	st.w	$r1,$r3,60(0x3c)
1c0021c4:	2980e076 	st.w	$r22,$r3,56(0x38)
1c0021c8:	02810076 	addi.w	$r22,$r3,64(0x40)
1c0021cc:	0015008c 	move	$r12,$r4
1c0021d0:	29bf22c5 	st.w	$r5,$r22,-56(0xfc8)
1c0021d4:	298022c6 	st.w	$r6,$r22,8(0x8)
1c0021d8:	298032c7 	st.w	$r7,$r22,12(0xc)
1c0021dc:	298042c8 	st.w	$r8,$r22,16(0x10)
1c0021e0:	298052c9 	st.w	$r9,$r22,20(0x14)
1c0021e4:	298062ca 	st.w	$r10,$r22,24(0x18)
1c0021e8:	298072cb 	st.w	$r11,$r22,28(0x1c)
1c0021ec:	293f3ecc 	st.b	$r12,$r22,-49(0xfcf)
1c0021f0:	028082cc 	addi.w	$r12,$r22,32(0x20)
1c0021f4:	02bfa18c 	addi.w	$r12,$r12,-24(0xfe8)
1c0021f8:	29bf72cc 	st.w	$r12,$r22,-36(0xfdc)
1c0021fc:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002200:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c002204:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c002208:	50039c00 	b	924(0x39c) # 1c0025a4 <myprintf2+0x3e8>
1c00220c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002210:	28bf22cd 	ld.w	$r13,$r22,-56(0xfc8)
1c002214:	001031ac 	add.w	$r12,$r13,$r12
1c002218:	2a00018c 	ld.bu	$r12,$r12,0
1c00221c:	293f8ecc 	st.b	$r12,$r22,-29(0xfe3)
1c002220:	283f8ecd 	ld.b	$r13,$r22,-29(0xfe3)
1c002224:	0280940c 	addi.w	$r12,$r0,37(0x25)
1c002228:	5c0341ac 	bne	$r13,$r12,832(0x340) # 1c002568 <myprintf2+0x3ac>
1c00222c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c002230:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c002234:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002238:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c00223c:	28bf22cd 	ld.w	$r13,$r22,-56(0xfc8)
1c002240:	001031ac 	add.w	$r12,$r13,$r12
1c002244:	2800018c 	ld.b	$r12,$r12,0
1c002248:	02bf6d8c 	addi.w	$r12,$r12,-37(0xfdb)
1c00224c:	02814c0d 	addi.w	$r13,$r0,83(0x53)
1c002250:	680301ac 	bltu	$r13,$r12,768(0x300) # 1c002550 <myprintf2+0x394>
1c002254:	0040898d 	slli.w	$r13,$r12,0x2
1c002258:	1c00006c 	pcaddu12i	$r12,3(0x3)
1c00225c:	029cb18c 	addi.w	$r12,$r12,1836(0x72c)
1c002260:	001031ac 	add.w	$r12,$r13,$r12
1c002264:	2880018c 	ld.w	$r12,$r12,0
1c002268:	4c000180 	jirl	$r0,$r12,0
1c00226c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002270:	2880018d 	ld.w	$r13,$r12,0
1c002274:	2a3f3ecc 	ld.bu	$r12,$r22,-49(0xfcf)
1c002278:	001501a5 	move	$r5,$r13
1c00227c:	00150184 	move	$r4,$r12
1c002280:	57fb13ff 	bl	-1264(0xffffb10) # 1c001d90 <puts2>
1c002284:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002288:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c00228c:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c002290:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002294:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002298:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c00229c:	5002fc00 	b	764(0x2fc) # 1c002598 <myprintf2+0x3dc>
1c0022a0:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0022a4:	2880018c 	ld.w	$r12,$r12,0
1c0022a8:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c0022ac:	2a3f3ecc 	ld.bu	$r12,$r22,-49(0xfcf)
1c0022b0:	001501a5 	move	$r5,$r13
1c0022b4:	00150184 	move	$r4,$r12
1c0022b8:	57f70fff 	bl	-2292(0xffff70c) # 1c0019c4 <myputchar2>
1c0022bc:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0022c0:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c0022c4:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0022c8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0022cc:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0022d0:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0022d4:	5002c400 	b	708(0x2c4) # 1c002598 <myprintf2+0x3dc>
1c0022d8:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0022dc:	2880018c 	ld.w	$r12,$r12,0
1c0022e0:	0015018d 	move	$r13,$r12
1c0022e4:	2a3f3ecc 	ld.bu	$r12,$r22,-49(0xfcf)
1c0022e8:	00150008 	move	$r8,$r0
1c0022ec:	02802807 	addi.w	$r7,$r0,10(0xa)
1c0022f0:	28bf92c6 	ld.w	$r6,$r22,-28(0xfe4)
1c0022f4:	001501a5 	move	$r5,$r13
1c0022f8:	00150184 	move	$r4,$r12
1c0022fc:	57f8afff 	bl	-1876(0xffff8ac) # 1c001ba8 <printbase2>
1c002300:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002304:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c002308:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c00230c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002310:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002314:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c002318:	50028000 	b	640(0x280) # 1c002598 <myprintf2+0x3dc>
1c00231c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002320:	2880018c 	ld.w	$r12,$r12,0
1c002324:	0015018d 	move	$r13,$r12
1c002328:	2a3f3ecc 	ld.bu	$r12,$r22,-49(0xfcf)
1c00232c:	02800408 	addi.w	$r8,$r0,1(0x1)
1c002330:	02802807 	addi.w	$r7,$r0,10(0xa)
1c002334:	28bf92c6 	ld.w	$r6,$r22,-28(0xfe4)
1c002338:	001501a5 	move	$r5,$r13
1c00233c:	00150184 	move	$r4,$r12
1c002340:	57f86bff 	bl	-1944(0xffff868) # 1c001ba8 <printbase2>
1c002344:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002348:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c00234c:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c002350:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002354:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002358:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c00235c:	50023c00 	b	572(0x23c) # 1c002598 <myprintf2+0x3dc>
1c002360:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002364:	2880018c 	ld.w	$r12,$r12,0
1c002368:	0015018d 	move	$r13,$r12
1c00236c:	2a3f3ecc 	ld.bu	$r12,$r22,-49(0xfcf)
1c002370:	00150008 	move	$r8,$r0
1c002374:	02802007 	addi.w	$r7,$r0,8(0x8)
1c002378:	28bf92c6 	ld.w	$r6,$r22,-28(0xfe4)
1c00237c:	001501a5 	move	$r5,$r13
1c002380:	00150184 	move	$r4,$r12
1c002384:	57f827ff 	bl	-2012(0xffff824) # 1c001ba8 <printbase2>
1c002388:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c00238c:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c002390:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c002394:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002398:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c00239c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0023a0:	5001f800 	b	504(0x1f8) # 1c002598 <myprintf2+0x3dc>
1c0023a4:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0023a8:	2880018c 	ld.w	$r12,$r12,0
1c0023ac:	0015018d 	move	$r13,$r12
1c0023b0:	2a3f3ecc 	ld.bu	$r12,$r22,-49(0xfcf)
1c0023b4:	00150008 	move	$r8,$r0
1c0023b8:	02800807 	addi.w	$r7,$r0,2(0x2)
1c0023bc:	28bf92c6 	ld.w	$r6,$r22,-28(0xfe4)
1c0023c0:	001501a5 	move	$r5,$r13
1c0023c4:	00150184 	move	$r4,$r12
1c0023c8:	57f7e3ff 	bl	-2080(0xffff7e0) # 1c001ba8 <printbase2>
1c0023cc:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0023d0:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c0023d4:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0023d8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0023dc:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0023e0:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0023e4:	5001b400 	b	436(0x1b4) # 1c002598 <myprintf2+0x3dc>
1c0023e8:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0023ec:	2880018c 	ld.w	$r12,$r12,0
1c0023f0:	0015018d 	move	$r13,$r12
1c0023f4:	2a3f3ecc 	ld.bu	$r12,$r22,-49(0xfcf)
1c0023f8:	00150008 	move	$r8,$r0
1c0023fc:	02804007 	addi.w	$r7,$r0,16(0x10)
1c002400:	28bf92c6 	ld.w	$r6,$r22,-28(0xfe4)
1c002404:	001501a5 	move	$r5,$r13
1c002408:	00150184 	move	$r4,$r12
1c00240c:	57f79fff 	bl	-2148(0xffff79c) # 1c001ba8 <printbase2>
1c002410:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002414:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c002418:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c00241c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002420:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002424:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c002428:	50017000 	b	368(0x170) # 1c002598 <myprintf2+0x3dc>
1c00242c:	2a3f3ecc 	ld.bu	$r12,$r22,-49(0xfcf)
1c002430:	02809405 	addi.w	$r5,$r0,37(0x25)
1c002434:	00150184 	move	$r4,$r12
1c002438:	57f58fff 	bl	-2676(0xffff58c) # 1c0019c4 <myputchar2>
1c00243c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002440:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002444:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c002448:	50015000 	b	336(0x150) # 1c002598 <myprintf2+0x3dc>
1c00244c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002450:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002454:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c002458:	29bf92c0 	st.w	$r0,$r22,-28(0xfe4)
1c00245c:	50003c00 	b	60(0x3c) # 1c002498 <myprintf2+0x2dc>
1c002460:	28bf92cd 	ld.w	$r13,$r22,-28(0xfe4)
1c002464:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c002468:	001c31ad 	mul.w	$r13,$r13,$r12
1c00246c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002470:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002474:	28bf22ce 	ld.w	$r14,$r22,-56(0xfc8)
1c002478:	001031cc 	add.w	$r12,$r14,$r12
1c00247c:	2800018c 	ld.b	$r12,$r12,0
1c002480:	02bf418c 	addi.w	$r12,$r12,-48(0xfd0)
1c002484:	001031ac 	add.w	$r12,$r13,$r12
1c002488:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c00248c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002490:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002494:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c002498:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00249c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0024a0:	28bf22cd 	ld.w	$r13,$r22,-56(0xfc8)
1c0024a4:	001031ac 	add.w	$r12,$r13,$r12
1c0024a8:	2800018d 	ld.b	$r13,$r12,0
1c0024ac:	0280c00c 	addi.w	$r12,$r0,48(0x30)
1c0024b0:	67fd858d 	bge	$r12,$r13,-636(0x3fd84) # 1c002234 <myprintf2+0x78>
1c0024b4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0024b8:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0024bc:	28bf22cd 	ld.w	$r13,$r22,-56(0xfc8)
1c0024c0:	001031ac 	add.w	$r12,$r13,$r12
1c0024c4:	2800018d 	ld.b	$r13,$r12,0
1c0024c8:	0280e40c 	addi.w	$r12,$r0,57(0x39)
1c0024cc:	67ff958d 	bge	$r12,$r13,-108(0x3ff94) # 1c002460 <myprintf2+0x2a4>
1c0024d0:	53fd67ff 	b	-668(0xffffd64) # 1c002234 <myprintf2+0x78>
1c0024d4:	29bf92c0 	st.w	$r0,$r22,-28(0xfe4)
1c0024d8:	50003c00 	b	60(0x3c) # 1c002514 <myprintf2+0x358>
1c0024dc:	28bf92cd 	ld.w	$r13,$r22,-28(0xfe4)
1c0024e0:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c0024e4:	001c31ad 	mul.w	$r13,$r13,$r12
1c0024e8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0024ec:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0024f0:	28bf22ce 	ld.w	$r14,$r22,-56(0xfc8)
1c0024f4:	001031cc 	add.w	$r12,$r14,$r12
1c0024f8:	2800018c 	ld.b	$r12,$r12,0
1c0024fc:	02bf418c 	addi.w	$r12,$r12,-48(0xfd0)
1c002500:	001031ac 	add.w	$r12,$r13,$r12
1c002504:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c002508:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00250c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002510:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c002514:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002518:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c00251c:	28bf22cd 	ld.w	$r13,$r22,-56(0xfc8)
1c002520:	001031ac 	add.w	$r12,$r13,$r12
1c002524:	2800018d 	ld.b	$r13,$r12,0
1c002528:	0280c00c 	addi.w	$r12,$r0,48(0x30)
1c00252c:	67fd098d 	bge	$r12,$r13,-760(0x3fd08) # 1c002234 <myprintf2+0x78>
1c002530:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002534:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002538:	28bf22cd 	ld.w	$r13,$r22,-56(0xfc8)
1c00253c:	001031ac 	add.w	$r12,$r13,$r12
1c002540:	2800018d 	ld.b	$r13,$r12,0
1c002544:	0280e40c 	addi.w	$r12,$r0,57(0x39)
1c002548:	67ff958d 	bge	$r12,$r13,-108(0x3ff94) # 1c0024dc <myprintf2+0x320>
1c00254c:	53fcebff 	b	-792(0xffffce8) # 1c002234 <myprintf2+0x78>
1c002550:	2a3f3ecc 	ld.bu	$r12,$r22,-49(0xfcf)
1c002554:	02809405 	addi.w	$r5,$r0,37(0x25)
1c002558:	00150184 	move	$r4,$r12
1c00255c:	57f46bff 	bl	-2968(0xffff468) # 1c0019c4 <myputchar2>
1c002560:	03400000 	andi	$r0,$r0,0x0
1c002564:	50003400 	b	52(0x34) # 1c002598 <myprintf2+0x3dc>
1c002568:	283f8ecd 	ld.b	$r13,$r22,-29(0xfe3)
1c00256c:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c002570:	5c0015ac 	bne	$r13,$r12,20(0x14) # 1c002584 <myprintf2+0x3c8>
1c002574:	2a3f3ecc 	ld.bu	$r12,$r22,-49(0xfcf)
1c002578:	02803405 	addi.w	$r5,$r0,13(0xd)
1c00257c:	00150184 	move	$r4,$r12
1c002580:	57f447ff 	bl	-3004(0xffff444) # 1c0019c4 <myputchar2>
1c002584:	2a3f8ecd 	ld.bu	$r13,$r22,-29(0xfe3)
1c002588:	2a3f3ecc 	ld.bu	$r12,$r22,-49(0xfcf)
1c00258c:	001501a5 	move	$r5,$r13
1c002590:	00150184 	move	$r4,$r12
1c002594:	57f433ff 	bl	-3024(0xffff430) # 1c0019c4 <myputchar2>
1c002598:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00259c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0025a0:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0025a4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0025a8:	28bf22cd 	ld.w	$r13,$r22,-56(0xfc8)
1c0025ac:	001031ac 	add.w	$r12,$r13,$r12
1c0025b0:	2800018c 	ld.b	$r12,$r12,0
1c0025b4:	47fc599f 	bnez	$r12,-936(0x7ffc58) # 1c00220c <myprintf2+0x50>
1c0025b8:	0015000c 	move	$r12,$r0
1c0025bc:	00150184 	move	$r4,$r12
1c0025c0:	2880f061 	ld.w	$r1,$r3,60(0x3c)
1c0025c4:	2880e076 	ld.w	$r22,$r3,56(0x38)
1c0025c8:	02818063 	addi.w	$r3,$r3,96(0x60)
1c0025cc:	4c000020 	jirl	$r0,$r1,0

1c0025d0 <UART_Init>:
UART_Init():
1c0025d0:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0025d4:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c0025d8:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c0025dc:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c0025e0:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c0025e4:	29bfa2c0 	st.w	$r0,$r22,-24(0xfe8)
1c0025e8:	29bf92c0 	st.w	$r0,$r22,-28(0xfe4)
1c0025ec:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0025f0:	2a00118c 	ld.bu	$r12,$r12,4(0x4)
1c0025f4:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0025f8:	03403d8c 	andi	$r12,$r12,0xf
1c0025fc:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c002600:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002604:	2a00118c 	ld.bu	$r12,$r12,4(0x4)
1c002608:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c00260c:	0044918c 	srli.w	$r12,$r12,0x4
1c002610:	293f8ecc 	st.b	$r12,$r22,-29(0xfe3)
1c002614:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c002618:	40000d80 	beqz	$r12,12(0xc) # 1c002624 <UART_Init+0x54>
1c00261c:	2a3f8ecc 	ld.bu	$r12,$r22,-29(0xfe3)
1c002620:	44001980 	bnez	$r12,24(0x18) # 1c002638 <UART_Init+0x68>
1c002624:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002628:	0280e00d 	addi.w	$r13,$r0,56(0x38)
1c00262c:	2900118d 	st.b	$r13,$r12,4(0x4)
1c002630:	0280200c 	addi.w	$r12,$r0,8(0x8)
1c002634:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c002638:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c00263c:	157fd18c 	lu12i.w	$r12,-262516(0xbfe8c)
1c002640:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c002658 <UART_Init+0x88>
1c002644:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002648:	02808c0d 	addi.w	$r13,$r0,35(0x23)
1c00264c:	2900118d 	st.b	$r13,$r12,4(0x4)
1c002650:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c002654:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c002658:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c00265c:	02800c0d 	addi.w	$r13,$r0,3(0x3)
1c002660:	29000d8d 	st.b	$r13,$r12,3(0x3)
1c002664:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c002668:	157fd00c 	lu12i.w	$r12,-262528(0xbfe80)
1c00266c:	580011ac 	beq	$r13,$r12,16(0x10) # 1c00267c <UART_Init+0xac>
1c002670:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c002674:	157fd10c 	lu12i.w	$r12,-262520(0xbfe88)
1c002678:	5c0061ac 	bne	$r13,$r12,96(0x60) # 1c0026d8 <UART_Init+0x108>
1c00267c:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c002680:	2880118d 	ld.w	$r13,$r12,4(0x4)
1c002684:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c002688:	2880018c 	ld.w	$r12,$r12,0
1c00268c:	002131ae 	div.wu	$r14,$r13,$r12
1c002690:	5c000980 	bne	$r12,$r0,8(0x8) # 1c002698 <UART_Init+0xc8>
1c002694:	002a0007 	break	0x7
1c002698:	2a3fbecd 	ld.bu	$r13,$r22,-17(0xfef)
1c00269c:	002135cc 	div.wu	$r12,$r14,$r13
1c0026a0:	5c0009a0 	bne	$r13,$r0,8(0x8) # 1c0026a8 <UART_Init+0xd8>
1c0026a4:	002a0007 	break	0x7
1c0026a8:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0026ac:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c0026b0:	2880118d 	ld.w	$r13,$r12,4(0x4)
1c0026b4:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c0026b8:	2880018e 	ld.w	$r14,$r12,0
1c0026bc:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0026c0:	001c31ce 	mul.w	$r14,$r14,$r12
1c0026c4:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c0026c8:	001c31cc 	mul.w	$r12,$r14,$r12
1c0026cc:	001131ac 	sub.w	$r12,$r13,$r12
1c0026d0:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c0026d4:	50005400 	b	84(0x54) # 1c002728 <UART_Init+0x158>
1c0026d8:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c0026dc:	2880018c 	ld.w	$r12,$r12,0
1c0026e0:	1400010d 	lu12i.w	$r13,8(0x8)
1c0026e4:	002131ae 	div.wu	$r14,$r13,$r12
1c0026e8:	5c000980 	bne	$r12,$r0,8(0x8) # 1c0026f0 <UART_Init+0x120>
1c0026ec:	002a0007 	break	0x7
1c0026f0:	2a3fbecd 	ld.bu	$r13,$r22,-17(0xfef)
1c0026f4:	002135cc 	div.wu	$r12,$r14,$r13
1c0026f8:	5c0009a0 	bne	$r13,$r0,8(0x8) # 1c002700 <UART_Init+0x130>
1c0026fc:	002a0007 	break	0x7
1c002700:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c002704:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c002708:	2880018d 	ld.w	$r13,$r12,0
1c00270c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002710:	001c31ad 	mul.w	$r13,$r13,$r12
1c002714:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c002718:	001c31ac 	mul.w	$r12,$r13,$r12
1c00271c:	1400010d 	lu12i.w	$r13,8(0x8)
1c002720:	001131ac 	sub.w	$r12,$r13,$r12
1c002724:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c002728:	28bf92cd 	ld.w	$r13,$r22,-28(0xfe4)
1c00272c:	0283fc0c 	addi.w	$r12,$r0,255(0xff)
1c002730:	001c31ad 	mul.w	$r13,$r13,$r12
1c002734:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c002738:	2880018c 	ld.w	$r12,$r12,0
1c00273c:	002131ae 	div.wu	$r14,$r13,$r12
1c002740:	5c000980 	bne	$r12,$r0,8(0x8) # 1c002748 <UART_Init+0x178>
1c002744:	002a0007 	break	0x7
1c002748:	2a3fbecd 	ld.bu	$r13,$r22,-17(0xfef)
1c00274c:	002135cc 	div.wu	$r12,$r14,$r13
1c002750:	5c0009a0 	bne	$r13,$r0,8(0x8) # 1c002758 <UART_Init+0x188>
1c002754:	002a0007 	break	0x7
1c002758:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c00275c:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002760:	2a000d8c 	ld.bu	$r12,$r12,3(0x3)
1c002764:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c002768:	02be000c 	addi.w	$r12,$r0,-128(0xf80)
1c00276c:	001531ac 	or	$r12,$r13,$r12
1c002770:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c002774:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002778:	29000d8d 	st.b	$r13,$r12,3(0x3)
1c00277c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002780:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c002784:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002788:	2900018d 	st.b	$r13,$r12,0
1c00278c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002790:	0044a18c 	srli.w	$r12,$r12,0x8
1c002794:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c002798:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c00279c:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c0027a0:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0027a4:	2900058d 	st.b	$r13,$r12,1(0x1)
1c0027a8:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c0027ac:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c0027b0:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0027b4:	2900098d 	st.b	$r13,$r12,2(0x2)
1c0027b8:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0027bc:	2a000d8c 	ld.bu	$r12,$r12,3(0x3)
1c0027c0:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0027c4:	0341fd8c 	andi	$r12,$r12,0x7f
1c0027c8:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c0027cc:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0027d0:	29000d8d 	st.b	$r13,$r12,3(0x3)
1c0027d4:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0027d8:	29000580 	st.b	$r0,$r12,1(0x1)
1c0027dc:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0027e0:	2a000d8c 	ld.bu	$r12,$r12,3(0x3)
1c0027e4:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c0027e8:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c0027ec:	2a00298c 	ld.bu	$r12,$r12,10(0xa)
1c0027f0:	001531ac 	or	$r12,$r13,$r12
1c0027f4:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c0027f8:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0027fc:	29000d8d 	st.b	$r13,$r12,3(0x3)
1c002800:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002804:	2a000d8c 	ld.bu	$r12,$r12,3(0x3)
1c002808:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c00280c:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c002810:	2a00358c 	ld.bu	$r12,$r12,13(0xd)
1c002814:	001531ac 	or	$r12,$r13,$r12
1c002818:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c00281c:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002820:	29000d8d 	st.b	$r13,$r12,3(0x3)
1c002824:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002828:	2a000d8c 	ld.bu	$r12,$r12,3(0x3)
1c00282c:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c002830:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c002834:	2a00398c 	ld.bu	$r12,$r12,14(0xe)
1c002838:	001531ac 	or	$r12,$r13,$r12
1c00283c:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c002840:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002844:	29000d8d 	st.b	$r13,$r12,3(0x3)
1c002848:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c00284c:	2a000d8c 	ld.bu	$r12,$r12,3(0x3)
1c002850:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c002854:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c002858:	2a002d8c 	ld.bu	$r12,$r12,11(0xb)
1c00285c:	001531ac 	or	$r12,$r13,$r12
1c002860:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c002864:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002868:	29000d8d 	st.b	$r13,$r12,3(0x3)
1c00286c:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002870:	2a000d8c 	ld.bu	$r12,$r12,3(0x3)
1c002874:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c002878:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c00287c:	2a003d8c 	ld.bu	$r12,$r12,15(0xf)
1c002880:	001531ac 	or	$r12,$r13,$r12
1c002884:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c002888:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c00288c:	29000d8d 	st.b	$r13,$r12,3(0x3)
1c002890:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002894:	2a000d8c 	ld.bu	$r12,$r12,3(0x3)
1c002898:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c00289c:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c0028a0:	2a00318c 	ld.bu	$r12,$r12,12(0xc)
1c0028a4:	001531ac 	or	$r12,$r13,$r12
1c0028a8:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c0028ac:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0028b0:	29000d8d 	st.b	$r13,$r12,3(0x3)
1c0028b4:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0028b8:	2a00018c 	ld.bu	$r12,$r12,0
1c0028bc:	03400000 	andi	$r0,$r0,0x0
1c0028c0:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c0028c4:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c0028c8:	4c000020 	jirl	$r0,$r1,0

1c0028cc <UART_StructInit>:
UART_StructInit():
1c0028cc:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0028d0:	29807076 	st.w	$r22,$r3,28(0x1c)
1c0028d4:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0028d8:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c0028dc:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0028e0:	1400038d 	lu12i.w	$r13,28(0x1c)
1c0028e4:	038801ad 	ori	$r13,$r13,0x200
1c0028e8:	2980018d 	st.w	$r13,$r12,0
1c0028ec:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0028f0:	1400f42d 	lu12i.w	$r13,1953(0x7a1)
1c0028f4:	038801ad 	ori	$r13,$r13,0x200
1c0028f8:	2980118d 	st.w	$r13,$r12,4(0x4)
1c0028fc:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002900:	02800c0d 	addi.w	$r13,$r0,3(0x3)
1c002904:	2900298d 	st.b	$r13,$r12,10(0xa)
1c002908:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00290c:	29002d80 	st.b	$r0,$r12,11(0xb)
1c002910:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002914:	29003580 	st.b	$r0,$r12,13(0xd)
1c002918:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00291c:	29003180 	st.b	$r0,$r12,12(0xc)
1c002920:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002924:	29003d80 	st.b	$r0,$r12,15(0xf)
1c002928:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00292c:	29003980 	st.b	$r0,$r12,14(0xe)
1c002930:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002934:	29402180 	st.h	$r0,$r12,8(0x8)
1c002938:	03400000 	andi	$r0,$r0,0x0
1c00293c:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002940:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002944:	4c000020 	jirl	$r0,$r1,0

1c002948 <UART_ITConfig>:
UART_ITConfig():
1c002948:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c00294c:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002950:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002954:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002958:	001500ac 	move	$r12,$r5
1c00295c:	29bf92c6 	st.w	$r6,$r22,-28(0xfe4)
1c002960:	293faecc 	st.b	$r12,$r22,-21(0xfeb)
1c002964:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c002968:	40002980 	beqz	$r12,40(0x28) # 1c002990 <UART_ITConfig+0x48>
1c00296c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002970:	2a00058c 	ld.bu	$r12,$r12,1(0x1)
1c002974:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c002978:	2a3faecc 	ld.bu	$r12,$r22,-21(0xfeb)
1c00297c:	001531ac 	or	$r12,$r13,$r12
1c002980:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c002984:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002988:	2900058d 	st.b	$r13,$r12,1(0x1)
1c00298c:	50003400 	b	52(0x34) # 1c0029c0 <UART_ITConfig+0x78>
1c002990:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002994:	2a00058c 	ld.bu	$r12,$r12,1(0x1)
1c002998:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c00299c:	00005d8d 	ext.w.b	$r13,$r12
1c0029a0:	283faecc 	ld.b	$r12,$r22,-21(0xfeb)
1c0029a4:	0014300c 	nor	$r12,$r0,$r12
1c0029a8:	00005d8c 	ext.w.b	$r12,$r12
1c0029ac:	0014b1ac 	and	$r12,$r13,$r12
1c0029b0:	00005d8c 	ext.w.b	$r12,$r12
1c0029b4:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c0029b8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0029bc:	2900058d 	st.b	$r13,$r12,1(0x1)
1c0029c0:	03400000 	andi	$r0,$r0,0x0
1c0029c4:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c0029c8:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0029cc:	4c000020 	jirl	$r0,$r1,0

1c0029d0 <UART_SendData>:
UART_SendData():
1c0029d0:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0029d4:	29807076 	st.w	$r22,$r3,28(0x1c)
1c0029d8:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0029dc:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c0029e0:	001500ac 	move	$r12,$r5
1c0029e4:	293faecc 	st.b	$r12,$r22,-21(0xfeb)
1c0029e8:	03400000 	andi	$r0,$r0,0x0
1c0029ec:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0029f0:	2a00158c 	ld.bu	$r12,$r12,5(0x5)
1c0029f4:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0029f8:	0340818c 	andi	$r12,$r12,0x20
1c0029fc:	43fff19f 	beqz	$r12,-16(0x7ffff0) # 1c0029ec <UART_SendData+0x1c>
1c002a00:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002a04:	2a3faecd 	ld.bu	$r13,$r22,-21(0xfeb)
1c002a08:	2900018d 	st.b	$r13,$r12,0
1c002a0c:	03400000 	andi	$r0,$r0,0x0
1c002a10:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002a14:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002a18:	4c000020 	jirl	$r0,$r1,0

1c002a1c <x_getchar>:
x_getchar():
1c002a1c:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002a20:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002a24:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002a28:	157fd18c 	lu12i.w	$r12,-262516(0xbfe8c)
1c002a2c:	2a00018c 	ld.bu	$r12,$r12,0
1c002a30:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c002a34:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c002a38:	00150184 	move	$r4,$r12
1c002a3c:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002a40:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002a44:	4c000020 	jirl	$r0,$r1,0

1c002a48 <Uart1_init>:
Uart1_init():
1c002a48:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c002a4c:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c002a50:	2980a076 	st.w	$r22,$r3,40(0x28)
1c002a54:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c002a58:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c002a5c:	02800405 	addi.w	$r5,$r0,1(0x1)
1c002a60:	02802004 	addi.w	$r4,$r0,8(0x8)
1c002a64:	57ebf3ff 	bl	-5136(0xfffebf0) # 1c001654 <gpio_pin_remap>
1c002a68:	02800405 	addi.w	$r5,$r0,1(0x1)
1c002a6c:	02802404 	addi.w	$r4,$r0,9(0x9)
1c002a70:	57ebe7ff 	bl	-5148(0xfffebe4) # 1c001654 <gpio_pin_remap>
1c002a74:	02bf82cc 	addi.w	$r12,$r22,-32(0xfe0)
1c002a78:	00150184 	move	$r4,$r12
1c002a7c:	57fe53ff 	bl	-432(0xffffe50) # 1c0028cc <UART_StructInit>
1c002a80:	1cc7ffcc 	pcaddu12i	$r12,409598(0x63ffe)
1c002a84:	2896218c 	ld.w	$r12,$r12,1416(0x588)
1c002a88:	2880018c 	ld.w	$r12,$r12,0
1c002a8c:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c002a90:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002a94:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c002a98:	02bf82cc 	addi.w	$r12,$r22,-32(0xfe0)
1c002a9c:	00150185 	move	$r5,$r12
1c002aa0:	157fd104 	lu12i.w	$r4,-262520(0xbfe88)
1c002aa4:	57fb2fff 	bl	-1236(0xffffb2c) # 1c0025d0 <UART_Init>
1c002aa8:	00150006 	move	$r6,$r0
1c002aac:	02800405 	addi.w	$r5,$r0,1(0x1)
1c002ab0:	157fd104 	lu12i.w	$r4,-262520(0xbfe88)
1c002ab4:	57fe97ff 	bl	-364(0xffffe94) # 1c002948 <UART_ITConfig>
1c002ab8:	03400000 	andi	$r0,$r0,0x0
1c002abc:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c002ac0:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c002ac4:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c002ac8:	4c000020 	jirl	$r0,$r1,0

1c002acc <Uart2_init>:
Uart2_init():
1c002acc:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c002ad0:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c002ad4:	2980a076 	st.w	$r22,$r3,40(0x28)
1c002ad8:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c002adc:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c002ae0:	02800805 	addi.w	$r5,$r0,2(0x2)
1c002ae4:	02809804 	addi.w	$r4,$r0,38(0x26)
1c002ae8:	57eb6fff 	bl	-5268(0xfffeb6c) # 1c001654 <gpio_pin_remap>
1c002aec:	02800805 	addi.w	$r5,$r0,2(0x2)
1c002af0:	02809c04 	addi.w	$r4,$r0,39(0x27)
1c002af4:	57eb63ff 	bl	-5280(0xfffeb60) # 1c001654 <gpio_pin_remap>
1c002af8:	02bf82cc 	addi.w	$r12,$r22,-32(0xfe0)
1c002afc:	00150184 	move	$r4,$r12
1c002b00:	57fdcfff 	bl	-564(0xffffdcc) # 1c0028cc <UART_StructInit>
1c002b04:	1400010c 	lu12i.w	$r12,8(0x8)
1c002b08:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c002b0c:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002b10:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c002b14:	02bf82cc 	addi.w	$r12,$r22,-32(0xfe0)
1c002b18:	00150185 	move	$r5,$r12
1c002b1c:	157fd184 	lu12i.w	$r4,-262516(0xbfe8c)
1c002b20:	57fab3ff 	bl	-1360(0xffffab0) # 1c0025d0 <UART_Init>
1c002b24:	00150006 	move	$r6,$r0
1c002b28:	02800405 	addi.w	$r5,$r0,1(0x1)
1c002b2c:	157fd184 	lu12i.w	$r4,-262516(0xbfe8c)
1c002b30:	57fe1bff 	bl	-488(0xffffe18) # 1c002948 <UART_ITConfig>
1c002b34:	03400000 	andi	$r0,$r0,0x0
1c002b38:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c002b3c:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c002b40:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c002b44:	4c000020 	jirl	$r0,$r1,0

1c002b48 <Uart0_send>:
Uart0_send():
1c002b48:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002b4c:	29807061 	st.w	$r1,$r3,28(0x1c)
1c002b50:	29806076 	st.w	$r22,$r3,24(0x18)
1c002b54:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002b58:	0015008c 	move	$r12,$r4
1c002b5c:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c002b60:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c002b64:	00150185 	move	$r5,$r12
1c002b68:	157fd004 	lu12i.w	$r4,-262528(0xbfe80)
1c002b6c:	57fe67ff 	bl	-412(0xffffe64) # 1c0029d0 <UART_SendData>
1c002b70:	03400000 	andi	$r0,$r0,0x0
1c002b74:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c002b78:	28806076 	ld.w	$r22,$r3,24(0x18)
1c002b7c:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002b80:	4c000020 	jirl	$r0,$r1,0

1c002b84 <Uart1_send>:
Uart1_send():
1c002b84:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002b88:	29807061 	st.w	$r1,$r3,28(0x1c)
1c002b8c:	29806076 	st.w	$r22,$r3,24(0x18)
1c002b90:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002b94:	0015008c 	move	$r12,$r4
1c002b98:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c002b9c:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c002ba0:	00150185 	move	$r5,$r12
1c002ba4:	157fd104 	lu12i.w	$r4,-262520(0xbfe88)
1c002ba8:	57fe2bff 	bl	-472(0xffffe28) # 1c0029d0 <UART_SendData>
1c002bac:	03400000 	andi	$r0,$r0,0x0
1c002bb0:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c002bb4:	28806076 	ld.w	$r22,$r3,24(0x18)
1c002bb8:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002bbc:	4c000020 	jirl	$r0,$r1,0

1c002bc0 <Uart2_send>:
Uart2_send():
1c002bc0:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002bc4:	29807061 	st.w	$r1,$r3,28(0x1c)
1c002bc8:	29806076 	st.w	$r22,$r3,24(0x18)
1c002bcc:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002bd0:	0015008c 	move	$r12,$r4
1c002bd4:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c002bd8:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c002bdc:	00150185 	move	$r5,$r12
1c002be0:	157fd184 	lu12i.w	$r4,-262516(0xbfe8c)
1c002be4:	57fdefff 	bl	-532(0xffffdec) # 1c0029d0 <UART_SendData>
1c002be8:	03400000 	andi	$r0,$r0,0x0
1c002bec:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c002bf0:	28806076 	ld.w	$r22,$r3,24(0x18)
1c002bf4:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002bf8:	4c000020 	jirl	$r0,$r1,0

1c002bfc <CLOCK_WaitForHSEStartUp>:
CLOCK_WaitForHSEStartUp():
1c002bfc:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002c00:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002c04:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002c08:	1400006c 	lu12i.w	$r12,3(0x3)
1c002c0c:	03ba018c 	ori	$r12,$r12,0xe80
1c002c10:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c002c14:	29bfa2c0 	st.w	$r0,$r22,-24(0xfe8)
1c002c18:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002c1c:	2880018d 	ld.w	$r13,$r12,0
1c002c20:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002c24:	038101ad 	ori	$r13,$r13,0x40
1c002c28:	2980018d 	st.w	$r13,$r12,0
1c002c2c:	03400000 	andi	$r0,$r0,0x0
1c002c30:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002c34:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c002c38:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c002c3c:	47fff59f 	bnez	$r12,-12(0x7ffff4) # 1c002c30 <CLOCK_WaitForHSEStartUp+0x34>
1c002c40:	50001c00 	b	28(0x1c) # 1c002c5c <CLOCK_WaitForHSEStartUp+0x60>
1c002c44:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002c48:	2880018e 	ld.w	$r14,$r12,0
1c002c4c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002c50:	02bdfc0d 	addi.w	$r13,$r0,-129(0xf7f)
1c002c54:	0014b5cd 	and	$r13,$r14,$r13
1c002c58:	2980018d 	st.w	$r13,$r12,0
1c002c5c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002c60:	2880118c 	ld.w	$r12,$r12,4(0x4)
1c002c64:	63ffe180 	blt	$r12,$r0,-32(0x3ffe0) # 1c002c44 <CLOCK_WaitForHSEStartUp+0x48>
1c002c68:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002c6c:	2880018d 	ld.w	$r13,$r12,0
1c002c70:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002c74:	038201ad 	ori	$r13,$r13,0x80
1c002c78:	2980018d 	st.w	$r13,$r12,0
1c002c7c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c002c80:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c002c84:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002c88:	00150184 	move	$r4,$r12
1c002c8c:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002c90:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002c94:	4c000020 	jirl	$r0,$r1,0

1c002c98 <CLOCK_WaitForLSEStartUp>:
CLOCK_WaitForLSEStartUp():
1c002c98:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002c9c:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002ca0:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002ca4:	29bf92c0 	st.w	$r0,$r22,-28(0xfe4)
1c002ca8:	50008800 	b	136(0x88) # 1c002d30 <CLOCK_WaitForLSEStartUp+0x98>
1c002cac:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002cb0:	2880018e 	ld.w	$r14,$r12,0
1c002cb4:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002cb8:	02bf7c0d 	addi.w	$r13,$r0,-33(0xfdf)
1c002cbc:	0014b5cd 	and	$r13,$r14,$r13
1c002cc0:	2980018d 	st.w	$r13,$r12,0
1c002cc4:	0280700c 	addi.w	$r12,$r0,28(0x1c)
1c002cc8:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c002ccc:	50001400 	b	20(0x14) # 1c002ce0 <CLOCK_WaitForLSEStartUp+0x48>
1c002cd0:	03400000 	andi	$r0,$r0,0x0
1c002cd4:	03400000 	andi	$r0,$r0,0x0
1c002cd8:	03400000 	andi	$r0,$r0,0x0
1c002cdc:	03400000 	andi	$r0,$r0,0x0
1c002ce0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002ce4:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c002ce8:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c002cec:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c002cd0 <CLOCK_WaitForLSEStartUp+0x38>
1c002cf0:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002cf4:	2880018d 	ld.w	$r13,$r12,0
1c002cf8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002cfc:	038081ad 	ori	$r13,$r13,0x20
1c002d00:	2980018d 	st.w	$r13,$r12,0
1c002d04:	0280700c 	addi.w	$r12,$r0,28(0x1c)
1c002d08:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c002d0c:	50001400 	b	20(0x14) # 1c002d20 <CLOCK_WaitForLSEStartUp+0x88>
1c002d10:	03400000 	andi	$r0,$r0,0x0
1c002d14:	03400000 	andi	$r0,$r0,0x0
1c002d18:	03400000 	andi	$r0,$r0,0x0
1c002d1c:	03400000 	andi	$r0,$r0,0x0
1c002d20:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002d24:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c002d28:	29bfa2cd 	st.w	$r13,$r22,-24(0xfe8)
1c002d2c:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c002d10 <CLOCK_WaitForLSEStartUp+0x78>
1c002d30:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002d34:	0380118c 	ori	$r12,$r12,0x4
1c002d38:	2880018d 	ld.w	$r13,$r12,0
1c002d3c:	1420000c 	lu12i.w	$r12,65536(0x10000)
1c002d40:	0014b1ac 	and	$r12,$r13,$r12
1c002d44:	43ff699f 	beqz	$r12,-152(0x7fff68) # 1c002cac <CLOCK_WaitForLSEStartUp+0x14>
1c002d48:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002d4c:	0380118c 	ori	$r12,$r12,0x4
1c002d50:	2880018d 	ld.w	$r13,$r12,0
1c002d54:	1440000c 	lu12i.w	$r12,131072(0x20000)
1c002d58:	0014b1ac 	and	$r12,$r13,$r12
1c002d5c:	47ff519f 	bnez	$r12,-176(0x7fff50) # 1c002cac <CLOCK_WaitForLSEStartUp+0x14>
1c002d60:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c002d64:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c002d68:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c002d6c:	00150184 	move	$r4,$r12
1c002d70:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002d74:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002d78:	4c000020 	jirl	$r0,$r1,0

1c002d7c <CLOCK_HSEConfig>:
CLOCK_HSEConfig():
1c002d7c:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c002d80:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c002d84:	2980a076 	st.w	$r22,$r3,40(0x28)
1c002d88:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c002d8c:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c002d90:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c002d94:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002d98:	2880018e 	ld.w	$r14,$r12,0
1c002d9c:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002da0:	0014300d 	nor	$r13,$r0,$r12
1c002da4:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002da8:	0014b5cd 	and	$r13,$r14,$r13
1c002dac:	2980018d 	st.w	$r13,$r12,0
1c002db0:	1400002c 	lu12i.w	$r12,1(0x1)
1c002db4:	03b4bd8c 	ori	$r12,$r12,0xd2f
1c002db8:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c002dbc:	50001400 	b	20(0x14) # 1c002dd0 <CLOCK_HSEConfig+0x54>
1c002dc0:	03400000 	andi	$r0,$r0,0x0
1c002dc4:	03400000 	andi	$r0,$r0,0x0
1c002dc8:	03400000 	andi	$r0,$r0,0x0
1c002dcc:	03400000 	andi	$r0,$r0,0x0
1c002dd0:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002dd4:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c002dd8:	29bfa2cd 	st.w	$r13,$r22,-24(0xfe8)
1c002ddc:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c002dc0 <CLOCK_HSEConfig+0x44>
1c002de0:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c002de4:	0282000c 	addi.w	$r12,$r0,128(0x80)
1c002de8:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c002df8 <CLOCK_HSEConfig+0x7c>
1c002dec:	57fe13ff 	bl	-496(0xffffe10) # 1c002bfc <CLOCK_WaitForHSEStartUp>
1c002df0:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002df4:	50002400 	b	36(0x24) # 1c002e18 <CLOCK_HSEConfig+0x9c>
1c002df8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002dfc:	2880018e 	ld.w	$r14,$r12,0
1c002e00:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002e04:	02bdfc0d 	addi.w	$r13,$r0,-129(0xf7f)
1c002e08:	0014b5cd 	and	$r13,$r14,$r13
1c002e0c:	2980018d 	st.w	$r13,$r12,0
1c002e10:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c002e14:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c002e18:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002e1c:	00150184 	move	$r4,$r12
1c002e20:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c002e24:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c002e28:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c002e2c:	4c000020 	jirl	$r0,$r1,0

1c002e30 <CLOCK_LSEConfig>:
CLOCK_LSEConfig():
1c002e30:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c002e34:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c002e38:	2980a076 	st.w	$r22,$r3,40(0x28)
1c002e3c:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c002e40:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c002e44:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c002e48:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c002e4c:	0280800c 	addi.w	$r12,$r0,32(0x20)
1c002e50:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c002e60 <CLOCK_LSEConfig+0x30>
1c002e54:	57fe47ff 	bl	-444(0xffffe44) # 1c002c98 <CLOCK_WaitForLSEStartUp>
1c002e58:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002e5c:	50002400 	b	36(0x24) # 1c002e80 <CLOCK_LSEConfig+0x50>
1c002e60:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002e64:	2880018e 	ld.w	$r14,$r12,0
1c002e68:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002e6c:	02bf7c0d 	addi.w	$r13,$r0,-33(0xfdf)
1c002e70:	0014b5cd 	and	$r13,$r14,$r13
1c002e74:	2980018d 	st.w	$r13,$r12,0
1c002e78:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c002e7c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c002e80:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002e84:	00150184 	move	$r4,$r12
1c002e88:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c002e8c:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c002e90:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c002e94:	4c000020 	jirl	$r0,$r1,0

1c002e98 <CLOCK_StructInit>:
CLOCK_StructInit():
1c002e98:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002e9c:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002ea0:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002ea4:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002ea8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002eac:	02803c0d 	addi.w	$r13,$r0,15(0xf)
1c002eb0:	2980018d 	st.w	$r13,$r12,0
1c002eb4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002eb8:	0282000d 	addi.w	$r13,$r0,128(0x80)
1c002ebc:	2980118d 	st.w	$r13,$r12,4(0x4)
1c002ec0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002ec4:	0280800d 	addi.w	$r13,$r0,32(0x20)
1c002ec8:	2980218d 	st.w	$r13,$r12,8(0x8)
1c002ecc:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002ed0:	29803180 	st.w	$r0,$r12,12(0xc)
1c002ed4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002ed8:	29804180 	st.w	$r0,$r12,16(0x10)
1c002edc:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002ee0:	29805180 	st.w	$r0,$r12,20(0x14)
1c002ee4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002ee8:	29806180 	st.w	$r0,$r12,24(0x18)
1c002eec:	03400000 	andi	$r0,$r0,0x0
1c002ef0:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002ef4:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002ef8:	4c000020 	jirl	$r0,$r1,0

1c002efc <CLOCK_Init>:
CLOCK_Init():
1c002efc:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c002f00:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c002f04:	2980a076 	st.w	$r22,$r3,40(0x28)
1c002f08:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c002f0c:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c002f10:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c002f14:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002f18:	2880018e 	ld.w	$r14,$r12,0
1c002f1c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002f20:	02b3fc0d 	addi.w	$r13,$r0,-769(0xcff)
1c002f24:	0014b5cd 	and	$r13,$r14,$r13
1c002f28:	2980018d 	st.w	$r13,$r12,0
1c002f2c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002f30:	2880018e 	ld.w	$r14,$r12,0
1c002f34:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002f38:	2880418d 	ld.w	$r13,$r12,16(0x10)
1c002f3c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002f40:	001535cd 	or	$r13,$r14,$r13
1c002f44:	2980018d 	st.w	$r13,$r12,0
1c002f48:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002f4c:	2880018e 	ld.w	$r14,$r12,0
1c002f50:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002f54:	02bfbc0d 	addi.w	$r13,$r0,-17(0xfef)
1c002f58:	0014b5cd 	and	$r13,$r14,$r13
1c002f5c:	2980018d 	st.w	$r13,$r12,0
1c002f60:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002f64:	2880018e 	ld.w	$r14,$r12,0
1c002f68:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002f6c:	2880318d 	ld.w	$r13,$r12,12(0xc)
1c002f70:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002f74:	001535cd 	or	$r13,$r14,$r13
1c002f78:	2980018d 	st.w	$r13,$r12,0
1c002f7c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002f80:	2880018e 	ld.w	$r14,$r12,0
1c002f84:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002f88:	15ffffed 	lu12i.w	$r13,-1(0xfffff)
1c002f8c:	039ffdad 	ori	$r13,$r13,0x7ff
1c002f90:	0014b5cd 	and	$r13,$r14,$r13
1c002f94:	2980018d 	st.w	$r13,$r12,0
1c002f98:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002f9c:	2880018e 	ld.w	$r14,$r12,0
1c002fa0:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002fa4:	2880518d 	ld.w	$r13,$r12,20(0x14)
1c002fa8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002fac:	001535cd 	or	$r13,$r14,$r13
1c002fb0:	2980018d 	st.w	$r13,$r12,0
1c002fb4:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002fb8:	2880118c 	ld.w	$r12,$r12,4(0x4)
1c002fbc:	00150184 	move	$r4,$r12
1c002fc0:	57fdbfff 	bl	-580(0xffffdbc) # 1c002d7c <CLOCK_HSEConfig>
1c002fc4:	0015008d 	move	$r13,$r4
1c002fc8:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c002fcc:	58000dac 	beq	$r13,$r12,12(0xc) # 1c002fd8 <CLOCK_Init+0xdc>
1c002fd0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002fd4:	50015000 	b	336(0x150) # 1c003124 <CLOCK_Init+0x228>
1c002fd8:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002fdc:	2880218c 	ld.w	$r12,$r12,8(0x8)
1c002fe0:	00150184 	move	$r4,$r12
1c002fe4:	57fe4fff 	bl	-436(0xffffe4c) # 1c002e30 <CLOCK_LSEConfig>
1c002fe8:	0015008d 	move	$r13,$r4
1c002fec:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c002ff0:	58000dac 	beq	$r13,$r12,12(0xc) # 1c002ffc <CLOCK_Init+0x100>
1c002ff4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002ff8:	50012c00 	b	300(0x12c) # 1c003124 <CLOCK_Init+0x228>
1c002ffc:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003000:	2880118d 	ld.w	$r13,$r12,4(0x4)
1c003004:	0282000c 	addi.w	$r12,$r0,128(0x80)
1c003008:	5800fdac 	beq	$r13,$r12,252(0xfc) # 1c003104 <CLOCK_Init+0x208>
1c00300c:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003010:	2880518c 	ld.w	$r12,$r12,20(0x14)
1c003014:	4000a180 	beqz	$r12,160(0xa0) # 1c0030b4 <CLOCK_Init+0x1b8>
1c003018:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00301c:	2880018e 	ld.w	$r14,$r12,0
1c003020:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c003024:	15efffed 	lu12i.w	$r13,-32769(0xf7fff)
1c003028:	03bffdad 	ori	$r13,$r13,0xfff
1c00302c:	0014b5cd 	and	$r13,$r14,$r13
1c003030:	2980018d 	st.w	$r13,$r12,0
1c003034:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c003038:	2880018e 	ld.w	$r14,$r12,0
1c00303c:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003040:	2880618d 	ld.w	$r13,$r12,24(0x18)
1c003044:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c003048:	001535cd 	or	$r13,$r14,$r13
1c00304c:	2980018d 	st.w	$r13,$r12,0
1c003050:	157e040c 	lu12i.w	$r12,-266208(0xbf020)
1c003054:	0386c18c 	ori	$r12,$r12,0x1b0
1c003058:	2880018c 	ld.w	$r12,$r12,0
1c00305c:	40004180 	beqz	$r12,64(0x40) # 1c00309c <CLOCK_Init+0x1a0>
1c003060:	157e040c 	lu12i.w	$r12,-266208(0xbf020)
1c003064:	0386c18c 	ori	$r12,$r12,0x1b0
1c003068:	2880018c 	ld.w	$r12,$r12,0
1c00306c:	0040898e 	slli.w	$r14,$r12,0x2
1c003070:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c003074:	002031cd 	div.w	$r13,$r14,$r12
1c003078:	5c000980 	bne	$r12,$r0,8(0x8) # 1c003080 <CLOCK_Init+0x184>
1c00307c:	002a0007 	break	0x7
1c003080:	028fa00c 	addi.w	$r12,$r0,1000(0x3e8)
1c003084:	001c31ac 	mul.w	$r12,$r13,$r12
1c003088:	0015018d 	move	$r13,$r12
1c00308c:	1cc7ffcc 	pcaddu12i	$r12,409598(0x63ffe)
1c003090:	02be118c 	addi.w	$r12,$r12,-124(0xf84)
1c003094:	2980018d 	st.w	$r13,$r12,0
1c003098:	50008000 	b	128(0x80) # 1c003118 <CLOCK_Init+0x21c>
1c00309c:	1cc7ffcc 	pcaddu12i	$r12,409598(0x63ffe)
1c0030a0:	02bdd18c 	addi.w	$r12,$r12,-140(0xf74)
1c0030a4:	1401458d 	lu12i.w	$r13,2604(0xa2c)
1c0030a8:	038fe1ad 	ori	$r13,$r13,0x3f8
1c0030ac:	2980018d 	st.w	$r13,$r12,0
1c0030b0:	50006800 	b	104(0x68) # 1c003118 <CLOCK_Init+0x21c>
1c0030b4:	157e040c 	lu12i.w	$r12,-266208(0xbf020)
1c0030b8:	0386c18c 	ori	$r12,$r12,0x1b0
1c0030bc:	2880018c 	ld.w	$r12,$r12,0
1c0030c0:	40002d80 	beqz	$r12,44(0x2c) # 1c0030ec <CLOCK_Init+0x1f0>
1c0030c4:	157e040c 	lu12i.w	$r12,-266208(0xbf020)
1c0030c8:	0386c18c 	ori	$r12,$r12,0x1b0
1c0030cc:	2880018d 	ld.w	$r13,$r12,0
1c0030d0:	028fa00c 	addi.w	$r12,$r0,1000(0x3e8)
1c0030d4:	001c31ac 	mul.w	$r12,$r13,$r12
1c0030d8:	0015018d 	move	$r13,$r12
1c0030dc:	1cc7ffcc 	pcaddu12i	$r12,409598(0x63ffe)
1c0030e0:	02bcd18c 	addi.w	$r12,$r12,-204(0xf34)
1c0030e4:	2980018d 	st.w	$r13,$r12,0
1c0030e8:	50003000 	b	48(0x30) # 1c003118 <CLOCK_Init+0x21c>
1c0030ec:	1cc7ffcc 	pcaddu12i	$r12,409598(0x63ffe)
1c0030f0:	02bc918c 	addi.w	$r12,$r12,-220(0xf24)
1c0030f4:	1400f42d 	lu12i.w	$r13,1953(0x7a1)
1c0030f8:	038801ad 	ori	$r13,$r13,0x200
1c0030fc:	2980018d 	st.w	$r13,$r12,0
1c003100:	50001800 	b	24(0x18) # 1c003118 <CLOCK_Init+0x21c>
1c003104:	1cc7ffcc 	pcaddu12i	$r12,409598(0x63ffe)
1c003108:	02bc318c 	addi.w	$r12,$r12,-244(0xf0c)
1c00310c:	1400f42d 	lu12i.w	$r13,1953(0x7a1)
1c003110:	038801ad 	ori	$r13,$r13,0x200
1c003114:	2980018d 	st.w	$r13,$r12,0
1c003118:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c00311c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003120:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003124:	00150184 	move	$r4,$r12
1c003128:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c00312c:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c003130:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c003134:	4c000020 	jirl	$r0,$r1,0

1c003138 <SystemClockInit>:
SystemClockInit():
1c003138:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c00313c:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c003140:	2980a076 	st.w	$r22,$r3,40(0x28)
1c003144:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c003148:	29bf52c0 	st.w	$r0,$r22,-44(0xfd4)
1c00314c:	29bf62c0 	st.w	$r0,$r22,-40(0xfd8)
1c003150:	29bf72c0 	st.w	$r0,$r22,-36(0xfdc)
1c003154:	29bf82c0 	st.w	$r0,$r22,-32(0xfe0)
1c003158:	29bf92c0 	st.w	$r0,$r22,-28(0xfe4)
1c00315c:	29bfa2c0 	st.w	$r0,$r22,-24(0xfe8)
1c003160:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c003164:	02bf52cc 	addi.w	$r12,$r22,-44(0xfd4)
1c003168:	00150184 	move	$r4,$r12
1c00316c:	57fd2fff 	bl	-724(0xffffd2c) # 1c002e98 <CLOCK_StructInit>
1c003170:	02803c0c 	addi.w	$r12,$r0,15(0xf)
1c003174:	29bf52cc 	st.w	$r12,$r22,-44(0xfd4)
1c003178:	0282000c 	addi.w	$r12,$r0,128(0x80)
1c00317c:	29bf62cc 	st.w	$r12,$r22,-40(0xfd8)
1c003180:	0280800c 	addi.w	$r12,$r0,32(0x20)
1c003184:	29bf72cc 	st.w	$r12,$r22,-36(0xfdc)
1c003188:	29bf82c0 	st.w	$r0,$r22,-32(0xfe0)
1c00318c:	0284000c 	addi.w	$r12,$r0,256(0x100)
1c003190:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c003194:	29bfa2c0 	st.w	$r0,$r22,-24(0xfe8)
1c003198:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c00319c:	02bf52cc 	addi.w	$r12,$r22,-44(0xfd4)
1c0031a0:	00150184 	move	$r4,$r12
1c0031a4:	57fd5bff 	bl	-680(0xffffd58) # 1c002efc <CLOCK_Init>
1c0031a8:	0015008d 	move	$r13,$r4
1c0031ac:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0031b0:	58000dac 	beq	$r13,$r12,12(0xc) # 1c0031bc <SystemClockInit+0x84>
1c0031b4:	02bffc0c 	addi.w	$r12,$r0,-1(0xfff)
1c0031b8:	50000800 	b	8(0x8) # 1c0031c0 <SystemClockInit+0x88>
1c0031bc:	0015000c 	move	$r12,$r0
1c0031c0:	00150184 	move	$r4,$r12
1c0031c4:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c0031c8:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c0031cc:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c0031d0:	4c000020 	jirl	$r0,$r1,0

1c0031d4 <DisableInt>:
DisableInt():
1c0031d4:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0031d8:	29803076 	st.w	$r22,$r3,12(0xc)
1c0031dc:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0031e0:	0380100c 	ori	$r12,$r0,0x4
1c0031e4:	04000180 	csrxchg	$r0,$r12,0x0
1c0031e8:	03400000 	andi	$r0,$r0,0x0
1c0031ec:	28803076 	ld.w	$r22,$r3,12(0xc)
1c0031f0:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0031f4:	4c000020 	jirl	$r0,$r1,0

1c0031f8 <EnableInt>:
EnableInt():
1c0031f8:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0031fc:	29803076 	st.w	$r22,$r3,12(0xc)
1c003200:	02804076 	addi.w	$r22,$r3,16(0x10)
1c003204:	0380100c 	ori	$r12,$r0,0x4
1c003208:	0400018c 	csrxchg	$r12,$r12,0x0
1c00320c:	03400000 	andi	$r0,$r0,0x0
1c003210:	28803076 	ld.w	$r22,$r3,12(0xc)
1c003214:	02804063 	addi.w	$r3,$r3,16(0x10)
1c003218:	4c000020 	jirl	$r0,$r1,0

1c00321c <Set_Timer_stop>:
Set_Timer_stop():
1c00321c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c003220:	29803076 	st.w	$r22,$r3,12(0xc)
1c003224:	02804076 	addi.w	$r22,$r3,16(0x10)
1c003228:	04010420 	csrwr	$r0,0x41
1c00322c:	03400000 	andi	$r0,$r0,0x0
1c003230:	28803076 	ld.w	$r22,$r3,12(0xc)
1c003234:	02804063 	addi.w	$r3,$r3,16(0x10)
1c003238:	4c000020 	jirl	$r0,$r1,0

1c00323c <Set_Timer_clear>:
Set_Timer_clear():
1c00323c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c003240:	29803076 	st.w	$r22,$r3,12(0xc)
1c003244:	02804076 	addi.w	$r22,$r3,16(0x10)
1c003248:	0380040c 	ori	$r12,$r0,0x1
1c00324c:	0401102c 	csrwr	$r12,0x44
1c003250:	03400000 	andi	$r0,$r0,0x0
1c003254:	28803076 	ld.w	$r22,$r3,12(0xc)
1c003258:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00325c:	4c000020 	jirl	$r0,$r1,0

1c003260 <Wake_Set>:
Wake_Set():
1c003260:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c003264:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c003268:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c00326c:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c003270:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003274:	40006980 	beqz	$r12,104(0x68) # 1c0032dc <Wake_Set+0x7c>
1c003278:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c00327c:	0040a18c 	slli.w	$r12,$r12,0x8
1c003280:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003284:	29bfa2c0 	st.w	$r0,$r22,-24(0xfe8)
1c003288:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00328c:	0380218c 	ori	$r12,$r12,0x8
1c003290:	2880018d 	ld.w	$r13,$r12,0
1c003294:	14001fec 	lu12i.w	$r12,255(0xff)
1c003298:	03bffd8c 	ori	$r12,$r12,0xfff
1c00329c:	0014b1ac 	and	$r12,$r13,$r12
1c0032a0:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0032a4:	001031ac 	add.w	$r12,$r13,$r12
1c0032a8:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0032ac:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0032b0:	0380318c 	ori	$r12,$r12,0xc
1c0032b4:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c0032b8:	2980018d 	st.w	$r13,$r12,0
1c0032bc:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0032c0:	0380118c 	ori	$r12,$r12,0x4
1c0032c4:	2880018d 	ld.w	$r13,$r12,0
1c0032c8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0032cc:	0380118c 	ori	$r12,$r12,0x4
1c0032d0:	038601ad 	ori	$r13,$r13,0x180
1c0032d4:	2980018d 	st.w	$r13,$r12,0
1c0032d8:	50002400 	b	36(0x24) # 1c0032fc <Wake_Set+0x9c>
1c0032dc:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0032e0:	0380118c 	ori	$r12,$r12,0x4
1c0032e4:	2880018e 	ld.w	$r14,$r12,0
1c0032e8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0032ec:	0380118c 	ori	$r12,$r12,0x4
1c0032f0:	02b9fc0d 	addi.w	$r13,$r0,-385(0xe7f)
1c0032f4:	0014b5cd 	and	$r13,$r14,$r13
1c0032f8:	2980018d 	st.w	$r13,$r12,0
1c0032fc:	03400000 	andi	$r0,$r0,0x0
1c003300:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c003304:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c003308:	4c000020 	jirl	$r0,$r1,0

1c00330c <PMU_GetRstRrc>:
PMU_GetRstRrc():
1c00330c:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c003310:	29807076 	st.w	$r22,$r3,28(0x1c)
1c003314:	02808076 	addi.w	$r22,$r3,32(0x20)
1c003318:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c00331c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c003320:	2880118d 	ld.w	$r13,$r12,4(0x4)
1c003324:	1418000c 	lu12i.w	$r12,49152(0xc000)
1c003328:	0014b1ac 	and	$r12,$r13,$r12
1c00332c:	44000d80 	bnez	$r12,12(0xc) # 1c003338 <PMU_GetRstRrc+0x2c>
1c003330:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c003334:	50003000 	b	48(0x30) # 1c003364 <PMU_GetRstRrc+0x58>
1c003338:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00333c:	2880118d 	ld.w	$r13,$r12,4(0x4)
1c003340:	1418000c 	lu12i.w	$r12,49152(0xc000)
1c003344:	0014b1ad 	and	$r13,$r13,$r12
1c003348:	1418000c 	lu12i.w	$r12,49152(0xc000)
1c00334c:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c00335c <PMU_GetRstRrc+0x50>
1c003350:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c003354:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003358:	50000c00 	b	12(0xc) # 1c003364 <PMU_GetRstRrc+0x58>
1c00335c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c003360:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003364:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003368:	00150184 	move	$r4,$r12
1c00336c:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c003370:	02808063 	addi.w	$r3,$r3,32(0x20)
1c003374:	4c000020 	jirl	$r0,$r1,0

1c003378 <PMU_GetBootSpiStatus>:
PMU_GetBootSpiStatus():
1c003378:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c00337c:	29807076 	st.w	$r22,$r3,28(0x1c)
1c003380:	02808076 	addi.w	$r22,$r3,32(0x20)
1c003384:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c003388:	29bfa2c0 	st.w	$r0,$r22,-24(0xfe8)
1c00338c:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c003390:	0380198c 	ori	$r12,$r12,0x6
1c003394:	2a00018c 	ld.bu	$r12,$r12,0
1c003398:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c00339c:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0033a0:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0033a4:	0340058c 	andi	$r12,$r12,0x1
1c0033a8:	40000d80 	beqz	$r12,12(0xc) # 1c0033b4 <PMU_GetBootSpiStatus+0x3c>
1c0033ac:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0033b0:	50000800 	b	8(0x8) # 1c0033b8 <PMU_GetBootSpiStatus+0x40>
1c0033b4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0033b8:	00150184 	move	$r4,$r12
1c0033bc:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c0033c0:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0033c4:	4c000020 	jirl	$r0,$r1,0

1c0033c8 <ls1x_logo>:
ls1x_logo():
1c0033c8:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0033cc:	29803061 	st.w	$r1,$r3,12(0xc)
1c0033d0:	29802076 	st.w	$r22,$r3,8(0x8)
1c0033d4:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0033d8:	1c000044 	pcaddu12i	$r4,2(0x2)
1c0033dc:	029bf084 	addi.w	$r4,$r4,1788(0x6fc)
1c0033e0:	57ea3bff 	bl	-5576(0xfffea38) # 1c001e18 <myprintf>
1c0033e4:	1c000044 	pcaddu12i	$r4,2(0x2)
1c0033e8:	029bd084 	addi.w	$r4,$r4,1780(0x6f4)
1c0033ec:	57ea2fff 	bl	-5588(0xfffea2c) # 1c001e18 <myprintf>
1c0033f0:	1c000044 	pcaddu12i	$r4,2(0x2)
1c0033f4:	029d3084 	addi.w	$r4,$r4,1868(0x74c)
1c0033f8:	57ea23ff 	bl	-5600(0xfffea20) # 1c001e18 <myprintf>
1c0033fc:	1c000044 	pcaddu12i	$r4,2(0x2)
1c003400:	029e9084 	addi.w	$r4,$r4,1956(0x7a4)
1c003404:	57ea17ff 	bl	-5612(0xfffea14) # 1c001e18 <myprintf>
1c003408:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00340c:	029ff084 	addi.w	$r4,$r4,2044(0x7fc)
1c003410:	57ea0bff 	bl	-5624(0xfffea08) # 1c001e18 <myprintf>
1c003414:	1c000064 	pcaddu12i	$r4,3(0x3)
1c003418:	02a15084 	addi.w	$r4,$r4,-1964(0x854)
1c00341c:	57e9ffff 	bl	-5636(0xfffe9fc) # 1c001e18 <myprintf>
1c003420:	1c000064 	pcaddu12i	$r4,3(0x3)
1c003424:	02a2b084 	addi.w	$r4,$r4,-1876(0x8ac)
1c003428:	57e9f3ff 	bl	-5648(0xfffe9f0) # 1c001e18 <myprintf>
1c00342c:	1c000064 	pcaddu12i	$r4,3(0x3)
1c003430:	02a41084 	addi.w	$r4,$r4,-1788(0x904)
1c003434:	57e9e7ff 	bl	-5660(0xfffe9e4) # 1c001e18 <myprintf>
1c003438:	1c000064 	pcaddu12i	$r4,3(0x3)
1c00343c:	02a57084 	addi.w	$r4,$r4,-1700(0x95c)
1c003440:	57e9dbff 	bl	-5672(0xfffe9d8) # 1c001e18 <myprintf>
1c003444:	1c000064 	pcaddu12i	$r4,3(0x3)
1c003448:	02a6d084 	addi.w	$r4,$r4,-1612(0x9b4)
1c00344c:	57e9cfff 	bl	-5684(0xfffe9cc) # 1c001e18 <myprintf>
1c003450:	03400000 	andi	$r0,$r0,0x0
1c003454:	28803061 	ld.w	$r1,$r3,12(0xc)
1c003458:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00345c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c003460:	4c000020 	jirl	$r0,$r1,0

1c003464 <get_count>:
get_count():
1c003464:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c003468:	29807076 	st.w	$r22,$r3,28(0x1c)
1c00346c:	02808076 	addi.w	$r22,$r3,32(0x20)
1c003470:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c003474:	0000600c 	rdtimel.w	$r12,$r0
1c003478:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c00347c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003480:	00150184 	move	$r4,$r12
1c003484:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c003488:	02808063 	addi.w	$r3,$r3,32(0x20)
1c00348c:	4c000020 	jirl	$r0,$r1,0

1c003490 <open_count>:
open_count():
1c003490:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c003494:	29803076 	st.w	$r22,$r3,12(0xc)
1c003498:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00349c:	0380400c 	ori	$r12,$r0,0x10
1c0034a0:	0402bd80 	csrxchg	$r0,$r12,0xaf
1c0034a4:	03400000 	andi	$r0,$r0,0x0
1c0034a8:	28803076 	ld.w	$r22,$r3,12(0xc)
1c0034ac:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0034b0:	4c000020 	jirl	$r0,$r1,0

1c0034b4 <start_count>:
start_count():
1c0034b4:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0034b8:	29807061 	st.w	$r1,$r3,28(0x1c)
1c0034bc:	29806076 	st.w	$r22,$r3,24(0x18)
1c0034c0:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0034c4:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c0034c8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0034cc:	29800180 	st.w	$r0,$r12,0
1c0034d0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0034d4:	29801180 	st.w	$r0,$r12,4(0x4)
1c0034d8:	57ff8fff 	bl	-116(0xfffff8c) # 1c003464 <get_count>
1c0034dc:	0015008d 	move	$r13,$r4
1c0034e0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0034e4:	2980018d 	st.w	$r13,$r12,0
1c0034e8:	03400000 	andi	$r0,$r0,0x0
1c0034ec:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c0034f0:	28806076 	ld.w	$r22,$r3,24(0x18)
1c0034f4:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0034f8:	4c000020 	jirl	$r0,$r1,0

1c0034fc <stop_count>:
stop_count():
1c0034fc:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c003500:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c003504:	2980a076 	st.w	$r22,$r3,40(0x28)
1c003508:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c00350c:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c003510:	57ff57ff 	bl	-172(0xfffff54) # 1c003464 <get_count>
1c003514:	0015008d 	move	$r13,$r4
1c003518:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c00351c:	2980118d 	st.w	$r13,$r12,4(0x4)
1c003520:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003524:	2880118d 	ld.w	$r13,$r12,4(0x4)
1c003528:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c00352c:	2880018c 	ld.w	$r12,$r12,0
1c003530:	68001dac 	bltu	$r13,$r12,28(0x1c) # 1c00354c <stop_count+0x50>
1c003534:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003538:	2880118d 	ld.w	$r13,$r12,4(0x4)
1c00353c:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003540:	2880018c 	ld.w	$r12,$r12,0
1c003544:	001131ac 	sub.w	$r12,$r13,$r12
1c003548:	50002800 	b	40(0x28) # 1c003570 <stop_count+0x74>
1c00354c:	02bffc0c 	addi.w	$r12,$r0,-1(0xfff)
1c003550:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003554:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003558:	2880018c 	ld.w	$r12,$r12,0
1c00355c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c003560:	001131ad 	sub.w	$r13,$r13,$r12
1c003564:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003568:	2880118c 	ld.w	$r12,$r12,4(0x4)
1c00356c:	001031ac 	add.w	$r12,$r13,$r12
1c003570:	00150184 	move	$r4,$r12
1c003574:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c003578:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c00357c:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c003580:	4c000020 	jirl	$r0,$r1,0

1c003584 <delay_cycle>:
delay_cycle():
1c003584:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c003588:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c00358c:	2980a076 	st.w	$r22,$r3,40(0x28)
1c003590:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c003594:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c003598:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c00359c:	29bf92c0 	st.w	$r0,$r22,-28(0xfe4)
1c0035a0:	29bfa2c0 	st.w	$r0,$r22,-24(0xfe8)
1c0035a4:	02bf92cc 	addi.w	$r12,$r22,-28(0xfe4)
1c0035a8:	00150184 	move	$r4,$r12
1c0035ac:	57ff0bff 	bl	-248(0xfffff08) # 1c0034b4 <start_count>
1c0035b0:	50001400 	b	20(0x14) # 1c0035c4 <delay_cycle+0x40>
1c0035b4:	02bf92cc 	addi.w	$r12,$r22,-28(0xfe4)
1c0035b8:	00150184 	move	$r4,$r12
1c0035bc:	57ff43ff 	bl	-192(0xfffff40) # 1c0034fc <stop_count>
1c0035c0:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c0035c4:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0035c8:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0035cc:	6bffe9ac 	bltu	$r13,$r12,-24(0x3ffe8) # 1c0035b4 <delay_cycle+0x30>
1c0035d0:	03400000 	andi	$r0,$r0,0x0
1c0035d4:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c0035d8:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c0035dc:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c0035e0:	4c000020 	jirl	$r0,$r1,0

1c0035e4 <delay_ms>:
delay_ms():
1c0035e4:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0035e8:	29807061 	st.w	$r1,$r3,28(0x1c)
1c0035ec:	29806076 	st.w	$r22,$r3,24(0x18)
1c0035f0:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0035f4:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c0035f8:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0035fc:	1400002c 	lu12i.w	$r12,1(0x1)
1c003600:	03bd018c 	ori	$r12,$r12,0xf40
1c003604:	001c31ac 	mul.w	$r12,$r13,$r12
1c003608:	00150184 	move	$r4,$r12
1c00360c:	57ff7bff 	bl	-136(0xfffff78) # 1c003584 <delay_cycle>
1c003610:	03400000 	andi	$r0,$r0,0x0
1c003614:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c003618:	28806076 	ld.w	$r22,$r3,24(0x18)
1c00361c:	02808063 	addi.w	$r3,$r3,32(0x20)
1c003620:	4c000020 	jirl	$r0,$r1,0

1c003624 <delay_s>:
delay_s():
1c003624:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c003628:	29807061 	st.w	$r1,$r3,28(0x1c)
1c00362c:	29806076 	st.w	$r22,$r3,24(0x18)
1c003630:	02808076 	addi.w	$r22,$r3,32(0x20)
1c003634:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c003638:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c00363c:	028fa00c 	addi.w	$r12,$r0,1000(0x3e8)
1c003640:	001c31ac 	mul.w	$r12,$r13,$r12
1c003644:	00150184 	move	$r4,$r12
1c003648:	57ff9fff 	bl	-100(0xfffff9c) # 1c0035e4 <delay_ms>
1c00364c:	03400000 	andi	$r0,$r0,0x0
1c003650:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c003654:	28806076 	ld.w	$r22,$r3,24(0x18)
1c003658:	02808063 	addi.w	$r3,$r3,32(0x20)
1c00365c:	4c000020 	jirl	$r0,$r1,0

1c003660 <EXTI_ClearITPendingBit>:
EXTI_ClearITPendingBit():
1c003660:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c003664:	29807076 	st.w	$r22,$r3,28(0x1c)
1c003668:	02808076 	addi.w	$r22,$r3,32(0x20)
1c00366c:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c003670:	29bfa2c5 	st.w	$r5,$r22,-24(0xfe8)
1c003674:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003678:	2880318d 	ld.w	$r13,$r12,12(0xc)
1c00367c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c003680:	001531ad 	or	$r13,$r13,$r12
1c003684:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003688:	2980318d 	st.w	$r13,$r12,12(0xc)
1c00368c:	03400000 	andi	$r0,$r0,0x0
1c003690:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c003694:	02808063 	addi.w	$r3,$r3,32(0x20)
1c003698:	4c000020 	jirl	$r0,$r1,0

1c00369c <WDG_getOddValue>:
WDG_getOddValue():
1c00369c:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0036a0:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c0036a4:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c0036a8:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c0036ac:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c0036b0:	29bfa2c0 	st.w	$r0,$r22,-24(0xfe8)
1c0036b4:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c0036b8:	50003800 	b	56(0x38) # 1c0036f0 <WDG_getOddValue+0x54>
1c0036bc:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c0036c0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0036c4:	001731ac 	sll.w	$r12,$r13,$r12
1c0036c8:	0015018d 	move	$r13,$r12
1c0036cc:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0036d0:	0014b1ac 	and	$r12,$r13,$r12
1c0036d4:	40001180 	beqz	$r12,16(0x10) # 1c0036e4 <WDG_getOddValue+0x48>
1c0036d8:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0036dc:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0036e0:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0036e4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0036e8:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0036ec:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0036f0:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0036f4:	0280380c 	addi.w	$r12,$r0,14(0xe)
1c0036f8:	67ffc58d 	bge	$r12,$r13,-60(0x3ffc4) # 1c0036bc <WDG_getOddValue+0x20>
1c0036fc:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c003700:	0340058c 	andi	$r12,$r12,0x1
1c003704:	44000d80 	bnez	$r12,12(0xc) # 1c003710 <WDG_getOddValue+0x74>
1c003708:	1400010c 	lu12i.w	$r12,8(0x8)
1c00370c:	50000800 	b	8(0x8) # 1c003714 <WDG_getOddValue+0x78>
1c003710:	0015000c 	move	$r12,$r0
1c003714:	00150184 	move	$r4,$r12
1c003718:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c00371c:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c003720:	4c000020 	jirl	$r0,$r1,0

1c003724 <WDG_SetWatchDog>:
WDG_SetWatchDog():
1c003724:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c003728:	29807061 	st.w	$r1,$r3,28(0x1c)
1c00372c:	29806076 	st.w	$r22,$r3,24(0x18)
1c003730:	02808076 	addi.w	$r22,$r3,32(0x20)
1c003734:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c003738:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c00373c:	140000ec 	lu12i.w	$r12,7(0x7)
1c003740:	03bffd8c 	ori	$r12,$r12,0xfff
1c003744:	0014b1ac 	and	$r12,$r13,$r12
1c003748:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c00374c:	28bfb2c4 	ld.w	$r4,$r22,-20(0xfec)
1c003750:	57ff4fff 	bl	-180(0xfffff4c) # 1c00369c <WDG_getOddValue>
1c003754:	0015008c 	move	$r12,$r4
1c003758:	0015018d 	move	$r13,$r12
1c00375c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003760:	0015358c 	or	$r12,$r12,$r13
1c003764:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003768:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00376c:	154ab4ad 	lu12i.w	$r13,-371291(0xa55a5)
1c003770:	0396a9ad 	ori	$r13,$r13,0x5aa
1c003774:	2980d18d 	st.w	$r13,$r12,52(0x34)
1c003778:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00377c:	0014300c 	nor	$r12,$r0,$r12
1c003780:	0040c18c 	slli.w	$r12,$r12,0x10
1c003784:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c003788:	001531ac 	or	$r12,$r13,$r12
1c00378c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003790:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c003794:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c003798:	2980c18d 	st.w	$r13,$r12,48(0x30)
1c00379c:	03400000 	andi	$r0,$r0,0x0
1c0037a0:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c0037a4:	28806076 	ld.w	$r22,$r3,24(0x18)
1c0037a8:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0037ac:	4c000020 	jirl	$r0,$r1,0

1c0037b0 <WDG_DogFeed>:
WDG_DogFeed():
1c0037b0:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0037b4:	29803076 	st.w	$r22,$r3,12(0xc)
1c0037b8:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0037bc:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0037c0:	154ab4ad 	lu12i.w	$r13,-371291(0xa55a5)
1c0037c4:	0396a9ad 	ori	$r13,$r13,0x5aa
1c0037c8:	2980d18d 	st.w	$r13,$r12,52(0x34)
1c0037cc:	03400000 	andi	$r0,$r0,0x0
1c0037d0:	28803076 	ld.w	$r22,$r3,12(0xc)
1c0037d4:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0037d8:	4c000020 	jirl	$r0,$r1,0

1c0037dc <WdgInit>:
WdgInit():
1c0037dc:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0037e0:	29803061 	st.w	$r1,$r3,12(0xc)
1c0037e4:	29802076 	st.w	$r22,$r3,8(0x8)
1c0037e8:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0037ec:	150000ec 	lu12i.w	$r12,-524281(0x80007)
1c0037f0:	03bffd84 	ori	$r4,$r12,0xfff
1c0037f4:	57ff33ff 	bl	-208(0xfffff30) # 1c003724 <WDG_SetWatchDog>
1c0037f8:	03400000 	andi	$r0,$r0,0x0
1c0037fc:	28803061 	ld.w	$r1,$r3,12(0xc)
1c003800:	28802076 	ld.w	$r22,$r3,8(0x8)
1c003804:	02804063 	addi.w	$r3,$r3,16(0x10)
1c003808:	4c000020 	jirl	$r0,$r1,0

1c00380c <IIC_Delay>:
IIC_Delay():
1c00380c:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c003810:	29807076 	st.w	$r22,$r3,28(0x1c)
1c003814:	02808076 	addi.w	$r22,$r3,32(0x20)
1c003818:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c00381c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003820:	50001000 	b	16(0x10) # 1c003830 <IIC_Delay+0x24>
1c003824:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003828:	02bffd8c 	addi.w	$r12,$r12,-1(0xfff)
1c00382c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003830:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003834:	47fff19f 	bnez	$r12,-16(0x7ffff0) # 1c003824 <IIC_Delay+0x18>
1c003838:	03400000 	andi	$r0,$r0,0x0
1c00383c:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c003840:	02808063 	addi.w	$r3,$r3,32(0x20)
1c003844:	4c000020 	jirl	$r0,$r1,0

1c003848 <IIC_Init>:
IIC_Init():
1c003848:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00384c:	29803061 	st.w	$r1,$r3,12(0xc)
1c003850:	29802076 	st.w	$r22,$r3,8(0x8)
1c003854:	02804076 	addi.w	$r22,$r3,16(0x10)
1c003858:	00150005 	move	$r5,$r0
1c00385c:	02801004 	addi.w	$r4,$r0,4(0x4)
1c003860:	57ddf7ff 	bl	-8716(0xfffddf4) # 1c001654 <gpio_pin_remap>
1c003864:	00150005 	move	$r5,$r0
1c003868:	02801404 	addi.w	$r4,$r0,5(0x5)
1c00386c:	57ddebff 	bl	-8728(0xfffdde8) # 1c001654 <gpio_pin_remap>
1c003870:	02800405 	addi.w	$r5,$r0,1(0x1)
1c003874:	02801004 	addi.w	$r4,$r0,4(0x4)
1c003878:	57dfebff 	bl	-8216(0xfffdfe8) # 1c001860 <gpio_set_direction>
1c00387c:	02800405 	addi.w	$r5,$r0,1(0x1)
1c003880:	02801404 	addi.w	$r4,$r0,5(0x5)
1c003884:	57dfdfff 	bl	-8228(0xfffdfdc) # 1c001860 <gpio_set_direction>
1c003888:	02800405 	addi.w	$r5,$r0,1(0x1)
1c00388c:	02801004 	addi.w	$r4,$r0,4(0x4)
1c003890:	57dd4fff 	bl	-8884(0xfffdd4c) # 1c0015dc <gpio_write_pin>
1c003894:	02800405 	addi.w	$r5,$r0,1(0x1)
1c003898:	02801404 	addi.w	$r4,$r0,5(0x5)
1c00389c:	57dd43ff 	bl	-8896(0xfffdd40) # 1c0015dc <gpio_write_pin>
1c0038a0:	03400000 	andi	$r0,$r0,0x0
1c0038a4:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0038a8:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0038ac:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0038b0:	4c000020 	jirl	$r0,$r1,0

1c0038b4 <SDA_IN>:
SDA_IN():
1c0038b4:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0038b8:	29803061 	st.w	$r1,$r3,12(0xc)
1c0038bc:	29802076 	st.w	$r22,$r3,8(0x8)
1c0038c0:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0038c4:	00150005 	move	$r5,$r0
1c0038c8:	02801404 	addi.w	$r4,$r0,5(0x5)
1c0038cc:	57df97ff 	bl	-8300(0xfffdf94) # 1c001860 <gpio_set_direction>
1c0038d0:	03400000 	andi	$r0,$r0,0x0
1c0038d4:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0038d8:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0038dc:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0038e0:	4c000020 	jirl	$r0,$r1,0

1c0038e4 <SDA_OUT>:
SDA_OUT():
1c0038e4:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0038e8:	29803061 	st.w	$r1,$r3,12(0xc)
1c0038ec:	29802076 	st.w	$r22,$r3,8(0x8)
1c0038f0:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0038f4:	02800405 	addi.w	$r5,$r0,1(0x1)
1c0038f8:	02801404 	addi.w	$r4,$r0,5(0x5)
1c0038fc:	57df67ff 	bl	-8348(0xfffdf64) # 1c001860 <gpio_set_direction>
1c003900:	02800405 	addi.w	$r5,$r0,1(0x1)
1c003904:	02801404 	addi.w	$r4,$r0,5(0x5)
1c003908:	57dcd7ff 	bl	-9004(0xfffdcd4) # 1c0015dc <gpio_write_pin>
1c00390c:	03400000 	andi	$r0,$r0,0x0
1c003910:	28803061 	ld.w	$r1,$r3,12(0xc)
1c003914:	28802076 	ld.w	$r22,$r3,8(0x8)
1c003918:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00391c:	4c000020 	jirl	$r0,$r1,0

1c003920 <IIC_Start>:
IIC_Start():
1c003920:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c003924:	29803061 	st.w	$r1,$r3,12(0xc)
1c003928:	29802076 	st.w	$r22,$r3,8(0x8)
1c00392c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c003930:	57ffb7ff 	bl	-76(0xfffffb4) # 1c0038e4 <SDA_OUT>
1c003934:	02800405 	addi.w	$r5,$r0,1(0x1)
1c003938:	02801404 	addi.w	$r4,$r0,5(0x5)
1c00393c:	57dca3ff 	bl	-9056(0xfffdca0) # 1c0015dc <gpio_write_pin>
1c003940:	02800405 	addi.w	$r5,$r0,1(0x1)
1c003944:	02801004 	addi.w	$r4,$r0,4(0x4)
1c003948:	57dc97ff 	bl	-9068(0xfffdc94) # 1c0015dc <gpio_write_pin>
1c00394c:	57fec3ff 	bl	-320(0xffffec0) # 1c00380c <IIC_Delay>
1c003950:	00150005 	move	$r5,$r0
1c003954:	02801404 	addi.w	$r4,$r0,5(0x5)
1c003958:	57dc87ff 	bl	-9084(0xfffdc84) # 1c0015dc <gpio_write_pin>
1c00395c:	57feb3ff 	bl	-336(0xffffeb0) # 1c00380c <IIC_Delay>
1c003960:	00150005 	move	$r5,$r0
1c003964:	02801004 	addi.w	$r4,$r0,4(0x4)
1c003968:	57dc77ff 	bl	-9100(0xfffdc74) # 1c0015dc <gpio_write_pin>
1c00396c:	03400000 	andi	$r0,$r0,0x0
1c003970:	28803061 	ld.w	$r1,$r3,12(0xc)
1c003974:	28802076 	ld.w	$r22,$r3,8(0x8)
1c003978:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00397c:	4c000020 	jirl	$r0,$r1,0

1c003980 <IIC_Stop>:
IIC_Stop():
1c003980:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c003984:	29803061 	st.w	$r1,$r3,12(0xc)
1c003988:	29802076 	st.w	$r22,$r3,8(0x8)
1c00398c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c003990:	57ff57ff 	bl	-172(0xfffff54) # 1c0038e4 <SDA_OUT>
1c003994:	00150005 	move	$r5,$r0
1c003998:	02801004 	addi.w	$r4,$r0,4(0x4)
1c00399c:	57dc43ff 	bl	-9152(0xfffdc40) # 1c0015dc <gpio_write_pin>
1c0039a0:	00150005 	move	$r5,$r0
1c0039a4:	02801404 	addi.w	$r4,$r0,5(0x5)
1c0039a8:	57dc37ff 	bl	-9164(0xfffdc34) # 1c0015dc <gpio_write_pin>
1c0039ac:	57fe63ff 	bl	-416(0xffffe60) # 1c00380c <IIC_Delay>
1c0039b0:	02800405 	addi.w	$r5,$r0,1(0x1)
1c0039b4:	02801004 	addi.w	$r4,$r0,4(0x4)
1c0039b8:	57dc27ff 	bl	-9180(0xfffdc24) # 1c0015dc <gpio_write_pin>
1c0039bc:	02800405 	addi.w	$r5,$r0,1(0x1)
1c0039c0:	02801404 	addi.w	$r4,$r0,5(0x5)
1c0039c4:	57dc1bff 	bl	-9192(0xfffdc18) # 1c0015dc <gpio_write_pin>
1c0039c8:	57fe47ff 	bl	-444(0xffffe44) # 1c00380c <IIC_Delay>
1c0039cc:	03400000 	andi	$r0,$r0,0x0
1c0039d0:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0039d4:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0039d8:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0039dc:	4c000020 	jirl	$r0,$r1,0

1c0039e0 <IIC_Wait_Ack>:
IIC_Wait_Ack():
1c0039e0:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0039e4:	29807061 	st.w	$r1,$r3,28(0x1c)
1c0039e8:	29806076 	st.w	$r22,$r3,24(0x18)
1c0039ec:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0039f0:	293fbec0 	st.b	$r0,$r22,-17(0xfef)
1c0039f4:	57fec3ff 	bl	-320(0xffffec0) # 1c0038b4 <SDA_IN>
1c0039f8:	02800405 	addi.w	$r5,$r0,1(0x1)
1c0039fc:	02801404 	addi.w	$r4,$r0,5(0x5)
1c003a00:	57dbdfff 	bl	-9252(0xfffdbdc) # 1c0015dc <gpio_write_pin>
1c003a04:	57fe0bff 	bl	-504(0xffffe08) # 1c00380c <IIC_Delay>
1c003a08:	02800405 	addi.w	$r5,$r0,1(0x1)
1c003a0c:	02801004 	addi.w	$r4,$r0,4(0x4)
1c003a10:	57dbcfff 	bl	-9268(0xfffdbcc) # 1c0015dc <gpio_write_pin>
1c003a14:	57fdfbff 	bl	-520(0xffffdf8) # 1c00380c <IIC_Delay>
1c003a18:	50002800 	b	40(0x28) # 1c003a40 <IIC_Wait_Ack+0x60>
1c003a1c:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c003a20:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c003a24:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c003a28:	2a3fbecd 	ld.bu	$r13,$r22,-17(0xfef)
1c003a2c:	0283e80c 	addi.w	$r12,$r0,250(0xfa)
1c003a30:	6c00118d 	bgeu	$r12,$r13,16(0x10) # 1c003a40 <IIC_Wait_Ack+0x60>
1c003a34:	57ff4fff 	bl	-180(0xfffff4c) # 1c003980 <IIC_Stop>
1c003a38:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c003a3c:	50002400 	b	36(0x24) # 1c003a60 <IIC_Wait_Ack+0x80>
1c003a40:	02801404 	addi.w	$r4,$r0,5(0x5)
1c003a44:	57db4bff 	bl	-9400(0xfffdb48) # 1c00158c <gpio_get_pin>
1c003a48:	0015008c 	move	$r12,$r4
1c003a4c:	47ffd19f 	bnez	$r12,-48(0x7fffd0) # 1c003a1c <IIC_Wait_Ack+0x3c>
1c003a50:	00150005 	move	$r5,$r0
1c003a54:	02801004 	addi.w	$r4,$r0,4(0x4)
1c003a58:	57db87ff 	bl	-9340(0xfffdb84) # 1c0015dc <gpio_write_pin>
1c003a5c:	0015000c 	move	$r12,$r0
1c003a60:	00150184 	move	$r4,$r12
1c003a64:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c003a68:	28806076 	ld.w	$r22,$r3,24(0x18)
1c003a6c:	02808063 	addi.w	$r3,$r3,32(0x20)
1c003a70:	4c000020 	jirl	$r0,$r1,0

1c003a74 <IIC_Ack>:
IIC_Ack():
1c003a74:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c003a78:	29803061 	st.w	$r1,$r3,12(0xc)
1c003a7c:	29802076 	st.w	$r22,$r3,8(0x8)
1c003a80:	02804076 	addi.w	$r22,$r3,16(0x10)
1c003a84:	00150005 	move	$r5,$r0
1c003a88:	02801004 	addi.w	$r4,$r0,4(0x4)
1c003a8c:	57db53ff 	bl	-9392(0xfffdb50) # 1c0015dc <gpio_write_pin>
1c003a90:	57fe57ff 	bl	-428(0xffffe54) # 1c0038e4 <SDA_OUT>
1c003a94:	00150005 	move	$r5,$r0
1c003a98:	02801404 	addi.w	$r4,$r0,5(0x5)
1c003a9c:	57db43ff 	bl	-9408(0xfffdb40) # 1c0015dc <gpio_write_pin>
1c003aa0:	57fd6fff 	bl	-660(0xffffd6c) # 1c00380c <IIC_Delay>
1c003aa4:	02800405 	addi.w	$r5,$r0,1(0x1)
1c003aa8:	02801004 	addi.w	$r4,$r0,4(0x4)
1c003aac:	57db33ff 	bl	-9424(0xfffdb30) # 1c0015dc <gpio_write_pin>
1c003ab0:	57fd5fff 	bl	-676(0xffffd5c) # 1c00380c <IIC_Delay>
1c003ab4:	00150005 	move	$r5,$r0
1c003ab8:	02801004 	addi.w	$r4,$r0,4(0x4)
1c003abc:	57db23ff 	bl	-9440(0xfffdb20) # 1c0015dc <gpio_write_pin>
1c003ac0:	03400000 	andi	$r0,$r0,0x0
1c003ac4:	28803061 	ld.w	$r1,$r3,12(0xc)
1c003ac8:	28802076 	ld.w	$r22,$r3,8(0x8)
1c003acc:	02804063 	addi.w	$r3,$r3,16(0x10)
1c003ad0:	4c000020 	jirl	$r0,$r1,0

1c003ad4 <IIC_NAck>:
IIC_NAck():
1c003ad4:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c003ad8:	29803061 	st.w	$r1,$r3,12(0xc)
1c003adc:	29802076 	st.w	$r22,$r3,8(0x8)
1c003ae0:	02804076 	addi.w	$r22,$r3,16(0x10)
1c003ae4:	00150005 	move	$r5,$r0
1c003ae8:	02801004 	addi.w	$r4,$r0,4(0x4)
1c003aec:	57daf3ff 	bl	-9488(0xfffdaf0) # 1c0015dc <gpio_write_pin>
1c003af0:	57fdf7ff 	bl	-524(0xffffdf4) # 1c0038e4 <SDA_OUT>
1c003af4:	02800405 	addi.w	$r5,$r0,1(0x1)
1c003af8:	02801404 	addi.w	$r4,$r0,5(0x5)
1c003afc:	57dae3ff 	bl	-9504(0xfffdae0) # 1c0015dc <gpio_write_pin>
1c003b00:	57fd0fff 	bl	-756(0xffffd0c) # 1c00380c <IIC_Delay>
1c003b04:	02800405 	addi.w	$r5,$r0,1(0x1)
1c003b08:	02801004 	addi.w	$r4,$r0,4(0x4)
1c003b0c:	57dad3ff 	bl	-9520(0xfffdad0) # 1c0015dc <gpio_write_pin>
1c003b10:	57fcffff 	bl	-772(0xffffcfc) # 1c00380c <IIC_Delay>
1c003b14:	00150005 	move	$r5,$r0
1c003b18:	02801004 	addi.w	$r4,$r0,4(0x4)
1c003b1c:	57dac3ff 	bl	-9536(0xfffdac0) # 1c0015dc <gpio_write_pin>
1c003b20:	03400000 	andi	$r0,$r0,0x0
1c003b24:	28803061 	ld.w	$r1,$r3,12(0xc)
1c003b28:	28802076 	ld.w	$r22,$r3,8(0x8)
1c003b2c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c003b30:	4c000020 	jirl	$r0,$r1,0

1c003b34 <IIC_Send_Byte>:
IIC_Send_Byte():
1c003b34:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c003b38:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c003b3c:	2980a076 	st.w	$r22,$r3,40(0x28)
1c003b40:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c003b44:	0015008c 	move	$r12,$r4
1c003b48:	293f7ecc 	st.b	$r12,$r22,-33(0xfdf)
1c003b4c:	57fd9bff 	bl	-616(0xffffd98) # 1c0038e4 <SDA_OUT>
1c003b50:	00150005 	move	$r5,$r0
1c003b54:	02801004 	addi.w	$r4,$r0,4(0x4)
1c003b58:	57da87ff 	bl	-9596(0xfffda84) # 1c0015dc <gpio_write_pin>
1c003b5c:	293fbec0 	st.b	$r0,$r22,-17(0xfef)
1c003b60:	50006000 	b	96(0x60) # 1c003bc0 <IIC_Send_Byte+0x8c>
1c003b64:	283f7ecc 	ld.b	$r12,$r22,-33(0xfdf)
1c003b68:	64001580 	bge	$r12,$r0,20(0x14) # 1c003b7c <IIC_Send_Byte+0x48>
1c003b6c:	02800405 	addi.w	$r5,$r0,1(0x1)
1c003b70:	02801404 	addi.w	$r4,$r0,5(0x5)
1c003b74:	57da6bff 	bl	-9624(0xfffda68) # 1c0015dc <gpio_write_pin>
1c003b78:	50001000 	b	16(0x10) # 1c003b88 <IIC_Send_Byte+0x54>
1c003b7c:	00150005 	move	$r5,$r0
1c003b80:	02801404 	addi.w	$r4,$r0,5(0x5)
1c003b84:	57da5bff 	bl	-9640(0xfffda58) # 1c0015dc <gpio_write_pin>
1c003b88:	2a3f7ecc 	ld.bu	$r12,$r22,-33(0xfdf)
1c003b8c:	0040858c 	slli.w	$r12,$r12,0x1
1c003b90:	293f7ecc 	st.b	$r12,$r22,-33(0xfdf)
1c003b94:	02800405 	addi.w	$r5,$r0,1(0x1)
1c003b98:	02801004 	addi.w	$r4,$r0,4(0x4)
1c003b9c:	57da43ff 	bl	-9664(0xfffda40) # 1c0015dc <gpio_write_pin>
1c003ba0:	57fc6fff 	bl	-916(0xffffc6c) # 1c00380c <IIC_Delay>
1c003ba4:	00150005 	move	$r5,$r0
1c003ba8:	02801004 	addi.w	$r4,$r0,4(0x4)
1c003bac:	57da33ff 	bl	-9680(0xfffda30) # 1c0015dc <gpio_write_pin>
1c003bb0:	57fc5fff 	bl	-932(0xffffc5c) # 1c00380c <IIC_Delay>
1c003bb4:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c003bb8:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c003bbc:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c003bc0:	2a3fbecd 	ld.bu	$r13,$r22,-17(0xfef)
1c003bc4:	02801c0c 	addi.w	$r12,$r0,7(0x7)
1c003bc8:	6fff9d8d 	bgeu	$r12,$r13,-100(0x3ff9c) # 1c003b64 <IIC_Send_Byte+0x30>
1c003bcc:	03400000 	andi	$r0,$r0,0x0
1c003bd0:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c003bd4:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c003bd8:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c003bdc:	4c000020 	jirl	$r0,$r1,0

1c003be0 <IIC_Read_Byte>:
IIC_Read_Byte():
1c003be0:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c003be4:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c003be8:	2980a076 	st.w	$r22,$r3,40(0x28)
1c003bec:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c003bf0:	0015008c 	move	$r12,$r4
1c003bf4:	293f7ecc 	st.b	$r12,$r22,-33(0xfdf)
1c003bf8:	293fbac0 	st.b	$r0,$r22,-18(0xfee)
1c003bfc:	57fcbbff 	bl	-840(0xffffcb8) # 1c0038b4 <SDA_IN>
1c003c00:	293fbec0 	st.b	$r0,$r22,-17(0xfef)
1c003c04:	50005800 	b	88(0x58) # 1c003c5c <IIC_Read_Byte+0x7c>
1c003c08:	00150005 	move	$r5,$r0
1c003c0c:	02801004 	addi.w	$r4,$r0,4(0x4)
1c003c10:	57d9cfff 	bl	-9780(0xfffd9cc) # 1c0015dc <gpio_write_pin>
1c003c14:	57fbfbff 	bl	-1032(0xffffbf8) # 1c00380c <IIC_Delay>
1c003c18:	02800405 	addi.w	$r5,$r0,1(0x1)
1c003c1c:	02801004 	addi.w	$r4,$r0,4(0x4)
1c003c20:	57d9bfff 	bl	-9796(0xfffd9bc) # 1c0015dc <gpio_write_pin>
1c003c24:	2a3fbacc 	ld.bu	$r12,$r22,-18(0xfee)
1c003c28:	0040858c 	slli.w	$r12,$r12,0x1
1c003c2c:	293fbacc 	st.b	$r12,$r22,-18(0xfee)
1c003c30:	02801404 	addi.w	$r4,$r0,5(0x5)
1c003c34:	57d95bff 	bl	-9896(0xfffd958) # 1c00158c <gpio_get_pin>
1c003c38:	0015008c 	move	$r12,$r4
1c003c3c:	40001180 	beqz	$r12,16(0x10) # 1c003c4c <IIC_Read_Byte+0x6c>
1c003c40:	2a3fbacc 	ld.bu	$r12,$r22,-18(0xfee)
1c003c44:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c003c48:	293fbacc 	st.b	$r12,$r22,-18(0xfee)
1c003c4c:	57fbc3ff 	bl	-1088(0xffffbc0) # 1c00380c <IIC_Delay>
1c003c50:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c003c54:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c003c58:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c003c5c:	2a3fbecd 	ld.bu	$r13,$r22,-17(0xfef)
1c003c60:	02801c0c 	addi.w	$r12,$r0,7(0x7)
1c003c64:	6fffa58d 	bgeu	$r12,$r13,-92(0x3ffa4) # 1c003c08 <IIC_Read_Byte+0x28>
1c003c68:	2a3f7ecc 	ld.bu	$r12,$r22,-33(0xfdf)
1c003c6c:	44000d80 	bnez	$r12,12(0xc) # 1c003c78 <IIC_Read_Byte+0x98>
1c003c70:	57fe67ff 	bl	-412(0xffffe64) # 1c003ad4 <IIC_NAck>
1c003c74:	50000800 	b	8(0x8) # 1c003c7c <IIC_Read_Byte+0x9c>
1c003c78:	57fdffff 	bl	-516(0xffffdfc) # 1c003a74 <IIC_Ack>
1c003c7c:	2a3fbacc 	ld.bu	$r12,$r22,-18(0xfee)
1c003c80:	00150184 	move	$r4,$r12
1c003c84:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c003c88:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c003c8c:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c003c90:	4c000020 	jirl	$r0,$r1,0

1c003c94 <TOUCH_GetBaseVal>:
TOUCH_GetBaseVal():
1c003c94:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c003c98:	29807076 	st.w	$r22,$r3,28(0x1c)
1c003c9c:	02808076 	addi.w	$r22,$r3,32(0x20)
1c003ca0:	0015008c 	move	$r12,$r4
1c003ca4:	297fbacc 	st.h	$r12,$r22,-18(0xfee)
1c003ca8:	2a7fbacc 	ld.hu	$r12,$r22,-18(0xfee)
1c003cac:	0040898c 	slli.w	$r12,$r12,0x2
1c003cb0:	0015018d 	move	$r13,$r12
1c003cb4:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c003cb8:	0381018c 	ori	$r12,$r12,0x40
1c003cbc:	001031ac 	add.w	$r12,$r13,$r12
1c003cc0:	2880018c 	ld.w	$r12,$r12,0
1c003cc4:	006f818c 	bstrpick.w	$r12,$r12,0xf,0x0
1c003cc8:	037ffd8c 	andi	$r12,$r12,0xfff
1c003ccc:	006f818c 	bstrpick.w	$r12,$r12,0xf,0x0
1c003cd0:	00150184 	move	$r4,$r12
1c003cd4:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c003cd8:	02808063 	addi.w	$r3,$r3,32(0x20)
1c003cdc:	4c000020 	jirl	$r0,$r1,0

1c003ce0 <TOUCH_GetCountValue>:
TOUCH_GetCountValue():
1c003ce0:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c003ce4:	29807076 	st.w	$r22,$r3,28(0x1c)
1c003ce8:	02808076 	addi.w	$r22,$r3,32(0x20)
1c003cec:	0015008c 	move	$r12,$r4
1c003cf0:	297fbacc 	st.h	$r12,$r22,-18(0xfee)
1c003cf4:	2a7fbacc 	ld.hu	$r12,$r22,-18(0xfee)
1c003cf8:	0040898c 	slli.w	$r12,$r12,0x2
1c003cfc:	0015018d 	move	$r13,$r12
1c003d00:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c003d04:	0382018c 	ori	$r12,$r12,0x80
1c003d08:	001031ac 	add.w	$r12,$r13,$r12
1c003d0c:	2880018c 	ld.w	$r12,$r12,0
1c003d10:	006f818c 	bstrpick.w	$r12,$r12,0xf,0x0
1c003d14:	037ffd8c 	andi	$r12,$r12,0xfff
1c003d18:	006f818c 	bstrpick.w	$r12,$r12,0xf,0x0
1c003d1c:	00150184 	move	$r4,$r12
1c003d20:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c003d24:	02808063 	addi.w	$r3,$r3,32(0x20)
1c003d28:	4c000020 	jirl	$r0,$r1,0

1c003d2c <Printf_KeyChannel>:
Printf_KeyChannel():
1c003d2c:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c003d30:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c003d34:	2980a076 	st.w	$r22,$r3,40(0x28)
1c003d38:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c003d3c:	0015008c 	move	$r12,$r4
1c003d40:	297f7acc 	st.h	$r12,$r22,-34(0xfde)
1c003d44:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c003d48:	50003400 	b	52(0x34) # 1c003d7c <Printf_KeyChannel+0x50>
1c003d4c:	2a7f7acd 	ld.hu	$r13,$r22,-34(0xfde)
1c003d50:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003d54:	001831ac 	sra.w	$r12,$r13,$r12
1c003d58:	0340058c 	andi	$r12,$r12,0x1
1c003d5c:	40001580 	beqz	$r12,20(0x14) # 1c003d70 <Printf_KeyChannel+0x44>
1c003d60:	28bfb2c5 	ld.w	$r5,$r22,-20(0xfec)
1c003d64:	1c000044 	pcaddu12i	$r4,2(0x2)
1c003d68:	0283e084 	addi.w	$r4,$r4,248(0xf8)
1c003d6c:	57e0afff 	bl	-8020(0xfffe0ac) # 1c001e18 <myprintf>
1c003d70:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003d74:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c003d78:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003d7c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c003d80:	02802c0c 	addi.w	$r12,$r0,11(0xb)
1c003d84:	6fffc98d 	bgeu	$r12,$r13,-56(0x3ffc8) # 1c003d4c <Printf_KeyChannel+0x20>
1c003d88:	1c000044 	pcaddu12i	$r4,2(0x2)
1c003d8c:	02836084 	addi.w	$r4,$r4,216(0xd8)
1c003d90:	57e08bff 	bl	-8056(0xfffe088) # 1c001e18 <myprintf>
1c003d94:	03400000 	andi	$r0,$r0,0x0
1c003d98:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c003d9c:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c003da0:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c003da4:	4c000020 	jirl	$r0,$r1,0

1c003da8 <Printf_KeyType>:
Printf_KeyType():
1c003da8:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c003dac:	29807061 	st.w	$r1,$r3,28(0x1c)
1c003db0:	29806076 	st.w	$r22,$r3,24(0x18)
1c003db4:	02808076 	addi.w	$r22,$r3,32(0x20)
1c003db8:	0015008c 	move	$r12,$r4
1c003dbc:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c003dc0:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c003dc4:	0340058c 	andi	$r12,$r12,0x1
1c003dc8:	40001180 	beqz	$r12,16(0x10) # 1c003dd8 <Printf_KeyType+0x30>
1c003dcc:	1c000044 	pcaddu12i	$r4,2(0x2)
1c003dd0:	02826084 	addi.w	$r4,$r4,152(0x98)
1c003dd4:	57e047ff 	bl	-8124(0xfffe044) # 1c001e18 <myprintf>
1c003dd8:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c003ddc:	0340098c 	andi	$r12,$r12,0x2
1c003de0:	40001180 	beqz	$r12,16(0x10) # 1c003df0 <Printf_KeyType+0x48>
1c003de4:	1c000044 	pcaddu12i	$r4,2(0x2)
1c003de8:	02822084 	addi.w	$r4,$r4,136(0x88)
1c003dec:	57e02fff 	bl	-8148(0xfffe02c) # 1c001e18 <myprintf>
1c003df0:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c003df4:	0340118c 	andi	$r12,$r12,0x4
1c003df8:	40001180 	beqz	$r12,16(0x10) # 1c003e08 <Printf_KeyType+0x60>
1c003dfc:	1c000044 	pcaddu12i	$r4,2(0x2)
1c003e00:	0281e084 	addi.w	$r4,$r4,120(0x78)
1c003e04:	57e017ff 	bl	-8172(0xfffe014) # 1c001e18 <myprintf>
1c003e08:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c003e0c:	0340218c 	andi	$r12,$r12,0x8
1c003e10:	40001180 	beqz	$r12,16(0x10) # 1c003e20 <Printf_KeyType+0x78>
1c003e14:	1c000044 	pcaddu12i	$r4,2(0x2)
1c003e18:	0281b084 	addi.w	$r4,$r4,108(0x6c)
1c003e1c:	57dfffff 	bl	-8196(0xfffdffc) # 1c001e18 <myprintf>
1c003e20:	03400000 	andi	$r0,$r0,0x0
1c003e24:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c003e28:	28806076 	ld.w	$r22,$r3,24(0x18)
1c003e2c:	02808063 	addi.w	$r3,$r3,32(0x20)
1c003e30:	4c000020 	jirl	$r0,$r1,0

1c003e34 <Printf_KeyVal>:
Printf_KeyVal():
1c003e34:	02bd4063 	addi.w	$r3,$r3,-176(0xf50)
1c003e38:	2982b061 	st.w	$r1,$r3,172(0xac)
1c003e3c:	2982a076 	st.w	$r22,$r3,168(0xa8)
1c003e40:	0282c076 	addi.w	$r22,$r3,176(0xb0)
1c003e44:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c003e48:	5000d800 	b	216(0xd8) # 1c003f20 <Printf_KeyVal+0xec>
1c003e4c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003e50:	006f818c 	bstrpick.w	$r12,$r12,0xf,0x0
1c003e54:	00150184 	move	$r4,$r12
1c003e58:	57fe8bff 	bl	-376(0xffffe88) # 1c003ce0 <TOUCH_GetCountValue>
1c003e5c:	0015008c 	move	$r12,$r4
1c003e60:	0015018d 	move	$r13,$r12
1c003e64:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003e68:	0040898c 	slli.w	$r12,$r12,0x2
1c003e6c:	02bfc2ce 	addi.w	$r14,$r22,-16(0xff0)
1c003e70:	001031cc 	add.w	$r12,$r14,$r12
1c003e74:	29bdb18d 	st.w	$r13,$r12,-148(0xf6c)
1c003e78:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003e7c:	006f818c 	bstrpick.w	$r12,$r12,0xf,0x0
1c003e80:	00150184 	move	$r4,$r12
1c003e84:	57fe13ff 	bl	-496(0xffffe10) # 1c003c94 <TOUCH_GetBaseVal>
1c003e88:	0015008c 	move	$r12,$r4
1c003e8c:	0015018d 	move	$r13,$r12
1c003e90:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003e94:	0040898c 	slli.w	$r12,$r12,0x2
1c003e98:	02bfc2ce 	addi.w	$r14,$r22,-16(0xff0)
1c003e9c:	001031cc 	add.w	$r12,$r14,$r12
1c003ea0:	29be718d 	st.w	$r13,$r12,-100(0xf9c)
1c003ea4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003ea8:	0040898c 	slli.w	$r12,$r12,0x2
1c003eac:	02bfc2cd 	addi.w	$r13,$r22,-16(0xff0)
1c003eb0:	001031ac 	add.w	$r12,$r13,$r12
1c003eb4:	28be718c 	ld.w	$r12,$r12,-100(0xf9c)
1c003eb8:	40004980 	beqz	$r12,72(0x48) # 1c003f00 <Printf_KeyVal+0xcc>
1c003ebc:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003ec0:	0040898c 	slli.w	$r12,$r12,0x2
1c003ec4:	02bfc2cd 	addi.w	$r13,$r22,-16(0xff0)
1c003ec8:	001031ac 	add.w	$r12,$r13,$r12
1c003ecc:	28be718d 	ld.w	$r13,$r12,-100(0xf9c)
1c003ed0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003ed4:	0040898c 	slli.w	$r12,$r12,0x2
1c003ed8:	02bfc2ce 	addi.w	$r14,$r22,-16(0xff0)
1c003edc:	001031cc 	add.w	$r12,$r14,$r12
1c003ee0:	28bdb18c 	ld.w	$r12,$r12,-148(0xf6c)
1c003ee4:	001131ad 	sub.w	$r13,$r13,$r12
1c003ee8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003eec:	0040898c 	slli.w	$r12,$r12,0x2
1c003ef0:	02bfc2ce 	addi.w	$r14,$r22,-16(0xff0)
1c003ef4:	001031cc 	add.w	$r12,$r14,$r12
1c003ef8:	29bf318d 	st.w	$r13,$r12,-52(0xfcc)
1c003efc:	50001800 	b	24(0x18) # 1c003f14 <Printf_KeyVal+0xe0>
1c003f00:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003f04:	0040898c 	slli.w	$r12,$r12,0x2
1c003f08:	02bfc2cd 	addi.w	$r13,$r22,-16(0xff0)
1c003f0c:	001031ac 	add.w	$r12,$r13,$r12
1c003f10:	29bf3180 	st.w	$r0,$r12,-52(0xfcc)
1c003f14:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003f18:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c003f1c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003f20:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c003f24:	02802c0c 	addi.w	$r12,$r0,11(0xb)
1c003f28:	67ff258d 	bge	$r12,$r13,-220(0x3ff24) # 1c003e4c <Printf_KeyVal+0x18>
1c003f2c:	1c000044 	pcaddu12i	$r4,2(0x2)
1c003f30:	02bd8084 	addi.w	$r4,$r4,-160(0xf60)
1c003f34:	57dee7ff 	bl	-8476(0xfffdee4) # 1c001e18 <myprintf>
1c003f38:	1c000044 	pcaddu12i	$r4,2(0x2)
1c003f3c:	02bdf084 	addi.w	$r4,$r4,-132(0xf7c)
1c003f40:	57dedbff 	bl	-8488(0xfffded8) # 1c001e18 <myprintf>
1c003f44:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c003f48:	50003400 	b	52(0x34) # 1c003f7c <Printf_KeyVal+0x148>
1c003f4c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003f50:	0040898c 	slli.w	$r12,$r12,0x2
1c003f54:	02bfc2cd 	addi.w	$r13,$r22,-16(0xff0)
1c003f58:	001031ac 	add.w	$r12,$r13,$r12
1c003f5c:	28bdb18c 	ld.w	$r12,$r12,-148(0xf6c)
1c003f60:	00150185 	move	$r5,$r12
1c003f64:	1c000044 	pcaddu12i	$r4,2(0x2)
1c003f68:	02bd6084 	addi.w	$r4,$r4,-168(0xf58)
1c003f6c:	57deafff 	bl	-8532(0xfffdeac) # 1c001e18 <myprintf>
1c003f70:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003f74:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c003f78:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003f7c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c003f80:	02802c0c 	addi.w	$r12,$r0,11(0xb)
1c003f84:	67ffc98d 	bge	$r12,$r13,-56(0x3ffc8) # 1c003f4c <Printf_KeyVal+0x118>
1c003f88:	1c000044 	pcaddu12i	$r4,2(0x2)
1c003f8c:	02bcf084 	addi.w	$r4,$r4,-196(0xf3c)
1c003f90:	57de8bff 	bl	-8568(0xfffde88) # 1c001e18 <myprintf>
1c003f94:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c003f98:	50003400 	b	52(0x34) # 1c003fcc <Printf_KeyVal+0x198>
1c003f9c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003fa0:	0040898c 	slli.w	$r12,$r12,0x2
1c003fa4:	02bfc2cd 	addi.w	$r13,$r22,-16(0xff0)
1c003fa8:	001031ac 	add.w	$r12,$r13,$r12
1c003fac:	28be718c 	ld.w	$r12,$r12,-100(0xf9c)
1c003fb0:	00150185 	move	$r5,$r12
1c003fb4:	1c000044 	pcaddu12i	$r4,2(0x2)
1c003fb8:	02bc2084 	addi.w	$r4,$r4,-248(0xf08)
1c003fbc:	57de5fff 	bl	-8612(0xfffde5c) # 1c001e18 <myprintf>
1c003fc0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003fc4:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c003fc8:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003fcc:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c003fd0:	02802c0c 	addi.w	$r12,$r0,11(0xb)
1c003fd4:	67ffc98d 	bge	$r12,$r13,-56(0x3ffc8) # 1c003f9c <Printf_KeyVal+0x168>
1c003fd8:	1c000044 	pcaddu12i	$r4,2(0x2)
1c003fdc:	02bbe084 	addi.w	$r4,$r4,-264(0xef8)
1c003fe0:	57de3bff 	bl	-8648(0xfffde38) # 1c001e18 <myprintf>
1c003fe4:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c003fe8:	50007400 	b	116(0x74) # 1c00405c <Printf_KeyVal+0x228>
1c003fec:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003ff0:	0040898c 	slli.w	$r12,$r12,0x2
1c003ff4:	02bfc2cd 	addi.w	$r13,$r22,-16(0xff0)
1c003ff8:	001031ac 	add.w	$r12,$r13,$r12
1c003ffc:	28bf318c 	ld.w	$r12,$r12,-52(0xfcc)
1c004000:	64002d80 	bge	$r12,$r0,44(0x2c) # 1c00402c <Printf_KeyVal+0x1f8>
1c004004:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004008:	0040898c 	slli.w	$r12,$r12,0x2
1c00400c:	02bfc2cd 	addi.w	$r13,$r22,-16(0xff0)
1c004010:	001031ac 	add.w	$r12,$r13,$r12
1c004014:	28bf318c 	ld.w	$r12,$r12,-52(0xfcc)
1c004018:	00150185 	move	$r5,$r12
1c00401c:	1c000044 	pcaddu12i	$r4,2(0x2)
1c004020:	02bb0084 	addi.w	$r4,$r4,-320(0xec0)
1c004024:	57ddf7ff 	bl	-8716(0xfffddf4) # 1c001e18 <myprintf>
1c004028:	50002800 	b	40(0x28) # 1c004050 <Printf_KeyVal+0x21c>
1c00402c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004030:	0040898c 	slli.w	$r12,$r12,0x2
1c004034:	02bfc2cd 	addi.w	$r13,$r22,-16(0xff0)
1c004038:	001031ac 	add.w	$r12,$r13,$r12
1c00403c:	28bf318c 	ld.w	$r12,$r12,-52(0xfcc)
1c004040:	00150185 	move	$r5,$r12
1c004044:	1c000044 	pcaddu12i	$r4,2(0x2)
1c004048:	02ba8084 	addi.w	$r4,$r4,-352(0xea0)
1c00404c:	57ddcfff 	bl	-8756(0xfffddcc) # 1c001e18 <myprintf>
1c004050:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004054:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c004058:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c00405c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c004060:	02802c0c 	addi.w	$r12,$r0,11(0xb)
1c004064:	67ff898d 	bge	$r12,$r13,-120(0x3ff88) # 1c003fec <Printf_KeyVal+0x1b8>
1c004068:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00406c:	02b7e084 	addi.w	$r4,$r4,-520(0xdf8)
1c004070:	57ddabff 	bl	-8792(0xfffdda8) # 1c001e18 <myprintf>
1c004074:	03400000 	andi	$r0,$r0,0x0
1c004078:	2882b061 	ld.w	$r1,$r3,172(0xac)
1c00407c:	2882a076 	ld.w	$r22,$r3,168(0xa8)
1c004080:	0282c063 	addi.w	$r3,$r3,176(0xb0)
1c004084:	4c000020 	jirl	$r0,$r1,0

1c004088 <TIM_GetITStatus>:
TIM_GetITStatus():
1c004088:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c00408c:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c004090:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c004094:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c004098:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c00409c:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c0040a0:	2880018d 	ld.w	$r13,$r12,0
1c0040a4:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0040a8:	0014b1ac 	and	$r12,$r13,$r12
1c0040ac:	40001180 	beqz	$r12,16(0x10) # 1c0040bc <TIM_GetITStatus+0x34>
1c0040b0:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0040b4:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0040b8:	50000800 	b	8(0x8) # 1c0040c0 <TIM_GetITStatus+0x38>
1c0040bc:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c0040c0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0040c4:	00150184 	move	$r4,$r12
1c0040c8:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c0040cc:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c0040d0:	4c000020 	jirl	$r0,$r1,0

1c0040d4 <TIM_ClearIT>:
TIM_ClearIT():
1c0040d4:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0040d8:	29807076 	st.w	$r22,$r3,28(0x1c)
1c0040dc:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0040e0:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c0040e4:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c0040e8:	2880018e 	ld.w	$r14,$r12,0
1c0040ec:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c0040f0:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0040f4:	001535cd 	or	$r13,$r14,$r13
1c0040f8:	2980018d 	st.w	$r13,$r12,0
1c0040fc:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c004100:	03800d8c 	ori	$r12,$r12,0x3
1c004104:	2a00018c 	ld.bu	$r12,$r12,0
1c004108:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c00410c:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c004110:	03800d8c 	ori	$r12,$r12,0x3
1c004114:	038005ad 	ori	$r13,$r13,0x1
1c004118:	006781ad 	bstrpick.w	$r13,$r13,0x7,0x0
1c00411c:	2900018d 	st.b	$r13,$r12,0
1c004120:	03400000 	andi	$r0,$r0,0x0
1c004124:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c004128:	02808063 	addi.w	$r3,$r3,32(0x20)
1c00412c:	4c000020 	jirl	$r0,$r1,0

1c004130 <exti_gpioa0_irq_handler>:
exti_gpioa0_irq_handler():
1c004130:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c004134:	29803061 	st.w	$r1,$r3,12(0xc)
1c004138:	29802076 	st.w	$r22,$r3,8(0x8)
1c00413c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c004140:	1c000046 	pcaddu12i	$r6,2(0x2)
1c004144:	02bd20c6 	addi.w	$r6,$r6,-184(0xf48)
1c004148:	02804805 	addi.w	$r5,$r0,18(0x12)
1c00414c:	1c000044 	pcaddu12i	$r4,2(0x2)
1c004150:	02b68084 	addi.w	$r4,$r4,-608(0xda0)
1c004154:	57dcc7ff 	bl	-9020(0xfffdcc4) # 1c001e18 <myprintf>
1c004158:	02800405 	addi.w	$r5,$r0,1(0x1)
1c00415c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004160:	03808184 	ori	$r4,$r12,0x20
1c004164:	57f4ffff 	bl	-2820(0xffff4fc) # 1c003660 <EXTI_ClearITPendingBit>
1c004168:	03400000 	andi	$r0,$r0,0x0
1c00416c:	28803061 	ld.w	$r1,$r3,12(0xc)
1c004170:	28802076 	ld.w	$r22,$r3,8(0x8)
1c004174:	02804063 	addi.w	$r3,$r3,16(0x10)
1c004178:	4c000020 	jirl	$r0,$r1,0

1c00417c <exti_gpioa1_irq_handler>:
exti_gpioa1_irq_handler():
1c00417c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c004180:	29803061 	st.w	$r1,$r3,12(0xc)
1c004184:	29802076 	st.w	$r22,$r3,8(0x8)
1c004188:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00418c:	1c000046 	pcaddu12i	$r6,2(0x2)
1c004190:	02bc50c6 	addi.w	$r6,$r6,-236(0xf14)
1c004194:	02805c05 	addi.w	$r5,$r0,23(0x17)
1c004198:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00419c:	02b55084 	addi.w	$r4,$r4,-684(0xd54)
1c0041a0:	57dc7bff 	bl	-9096(0xfffdc78) # 1c001e18 <myprintf>
1c0041a4:	02800805 	addi.w	$r5,$r0,2(0x2)
1c0041a8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0041ac:	03808184 	ori	$r4,$r12,0x20
1c0041b0:	57f4b3ff 	bl	-2896(0xffff4b0) # 1c003660 <EXTI_ClearITPendingBit>
1c0041b4:	03400000 	andi	$r0,$r0,0x0
1c0041b8:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0041bc:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0041c0:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0041c4:	4c000020 	jirl	$r0,$r1,0

1c0041c8 <exti_gpioa2_irq_handler>:
exti_gpioa2_irq_handler():
1c0041c8:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0041cc:	29803061 	st.w	$r1,$r3,12(0xc)
1c0041d0:	29802076 	st.w	$r22,$r3,8(0x8)
1c0041d4:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0041d8:	1c000046 	pcaddu12i	$r6,2(0x2)
1c0041dc:	02bb80c6 	addi.w	$r6,$r6,-288(0xee0)
1c0041e0:	02807005 	addi.w	$r5,$r0,28(0x1c)
1c0041e4:	1c000044 	pcaddu12i	$r4,2(0x2)
1c0041e8:	02b42084 	addi.w	$r4,$r4,-760(0xd08)
1c0041ec:	57dc2fff 	bl	-9172(0xfffdc2c) # 1c001e18 <myprintf>
1c0041f0:	02801005 	addi.w	$r5,$r0,4(0x4)
1c0041f4:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0041f8:	03808184 	ori	$r4,$r12,0x20
1c0041fc:	57f467ff 	bl	-2972(0xffff464) # 1c003660 <EXTI_ClearITPendingBit>
1c004200:	03400000 	andi	$r0,$r0,0x0
1c004204:	28803061 	ld.w	$r1,$r3,12(0xc)
1c004208:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00420c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c004210:	4c000020 	jirl	$r0,$r1,0

1c004214 <exti_gpioa3_irq_handler>:
exti_gpioa3_irq_handler():
1c004214:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c004218:	29803061 	st.w	$r1,$r3,12(0xc)
1c00421c:	29802076 	st.w	$r22,$r3,8(0x8)
1c004220:	02804076 	addi.w	$r22,$r3,16(0x10)
1c004224:	1c000046 	pcaddu12i	$r6,2(0x2)
1c004228:	02bab0c6 	addi.w	$r6,$r6,-340(0xeac)
1c00422c:	02808405 	addi.w	$r5,$r0,33(0x21)
1c004230:	1c000044 	pcaddu12i	$r4,2(0x2)
1c004234:	02b2f084 	addi.w	$r4,$r4,-836(0xcbc)
1c004238:	57dbe3ff 	bl	-9248(0xfffdbe0) # 1c001e18 <myprintf>
1c00423c:	02802005 	addi.w	$r5,$r0,8(0x8)
1c004240:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004244:	03808184 	ori	$r4,$r12,0x20
1c004248:	57f41bff 	bl	-3048(0xffff418) # 1c003660 <EXTI_ClearITPendingBit>
1c00424c:	03400000 	andi	$r0,$r0,0x0
1c004250:	28803061 	ld.w	$r1,$r3,12(0xc)
1c004254:	28802076 	ld.w	$r22,$r3,8(0x8)
1c004258:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00425c:	4c000020 	jirl	$r0,$r1,0

1c004260 <exti_gpioa4_irq_handler>:
exti_gpioa4_irq_handler():
1c004260:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c004264:	29803061 	st.w	$r1,$r3,12(0xc)
1c004268:	29802076 	st.w	$r22,$r3,8(0x8)
1c00426c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c004270:	1c000046 	pcaddu12i	$r6,2(0x2)
1c004274:	02b9e0c6 	addi.w	$r6,$r6,-392(0xe78)
1c004278:	02809805 	addi.w	$r5,$r0,38(0x26)
1c00427c:	1c000044 	pcaddu12i	$r4,2(0x2)
1c004280:	02b1c084 	addi.w	$r4,$r4,-912(0xc70)
1c004284:	57db97ff 	bl	-9324(0xfffdb94) # 1c001e18 <myprintf>
1c004288:	02804005 	addi.w	$r5,$r0,16(0x10)
1c00428c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004290:	03808184 	ori	$r4,$r12,0x20
1c004294:	57f3cfff 	bl	-3124(0xffff3cc) # 1c003660 <EXTI_ClearITPendingBit>
1c004298:	03400000 	andi	$r0,$r0,0x0
1c00429c:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0042a0:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0042a4:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0042a8:	4c000020 	jirl	$r0,$r1,0

1c0042ac <exti_gpioa5_irq_handler>:
exti_gpioa5_irq_handler():
1c0042ac:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0042b0:	29803061 	st.w	$r1,$r3,12(0xc)
1c0042b4:	29802076 	st.w	$r22,$r3,8(0x8)
1c0042b8:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0042bc:	1c000046 	pcaddu12i	$r6,2(0x2)
1c0042c0:	02b910c6 	addi.w	$r6,$r6,-444(0xe44)
1c0042c4:	0280ac05 	addi.w	$r5,$r0,43(0x2b)
1c0042c8:	1c000044 	pcaddu12i	$r4,2(0x2)
1c0042cc:	02b09084 	addi.w	$r4,$r4,-988(0xc24)
1c0042d0:	57db4bff 	bl	-9400(0xfffdb48) # 1c001e18 <myprintf>
1c0042d4:	02808005 	addi.w	$r5,$r0,32(0x20)
1c0042d8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0042dc:	03808184 	ori	$r4,$r12,0x20
1c0042e0:	57f383ff 	bl	-3200(0xffff380) # 1c003660 <EXTI_ClearITPendingBit>
1c0042e4:	03400000 	andi	$r0,$r0,0x0
1c0042e8:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0042ec:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0042f0:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0042f4:	4c000020 	jirl	$r0,$r1,0

1c0042f8 <exti_gpioa6_irq_handler>:
exti_gpioa6_irq_handler():
1c0042f8:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0042fc:	29803061 	st.w	$r1,$r3,12(0xc)
1c004300:	29802076 	st.w	$r22,$r3,8(0x8)
1c004304:	02804076 	addi.w	$r22,$r3,16(0x10)
1c004308:	1c000046 	pcaddu12i	$r6,2(0x2)
1c00430c:	02b840c6 	addi.w	$r6,$r6,-496(0xe10)
1c004310:	0280c005 	addi.w	$r5,$r0,48(0x30)
1c004314:	1c000044 	pcaddu12i	$r4,2(0x2)
1c004318:	02af6084 	addi.w	$r4,$r4,-1064(0xbd8)
1c00431c:	57daffff 	bl	-9476(0xfffdafc) # 1c001e18 <myprintf>
1c004320:	02810005 	addi.w	$r5,$r0,64(0x40)
1c004324:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004328:	03808184 	ori	$r4,$r12,0x20
1c00432c:	57f337ff 	bl	-3276(0xffff334) # 1c003660 <EXTI_ClearITPendingBit>
1c004330:	03400000 	andi	$r0,$r0,0x0
1c004334:	28803061 	ld.w	$r1,$r3,12(0xc)
1c004338:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00433c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c004340:	4c000020 	jirl	$r0,$r1,0

1c004344 <exti_gpioa7_irq_handler>:
exti_gpioa7_irq_handler():
1c004344:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c004348:	29803061 	st.w	$r1,$r3,12(0xc)
1c00434c:	29802076 	st.w	$r22,$r3,8(0x8)
1c004350:	02804076 	addi.w	$r22,$r3,16(0x10)
1c004354:	1c000046 	pcaddu12i	$r6,2(0x2)
1c004358:	02b770c6 	addi.w	$r6,$r6,-548(0xddc)
1c00435c:	0280d405 	addi.w	$r5,$r0,53(0x35)
1c004360:	1c000044 	pcaddu12i	$r4,2(0x2)
1c004364:	02ae3084 	addi.w	$r4,$r4,-1140(0xb8c)
1c004368:	57dab3ff 	bl	-9552(0xfffdab0) # 1c001e18 <myprintf>
1c00436c:	02820005 	addi.w	$r5,$r0,128(0x80)
1c004370:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004374:	03808184 	ori	$r4,$r12,0x20
1c004378:	57f2ebff 	bl	-3352(0xffff2e8) # 1c003660 <EXTI_ClearITPendingBit>
1c00437c:	03400000 	andi	$r0,$r0,0x0
1c004380:	28803061 	ld.w	$r1,$r3,12(0xc)
1c004384:	28802076 	ld.w	$r22,$r3,8(0x8)
1c004388:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00438c:	4c000020 	jirl	$r0,$r1,0

1c004390 <exti_gpiob0_irq_handler>:
exti_gpiob0_irq_handler():
1c004390:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c004394:	29803061 	st.w	$r1,$r3,12(0xc)
1c004398:	29802076 	st.w	$r22,$r3,8(0x8)
1c00439c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0043a0:	1c000046 	pcaddu12i	$r6,2(0x2)
1c0043a4:	02b6a0c6 	addi.w	$r6,$r6,-600(0xda8)
1c0043a8:	0280e805 	addi.w	$r5,$r0,58(0x3a)
1c0043ac:	1c000044 	pcaddu12i	$r4,2(0x2)
1c0043b0:	02ad0084 	addi.w	$r4,$r4,-1216(0xb40)
1c0043b4:	57da67ff 	bl	-9628(0xfffda64) # 1c001e18 <myprintf>
1c0043b8:	02840005 	addi.w	$r5,$r0,256(0x100)
1c0043bc:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0043c0:	03808184 	ori	$r4,$r12,0x20
1c0043c4:	57f29fff 	bl	-3428(0xffff29c) # 1c003660 <EXTI_ClearITPendingBit>
1c0043c8:	03400000 	andi	$r0,$r0,0x0
1c0043cc:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0043d0:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0043d4:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0043d8:	4c000020 	jirl	$r0,$r1,0

1c0043dc <exti_gpiob1_irq_handler>:
exti_gpiob1_irq_handler():
1c0043dc:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0043e0:	29803061 	st.w	$r1,$r3,12(0xc)
1c0043e4:	29802076 	st.w	$r22,$r3,8(0x8)
1c0043e8:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0043ec:	1c000046 	pcaddu12i	$r6,2(0x2)
1c0043f0:	02b5d0c6 	addi.w	$r6,$r6,-652(0xd74)
1c0043f4:	0280fc05 	addi.w	$r5,$r0,63(0x3f)
1c0043f8:	1c000044 	pcaddu12i	$r4,2(0x2)
1c0043fc:	02abd084 	addi.w	$r4,$r4,-1292(0xaf4)
1c004400:	57da1bff 	bl	-9704(0xfffda18) # 1c001e18 <myprintf>
1c004404:	02880005 	addi.w	$r5,$r0,512(0x200)
1c004408:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00440c:	03808184 	ori	$r4,$r12,0x20
1c004410:	57f253ff 	bl	-3504(0xffff250) # 1c003660 <EXTI_ClearITPendingBit>
1c004414:	03400000 	andi	$r0,$r0,0x0
1c004418:	28803061 	ld.w	$r1,$r3,12(0xc)
1c00441c:	28802076 	ld.w	$r22,$r3,8(0x8)
1c004420:	02804063 	addi.w	$r3,$r3,16(0x10)
1c004424:	4c000020 	jirl	$r0,$r1,0

1c004428 <exti_gpiob2_irq_handler>:
exti_gpiob2_irq_handler():
1c004428:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00442c:	29803061 	st.w	$r1,$r3,12(0xc)
1c004430:	29802076 	st.w	$r22,$r3,8(0x8)
1c004434:	02804076 	addi.w	$r22,$r3,16(0x10)
1c004438:	1c000046 	pcaddu12i	$r6,2(0x2)
1c00443c:	02b500c6 	addi.w	$r6,$r6,-704(0xd40)
1c004440:	02811005 	addi.w	$r5,$r0,68(0x44)
1c004444:	1c000044 	pcaddu12i	$r4,2(0x2)
1c004448:	02aaa084 	addi.w	$r4,$r4,-1368(0xaa8)
1c00444c:	57d9cfff 	bl	-9780(0xfffd9cc) # 1c001e18 <myprintf>
1c004450:	02900005 	addi.w	$r5,$r0,1024(0x400)
1c004454:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004458:	03808184 	ori	$r4,$r12,0x20
1c00445c:	57f207ff 	bl	-3580(0xffff204) # 1c003660 <EXTI_ClearITPendingBit>
1c004460:	03400000 	andi	$r0,$r0,0x0
1c004464:	28803061 	ld.w	$r1,$r3,12(0xc)
1c004468:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00446c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c004470:	4c000020 	jirl	$r0,$r1,0

1c004474 <exti_gpiob3_irq_handler>:
exti_gpiob3_irq_handler():
1c004474:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c004478:	29803061 	st.w	$r1,$r3,12(0xc)
1c00447c:	29802076 	st.w	$r22,$r3,8(0x8)
1c004480:	02804076 	addi.w	$r22,$r3,16(0x10)
1c004484:	1c000046 	pcaddu12i	$r6,2(0x2)
1c004488:	02b430c6 	addi.w	$r6,$r6,-756(0xd0c)
1c00448c:	02812405 	addi.w	$r5,$r0,73(0x49)
1c004490:	1c000044 	pcaddu12i	$r4,2(0x2)
1c004494:	02a97084 	addi.w	$r4,$r4,-1444(0xa5c)
1c004498:	57d983ff 	bl	-9856(0xfffd980) # 1c001e18 <myprintf>
1c00449c:	03a00005 	ori	$r5,$r0,0x800
1c0044a0:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0044a4:	03808184 	ori	$r4,$r12,0x20
1c0044a8:	57f1bbff 	bl	-3656(0xffff1b8) # 1c003660 <EXTI_ClearITPendingBit>
1c0044ac:	03400000 	andi	$r0,$r0,0x0
1c0044b0:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0044b4:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0044b8:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0044bc:	4c000020 	jirl	$r0,$r1,0

1c0044c0 <exti_gpiob4_irq_handler>:
exti_gpiob4_irq_handler():
1c0044c0:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0044c4:	29803061 	st.w	$r1,$r3,12(0xc)
1c0044c8:	29802076 	st.w	$r22,$r3,8(0x8)
1c0044cc:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0044d0:	1c000046 	pcaddu12i	$r6,2(0x2)
1c0044d4:	02b360c6 	addi.w	$r6,$r6,-808(0xcd8)
1c0044d8:	02813805 	addi.w	$r5,$r0,78(0x4e)
1c0044dc:	1c000044 	pcaddu12i	$r4,2(0x2)
1c0044e0:	02a84084 	addi.w	$r4,$r4,-1520(0xa10)
1c0044e4:	57d937ff 	bl	-9932(0xfffd934) # 1c001e18 <myprintf>
1c0044e8:	14000025 	lu12i.w	$r5,1(0x1)
1c0044ec:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0044f0:	03808184 	ori	$r4,$r12,0x20
1c0044f4:	57f16fff 	bl	-3732(0xffff16c) # 1c003660 <EXTI_ClearITPendingBit>
1c0044f8:	03400000 	andi	$r0,$r0,0x0
1c0044fc:	28803061 	ld.w	$r1,$r3,12(0xc)
1c004500:	28802076 	ld.w	$r22,$r3,8(0x8)
1c004504:	02804063 	addi.w	$r3,$r3,16(0x10)
1c004508:	4c000020 	jirl	$r0,$r1,0

1c00450c <exti_gpiob5_irq_handler>:
exti_gpiob5_irq_handler():
1c00450c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c004510:	29803061 	st.w	$r1,$r3,12(0xc)
1c004514:	29802076 	st.w	$r22,$r3,8(0x8)
1c004518:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00451c:	1c000046 	pcaddu12i	$r6,2(0x2)
1c004520:	02b290c6 	addi.w	$r6,$r6,-860(0xca4)
1c004524:	02814c05 	addi.w	$r5,$r0,83(0x53)
1c004528:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00452c:	02a71084 	addi.w	$r4,$r4,-1596(0x9c4)
1c004530:	57d8ebff 	bl	-10008(0xfffd8e8) # 1c001e18 <myprintf>
1c004534:	14000045 	lu12i.w	$r5,2(0x2)
1c004538:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00453c:	03808184 	ori	$r4,$r12,0x20
1c004540:	57f123ff 	bl	-3808(0xffff120) # 1c003660 <EXTI_ClearITPendingBit>
1c004544:	03400000 	andi	$r0,$r0,0x0
1c004548:	28803061 	ld.w	$r1,$r3,12(0xc)
1c00454c:	28802076 	ld.w	$r22,$r3,8(0x8)
1c004550:	02804063 	addi.w	$r3,$r3,16(0x10)
1c004554:	4c000020 	jirl	$r0,$r1,0

1c004558 <exti_gpiob6_irq_handler>:
exti_gpiob6_irq_handler():
1c004558:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00455c:	29803061 	st.w	$r1,$r3,12(0xc)
1c004560:	29802076 	st.w	$r22,$r3,8(0x8)
1c004564:	02804076 	addi.w	$r22,$r3,16(0x10)
1c004568:	1c000046 	pcaddu12i	$r6,2(0x2)
1c00456c:	02b1c0c6 	addi.w	$r6,$r6,-912(0xc70)
1c004570:	02816005 	addi.w	$r5,$r0,88(0x58)
1c004574:	1c000044 	pcaddu12i	$r4,2(0x2)
1c004578:	02a5e084 	addi.w	$r4,$r4,-1672(0x978)
1c00457c:	57d89fff 	bl	-10084(0xfffd89c) # 1c001e18 <myprintf>
1c004580:	14000085 	lu12i.w	$r5,4(0x4)
1c004584:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004588:	03808184 	ori	$r4,$r12,0x20
1c00458c:	57f0d7ff 	bl	-3884(0xffff0d4) # 1c003660 <EXTI_ClearITPendingBit>
1c004590:	03400000 	andi	$r0,$r0,0x0
1c004594:	28803061 	ld.w	$r1,$r3,12(0xc)
1c004598:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00459c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0045a0:	4c000020 	jirl	$r0,$r1,0

1c0045a4 <exti_gpiob7_irq_handler>:
exti_gpiob7_irq_handler():
1c0045a4:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0045a8:	29803061 	st.w	$r1,$r3,12(0xc)
1c0045ac:	29802076 	st.w	$r22,$r3,8(0x8)
1c0045b0:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0045b4:	1c000046 	pcaddu12i	$r6,2(0x2)
1c0045b8:	02b0f0c6 	addi.w	$r6,$r6,-964(0xc3c)
1c0045bc:	02817405 	addi.w	$r5,$r0,93(0x5d)
1c0045c0:	1c000044 	pcaddu12i	$r4,2(0x2)
1c0045c4:	02a4b084 	addi.w	$r4,$r4,-1748(0x92c)
1c0045c8:	57d853ff 	bl	-10160(0xfffd850) # 1c001e18 <myprintf>
1c0045cc:	14000105 	lu12i.w	$r5,8(0x8)
1c0045d0:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0045d4:	03808184 	ori	$r4,$r12,0x20
1c0045d8:	57f08bff 	bl	-3960(0xffff088) # 1c003660 <EXTI_ClearITPendingBit>
1c0045dc:	03400000 	andi	$r0,$r0,0x0
1c0045e0:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0045e4:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0045e8:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0045ec:	4c000020 	jirl	$r0,$r1,0

1c0045f0 <exti_gpioc0_irq_handler>:
exti_gpioc0_irq_handler():
1c0045f0:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0045f4:	29803061 	st.w	$r1,$r3,12(0xc)
1c0045f8:	29802076 	st.w	$r22,$r3,8(0x8)
1c0045fc:	02804076 	addi.w	$r22,$r3,16(0x10)
1c004600:	1c000046 	pcaddu12i	$r6,2(0x2)
1c004604:	02b020c6 	addi.w	$r6,$r6,-1016(0xc08)
1c004608:	02818c05 	addi.w	$r5,$r0,99(0x63)
1c00460c:	1c000044 	pcaddu12i	$r4,2(0x2)
1c004610:	02a38084 	addi.w	$r4,$r4,-1824(0x8e0)
1c004614:	57d807ff 	bl	-10236(0xfffd804) # 1c001e18 <myprintf>
1c004618:	14000205 	lu12i.w	$r5,16(0x10)
1c00461c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004620:	03808184 	ori	$r4,$r12,0x20
1c004624:	57f03fff 	bl	-4036(0xffff03c) # 1c003660 <EXTI_ClearITPendingBit>
1c004628:	03400000 	andi	$r0,$r0,0x0
1c00462c:	28803061 	ld.w	$r1,$r3,12(0xc)
1c004630:	28802076 	ld.w	$r22,$r3,8(0x8)
1c004634:	02804063 	addi.w	$r3,$r3,16(0x10)
1c004638:	4c000020 	jirl	$r0,$r1,0

1c00463c <exti_gpioc1_irq_handler>:
exti_gpioc1_irq_handler():
1c00463c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c004640:	29803061 	st.w	$r1,$r3,12(0xc)
1c004644:	29802076 	st.w	$r22,$r3,8(0x8)
1c004648:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00464c:	1c000046 	pcaddu12i	$r6,2(0x2)
1c004650:	02af50c6 	addi.w	$r6,$r6,-1068(0xbd4)
1c004654:	0281a005 	addi.w	$r5,$r0,104(0x68)
1c004658:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00465c:	02a25084 	addi.w	$r4,$r4,-1900(0x894)
1c004660:	57d7bbff 	bl	-10312(0xfffd7b8) # 1c001e18 <myprintf>
1c004664:	14000405 	lu12i.w	$r5,32(0x20)
1c004668:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00466c:	03808184 	ori	$r4,$r12,0x20
1c004670:	57eff3ff 	bl	-4112(0xfffeff0) # 1c003660 <EXTI_ClearITPendingBit>
1c004674:	03400000 	andi	$r0,$r0,0x0
1c004678:	28803061 	ld.w	$r1,$r3,12(0xc)
1c00467c:	28802076 	ld.w	$r22,$r3,8(0x8)
1c004680:	02804063 	addi.w	$r3,$r3,16(0x10)
1c004684:	4c000020 	jirl	$r0,$r1,0

1c004688 <exti_gpioc2_irq_handler>:
exti_gpioc2_irq_handler():
1c004688:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00468c:	29803061 	st.w	$r1,$r3,12(0xc)
1c004690:	29802076 	st.w	$r22,$r3,8(0x8)
1c004694:	02804076 	addi.w	$r22,$r3,16(0x10)
1c004698:	1c000046 	pcaddu12i	$r6,2(0x2)
1c00469c:	02ae80c6 	addi.w	$r6,$r6,-1120(0xba0)
1c0046a0:	0281b405 	addi.w	$r5,$r0,109(0x6d)
1c0046a4:	1c000044 	pcaddu12i	$r4,2(0x2)
1c0046a8:	02a12084 	addi.w	$r4,$r4,-1976(0x848)
1c0046ac:	57d76fff 	bl	-10388(0xfffd76c) # 1c001e18 <myprintf>
1c0046b0:	14000805 	lu12i.w	$r5,64(0x40)
1c0046b4:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0046b8:	03808184 	ori	$r4,$r12,0x20
1c0046bc:	57efa7ff 	bl	-4188(0xfffefa4) # 1c003660 <EXTI_ClearITPendingBit>
1c0046c0:	03400000 	andi	$r0,$r0,0x0
1c0046c4:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0046c8:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0046cc:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0046d0:	4c000020 	jirl	$r0,$r1,0

1c0046d4 <exti_gpioc3_irq_handler>:
exti_gpioc3_irq_handler():
1c0046d4:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0046d8:	29803061 	st.w	$r1,$r3,12(0xc)
1c0046dc:	29802076 	st.w	$r22,$r3,8(0x8)
1c0046e0:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0046e4:	1c000046 	pcaddu12i	$r6,2(0x2)
1c0046e8:	02adb0c6 	addi.w	$r6,$r6,-1172(0xb6c)
1c0046ec:	0281c805 	addi.w	$r5,$r0,114(0x72)
1c0046f0:	1c000024 	pcaddu12i	$r4,1(0x1)
1c0046f4:	029ff084 	addi.w	$r4,$r4,2044(0x7fc)
1c0046f8:	57d723ff 	bl	-10464(0xfffd720) # 1c001e18 <myprintf>
1c0046fc:	14001005 	lu12i.w	$r5,128(0x80)
1c004700:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004704:	03808184 	ori	$r4,$r12,0x20
1c004708:	57ef5bff 	bl	-4264(0xfffef58) # 1c003660 <EXTI_ClearITPendingBit>
1c00470c:	03400000 	andi	$r0,$r0,0x0
1c004710:	28803061 	ld.w	$r1,$r3,12(0xc)
1c004714:	28802076 	ld.w	$r22,$r3,8(0x8)
1c004718:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00471c:	4c000020 	jirl	$r0,$r1,0

1c004720 <exti_gpioc4_irq_handler>:
exti_gpioc4_irq_handler():
1c004720:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c004724:	29803061 	st.w	$r1,$r3,12(0xc)
1c004728:	29802076 	st.w	$r22,$r3,8(0x8)
1c00472c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c004730:	1c000046 	pcaddu12i	$r6,2(0x2)
1c004734:	02ace0c6 	addi.w	$r6,$r6,-1224(0xb38)
1c004738:	0281dc05 	addi.w	$r5,$r0,119(0x77)
1c00473c:	1c000024 	pcaddu12i	$r4,1(0x1)
1c004740:	029ec084 	addi.w	$r4,$r4,1968(0x7b0)
1c004744:	57d6d7ff 	bl	-10540(0xfffd6d4) # 1c001e18 <myprintf>
1c004748:	14002005 	lu12i.w	$r5,256(0x100)
1c00474c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004750:	03808184 	ori	$r4,$r12,0x20
1c004754:	57ef0fff 	bl	-4340(0xfffef0c) # 1c003660 <EXTI_ClearITPendingBit>
1c004758:	03400000 	andi	$r0,$r0,0x0
1c00475c:	28803061 	ld.w	$r1,$r3,12(0xc)
1c004760:	28802076 	ld.w	$r22,$r3,8(0x8)
1c004764:	02804063 	addi.w	$r3,$r3,16(0x10)
1c004768:	4c000020 	jirl	$r0,$r1,0

1c00476c <exti_gpioc5_irq_handler>:
exti_gpioc5_irq_handler():
1c00476c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c004770:	29803061 	st.w	$r1,$r3,12(0xc)
1c004774:	29802076 	st.w	$r22,$r3,8(0x8)
1c004778:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00477c:	1c000046 	pcaddu12i	$r6,2(0x2)
1c004780:	02ac10c6 	addi.w	$r6,$r6,-1276(0xb04)
1c004784:	0281f005 	addi.w	$r5,$r0,124(0x7c)
1c004788:	1c000024 	pcaddu12i	$r4,1(0x1)
1c00478c:	029d9084 	addi.w	$r4,$r4,1892(0x764)
1c004790:	57d68bff 	bl	-10616(0xfffd688) # 1c001e18 <myprintf>
1c004794:	14004005 	lu12i.w	$r5,512(0x200)
1c004798:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00479c:	03808184 	ori	$r4,$r12,0x20
1c0047a0:	57eec3ff 	bl	-4416(0xfffeec0) # 1c003660 <EXTI_ClearITPendingBit>
1c0047a4:	03400000 	andi	$r0,$r0,0x0
1c0047a8:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0047ac:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0047b0:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0047b4:	4c000020 	jirl	$r0,$r1,0

1c0047b8 <exti_gpioc6_irq_handler>:
exti_gpioc6_irq_handler():
1c0047b8:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0047bc:	29803061 	st.w	$r1,$r3,12(0xc)
1c0047c0:	29802076 	st.w	$r22,$r3,8(0x8)
1c0047c4:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0047c8:	1c000046 	pcaddu12i	$r6,2(0x2)
1c0047cc:	02ab40c6 	addi.w	$r6,$r6,-1328(0xad0)
1c0047d0:	02820405 	addi.w	$r5,$r0,129(0x81)
1c0047d4:	1c000024 	pcaddu12i	$r4,1(0x1)
1c0047d8:	029c6084 	addi.w	$r4,$r4,1816(0x718)
1c0047dc:	57d63fff 	bl	-10692(0xfffd63c) # 1c001e18 <myprintf>
1c0047e0:	14008005 	lu12i.w	$r5,1024(0x400)
1c0047e4:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0047e8:	03808184 	ori	$r4,$r12,0x20
1c0047ec:	57ee77ff 	bl	-4492(0xfffee74) # 1c003660 <EXTI_ClearITPendingBit>
1c0047f0:	03400000 	andi	$r0,$r0,0x0
1c0047f4:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0047f8:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0047fc:	02804063 	addi.w	$r3,$r3,16(0x10)
1c004800:	4c000020 	jirl	$r0,$r1,0

1c004804 <exti_gpioc7_irq_handler>:
exti_gpioc7_irq_handler():
1c004804:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c004808:	29803061 	st.w	$r1,$r3,12(0xc)
1c00480c:	29802076 	st.w	$r22,$r3,8(0x8)
1c004810:	02804076 	addi.w	$r22,$r3,16(0x10)
1c004814:	1c000046 	pcaddu12i	$r6,2(0x2)
1c004818:	02aa70c6 	addi.w	$r6,$r6,-1380(0xa9c)
1c00481c:	02821805 	addi.w	$r5,$r0,134(0x86)
1c004820:	1c000024 	pcaddu12i	$r4,1(0x1)
1c004824:	029b3084 	addi.w	$r4,$r4,1740(0x6cc)
1c004828:	57d5f3ff 	bl	-10768(0xfffd5f0) # 1c001e18 <myprintf>
1c00482c:	14010005 	lu12i.w	$r5,2048(0x800)
1c004830:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004834:	03808184 	ori	$r4,$r12,0x20
1c004838:	57ee2bff 	bl	-4568(0xfffee28) # 1c003660 <EXTI_ClearITPendingBit>
1c00483c:	03400000 	andi	$r0,$r0,0x0
1c004840:	28803061 	ld.w	$r1,$r3,12(0xc)
1c004844:	28802076 	ld.w	$r22,$r3,8(0x8)
1c004848:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00484c:	4c000020 	jirl	$r0,$r1,0

1c004850 <exti_gpiod0_irq_handler>:
exti_gpiod0_irq_handler():
1c004850:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c004854:	29803061 	st.w	$r1,$r3,12(0xc)
1c004858:	29802076 	st.w	$r22,$r3,8(0x8)
1c00485c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c004860:	1c000046 	pcaddu12i	$r6,2(0x2)
1c004864:	02a9a0c6 	addi.w	$r6,$r6,-1432(0xa68)
1c004868:	02822c05 	addi.w	$r5,$r0,139(0x8b)
1c00486c:	1c000024 	pcaddu12i	$r4,1(0x1)
1c004870:	029a0084 	addi.w	$r4,$r4,1664(0x680)
1c004874:	57d5a7ff 	bl	-10844(0xfffd5a4) # 1c001e18 <myprintf>
1c004878:	14020005 	lu12i.w	$r5,4096(0x1000)
1c00487c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004880:	03808184 	ori	$r4,$r12,0x20
1c004884:	57eddfff 	bl	-4644(0xfffeddc) # 1c003660 <EXTI_ClearITPendingBit>
1c004888:	03400000 	andi	$r0,$r0,0x0
1c00488c:	28803061 	ld.w	$r1,$r3,12(0xc)
1c004890:	28802076 	ld.w	$r22,$r3,8(0x8)
1c004894:	02804063 	addi.w	$r3,$r3,16(0x10)
1c004898:	4c000020 	jirl	$r0,$r1,0

1c00489c <exti_gpiod1_irq_handler>:
exti_gpiod1_irq_handler():
1c00489c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0048a0:	29803061 	st.w	$r1,$r3,12(0xc)
1c0048a4:	29802076 	st.w	$r22,$r3,8(0x8)
1c0048a8:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0048ac:	1c000046 	pcaddu12i	$r6,2(0x2)
1c0048b0:	02a8d0c6 	addi.w	$r6,$r6,-1484(0xa34)
1c0048b4:	02824005 	addi.w	$r5,$r0,144(0x90)
1c0048b8:	1c000024 	pcaddu12i	$r4,1(0x1)
1c0048bc:	0298d084 	addi.w	$r4,$r4,1588(0x634)
1c0048c0:	57d55bff 	bl	-10920(0xfffd558) # 1c001e18 <myprintf>
1c0048c4:	14040005 	lu12i.w	$r5,8192(0x2000)
1c0048c8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0048cc:	03808184 	ori	$r4,$r12,0x20
1c0048d0:	57ed93ff 	bl	-4720(0xfffed90) # 1c003660 <EXTI_ClearITPendingBit>
1c0048d4:	03400000 	andi	$r0,$r0,0x0
1c0048d8:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0048dc:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0048e0:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0048e4:	4c000020 	jirl	$r0,$r1,0

1c0048e8 <exti_gpiod2_irq_handler>:
exti_gpiod2_irq_handler():
1c0048e8:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0048ec:	29803061 	st.w	$r1,$r3,12(0xc)
1c0048f0:	29802076 	st.w	$r22,$r3,8(0x8)
1c0048f4:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0048f8:	1c000046 	pcaddu12i	$r6,2(0x2)
1c0048fc:	02a800c6 	addi.w	$r6,$r6,-1536(0xa00)
1c004900:	02825405 	addi.w	$r5,$r0,149(0x95)
1c004904:	1c000024 	pcaddu12i	$r4,1(0x1)
1c004908:	0297a084 	addi.w	$r4,$r4,1512(0x5e8)
1c00490c:	57d50fff 	bl	-10996(0xfffd50c) # 1c001e18 <myprintf>
1c004910:	14080005 	lu12i.w	$r5,16384(0x4000)
1c004914:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004918:	03808184 	ori	$r4,$r12,0x20
1c00491c:	57ed47ff 	bl	-4796(0xfffed44) # 1c003660 <EXTI_ClearITPendingBit>
1c004920:	03400000 	andi	$r0,$r0,0x0
1c004924:	28803061 	ld.w	$r1,$r3,12(0xc)
1c004928:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00492c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c004930:	4c000020 	jirl	$r0,$r1,0

1c004934 <exti_gpiod3_irq_handler>:
exti_gpiod3_irq_handler():
1c004934:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c004938:	29803061 	st.w	$r1,$r3,12(0xc)
1c00493c:	29802076 	st.w	$r22,$r3,8(0x8)
1c004940:	02804076 	addi.w	$r22,$r3,16(0x10)
1c004944:	1c000046 	pcaddu12i	$r6,2(0x2)
1c004948:	02a730c6 	addi.w	$r6,$r6,-1588(0x9cc)
1c00494c:	02826805 	addi.w	$r5,$r0,154(0x9a)
1c004950:	1c000024 	pcaddu12i	$r4,1(0x1)
1c004954:	02967084 	addi.w	$r4,$r4,1436(0x59c)
1c004958:	57d4c3ff 	bl	-11072(0xfffd4c0) # 1c001e18 <myprintf>
1c00495c:	14100005 	lu12i.w	$r5,32768(0x8000)
1c004960:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004964:	03808184 	ori	$r4,$r12,0x20
1c004968:	57ecfbff 	bl	-4872(0xfffecf8) # 1c003660 <EXTI_ClearITPendingBit>
1c00496c:	03400000 	andi	$r0,$r0,0x0
1c004970:	28803061 	ld.w	$r1,$r3,12(0xc)
1c004974:	28802076 	ld.w	$r22,$r3,8(0x8)
1c004978:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00497c:	4c000020 	jirl	$r0,$r1,0

1c004980 <exti_gpiod4_irq_handler>:
exti_gpiod4_irq_handler():
1c004980:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c004984:	29803061 	st.w	$r1,$r3,12(0xc)
1c004988:	29802076 	st.w	$r22,$r3,8(0x8)
1c00498c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c004990:	1c000046 	pcaddu12i	$r6,2(0x2)
1c004994:	02a660c6 	addi.w	$r6,$r6,-1640(0x998)
1c004998:	02827c05 	addi.w	$r5,$r0,159(0x9f)
1c00499c:	1c000024 	pcaddu12i	$r4,1(0x1)
1c0049a0:	02954084 	addi.w	$r4,$r4,1360(0x550)
1c0049a4:	57d477ff 	bl	-11148(0xfffd474) # 1c001e18 <myprintf>
1c0049a8:	14200005 	lu12i.w	$r5,65536(0x10000)
1c0049ac:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0049b0:	03808184 	ori	$r4,$r12,0x20
1c0049b4:	57ecafff 	bl	-4948(0xfffecac) # 1c003660 <EXTI_ClearITPendingBit>
1c0049b8:	03400000 	andi	$r0,$r0,0x0
1c0049bc:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0049c0:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0049c4:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0049c8:	4c000020 	jirl	$r0,$r1,0

1c0049cc <exti_gpiod5_irq_handler>:
exti_gpiod5_irq_handler():
1c0049cc:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0049d0:	29803061 	st.w	$r1,$r3,12(0xc)
1c0049d4:	29802076 	st.w	$r22,$r3,8(0x8)
1c0049d8:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0049dc:	1c000046 	pcaddu12i	$r6,2(0x2)
1c0049e0:	02a590c6 	addi.w	$r6,$r6,-1692(0x964)
1c0049e4:	02829405 	addi.w	$r5,$r0,165(0xa5)
1c0049e8:	1c000024 	pcaddu12i	$r4,1(0x1)
1c0049ec:	02941084 	addi.w	$r4,$r4,1284(0x504)
1c0049f0:	57d42bff 	bl	-11224(0xfffd428) # 1c001e18 <myprintf>
1c0049f4:	14400005 	lu12i.w	$r5,131072(0x20000)
1c0049f8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0049fc:	03808184 	ori	$r4,$r12,0x20
1c004a00:	57ec63ff 	bl	-5024(0xfffec60) # 1c003660 <EXTI_ClearITPendingBit>
1c004a04:	03400000 	andi	$r0,$r0,0x0
1c004a08:	28803061 	ld.w	$r1,$r3,12(0xc)
1c004a0c:	28802076 	ld.w	$r22,$r3,8(0x8)
1c004a10:	02804063 	addi.w	$r3,$r3,16(0x10)
1c004a14:	4c000020 	jirl	$r0,$r1,0

1c004a18 <exti_gpiod6_irq_handler>:
exti_gpiod6_irq_handler():
1c004a18:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c004a1c:	29803061 	st.w	$r1,$r3,12(0xc)
1c004a20:	29802076 	st.w	$r22,$r3,8(0x8)
1c004a24:	02804076 	addi.w	$r22,$r3,16(0x10)
1c004a28:	1c000046 	pcaddu12i	$r6,2(0x2)
1c004a2c:	02a4c0c6 	addi.w	$r6,$r6,-1744(0x930)
1c004a30:	0282a805 	addi.w	$r5,$r0,170(0xaa)
1c004a34:	1c000024 	pcaddu12i	$r4,1(0x1)
1c004a38:	0292e084 	addi.w	$r4,$r4,1208(0x4b8)
1c004a3c:	57d3dfff 	bl	-11300(0xfffd3dc) # 1c001e18 <myprintf>
1c004a40:	14800005 	lu12i.w	$r5,262144(0x40000)
1c004a44:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004a48:	03808184 	ori	$r4,$r12,0x20
1c004a4c:	57ec17ff 	bl	-5100(0xfffec14) # 1c003660 <EXTI_ClearITPendingBit>
1c004a50:	03400000 	andi	$r0,$r0,0x0
1c004a54:	28803061 	ld.w	$r1,$r3,12(0xc)
1c004a58:	28802076 	ld.w	$r22,$r3,8(0x8)
1c004a5c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c004a60:	4c000020 	jirl	$r0,$r1,0

1c004a64 <exti_gpiod7_irq_handler>:
exti_gpiod7_irq_handler():
1c004a64:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c004a68:	29803061 	st.w	$r1,$r3,12(0xc)
1c004a6c:	29802076 	st.w	$r22,$r3,8(0x8)
1c004a70:	02804076 	addi.w	$r22,$r3,16(0x10)
1c004a74:	1c000046 	pcaddu12i	$r6,2(0x2)
1c004a78:	02a3f0c6 	addi.w	$r6,$r6,-1796(0x8fc)
1c004a7c:	0282bc05 	addi.w	$r5,$r0,175(0xaf)
1c004a80:	1c000024 	pcaddu12i	$r4,1(0x1)
1c004a84:	0291b084 	addi.w	$r4,$r4,1132(0x46c)
1c004a88:	57d393ff 	bl	-11376(0xfffd390) # 1c001e18 <myprintf>
1c004a8c:	15000005 	lu12i.w	$r5,-524288(0x80000)
1c004a90:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004a94:	03808184 	ori	$r4,$r12,0x20
1c004a98:	57ebcbff 	bl	-5176(0xfffebc8) # 1c003660 <EXTI_ClearITPendingBit>
1c004a9c:	03400000 	andi	$r0,$r0,0x0
1c004aa0:	28803061 	ld.w	$r1,$r3,12(0xc)
1c004aa4:	28802076 	ld.w	$r22,$r3,8(0x8)
1c004aa8:	02804063 	addi.w	$r3,$r3,16(0x10)
1c004aac:	4c000020 	jirl	$r0,$r1,0

1c004ab0 <ext_handler>:
ext_handler():
1c004ab0:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c004ab4:	29807061 	st.w	$r1,$r3,28(0x1c)
1c004ab8:	29806076 	st.w	$r22,$r3,24(0x18)
1c004abc:	02808076 	addi.w	$r22,$r3,32(0x20)
1c004ac0:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004ac4:	0380f18c 	ori	$r12,$r12,0x3c
1c004ac8:	1402000d 	lu12i.w	$r13,4096(0x1000)
1c004acc:	2980018d 	st.w	$r13,$r12,0
1c004ad0:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004ad4:	0380818c 	ori	$r12,$r12,0x20
1c004ad8:	2880318c 	ld.w	$r12,$r12,12(0xc)
1c004adc:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c004ae0:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004ae4:	0380818c 	ori	$r12,$r12,0x20
1c004ae8:	2880018c 	ld.w	$r12,$r12,0
1c004aec:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c004af0:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c004af4:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c004af8:	0014b1ac 	and	$r12,$r13,$r12
1c004afc:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c004b00:	03400000 	andi	$r0,$r0,0x0
1c004b04:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c004b08:	50004000 	b	64(0x40) # 1c004b48 <ext_handler+0x98>
1c004b0c:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c004b10:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004b14:	0017b1ac 	srl.w	$r12,$r13,$r12
1c004b18:	0340058c 	andi	$r12,$r12,0x1
1c004b1c:	40002180 	beqz	$r12,32(0x20) # 1c004b3c <ext_handler+0x8c>
1c004b20:	1c00002d 	pcaddu12i	$r13,1(0x1)
1c004b24:	029291ad 	addi.w	$r13,$r13,1188(0x4a4)
1c004b28:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004b2c:	0040898c 	slli.w	$r12,$r12,0x2
1c004b30:	001031ac 	add.w	$r12,$r13,$r12
1c004b34:	2880018c 	ld.w	$r12,$r12,0
1c004b38:	4c000181 	jirl	$r1,$r12,0
1c004b3c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004b40:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c004b44:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c004b48:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c004b4c:	02807c0c 	addi.w	$r12,$r0,31(0x1f)
1c004b50:	6fffbd8d 	bgeu	$r12,$r13,-68(0x3ffbc) # 1c004b0c <ext_handler+0x5c>
1c004b54:	03400000 	andi	$r0,$r0,0x0
1c004b58:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c004b5c:	28806076 	ld.w	$r22,$r3,24(0x18)
1c004b60:	02808063 	addi.w	$r3,$r3,32(0x20)
1c004b64:	4c000020 	jirl	$r0,$r1,0

1c004b68 <TIMER_WAKE_INT>:
TIMER_WAKE_INT():
1c004b68:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c004b6c:	29807061 	st.w	$r1,$r3,28(0x1c)
1c004b70:	29806076 	st.w	$r22,$r3,24(0x18)
1c004b74:	02808076 	addi.w	$r22,$r3,32(0x20)
1c004b78:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004b7c:	0380f18c 	ori	$r12,$r12,0x3c
1c004b80:	1400020d 	lu12i.w	$r13,16(0x10)
1c004b84:	2980018d 	st.w	$r13,$r12,0
1c004b88:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004b8c:	0380118c 	ori	$r12,$r12,0x4
1c004b90:	2880018c 	ld.w	$r12,$r12,0
1c004b94:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c004b98:	57ec1bff 	bl	-5096(0xfffec18) # 1c0037b0 <WDG_DogFeed>
1c004b9c:	02801804 	addi.w	$r4,$r0,6(0x6)
1c004ba0:	57e6c3ff 	bl	-6464(0xfffe6c0) # 1c003260 <Wake_Set>
1c004ba4:	03400000 	andi	$r0,$r0,0x0
1c004ba8:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c004bac:	28806076 	ld.w	$r22,$r3,24(0x18)
1c004bb0:	02808063 	addi.w	$r3,$r3,32(0x20)
1c004bb4:	4c000020 	jirl	$r0,$r1,0

1c004bb8 <TOUCH>:
TOUCH():
1c004bb8:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c004bbc:	29807061 	st.w	$r1,$r3,28(0x1c)
1c004bc0:	29806076 	st.w	$r22,$r3,24(0x18)
1c004bc4:	02808076 	addi.w	$r22,$r3,32(0x20)
1c004bc8:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c004bcc:	0380118c 	ori	$r12,$r12,0x4
1c004bd0:	2880018c 	ld.w	$r12,$r12,0
1c004bd4:	0044c18c 	srli.w	$r12,$r12,0x10
1c004bd8:	006f818c 	bstrpick.w	$r12,$r12,0xf,0x0
1c004bdc:	037ffd8c 	andi	$r12,$r12,0xfff
1c004be0:	297fbacc 	st.h	$r12,$r22,-18(0xfee)
1c004be4:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c004be8:	0380118c 	ori	$r12,$r12,0x4
1c004bec:	2880018c 	ld.w	$r12,$r12,0
1c004bf0:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c004bf4:	03403d8c 	andi	$r12,$r12,0xf
1c004bf8:	293fb6cc 	st.b	$r12,$r22,-19(0xfed)
1c004bfc:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004c00:	0380f18c 	ori	$r12,$r12,0x3c
1c004c04:	1400040d 	lu12i.w	$r13,32(0x20)
1c004c08:	2980018d 	st.w	$r13,$r12,0
1c004c0c:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c004c10:	0380118c 	ori	$r12,$r12,0x4
1c004c14:	02803c0d 	addi.w	$r13,$r0,15(0xf)
1c004c18:	2980018d 	st.w	$r13,$r12,0
1c004c1c:	2a3fb6cc 	ld.bu	$r12,$r22,-19(0xfed)
1c004c20:	00150184 	move	$r4,$r12
1c004c24:	57f187ff 	bl	-3708(0xffff184) # 1c003da8 <Printf_KeyType>
1c004c28:	2a7fbacc 	ld.hu	$r12,$r22,-18(0xfee)
1c004c2c:	00150184 	move	$r4,$r12
1c004c30:	57f0ffff 	bl	-3844(0xffff0fc) # 1c003d2c <Printf_KeyChannel>
1c004c34:	57f203ff 	bl	-3584(0xffff200) # 1c003e34 <Printf_KeyVal>
1c004c38:	03400000 	andi	$r0,$r0,0x0
1c004c3c:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c004c40:	28806076 	ld.w	$r22,$r3,24(0x18)
1c004c44:	02808063 	addi.w	$r3,$r3,32(0x20)
1c004c48:	4c000020 	jirl	$r0,$r1,0

1c004c4c <UART2_INT>:
UART2_INT():
1c004c4c:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c004c50:	29807076 	st.w	$r22,$r3,28(0x1c)
1c004c54:	02808076 	addi.w	$r22,$r3,32(0x20)
1c004c58:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004c5c:	0380f18c 	ori	$r12,$r12,0x3c
1c004c60:	1400080d 	lu12i.w	$r13,64(0x40)
1c004c64:	2980018d 	st.w	$r13,$r12,0
1c004c68:	157fd18c 	lu12i.w	$r12,-262516(0xbfe8c)
1c004c6c:	0380098c 	ori	$r12,$r12,0x2
1c004c70:	2a00018c 	ld.bu	$r12,$r12,0
1c004c74:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c004c78:	03400000 	andi	$r0,$r0,0x0
1c004c7c:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c004c80:	02808063 	addi.w	$r3,$r3,32(0x20)
1c004c84:	4c000020 	jirl	$r0,$r1,0

1c004c88 <BAT_FAIL>:
BAT_FAIL():
1c004c88:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c004c8c:	29807061 	st.w	$r1,$r3,28(0x1c)
1c004c90:	29806076 	st.w	$r22,$r3,24(0x18)
1c004c94:	02808076 	addi.w	$r22,$r3,32(0x20)
1c004c98:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004c9c:	0380118c 	ori	$r12,$r12,0x4
1c004ca0:	2880018c 	ld.w	$r12,$r12,0
1c004ca4:	0044cd8c 	srli.w	$r12,$r12,0x13
1c004ca8:	03407d8c 	andi	$r12,$r12,0x1f
1c004cac:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c004cb0:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004cb4:	0380118c 	ori	$r12,$r12,0x4
1c004cb8:	2880018e 	ld.w	$r14,$r12,0
1c004cbc:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004cc0:	0380f18c 	ori	$r12,$r12,0x3c
1c004cc4:	1401f00d 	lu12i.w	$r13,3968(0xf80)
1c004cc8:	0014b5cd 	and	$r13,$r14,$r13
1c004ccc:	2980018d 	st.w	$r13,$r12,0
1c004cd0:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c004cd4:	0280400c 	addi.w	$r12,$r0,16(0x10)
1c004cd8:	6800718d 	bltu	$r12,$r13,112(0x70) # 1c004d48 <BAT_FAIL+0xc0>
1c004cdc:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004ce0:	0040898d 	slli.w	$r13,$r12,0x2
1c004ce4:	1c00002c 	pcaddu12i	$r12,1(0x1)
1c004ce8:	028d818c 	addi.w	$r12,$r12,864(0x360)
1c004cec:	001031ac 	add.w	$r12,$r13,$r12
1c004cf0:	2880018c 	ld.w	$r12,$r12,0
1c004cf4:	4c000180 	jirl	$r0,$r12,0
1c004cf8:	1c000024 	pcaddu12i	$r4,1(0x1)
1c004cfc:	0288e084 	addi.w	$r4,$r4,568(0x238)
1c004d00:	57d11bff 	bl	-12008(0xfffd118) # 1c001e18 <myprintf>
1c004d04:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004d08:	0380118c 	ori	$r12,$r12,0x4
1c004d0c:	29800180 	st.w	$r0,$r12,0
1c004d10:	50003c00 	b	60(0x3c) # 1c004d4c <BAT_FAIL+0xc4>
1c004d14:	1c000024 	pcaddu12i	$r4,1(0x1)
1c004d18:	02891084 	addi.w	$r4,$r4,580(0x244)
1c004d1c:	57d0ffff 	bl	-12036(0xfffd0fc) # 1c001e18 <myprintf>
1c004d20:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004d24:	0380118c 	ori	$r12,$r12,0x4
1c004d28:	2880018e 	ld.w	$r14,$r12,0
1c004d2c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004d30:	0380118c 	ori	$r12,$r12,0x4
1c004d34:	15fffeed 	lu12i.w	$r13,-9(0xffff7)
1c004d38:	03bffdad 	ori	$r13,$r13,0xfff
1c004d3c:	0014b5cd 	and	$r13,$r14,$r13
1c004d40:	2980018d 	st.w	$r13,$r12,0
1c004d44:	50000800 	b	8(0x8) # 1c004d4c <BAT_FAIL+0xc4>
1c004d48:	03400000 	andi	$r0,$r0,0x0
1c004d4c:	03400000 	andi	$r0,$r0,0x0
1c004d50:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c004d54:	28806076 	ld.w	$r22,$r3,24(0x18)
1c004d58:	02808063 	addi.w	$r3,$r3,32(0x20)
1c004d5c:	4c000020 	jirl	$r0,$r1,0

1c004d60 <intc_handler>:
intc_handler():
1c004d60:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c004d64:	29807061 	st.w	$r1,$r3,28(0x1c)
1c004d68:	29806076 	st.w	$r22,$r3,24(0x18)
1c004d6c:	02808076 	addi.w	$r22,$r3,32(0x20)
1c004d70:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c004d74:	0380158c 	ori	$r12,$r12,0x5
1c004d78:	2a00018c 	ld.bu	$r12,$r12,0
1c004d7c:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c004d80:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c004d84:	0340058c 	andi	$r12,$r12,0x1
1c004d88:	40002980 	beqz	$r12,40(0x28) # 1c004db0 <intc_handler+0x50>
1c004d8c:	02840004 	addi.w	$r4,$r0,256(0x100)
1c004d90:	57f2fbff 	bl	-3336(0xffff2f8) # 1c004088 <TIM_GetITStatus>
1c004d94:	0015008c 	move	$r12,$r4
1c004d98:	40001980 	beqz	$r12,24(0x18) # 1c004db0 <intc_handler+0x50>
1c004d9c:	02840004 	addi.w	$r4,$r0,256(0x100)
1c004da0:	57f337ff 	bl	-3276(0xffff334) # 1c0040d4 <TIM_ClearIT>
1c004da4:	1c000024 	pcaddu12i	$r4,1(0x1)
1c004da8:	02876084 	addi.w	$r4,$r4,472(0x1d8)
1c004dac:	57d06fff 	bl	-12180(0xfffd06c) # 1c001e18 <myprintf>
1c004db0:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c004db4:	0340118c 	andi	$r12,$r12,0x4
1c004db8:	40001580 	beqz	$r12,20(0x14) # 1c004dcc <intc_handler+0x6c>
1c004dbc:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c004dc0:	03800d8c 	ori	$r12,$r12,0x3
1c004dc4:	0280100d 	addi.w	$r13,$r0,4(0x4)
1c004dc8:	2900018d 	st.b	$r13,$r12,0
1c004dcc:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c004dd0:	0340218c 	andi	$r12,$r12,0x8
1c004dd4:	40001580 	beqz	$r12,20(0x14) # 1c004de8 <intc_handler+0x88>
1c004dd8:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c004ddc:	03800d8c 	ori	$r12,$r12,0x3
1c004de0:	0280200d 	addi.w	$r13,$r0,8(0x8)
1c004de4:	2900018d 	st.b	$r13,$r12,0
1c004de8:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c004dec:	03800d8c 	ori	$r12,$r12,0x3
1c004df0:	02bffc0d 	addi.w	$r13,$r0,-1(0xfff)
1c004df4:	2900018d 	st.b	$r13,$r12,0
1c004df8:	03400000 	andi	$r0,$r0,0x0
1c004dfc:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c004e00:	28806076 	ld.w	$r22,$r3,24(0x18)
1c004e04:	02808063 	addi.w	$r3,$r3,32(0x20)
1c004e08:	4c000020 	jirl	$r0,$r1,0

1c004e0c <TIMER_HANDLER>:
TIMER_HANDLER():
1c004e0c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c004e10:	29803061 	st.w	$r1,$r3,12(0xc)
1c004e14:	29802076 	st.w	$r22,$r3,8(0x8)
1c004e18:	02804076 	addi.w	$r22,$r3,16(0x10)
1c004e1c:	57e423ff 	bl	-7136(0xfffe420) # 1c00323c <Set_Timer_clear>
1c004e20:	1c000024 	pcaddu12i	$r4,1(0x1)
1c004e24:	02861084 	addi.w	$r4,$r4,388(0x184)
1c004e28:	57cff3ff 	bl	-12304(0xfffcff0) # 1c001e18 <myprintf>
1c004e2c:	57e3f3ff 	bl	-7184(0xfffe3f0) # 1c00321c <Set_Timer_stop>
1c004e30:	03400000 	andi	$r0,$r0,0x0
1c004e34:	28803061 	ld.w	$r1,$r3,12(0xc)
1c004e38:	28802076 	ld.w	$r22,$r3,8(0x8)
1c004e3c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c004e40:	4c000020 	jirl	$r0,$r1,0

1c004e44 <main>:
main():
1c004e44:	02bf0063 	addi.w	$r3,$r3,-64(0xfc0)
1c004e48:	2980f061 	st.w	$r1,$r3,60(0x3c)
1c004e4c:	2980e076 	st.w	$r22,$r3,56(0x38)
1c004e50:	02810076 	addi.w	$r22,$r3,64(0x40)
1c004e54:	57e9f7ff 	bl	-5644(0xfffe9f4) # 1c003848 <IIC_Init>
1c004e58:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c004e5c:	29bfa2c0 	st.w	$r0,$r22,-24(0xfe8)
1c004e60:	297f9ac0 	st.h	$r0,$r22,-26(0xfe6)
1c004e64:	29bf82c0 	st.w	$r0,$r22,-32(0xfe0)
1c004e68:	293f7ec0 	st.b	$r0,$r22,-33(0xfdf)
1c004e6c:	293f7ac0 	st.b	$r0,$r22,-34(0xfde)
1c004e70:	1c00002c 	pcaddu12i	$r12,1(0x1)
1c004e74:	0294718c 	addi.w	$r12,$r12,1308(0x51c)
1c004e78:	28800190 	ld.w	$r16,$r12,0
1c004e7c:	2880118f 	ld.w	$r15,$r12,4(0x4)
1c004e80:	2880218e 	ld.w	$r14,$r12,8(0x8)
1c004e84:	2880318d 	ld.w	$r13,$r12,12(0xc)
1c004e88:	29bf22d0 	st.w	$r16,$r22,-56(0xfc8)
1c004e8c:	29bf32cf 	st.w	$r15,$r22,-52(0xfcc)
1c004e90:	29bf42ce 	st.w	$r14,$r22,-48(0xfd0)
1c004e94:	29bf52cd 	st.w	$r13,$r22,-44(0xfd4)
1c004e98:	2a40418d 	ld.hu	$r13,$r12,16(0x10)
1c004e9c:	297f62cd 	st.h	$r13,$r22,-40(0xfd8)
1c004ea0:	2a00498c 	ld.bu	$r12,$r12,18(0x12)
1c004ea4:	293f6acc 	st.b	$r12,$r22,-38(0xfda)
1c004ea8:	1400004c 	lu12i.w	$r12,2(0x2)
1c004eac:	03960184 	ori	$r4,$r12,0x580
1c004eb0:	57dc1fff 	bl	-9188(0xfffdc1c) # 1c002acc <Uart2_init>
1c004eb4:	5402c800 	bl	712(0x2c8) # 1c00517c <sgp30_init>
1c004eb8:	02803c04 	addi.w	$r4,$r0,15(0xf)
1c004ebc:	57e76bff 	bl	-6296(0xfffe768) # 1c003624 <delay_s>
1c004ec0:	02800404 	addi.w	$r4,$r0,1(0x1)
1c004ec4:	57e763ff 	bl	-6304(0xfffe760) # 1c003624 <delay_s>
1c004ec8:	157fd18c 	lu12i.w	$r12,-262516(0xbfe8c)
1c004ecc:	0380158c 	ori	$r12,$r12,0x5
1c004ed0:	2a00018c 	ld.bu	$r12,$r12,0
1c004ed4:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c004ed8:	0340058c 	andi	$r12,$r12,0x1
1c004edc:	4000d980 	beqz	$r12,216(0xd8) # 1c004fb4 <main+0x170>
1c004ee0:	57db3fff 	bl	-9412(0xfffdb3c) # 1c002a1c <x_getchar>
1c004ee4:	0015008c 	move	$r12,$r4
1c004ee8:	293f7ecc 	st.b	$r12,$r22,-33(0xfdf)
1c004eec:	2a3f7ecd 	ld.bu	$r13,$r22,-33(0xfdf)
1c004ef0:	0281040c 	addi.w	$r12,$r0,65(0x41)
1c004ef4:	5c00c1ac 	bne	$r13,$r12,192(0xc0) # 1c004fb4 <main+0x170>
1c004ef8:	03400000 	andi	$r0,$r0,0x0
1c004efc:	54066000 	bl	1632(0x660) # 1c00555c <sht31_do_once>
1c004f00:	02805004 	addi.w	$r4,$r0,20(0x14)
1c004f04:	57e6e3ff 	bl	-6432(0xfffe6e0) # 1c0035e4 <delay_ms>
1c004f08:	5406a400 	bl	1700(0x6a4) # 1c0055ac <sht31_read_once>
1c004f0c:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c004f10:	02800404 	addi.w	$r4,$r0,1(0x1)
1c004f14:	57e713ff 	bl	-6384(0xfffe710) # 1c003624 <delay_s>
1c004f18:	5402b400 	bl	692(0x2b4) # 1c0051cc <sgp30_do_once>
1c004f1c:	0280c804 	addi.w	$r4,$r0,50(0x32)
1c004f20:	57e6c7ff 	bl	-6460(0xfffe6c4) # 1c0035e4 <delay_ms>
1c004f24:	5402f800 	bl	760(0x2f8) # 1c00521c <sgp30_read_once>
1c004f28:	29bfa2c4 	st.w	$r4,$r22,-24(0xfe8)
1c004f2c:	28bfb2c4 	ld.w	$r4,$r22,-20(0xfec)
1c004f30:	5407fc00 	bl	2044(0x7fc) # 1c00572c <correct>
1c004f34:	29bf82c4 	st.w	$r4,$r22,-32(0xfe0)
1c004f38:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c004f3c:	2a40018c 	ld.hu	$r12,$r12,0
1c004f40:	0000598d 	ext.w.h	$r13,$r12
1c004f44:	02bf22cc 	addi.w	$r12,$r22,-56(0xfc8)
1c004f48:	0280098c 	addi.w	$r12,$r12,2(0x2)
1c004f4c:	00150185 	move	$r5,$r12
1c004f50:	001501a4 	move	$r4,$r13
1c004f54:	54044800 	bl	1096(0x448) # 1c00539c <signed_to_string>
1c004f58:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c004f5c:	0280098c 	addi.w	$r12,$r12,2(0x2)
1c004f60:	2a40018c 	ld.hu	$r12,$r12,0
1c004f64:	0000598d 	ext.w.h	$r13,$r12
1c004f68:	02bf22cc 	addi.w	$r12,$r22,-56(0xfc8)
1c004f6c:	02801d8c 	addi.w	$r12,$r12,7(0x7)
1c004f70:	00150185 	move	$r5,$r12
1c004f74:	001501a4 	move	$r4,$r13
1c004f78:	54042400 	bl	1060(0x424) # 1c00539c <signed_to_string>
1c004f7c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c004f80:	2a40018d 	ld.hu	$r13,$r12,0
1c004f84:	02bf22cc 	addi.w	$r12,$r22,-56(0xfc8)
1c004f88:	0280318c 	addi.w	$r12,$r12,12(0xc)
1c004f8c:	00150185 	move	$r5,$r12
1c004f90:	001501a4 	move	$r4,$r13
1c004f94:	54002800 	bl	40(0x28) # 1c004fbc <unsigned_to_string>
1c004f98:	02bf22cc 	addi.w	$r12,$r22,-56(0xfc8)
1c004f9c:	00150186 	move	$r6,$r12
1c004fa0:	1c000025 	pcaddu12i	$r5,1(0x1)
1c004fa4:	028fa0a5 	addi.w	$r5,$r5,1000(0x3e8)
1c004fa8:	02800804 	addi.w	$r4,$r0,2(0x2)
1c004fac:	57d213ff 	bl	-11760(0xfffd210) # 1c0021bc <myprintf2>
1c004fb0:	53ff13ff 	b	-240(0xfffff10) # 1c004ec0 <main+0x7c>
1c004fb4:	03400000 	andi	$r0,$r0,0x0
1c004fb8:	53ff0bff 	b	-248(0xfffff08) # 1c004ec0 <main+0x7c>

1c004fbc <unsigned_to_string>:
unsigned_to_string():
1c004fbc:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c004fc0:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c004fc4:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c004fc8:	0015008c 	move	$r12,$r4
1c004fcc:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c004fd0:	297f7acc 	st.h	$r12,$r22,-34(0xfde)
1c004fd4:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c004fd8:	2a7f7acd 	ld.hu	$r13,$r22,-34(0xfde)
1c004fdc:	1400004c 	lu12i.w	$r12,2(0x2)
1c004fe0:	039c418c 	ori	$r12,$r12,0x710
1c004fe4:	002131ae 	div.wu	$r14,$r13,$r12
1c004fe8:	5c000980 	bne	$r12,$r0,8(0x8) # 1c004ff0 <unsigned_to_string+0x34>
1c004fec:	002a0007 	break	0x7
1c004ff0:	006f81cc 	bstrpick.w	$r12,$r14,0xf,0x0
1c004ff4:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c004ff8:	0280c18c 	addi.w	$r12,$r12,48(0x30)
1c004ffc:	0067818e 	bstrpick.w	$r14,$r12,0x7,0x0
1c005000:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005004:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c005008:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c00500c:	0015018d 	move	$r13,$r12
1c005010:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c005014:	0010358c 	add.w	$r12,$r12,$r13
1c005018:	00005dcd 	ext.w.b	$r13,$r14
1c00501c:	2900018d 	st.b	$r13,$r12,0
1c005020:	2a7f7acd 	ld.hu	$r13,$r22,-34(0xfde)
1c005024:	028fa00c 	addi.w	$r12,$r0,1000(0x3e8)
1c005028:	002131ae 	div.wu	$r14,$r13,$r12
1c00502c:	5c000980 	bne	$r12,$r0,8(0x8) # 1c005034 <unsigned_to_string+0x78>
1c005030:	002a0007 	break	0x7
1c005034:	006f81cd 	bstrpick.w	$r13,$r14,0xf,0x0
1c005038:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c00503c:	0021b1ae 	mod.wu	$r14,$r13,$r12
1c005040:	5c000980 	bne	$r12,$r0,8(0x8) # 1c005048 <unsigned_to_string+0x8c>
1c005044:	002a0007 	break	0x7
1c005048:	006f81cc 	bstrpick.w	$r12,$r14,0xf,0x0
1c00504c:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c005050:	0280c18c 	addi.w	$r12,$r12,48(0x30)
1c005054:	0067818e 	bstrpick.w	$r14,$r12,0x7,0x0
1c005058:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00505c:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c005060:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c005064:	0015018d 	move	$r13,$r12
1c005068:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c00506c:	0010358c 	add.w	$r12,$r12,$r13
1c005070:	00005dcd 	ext.w.b	$r13,$r14
1c005074:	2900018d 	st.b	$r13,$r12,0
1c005078:	2a7f7acd 	ld.hu	$r13,$r22,-34(0xfde)
1c00507c:	0281900c 	addi.w	$r12,$r0,100(0x64)
1c005080:	002131ae 	div.wu	$r14,$r13,$r12
1c005084:	5c000980 	bne	$r12,$r0,8(0x8) # 1c00508c <unsigned_to_string+0xd0>
1c005088:	002a0007 	break	0x7
1c00508c:	006f81cd 	bstrpick.w	$r13,$r14,0xf,0x0
1c005090:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c005094:	0021b1ae 	mod.wu	$r14,$r13,$r12
1c005098:	5c000980 	bne	$r12,$r0,8(0x8) # 1c0050a0 <unsigned_to_string+0xe4>
1c00509c:	002a0007 	break	0x7
1c0050a0:	006f81cc 	bstrpick.w	$r12,$r14,0xf,0x0
1c0050a4:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0050a8:	0280c18c 	addi.w	$r12,$r12,48(0x30)
1c0050ac:	0067818e 	bstrpick.w	$r14,$r12,0x7,0x0
1c0050b0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0050b4:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c0050b8:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c0050bc:	0015018d 	move	$r13,$r12
1c0050c0:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c0050c4:	0010358c 	add.w	$r12,$r12,$r13
1c0050c8:	00005dcd 	ext.w.b	$r13,$r14
1c0050cc:	2900018d 	st.b	$r13,$r12,0
1c0050d0:	2a7f7acd 	ld.hu	$r13,$r22,-34(0xfde)
1c0050d4:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c0050d8:	002131ae 	div.wu	$r14,$r13,$r12
1c0050dc:	5c000980 	bne	$r12,$r0,8(0x8) # 1c0050e4 <unsigned_to_string+0x128>
1c0050e0:	002a0007 	break	0x7
1c0050e4:	006f81cd 	bstrpick.w	$r13,$r14,0xf,0x0
1c0050e8:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c0050ec:	0021b1ae 	mod.wu	$r14,$r13,$r12
1c0050f0:	5c000980 	bne	$r12,$r0,8(0x8) # 1c0050f8 <unsigned_to_string+0x13c>
1c0050f4:	002a0007 	break	0x7
1c0050f8:	006f81cc 	bstrpick.w	$r12,$r14,0xf,0x0
1c0050fc:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c005100:	0280c18c 	addi.w	$r12,$r12,48(0x30)
1c005104:	0067818e 	bstrpick.w	$r14,$r12,0x7,0x0
1c005108:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00510c:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c005110:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c005114:	0015018d 	move	$r13,$r12
1c005118:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c00511c:	0010358c 	add.w	$r12,$r12,$r13
1c005120:	00005dcd 	ext.w.b	$r13,$r14
1c005124:	2900018d 	st.b	$r13,$r12,0
1c005128:	2a7f7acd 	ld.hu	$r13,$r22,-34(0xfde)
1c00512c:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c005130:	0021b1ae 	mod.wu	$r14,$r13,$r12
1c005134:	5c000980 	bne	$r12,$r0,8(0x8) # 1c00513c <unsigned_to_string+0x180>
1c005138:	002a0007 	break	0x7
1c00513c:	006f81cc 	bstrpick.w	$r12,$r14,0xf,0x0
1c005140:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c005144:	0280c18c 	addi.w	$r12,$r12,48(0x30)
1c005148:	0067818e 	bstrpick.w	$r14,$r12,0x7,0x0
1c00514c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005150:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c005154:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c005158:	0015018d 	move	$r13,$r12
1c00515c:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c005160:	0010358c 	add.w	$r12,$r12,$r13
1c005164:	00005dcd 	ext.w.b	$r13,$r14
1c005168:	2900018d 	st.b	$r13,$r12,0
1c00516c:	03400000 	andi	$r0,$r0,0x0
1c005170:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c005174:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c005178:	4c000020 	jirl	$r0,$r1,0

1c00517c <sgp30_init>:
sgp30_init():
1c00517c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c005180:	29803061 	st.w	$r1,$r3,12(0xc)
1c005184:	29802076 	st.w	$r22,$r3,8(0x8)
1c005188:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00518c:	57e797ff 	bl	-6252(0xfffe794) # 1c003920 <IIC_Start>
1c005190:	0282c004 	addi.w	$r4,$r0,176(0xb0)
1c005194:	57e9a3ff 	bl	-5728(0xfffe9a0) # 1c003b34 <IIC_Send_Byte>
1c005198:	57e84bff 	bl	-6072(0xfffe848) # 1c0039e0 <IIC_Wait_Ack>
1c00519c:	02808004 	addi.w	$r4,$r0,32(0x20)
1c0051a0:	57e997ff 	bl	-5740(0xfffe994) # 1c003b34 <IIC_Send_Byte>
1c0051a4:	57e83fff 	bl	-6084(0xfffe83c) # 1c0039e0 <IIC_Wait_Ack>
1c0051a8:	02800c04 	addi.w	$r4,$r0,3(0x3)
1c0051ac:	57e98bff 	bl	-5752(0xfffe988) # 1c003b34 <IIC_Send_Byte>
1c0051b0:	57e833ff 	bl	-6096(0xfffe830) # 1c0039e0 <IIC_Wait_Ack>
1c0051b4:	57e7cfff 	bl	-6196(0xfffe7cc) # 1c003980 <IIC_Stop>
1c0051b8:	03400000 	andi	$r0,$r0,0x0
1c0051bc:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0051c0:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0051c4:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0051c8:	4c000020 	jirl	$r0,$r1,0

1c0051cc <sgp30_do_once>:
sgp30_do_once():
1c0051cc:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0051d0:	29803061 	st.w	$r1,$r3,12(0xc)
1c0051d4:	29802076 	st.w	$r22,$r3,8(0x8)
1c0051d8:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0051dc:	57e747ff 	bl	-6332(0xfffe744) # 1c003920 <IIC_Start>
1c0051e0:	0282c004 	addi.w	$r4,$r0,176(0xb0)
1c0051e4:	57e953ff 	bl	-5808(0xfffe950) # 1c003b34 <IIC_Send_Byte>
1c0051e8:	57e7fbff 	bl	-6152(0xfffe7f8) # 1c0039e0 <IIC_Wait_Ack>
1c0051ec:	02808004 	addi.w	$r4,$r0,32(0x20)
1c0051f0:	57e947ff 	bl	-5820(0xfffe944) # 1c003b34 <IIC_Send_Byte>
1c0051f4:	57e7efff 	bl	-6164(0xfffe7ec) # 1c0039e0 <IIC_Wait_Ack>
1c0051f8:	02802004 	addi.w	$r4,$r0,8(0x8)
1c0051fc:	57e93bff 	bl	-5832(0xfffe938) # 1c003b34 <IIC_Send_Byte>
1c005200:	57e7e3ff 	bl	-6176(0xfffe7e0) # 1c0039e0 <IIC_Wait_Ack>
1c005204:	57e77fff 	bl	-6276(0xfffe77c) # 1c003980 <IIC_Stop>
1c005208:	03400000 	andi	$r0,$r0,0x0
1c00520c:	28803061 	ld.w	$r1,$r3,12(0xc)
1c005210:	28802076 	ld.w	$r22,$r3,8(0x8)
1c005214:	02804063 	addi.w	$r3,$r3,16(0x10)
1c005218:	4c000020 	jirl	$r0,$r1,0

1c00521c <sgp30_read_once>:
sgp30_read_once():
1c00521c:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c005220:	29807061 	st.w	$r1,$r3,28(0x1c)
1c005224:	29806076 	st.w	$r22,$r3,24(0x18)
1c005228:	29805077 	st.w	$r23,$r3,20(0x14)
1c00522c:	02808076 	addi.w	$r22,$r3,32(0x20)
1c005230:	293fb2c0 	st.b	$r0,$r22,-20(0xfec)
1c005234:	293fb6c0 	st.b	$r0,$r22,-19(0xfed)
1c005238:	57e6ebff 	bl	-6424(0xfffe6e8) # 1c003920 <IIC_Start>
1c00523c:	0282c404 	addi.w	$r4,$r0,177(0xb1)
1c005240:	57e8f7ff 	bl	-5900(0xfffe8f4) # 1c003b34 <IIC_Send_Byte>
1c005244:	57e79fff 	bl	-6244(0xfffe79c) # 1c0039e0 <IIC_Wait_Ack>
1c005248:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00524c:	02b6e18c 	addi.w	$r12,$r12,-584(0xdb8)
1c005250:	2a40018c 	ld.hu	$r12,$r12,0
1c005254:	0000598c 	ext.w.h	$r12,$r12
1c005258:	0343fd8c 	andi	$r12,$r12,0xff
1c00525c:	00005997 	ext.w.h	$r23,$r12
1c005260:	02800404 	addi.w	$r4,$r0,1(0x1)
1c005264:	57e97fff 	bl	-5764(0xfffe97c) # 1c003be0 <IIC_Read_Byte>
1c005268:	0015008c 	move	$r12,$r4
1c00526c:	0040a18c 	slli.w	$r12,$r12,0x8
1c005270:	0000598c 	ext.w.h	$r12,$r12
1c005274:	001532ec 	or	$r12,$r23,$r12
1c005278:	0000598c 	ext.w.h	$r12,$r12
1c00527c:	006f818d 	bstrpick.w	$r13,$r12,0xf,0x0
1c005280:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005284:	02b6018c 	addi.w	$r12,$r12,-640(0xd80)
1c005288:	2940018d 	st.h	$r13,$r12,0
1c00528c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005290:	02b5d18c 	addi.w	$r12,$r12,-652(0xd74)
1c005294:	2a40018c 	ld.hu	$r12,$r12,0
1c005298:	0000598d 	ext.w.h	$r13,$r12
1c00529c:	02bc000c 	addi.w	$r12,$r0,-256(0xf00)
1c0052a0:	0014b1ac 	and	$r12,$r13,$r12
1c0052a4:	00005997 	ext.w.h	$r23,$r12
1c0052a8:	02800404 	addi.w	$r4,$r0,1(0x1)
1c0052ac:	57e937ff 	bl	-5836(0xfffe934) # 1c003be0 <IIC_Read_Byte>
1c0052b0:	0015008c 	move	$r12,$r4
1c0052b4:	0000598c 	ext.w.h	$r12,$r12
1c0052b8:	001532ec 	or	$r12,$r23,$r12
1c0052bc:	0000598c 	ext.w.h	$r12,$r12
1c0052c0:	006f818d 	bstrpick.w	$r13,$r12,0xf,0x0
1c0052c4:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0052c8:	02b4f18c 	addi.w	$r12,$r12,-708(0xd3c)
1c0052cc:	2940018d 	st.h	$r13,$r12,0
1c0052d0:	02800404 	addi.w	$r4,$r0,1(0x1)
1c0052d4:	57e90fff 	bl	-5876(0xfffe90c) # 1c003be0 <IIC_Read_Byte>
1c0052d8:	0015008c 	move	$r12,$r4
1c0052dc:	293fb2cc 	st.b	$r12,$r22,-20(0xfec)
1c0052e0:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0052e4:	02b4818c 	addi.w	$r12,$r12,-736(0xd20)
1c0052e8:	2a40098c 	ld.hu	$r12,$r12,2(0x2)
1c0052ec:	0000598c 	ext.w.h	$r12,$r12
1c0052f0:	0343fd8c 	andi	$r12,$r12,0xff
1c0052f4:	00005997 	ext.w.h	$r23,$r12
1c0052f8:	02800404 	addi.w	$r4,$r0,1(0x1)
1c0052fc:	57e8e7ff 	bl	-5916(0xfffe8e4) # 1c003be0 <IIC_Read_Byte>
1c005300:	0015008c 	move	$r12,$r4
1c005304:	0040a18c 	slli.w	$r12,$r12,0x8
1c005308:	0000598c 	ext.w.h	$r12,$r12
1c00530c:	001532ec 	or	$r12,$r23,$r12
1c005310:	0000598c 	ext.w.h	$r12,$r12
1c005314:	006f818d 	bstrpick.w	$r13,$r12,0xf,0x0
1c005318:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00531c:	02b3a18c 	addi.w	$r12,$r12,-792(0xce8)
1c005320:	2940098d 	st.h	$r13,$r12,2(0x2)
1c005324:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005328:	02b3718c 	addi.w	$r12,$r12,-804(0xcdc)
1c00532c:	2a40098c 	ld.hu	$r12,$r12,2(0x2)
1c005330:	0000598d 	ext.w.h	$r13,$r12
1c005334:	02bc000c 	addi.w	$r12,$r0,-256(0xf00)
1c005338:	0014b1ac 	and	$r12,$r13,$r12
1c00533c:	00005997 	ext.w.h	$r23,$r12
1c005340:	02800404 	addi.w	$r4,$r0,1(0x1)
1c005344:	57e89fff 	bl	-5988(0xfffe89c) # 1c003be0 <IIC_Read_Byte>
1c005348:	0015008c 	move	$r12,$r4
1c00534c:	0000598c 	ext.w.h	$r12,$r12
1c005350:	001532ec 	or	$r12,$r23,$r12
1c005354:	0000598c 	ext.w.h	$r12,$r12
1c005358:	006f818d 	bstrpick.w	$r13,$r12,0xf,0x0
1c00535c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005360:	02b2918c 	addi.w	$r12,$r12,-860(0xca4)
1c005364:	2940098d 	st.h	$r13,$r12,2(0x2)
1c005368:	00150004 	move	$r4,$r0
1c00536c:	57e877ff 	bl	-6028(0xfffe874) # 1c003be0 <IIC_Read_Byte>
1c005370:	0015008c 	move	$r12,$r4
1c005374:	293fb6cc 	st.b	$r12,$r22,-19(0xfed)
1c005378:	57e60bff 	bl	-6648(0xfffe608) # 1c003980 <IIC_Stop>
1c00537c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005380:	02b2118c 	addi.w	$r12,$r12,-892(0xc84)
1c005384:	00150184 	move	$r4,$r12
1c005388:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c00538c:	28806076 	ld.w	$r22,$r3,24(0x18)
1c005390:	28805077 	ld.w	$r23,$r3,20(0x14)
1c005394:	02808063 	addi.w	$r3,$r3,32(0x20)
1c005398:	4c000020 	jirl	$r0,$r1,0

1c00539c <signed_to_string>:
signed_to_string():
1c00539c:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0053a0:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c0053a4:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c0053a8:	0015008c 	move	$r12,$r4
1c0053ac:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c0053b0:	297f7acc 	st.h	$r12,$r22,-34(0xfde)
1c0053b4:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c0053b8:	287f7acc 	ld.h	$r12,$r22,-34(0xfde)
1c0053bc:	64003980 	bge	$r12,$r0,56(0x38) # 1c0053f4 <signed_to_string+0x58>
1c0053c0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0053c4:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c0053c8:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c0053cc:	0015018d 	move	$r13,$r12
1c0053d0:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c0053d4:	0010358c 	add.w	$r12,$r12,$r13
1c0053d8:	0280b40d 	addi.w	$r13,$r0,45(0x2d)
1c0053dc:	2900018d 	st.b	$r13,$r12,0
1c0053e0:	2a7f7acc 	ld.hu	$r12,$r22,-34(0xfde)
1c0053e4:	0011300c 	sub.w	$r12,$r0,$r12
1c0053e8:	006f818c 	bstrpick.w	$r12,$r12,0xf,0x0
1c0053ec:	297f7acc 	st.h	$r12,$r22,-34(0xfde)
1c0053f0:	50002400 	b	36(0x24) # 1c005414 <signed_to_string+0x78>
1c0053f4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0053f8:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c0053fc:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c005400:	0015018d 	move	$r13,$r12
1c005404:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c005408:	0010358c 	add.w	$r12,$r12,$r13
1c00540c:	0280ac0d 	addi.w	$r13,$r0,43(0x2b)
1c005410:	2900018d 	st.b	$r13,$r12,0
1c005414:	287f7acd 	ld.h	$r13,$r22,-34(0xfde)
1c005418:	028fa00c 	addi.w	$r12,$r0,1000(0x3e8)
1c00541c:	002031ae 	div.w	$r14,$r13,$r12
1c005420:	5c000980 	bne	$r12,$r0,8(0x8) # 1c005428 <signed_to_string+0x8c>
1c005424:	002a0007 	break	0x7
1c005428:	000059cc 	ext.w.h	$r12,$r14
1c00542c:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c005430:	0280c18c 	addi.w	$r12,$r12,48(0x30)
1c005434:	0067818e 	bstrpick.w	$r14,$r12,0x7,0x0
1c005438:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00543c:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c005440:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c005444:	0015018d 	move	$r13,$r12
1c005448:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c00544c:	0010358c 	add.w	$r12,$r12,$r13
1c005450:	00005dcd 	ext.w.b	$r13,$r14
1c005454:	2900018d 	st.b	$r13,$r12,0
1c005458:	287f7acd 	ld.h	$r13,$r22,-34(0xfde)
1c00545c:	028fa00c 	addi.w	$r12,$r0,1000(0x3e8)
1c005460:	0020b1ae 	mod.w	$r14,$r13,$r12
1c005464:	5c000980 	bne	$r12,$r0,8(0x8) # 1c00546c <signed_to_string+0xd0>
1c005468:	002a0007 	break	0x7
1c00546c:	000059cd 	ext.w.h	$r13,$r14
1c005470:	0281900c 	addi.w	$r12,$r0,100(0x64)
1c005474:	002031ae 	div.w	$r14,$r13,$r12
1c005478:	5c000980 	bne	$r12,$r0,8(0x8) # 1c005480 <signed_to_string+0xe4>
1c00547c:	002a0007 	break	0x7
1c005480:	000059cc 	ext.w.h	$r12,$r14
1c005484:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c005488:	0280c18c 	addi.w	$r12,$r12,48(0x30)
1c00548c:	0067818e 	bstrpick.w	$r14,$r12,0x7,0x0
1c005490:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005494:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c005498:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c00549c:	0015018d 	move	$r13,$r12
1c0054a0:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c0054a4:	0010358c 	add.w	$r12,$r12,$r13
1c0054a8:	00005dcd 	ext.w.b	$r13,$r14
1c0054ac:	2900018d 	st.b	$r13,$r12,0
1c0054b0:	287f7acd 	ld.h	$r13,$r22,-34(0xfde)
1c0054b4:	0281900c 	addi.w	$r12,$r0,100(0x64)
1c0054b8:	0020b1ae 	mod.w	$r14,$r13,$r12
1c0054bc:	5c000980 	bne	$r12,$r0,8(0x8) # 1c0054c4 <signed_to_string+0x128>
1c0054c0:	002a0007 	break	0x7
1c0054c4:	000059cd 	ext.w.h	$r13,$r14
1c0054c8:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c0054cc:	002031ae 	div.w	$r14,$r13,$r12
1c0054d0:	5c000980 	bne	$r12,$r0,8(0x8) # 1c0054d8 <signed_to_string+0x13c>
1c0054d4:	002a0007 	break	0x7
1c0054d8:	000059cc 	ext.w.h	$r12,$r14
1c0054dc:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0054e0:	0280c18c 	addi.w	$r12,$r12,48(0x30)
1c0054e4:	0067818e 	bstrpick.w	$r14,$r12,0x7,0x0
1c0054e8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0054ec:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c0054f0:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c0054f4:	0015018d 	move	$r13,$r12
1c0054f8:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c0054fc:	0010358c 	add.w	$r12,$r12,$r13
1c005500:	00005dcd 	ext.w.b	$r13,$r14
1c005504:	2900018d 	st.b	$r13,$r12,0
1c005508:	287f7acd 	ld.h	$r13,$r22,-34(0xfde)
1c00550c:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c005510:	0020b1ae 	mod.w	$r14,$r13,$r12
1c005514:	5c000980 	bne	$r12,$r0,8(0x8) # 1c00551c <signed_to_string+0x180>
1c005518:	002a0007 	break	0x7
1c00551c:	000059cc 	ext.w.h	$r12,$r14
1c005520:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c005524:	0280c18c 	addi.w	$r12,$r12,48(0x30)
1c005528:	0067818e 	bstrpick.w	$r14,$r12,0x7,0x0
1c00552c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005530:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c005534:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c005538:	0015018d 	move	$r13,$r12
1c00553c:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c005540:	0010358c 	add.w	$r12,$r12,$r13
1c005544:	00005dcd 	ext.w.b	$r13,$r14
1c005548:	2900018d 	st.b	$r13,$r12,0
1c00554c:	03400000 	andi	$r0,$r0,0x0
1c005550:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c005554:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c005558:	4c000020 	jirl	$r0,$r1,0

1c00555c <sht31_do_once>:
sht31_do_once():
1c00555c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c005560:	29803061 	st.w	$r1,$r3,12(0xc)
1c005564:	29802076 	st.w	$r22,$r3,8(0x8)
1c005568:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00556c:	57e3b7ff 	bl	-7244(0xfffe3b4) # 1c003920 <IIC_Start>
1c005570:	02822004 	addi.w	$r4,$r0,136(0x88)
1c005574:	57e5c3ff 	bl	-6720(0xfffe5c0) # 1c003b34 <IIC_Send_Byte>
1c005578:	57e46bff 	bl	-7064(0xfffe468) # 1c0039e0 <IIC_Wait_Ack>
1c00557c:	02809004 	addi.w	$r4,$r0,36(0x24)
1c005580:	57e5b7ff 	bl	-6732(0xfffe5b4) # 1c003b34 <IIC_Send_Byte>
1c005584:	57e45fff 	bl	-7076(0xfffe45c) # 1c0039e0 <IIC_Wait_Ack>
1c005588:	00150004 	move	$r4,$r0
1c00558c:	57e5abff 	bl	-6744(0xfffe5a8) # 1c003b34 <IIC_Send_Byte>
1c005590:	57e453ff 	bl	-7088(0xfffe450) # 1c0039e0 <IIC_Wait_Ack>
1c005594:	57e3efff 	bl	-7188(0xfffe3ec) # 1c003980 <IIC_Stop>
1c005598:	03400000 	andi	$r0,$r0,0x0
1c00559c:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0055a0:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0055a4:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0055a8:	4c000020 	jirl	$r0,$r1,0

1c0055ac <sht31_read_once>:
sht31_read_once():
1c0055ac:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0055b0:	29807061 	st.w	$r1,$r3,28(0x1c)
1c0055b4:	29806076 	st.w	$r22,$r3,24(0x18)
1c0055b8:	29805077 	st.w	$r23,$r3,20(0x14)
1c0055bc:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0055c0:	293fb2c0 	st.b	$r0,$r22,-20(0xfec)
1c0055c4:	293fb6c0 	st.b	$r0,$r22,-19(0xfed)
1c0055c8:	57e35bff 	bl	-7336(0xfffe358) # 1c003920 <IIC_Start>
1c0055cc:	02822404 	addi.w	$r4,$r0,137(0x89)
1c0055d0:	57e567ff 	bl	-6812(0xfffe564) # 1c003b34 <IIC_Send_Byte>
1c0055d4:	57e40fff 	bl	-7156(0xfffe40c) # 1c0039e0 <IIC_Wait_Ack>
1c0055d8:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0055dc:	02a8b18c 	addi.w	$r12,$r12,-1492(0xa2c)
1c0055e0:	2a40018c 	ld.hu	$r12,$r12,0
1c0055e4:	0000598c 	ext.w.h	$r12,$r12
1c0055e8:	0343fd8c 	andi	$r12,$r12,0xff
1c0055ec:	00005997 	ext.w.h	$r23,$r12
1c0055f0:	02800404 	addi.w	$r4,$r0,1(0x1)
1c0055f4:	57e5efff 	bl	-6676(0xfffe5ec) # 1c003be0 <IIC_Read_Byte>
1c0055f8:	0015008c 	move	$r12,$r4
1c0055fc:	0040a18c 	slli.w	$r12,$r12,0x8
1c005600:	0000598c 	ext.w.h	$r12,$r12
1c005604:	001532ec 	or	$r12,$r23,$r12
1c005608:	0000598c 	ext.w.h	$r12,$r12
1c00560c:	006f818d 	bstrpick.w	$r13,$r12,0xf,0x0
1c005610:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005614:	02a7d18c 	addi.w	$r12,$r12,-1548(0x9f4)
1c005618:	2940018d 	st.h	$r13,$r12,0
1c00561c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005620:	02a7a18c 	addi.w	$r12,$r12,-1560(0x9e8)
1c005624:	2a40018c 	ld.hu	$r12,$r12,0
1c005628:	0000598d 	ext.w.h	$r13,$r12
1c00562c:	02bc000c 	addi.w	$r12,$r0,-256(0xf00)
1c005630:	0014b1ac 	and	$r12,$r13,$r12
1c005634:	00005997 	ext.w.h	$r23,$r12
1c005638:	02800404 	addi.w	$r4,$r0,1(0x1)
1c00563c:	57e5a7ff 	bl	-6748(0xfffe5a4) # 1c003be0 <IIC_Read_Byte>
1c005640:	0015008c 	move	$r12,$r4
1c005644:	0000598c 	ext.w.h	$r12,$r12
1c005648:	001532ec 	or	$r12,$r23,$r12
1c00564c:	0000598c 	ext.w.h	$r12,$r12
1c005650:	006f818d 	bstrpick.w	$r13,$r12,0xf,0x0
1c005654:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005658:	02a6c18c 	addi.w	$r12,$r12,-1616(0x9b0)
1c00565c:	2940018d 	st.h	$r13,$r12,0
1c005660:	02800404 	addi.w	$r4,$r0,1(0x1)
1c005664:	57e57fff 	bl	-6788(0xfffe57c) # 1c003be0 <IIC_Read_Byte>
1c005668:	0015008c 	move	$r12,$r4
1c00566c:	293fb2cc 	st.b	$r12,$r22,-20(0xfec)
1c005670:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005674:	02a6518c 	addi.w	$r12,$r12,-1644(0x994)
1c005678:	2a40098c 	ld.hu	$r12,$r12,2(0x2)
1c00567c:	0000598c 	ext.w.h	$r12,$r12
1c005680:	0343fd8c 	andi	$r12,$r12,0xff
1c005684:	00005997 	ext.w.h	$r23,$r12
1c005688:	02800404 	addi.w	$r4,$r0,1(0x1)
1c00568c:	57e557ff 	bl	-6828(0xfffe554) # 1c003be0 <IIC_Read_Byte>
1c005690:	0015008c 	move	$r12,$r4
1c005694:	0040a18c 	slli.w	$r12,$r12,0x8
1c005698:	0000598c 	ext.w.h	$r12,$r12
1c00569c:	001532ec 	or	$r12,$r23,$r12
1c0056a0:	0000598c 	ext.w.h	$r12,$r12
1c0056a4:	006f818d 	bstrpick.w	$r13,$r12,0xf,0x0
1c0056a8:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0056ac:	02a5718c 	addi.w	$r12,$r12,-1700(0x95c)
1c0056b0:	2940098d 	st.h	$r13,$r12,2(0x2)
1c0056b4:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0056b8:	02a5418c 	addi.w	$r12,$r12,-1712(0x950)
1c0056bc:	2a40098c 	ld.hu	$r12,$r12,2(0x2)
1c0056c0:	0000598d 	ext.w.h	$r13,$r12
1c0056c4:	02bc000c 	addi.w	$r12,$r0,-256(0xf00)
1c0056c8:	0014b1ac 	and	$r12,$r13,$r12
1c0056cc:	00005997 	ext.w.h	$r23,$r12
1c0056d0:	02800404 	addi.w	$r4,$r0,1(0x1)
1c0056d4:	57e50fff 	bl	-6900(0xfffe50c) # 1c003be0 <IIC_Read_Byte>
1c0056d8:	0015008c 	move	$r12,$r4
1c0056dc:	0000598c 	ext.w.h	$r12,$r12
1c0056e0:	001532ec 	or	$r12,$r23,$r12
1c0056e4:	0000598c 	ext.w.h	$r12,$r12
1c0056e8:	006f818d 	bstrpick.w	$r13,$r12,0xf,0x0
1c0056ec:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0056f0:	02a4618c 	addi.w	$r12,$r12,-1768(0x918)
1c0056f4:	2940098d 	st.h	$r13,$r12,2(0x2)
1c0056f8:	00150004 	move	$r4,$r0
1c0056fc:	57e4e7ff 	bl	-6940(0xfffe4e4) # 1c003be0 <IIC_Read_Byte>
1c005700:	0015008c 	move	$r12,$r4
1c005704:	293fb6cc 	st.b	$r12,$r22,-19(0xfed)
1c005708:	57e27bff 	bl	-7560(0xfffe278) # 1c003980 <IIC_Stop>
1c00570c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005710:	02a3e18c 	addi.w	$r12,$r12,-1800(0x8f8)
1c005714:	00150184 	move	$r4,$r12
1c005718:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c00571c:	28806076 	ld.w	$r22,$r3,24(0x18)
1c005720:	28805077 	ld.w	$r23,$r3,20(0x14)
1c005724:	02808063 	addi.w	$r3,$r3,32(0x20)
1c005728:	4c000020 	jirl	$r0,$r1,0

1c00572c <correct>:
correct():
1c00572c:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c005730:	29807076 	st.w	$r22,$r3,28(0x1c)
1c005734:	02808076 	addi.w	$r22,$r3,32(0x20)
1c005738:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c00573c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005740:	2a40018c 	ld.hu	$r12,$r12,0
1c005744:	0015018d 	move	$r13,$r12
1c005748:	029b580c 	addi.w	$r12,$r0,1750(0x6d6)
1c00574c:	001c31ad 	mul.w	$r13,$r13,$r12
1c005750:	140001ec 	lu12i.w	$r12,15(0xf)
1c005754:	03bffd8c 	ori	$r12,$r12,0xfff
1c005758:	002031ae 	div.w	$r14,$r13,$r12
1c00575c:	5c000980 	bne	$r12,$r0,8(0x8) # 1c005764 <correct+0x38>
1c005760:	002a0007 	break	0x7
1c005764:	006f81cc 	bstrpick.w	$r12,$r14,0xf,0x0
1c005768:	02b8f98c 	addi.w	$r12,$r12,-450(0xe3e)
1c00576c:	006f818d 	bstrpick.w	$r13,$r12,0xf,0x0
1c005770:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005774:	02a2618c 	addi.w	$r12,$r12,-1896(0x898)
1c005778:	2940018d 	st.h	$r13,$r12,0
1c00577c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005780:	0280098c 	addi.w	$r12,$r12,2(0x2)
1c005784:	2a40018c 	ld.hu	$r12,$r12,0
1c005788:	0015018d 	move	$r13,$r12
1c00578c:	028fa00c 	addi.w	$r12,$r0,1000(0x3e8)
1c005790:	001c31ad 	mul.w	$r13,$r13,$r12
1c005794:	140001ec 	lu12i.w	$r12,15(0xf)
1c005798:	03bffd8c 	ori	$r12,$r12,0xfff
1c00579c:	002031ae 	div.w	$r14,$r13,$r12
1c0057a0:	5c000980 	bne	$r12,$r0,8(0x8) # 1c0057a8 <correct+0x7c>
1c0057a4:	002a0007 	break	0x7
1c0057a8:	006f81cd 	bstrpick.w	$r13,$r14,0xf,0x0
1c0057ac:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0057b0:	02a1718c 	addi.w	$r12,$r12,-1956(0x85c)
1c0057b4:	2940098d 	st.h	$r13,$r12,2(0x2)
1c0057b8:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0057bc:	02a1418c 	addi.w	$r12,$r12,-1968(0x850)
1c0057c0:	00150184 	move	$r4,$r12
1c0057c4:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c0057c8:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0057cc:	4c000020 	jirl	$r0,$r1,0

Disassembly of section .rodata:

1c0057e0 <msg_wakeup>:
msg_wakeup():
1c0057e0:	656b6177 	bge	$r11,$r23,93024(0x16b60) # 1c01c340 <_sidata+0x15fa0>
1c0057e4:	0a217075 	xvfmadd.d	$xr21,$xr3,$xr28,$xr2
	...

1c0057e9 <hexdecarr>:
hexdecarr():
1c0057e9:	33323130 	xvstelm.w	$xr16,$r9,-464(0x230),0x4
1c0057ed:	37363534 	0x37363534
1c0057f1:	62613938 	blt	$r9,$r24,-106184(0x26138) # 1bfeb929 <_start-0x146d7>
1c0057f5:	66656463 	bge	$r3,$r3,-105116(0x26564) # 1bfebd59 <_start-0x142a7>
1c0057f9:	0d000000 	fsel	$f0,$f0,$f0,$fcc0
1c0057fd:	79654b0a 	0x79654b0a
1c005801:	73657220 	vssrani.wu.d	$vr0,$vr17,0x1c
1c005805:	0d217465 	xvbitsel.v	$xr5,$xr3,$xr29,$xr2
1c005809:	0d00000a 	fsel	$f10,$f0,$f0,$fcc0
1c00580d:	6970730a 	bltu	$r24,$r10,94320(0x17070) # 1c01c87d <_sidata+0x164dd>
1c005811:	6f6f6220 	bgeu	$r17,$r0,-37024(0x36f60) # 1bffc771 <_start-0x388f>
1c005815:	0d000074 	fsel	$f20,$f3,$f0,$fcc0
1c005819:	676f640a 	bge	$r0,$r10,-37020(0x36f64) # 1bffc77d <_start-0x3883>
1c00581d:	72616220 	0x72616220
1c005821:	0a0d216b 	0x0a0d216b
1c005825:	0d000000 	fsel	$f0,$f0,$f0,$fcc0
1c005829:	6b61770a 	bltu	$r24,$r10,-40588(0x36174) # 1bffb99d <_start-0x4663>
1c00582d:	21705565 	sc.w	$r5,$r11,28756(0x7054)
1c005831:	38000a0d 	ldx.b	$r13,$r16,$r2
1c005835:	541c0020 	bl	8395776(0x801c00) # 1c807435 <_sidata+0x801095>
1c005839:	541c0021 	bl	8657920(0x841c00) # 1c847439 <_sidata+0x841099>
1c00583d:	541c0021 	bl	8657920(0x841c00) # 1c84743d <_sidata+0x84109d>
1c005841:	541c0021 	bl	8657920(0x841c00) # 1c847441 <_sidata+0x8410a1>
1c005845:	541c0021 	bl	8657920(0x841c00) # 1c847445 <_sidata+0x8410a5>
1c005849:	541c0021 	bl	8657920(0x841c00) # 1c847449 <_sidata+0x8410a9>
1c00584d:	541c0021 	bl	8657920(0x841c00) # 1c84744d <_sidata+0x8410ad>
1c005851:	541c0021 	bl	8657920(0x841c00) # 1c847451 <_sidata+0x8410b1>
1c005855:	541c0021 	bl	8657920(0x841c00) # 1c847455 <_sidata+0x8410b5>
1c005859:	541c0021 	bl	8657920(0x841c00) # 1c847459 <_sidata+0x8410b9>
1c00585d:	501c0021 	b	8657920(0x841c00) # 1c84745d <_sidata+0x8410bd>
1c005861:	d81c0020 	0xd81c0020
1c005865:	d81c0020 	0xd81c0020
1c005869:	d81c0020 	0xd81c0020
1c00586d:	d81c0020 	0xd81c0020
1c005871:	d81c0020 	0xd81c0020
1c005875:	d81c0020 	0xd81c0020
1c005879:	d81c0020 	0xd81c0020
1c00587d:	d81c0020 	0xd81c0020
1c005881:	d81c0020 	0xd81c0020
1c005885:	541c0020 	bl	8395776(0x801c00) # 1c807485 <_sidata+0x8010e5>
1c005889:	541c0021 	bl	8657920(0x841c00) # 1c847489 <_sidata+0x8410e9>
1c00588d:	541c0021 	bl	8657920(0x841c00) # 1c84748d <_sidata+0x8410ed>
1c005891:	541c0021 	bl	8657920(0x841c00) # 1c847491 <_sidata+0x8410f1>
1c005895:	541c0021 	bl	8657920(0x841c00) # 1c847495 <_sidata+0x8410f5>
1c005899:	541c0021 	bl	8657920(0x841c00) # 1c847499 <_sidata+0x8410f9>
1c00589d:	541c0021 	bl	8657920(0x841c00) # 1c84749d <_sidata+0x8410fd>
1c0058a1:	541c0021 	bl	8657920(0x841c00) # 1c8474a1 <_sidata+0x841101>
1c0058a5:	541c0021 	bl	8657920(0x841c00) # 1c8474a5 <_sidata+0x841105>
1c0058a9:	541c0021 	bl	8657920(0x841c00) # 1c8474a9 <_sidata+0x841109>
1c0058ad:	541c0021 	bl	8657920(0x841c00) # 1c8474ad <_sidata+0x84110d>
1c0058b1:	541c0021 	bl	8657920(0x841c00) # 1c8474b1 <_sidata+0x841111>
1c0058b5:	541c0021 	bl	8657920(0x841c00) # 1c8474b5 <_sidata+0x841115>
1c0058b9:	541c0021 	bl	8657920(0x841c00) # 1c8474b9 <_sidata+0x841119>
1c0058bd:	541c0021 	bl	8657920(0x841c00) # 1c8474bd <_sidata+0x84111d>
1c0058c1:	541c0021 	bl	8657920(0x841c00) # 1c8474c1 <_sidata+0x841121>
1c0058c5:	541c0021 	bl	8657920(0x841c00) # 1c8474c5 <_sidata+0x841125>
1c0058c9:	541c0021 	bl	8657920(0x841c00) # 1c8474c9 <_sidata+0x841129>
1c0058cd:	541c0021 	bl	8657920(0x841c00) # 1c8474cd <_sidata+0x84112d>
1c0058d1:	541c0021 	bl	8657920(0x841c00) # 1c8474d1 <_sidata+0x841131>
1c0058d5:	541c0021 	bl	8657920(0x841c00) # 1c8474d5 <_sidata+0x841135>
1c0058d9:	541c0021 	bl	8657920(0x841c00) # 1c8474d9 <_sidata+0x841139>
1c0058dd:	541c0021 	bl	8657920(0x841c00) # 1c8474dd <_sidata+0x84113d>
1c0058e1:	541c0021 	bl	8657920(0x841c00) # 1c8474e1 <_sidata+0x841141>
1c0058e5:	541c0021 	bl	8657920(0x841c00) # 1c8474e5 <_sidata+0x841145>
1c0058e9:	541c0021 	bl	8657920(0x841c00) # 1c8474e9 <_sidata+0x841149>
1c0058ed:	541c0021 	bl	8657920(0x841c00) # 1c8474ed <_sidata+0x84114d>
1c0058f1:	541c0021 	bl	8657920(0x841c00) # 1c8474f1 <_sidata+0x841151>
1c0058f5:	541c0021 	bl	8657920(0x841c00) # 1c8474f5 <_sidata+0x841155>
1c0058f9:	541c0021 	bl	8657920(0x841c00) # 1c8474f9 <_sidata+0x841159>
1c0058fd:	541c0021 	bl	8657920(0x841c00) # 1c8474fd <_sidata+0x84115d>
1c005901:	541c0021 	bl	8657920(0x841c00) # 1c847501 <_sidata+0x841161>
1c005905:	541c0021 	bl	8657920(0x841c00) # 1c847505 <_sidata+0x841165>
1c005909:	541c0021 	bl	8657920(0x841c00) # 1c847509 <_sidata+0x841169>
1c00590d:	541c0021 	bl	8657920(0x841c00) # 1c84750d <_sidata+0x84116d>
1c005911:	541c0021 	bl	8657920(0x841c00) # 1c847511 <_sidata+0x841171>
1c005915:	541c0021 	bl	8657920(0x841c00) # 1c847515 <_sidata+0x841175>
1c005919:	541c0021 	bl	8657920(0x841c00) # 1c847519 <_sidata+0x841179>
1c00591d:	541c0021 	bl	8657920(0x841c00) # 1c84751d <_sidata+0x84117d>
1c005921:	541c0021 	bl	8657920(0x841c00) # 1c847521 <_sidata+0x841181>
1c005925:	c81c0021 	0xc81c0021
1c005929:	f01c001f 	0xf01c001f
1c00592d:	581c001e 	beq	$r0,$r30,7168(0x1c00) # 1c00752d <_sidata+0x118d>
1c005931:	541c001f 	bl	8133632(0x7c1c00) # 1c7c7531 <_sidata+0x7c1191>
1c005935:	541c0021 	bl	8657920(0x841c00) # 1c847535 <_sidata+0x841195>
1c005939:	541c0021 	bl	8657920(0x841c00) # 1c847539 <_sidata+0x841199>
1c00593d:	541c0021 	bl	8657920(0x841c00) # 1c84753d <_sidata+0x84119d>
1c005941:	541c0021 	bl	8657920(0x841c00) # 1c847541 <_sidata+0x8411a1>
1c005945:	541c0021 	bl	8657920(0x841c00) # 1c847545 <_sidata+0x8411a5>
1c005949:	541c0021 	bl	8657920(0x841c00) # 1c847549 <_sidata+0x8411a9>
1c00594d:	541c0021 	bl	8657920(0x841c00) # 1c84754d <_sidata+0x8411ad>
1c005951:	541c0021 	bl	8657920(0x841c00) # 1c847551 <_sidata+0x8411b1>
1c005955:	541c0021 	bl	8657920(0x841c00) # 1c847555 <_sidata+0x8411b5>
1c005959:	901c0021 	0x901c0021
1c00595d:	001c001f 	mul.w	$r31,$r0,$r0
1c005961:	541c0020 	bl	8395776(0x801c00) # 1c807561 <_sidata+0x8011c1>
1c005965:	541c0021 	bl	8657920(0x841c00) # 1c847565 <_sidata+0x8411c5>
1c005969:	c41c0021 	0xc41c0021
1c00596d:	541c001e 	bl	7871488(0x781c00) # 1c78756d <_sidata+0x7811cd>
1c005971:	201c0021 	ll.w	$r1,$r1,7168(0x1c00)
1c005975:	541c001f 	bl	8133632(0x7c1c00) # 1c7c7575 <_sidata+0x7c11d5>
1c005979:	541c0021 	bl	8657920(0x841c00) # 1c847579 <_sidata+0x8411d9>
1c00597d:	001c0021 	mul.w	$r1,$r1,$r0
1c005981:	2c1c0020 	vld	$vr0,$r1,1792(0x700)
1c005985:	501c0024 	b	9444352(0x901c00) # 1c907585 <_sidata+0x9011e5>
1c005989:	501c0025 	b	9706496(0x941c00) # 1c947589 <_sidata+0x9411e9>
1c00598d:	501c0025 	b	9706496(0x941c00) # 1c94758d <_sidata+0x9411ed>
1c005991:	501c0025 	b	9706496(0x941c00) # 1c947591 <_sidata+0x9411f1>
1c005995:	501c0025 	b	9706496(0x941c00) # 1c947595 <_sidata+0x9411f5>
1c005999:	501c0025 	b	9706496(0x941c00) # 1c947599 <_sidata+0x9411f9>
1c00599d:	501c0025 	b	9706496(0x941c00) # 1c94759d <_sidata+0x9411fd>
1c0059a1:	501c0025 	b	9706496(0x941c00) # 1c9475a1 <_sidata+0x941201>
1c0059a5:	501c0025 	b	9706496(0x941c00) # 1c9475a5 <_sidata+0x941205>
1c0059a9:	501c0025 	b	9706496(0x941c00) # 1c9475a9 <_sidata+0x941209>
1c0059ad:	4c1c0025 	jirl	$r5,$r1,7168(0x1c00)
1c0059b1:	d41c0024 	0xd41c0024
1c0059b5:	d41c0024 	0xd41c0024
1c0059b9:	d41c0024 	0xd41c0024
1c0059bd:	d41c0024 	0xd41c0024
1c0059c1:	d41c0024 	0xd41c0024
1c0059c5:	d41c0024 	0xd41c0024
1c0059c9:	d41c0024 	0xd41c0024
1c0059cd:	d41c0024 	0xd41c0024
1c0059d1:	d41c0024 	0xd41c0024
1c0059d5:	501c0024 	b	9444352(0x901c00) # 1c9075d5 <_sidata+0x901235>
1c0059d9:	501c0025 	b	9706496(0x941c00) # 1c9475d9 <_sidata+0x941239>
1c0059dd:	501c0025 	b	9706496(0x941c00) # 1c9475dd <_sidata+0x94123d>
1c0059e1:	501c0025 	b	9706496(0x941c00) # 1c9475e1 <_sidata+0x941241>
1c0059e5:	501c0025 	b	9706496(0x941c00) # 1c9475e5 <_sidata+0x941245>
1c0059e9:	501c0025 	b	9706496(0x941c00) # 1c9475e9 <_sidata+0x941249>
1c0059ed:	501c0025 	b	9706496(0x941c00) # 1c9475ed <_sidata+0x94124d>
1c0059f1:	501c0025 	b	9706496(0x941c00) # 1c9475f1 <_sidata+0x941251>
1c0059f5:	501c0025 	b	9706496(0x941c00) # 1c9475f5 <_sidata+0x941255>
1c0059f9:	501c0025 	b	9706496(0x941c00) # 1c9475f9 <_sidata+0x941259>
1c0059fd:	501c0025 	b	9706496(0x941c00) # 1c9475fd <_sidata+0x94125d>
1c005a01:	501c0025 	b	9706496(0x941c00) # 1c947601 <_sidata+0x941261>
1c005a05:	501c0025 	b	9706496(0x941c00) # 1c947605 <_sidata+0x941265>
1c005a09:	501c0025 	b	9706496(0x941c00) # 1c947609 <_sidata+0x941269>
1c005a0d:	501c0025 	b	9706496(0x941c00) # 1c94760d <_sidata+0x94126d>
1c005a11:	501c0025 	b	9706496(0x941c00) # 1c947611 <_sidata+0x941271>
1c005a15:	501c0025 	b	9706496(0x941c00) # 1c947615 <_sidata+0x941275>
1c005a19:	501c0025 	b	9706496(0x941c00) # 1c947619 <_sidata+0x941279>
1c005a1d:	501c0025 	b	9706496(0x941c00) # 1c94761d <_sidata+0x94127d>
1c005a21:	501c0025 	b	9706496(0x941c00) # 1c947621 <_sidata+0x941281>
1c005a25:	501c0025 	b	9706496(0x941c00) # 1c947625 <_sidata+0x941285>
1c005a29:	501c0025 	b	9706496(0x941c00) # 1c947629 <_sidata+0x941289>
1c005a2d:	501c0025 	b	9706496(0x941c00) # 1c94762d <_sidata+0x94128d>
1c005a31:	501c0025 	b	9706496(0x941c00) # 1c947631 <_sidata+0x941291>
1c005a35:	501c0025 	b	9706496(0x941c00) # 1c947635 <_sidata+0x941295>
1c005a39:	501c0025 	b	9706496(0x941c00) # 1c947639 <_sidata+0x941299>
1c005a3d:	501c0025 	b	9706496(0x941c00) # 1c94763d <_sidata+0x94129d>
1c005a41:	501c0025 	b	9706496(0x941c00) # 1c947641 <_sidata+0x9412a1>
1c005a45:	501c0025 	b	9706496(0x941c00) # 1c947645 <_sidata+0x9412a5>
1c005a49:	501c0025 	b	9706496(0x941c00) # 1c947649 <_sidata+0x9412a9>
1c005a4d:	e81c0025 	0xe81c0025
1c005a51:	501c0023 	b	9182208(0x8c1c00) # 1c8c7651 <_sidata+0x8c12b1>
1c005a55:	501c0025 	b	9706496(0x941c00) # 1c947655 <_sidata+0x9412b5>
1c005a59:	501c0025 	b	9706496(0x941c00) # 1c947659 <_sidata+0x9412b9>
1c005a5d:	501c0025 	b	9706496(0x941c00) # 1c94765d <_sidata+0x9412bd>
1c005a61:	501c0025 	b	9706496(0x941c00) # 1c947661 <_sidata+0x9412c1>
1c005a65:	501c0025 	b	9706496(0x941c00) # 1c947665 <_sidata+0x9412c5>
1c005a69:	501c0025 	b	9706496(0x941c00) # 1c947669 <_sidata+0x9412c9>
1c005a6d:	501c0025 	b	9706496(0x941c00) # 1c94766d <_sidata+0x9412cd>
1c005a71:	501c0025 	b	9706496(0x941c00) # 1c947671 <_sidata+0x9412d1>
1c005a75:	a41c0025 	0xa41c0025
1c005a79:	a01c0023 	0xa01c0023
1c005a7d:	1c1c0022 	pcaddu12i	$r2,57345(0xe001)
1c005a81:	501c0023 	b	9182208(0x8c1c00) # 1c8c7681 <_sidata+0x8c12e1>
1c005a85:	501c0025 	b	9706496(0x941c00) # 1c947685 <_sidata+0x9412e5>
1c005a89:	501c0025 	b	9706496(0x941c00) # 1c947689 <_sidata+0x9412e9>
1c005a8d:	501c0025 	b	9706496(0x941c00) # 1c94768d <_sidata+0x9412ed>
1c005a91:	501c0025 	b	9706496(0x941c00) # 1c947691 <_sidata+0x9412f1>
1c005a95:	501c0025 	b	9706496(0x941c00) # 1c947695 <_sidata+0x9412f5>
1c005a99:	501c0025 	b	9706496(0x941c00) # 1c947699 <_sidata+0x9412f9>
1c005a9d:	501c0025 	b	9706496(0x941c00) # 1c94769d <_sidata+0x9412fd>
1c005aa1:	501c0025 	b	9706496(0x941c00) # 1c9476a1 <_sidata+0x941301>
1c005aa5:	501c0025 	b	9706496(0x941c00) # 1c9476a5 <_sidata+0x941305>
1c005aa9:	601c0025 	blt	$r1,$r5,7168(0x1c00) # 1c0076a9 <_sidata+0x1309>
1c005aad:	e81c0023 	0xe81c0023
1c005ab1:	501c0023 	b	9182208(0x8c1c00) # 1c8c76b1 <_sidata+0x8c1311>
1c005ab5:	501c0025 	b	9706496(0x941c00) # 1c9476b5 <_sidata+0x941315>
1c005ab9:	6c1c0025 	bgeu	$r1,$r5,7168(0x1c00) # 1c0076b9 <_sidata+0x1319>
1c005abd:	501c0022 	b	8920064(0x881c00) # 1c8876bd <_sidata+0x88131d>
1c005ac1:	d81c0025 	0xd81c0025
1c005ac5:	501c0022 	b	8920064(0x881c00) # 1c8876c5 <_sidata+0x881325>
1c005ac9:	501c0025 	b	9706496(0x941c00) # 1c9476c9 <_sidata+0x941329>
1c005acd:	e81c0025 	0xe81c0025
1c005ad1:	0a1c0023 	xvfmadd.s	$xr3,$xr1,$xr0,$xr24
1c005ad5:	7c000000 	0x7c000000
1c005ad9:	7c7c7c7c 	0x7c7c7c7c
1c005add:	7c7c7c7c 	0x7c7c7c7c
1c005ae1:	7c7c7c7c 	0x7c7c7c7c
1c005ae5:	7c7c7c7c 	0x7c7c7c7c
1c005ae9:	7c7c7c7c 	0x7c7c7c7c
1c005aed:	7c7c7c7c 	0x7c7c7c7c
1c005af1:	7c7c7c7c 	0x7c7c7c7c
1c005af5:	7c7c7c7c 	0x7c7c7c7c
1c005af9:	7c7c7c7c 	0x7c7c7c7c
1c005afd:	7c7c7c7c 	0x7c7c7c7c
1c005b01:	7c7c7c7c 	0x7c7c7c7c
1c005b05:	7c7c7c7c 	0x7c7c7c7c
1c005b09:	7c7c7c7c 	0x7c7c7c7c
1c005b0d:	7c7c7c7c 	0x7c7c7c7c
1c005b11:	7c7c7c7c 	0x7c7c7c7c
1c005b15:	7c7c7c7c 	0x7c7c7c7c
1c005b19:	7c7c7c7c 	0x7c7c7c7c
1c005b1d:	7c7c7c7c 	0x7c7c7c7c
1c005b21:	7c7c7c7c 	0x7c7c7c7c
1c005b25:	7c7c7c7c 	0x7c7c7c7c
1c005b29:	7c7c7c7c 	0x7c7c7c7c
1c005b2d:	7c7c7c7c 	0x7c7c7c7c
1c005b31:	7c7c7c7c 	0x7c7c7c7c
1c005b35:	7c7c7c7c 	0x7c7c7c7c
1c005b39:	7c00000a 	0x7c00000a
1c005b3d:	7c20207c 	0x7c20207c
1c005b41:	7c7c7c7c 	0x7c7c7c7c
1c005b45:	7c7c7c7c 	0x7c7c7c7c
1c005b49:	20202020 	ll.w	$r0,$r1,8224(0x2020)
1c005b4d:	7c202020 	0x7c202020
1c005b51:	7c7c7c7c 	0x7c7c7c7c
1c005b55:	20202020 	ll.w	$r0,$r1,8224(0x2020)
1c005b59:	7c202020 	0x7c202020
1c005b5d:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005b61:	7c7c2020 	0x7c7c2020
1c005b65:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005b69:	7c7c7c20 	0x7c7c7c20
1c005b6d:	20207c7c 	ll.w	$r28,$r3,8316(0x207c)
1c005b71:	20202020 	ll.w	$r0,$r1,8224(0x2020)
1c005b75:	7c7c7c7c 	0x7c7c7c7c
1c005b79:	2020207c 	ll.w	$r28,$r3,8224(0x2020)
1c005b7d:	20202020 	ll.w	$r0,$r1,8224(0x2020)
1c005b81:	7c7c7c7c 	0x7c7c7c7c
1c005b85:	2020207c 	ll.w	$r28,$r3,8224(0x2020)
1c005b89:	20202020 	ll.w	$r0,$r1,8224(0x2020)
1c005b8d:	7c7c7c7c 	0x7c7c7c7c
1c005b91:	7c202020 	0x7c202020
1c005b95:	7c7c7c7c 	0x7c7c7c7c
1c005b99:	7c7c2020 	0x7c7c2020
1c005b9d:	7c00000a 	0x7c00000a
1c005ba1:	7c20207c 	0x7c20207c
1c005ba5:	7c7c7c7c 	0x7c7c7c7c
1c005ba9:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005bad:	7c7c2020 	0x7c7c2020
1c005bb1:	20207c7c 	ll.w	$r28,$r3,8316(0x207c)
1c005bb5:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005bb9:	7c7c2020 	0x7c7c2020
1c005bbd:	20207c7c 	ll.w	$r28,$r3,8316(0x207c)
1c005bc1:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005bc5:	7c202020 	0x7c202020
1c005bc9:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005bcd:	7c7c7c20 	0x7c7c7c20
1c005bd1:	7c20207c 	0x7c20207c
1c005bd5:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005bd9:	7c7c7c20 	0x7c7c7c20
1c005bdd:	7c202020 	0x7c202020
1c005be1:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005be5:	7c7c7c20 	0x7c7c7c20
1c005be9:	7c202020 	0x7c202020
1c005bed:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005bf1:	7c7c7c20 	0x7c7c7c20
1c005bf5:	20202020 	ll.w	$r0,$r1,8224(0x2020)
1c005bf9:	7c7c7c7c 	0x7c7c7c7c
1c005bfd:	7c7c2020 	0x7c7c2020
1c005c01:	7c00000a 	0x7c00000a
1c005c05:	7c20207c 	0x7c20207c
1c005c09:	7c7c7c7c 	0x7c7c7c7c
1c005c0d:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005c11:	7c7c7c20 	0x7c7c7c20
1c005c15:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005c19:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005c1d:	7c7c7c20 	0x7c7c7c20
1c005c21:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005c25:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005c29:	20207c20 	ll.w	$r0,$r1,8316(0x207c)
1c005c2d:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005c31:	7c7c7c20 	0x7c7c7c20
1c005c35:	7c7c2020 	0x7c7c2020
1c005c39:	7c7c7c7c 	0x7c7c7c7c
1c005c3d:	7c7c7c7c 	0x7c7c7c7c
1c005c41:	20207c7c 	ll.w	$r28,$r3,8316(0x207c)
1c005c45:	7c7c7c20 	0x7c7c7c20
1c005c49:	7c7c7c7c 	0x7c7c7c7c
1c005c4d:	7c7c2020 	0x7c7c2020
1c005c51:	7c7c7c7c 	0x7c7c7c7c
1c005c55:	7c7c7c20 	0x7c7c7c20
1c005c59:	207c2020 	ll.w	$r0,$r1,31776(0x7c20)
1c005c5d:	7c7c7c20 	0x7c7c7c20
1c005c61:	7c7c2020 	0x7c7c2020
1c005c65:	7c00000a 	0x7c00000a
1c005c69:	7c20207c 	0x7c20207c
1c005c6d:	7c7c7c7c 	0x7c7c7c7c
1c005c71:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005c75:	7c7c7c20 	0x7c7c7c20
1c005c79:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005c7d:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005c81:	7c7c7c20 	0x7c7c7c20
1c005c85:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005c89:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005c8d:	207c7c20 	ll.w	$r0,$r1,31868(0x7c7c)
1c005c91:	207c7c20 	ll.w	$r0,$r1,31868(0x7c7c)
1c005c95:	7c7c7c20 	0x7c7c7c20
1c005c99:	7c7c2020 	0x7c7c2020
1c005c9d:	2020207c 	ll.w	$r28,$r3,8224(0x2020)
1c005ca1:	7c7c7c20 	0x7c7c7c20
1c005ca5:	7c7c7c7c 	0x7c7c7c7c
1c005ca9:	20202020 	ll.w	$r0,$r1,8224(0x2020)
1c005cad:	7c7c7c7c 	0x7c7c7c7c
1c005cb1:	7c7c2020 	0x7c7c2020
1c005cb5:	7c7c7c7c 	0x7c7c7c7c
1c005cb9:	7c7c7c20 	0x7c7c7c20
1c005cbd:	7c7c2020 	0x7c7c2020
1c005cc1:	7c7c2020 	0x7c7c2020
1c005cc5:	7c7c2020 	0x7c7c2020
1c005cc9:	7c00000a 	0x7c00000a
1c005ccd:	7c20207c 	0x7c20207c
1c005cd1:	7c7c7c7c 	0x7c7c7c7c
1c005cd5:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005cd9:	7c7c7c20 	0x7c7c7c20
1c005cdd:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005ce1:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005ce5:	7c7c7c20 	0x7c7c7c20
1c005ce9:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005ced:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005cf1:	7c7c7c20 	0x7c7c7c20
1c005cf5:	207c2020 	ll.w	$r0,$r1,31776(0x7c20)
1c005cf9:	7c7c7c20 	0x7c7c7c20
1c005cfd:	7c7c2020 	0x7c7c2020
1c005d01:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005d05:	7c7c7c20 	0x7c7c7c20
1c005d09:	7c7c7c7c 	0x7c7c7c7c
1c005d0d:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005d11:	7c7c7c20 	0x7c7c7c20
1c005d15:	7c7c2020 	0x7c7c2020
1c005d19:	7c7c7c7c 	0x7c7c7c7c
1c005d1d:	7c7c7c20 	0x7c7c7c20
1c005d21:	7c7c2020 	0x7c7c2020
1c005d25:	7c20207c 	0x7c20207c
1c005d29:	7c7c2020 	0x7c7c2020
1c005d2d:	7c00000a 	0x7c00000a
1c005d31:	7c20207c 	0x7c20207c
1c005d35:	7c7c7c7c 	0x7c7c7c7c
1c005d39:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005d3d:	7c7c2020 	0x7c7c2020
1c005d41:	20207c7c 	ll.w	$r28,$r3,8316(0x207c)
1c005d45:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005d49:	7c7c2020 	0x7c7c2020
1c005d4d:	20207c7c 	ll.w	$r28,$r3,8316(0x207c)
1c005d51:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005d55:	7c7c7c20 	0x7c7c7c20
1c005d59:	2020207c 	ll.w	$r28,$r3,8224(0x2020)
1c005d5d:	7c7c7c20 	0x7c7c7c20
1c005d61:	7c202020 	0x7c202020
1c005d65:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005d69:	7c7c7c20 	0x7c7c7c20
1c005d6d:	7c202020 	0x7c202020
1c005d71:	20207c7c 	ll.w	$r28,$r3,8316(0x207c)
1c005d75:	7c7c7c7c 	0x7c7c7c7c
1c005d79:	7c202020 	0x7c202020
1c005d7d:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005d81:	7c7c7c20 	0x7c7c7c20
1c005d85:	7c7c2020 	0x7c7c2020
1c005d89:	20207c7c 	ll.w	$r28,$r3,8316(0x207c)
1c005d8d:	7c7c2020 	0x7c7c2020
1c005d91:	7c00000a 	0x7c00000a
1c005d95:	2020207c 	ll.w	$r28,$r3,8224(0x2020)
1c005d99:	20202020 	ll.w	$r0,$r1,8224(0x2020)
1c005d9d:	7c7c7c7c 	0x7c7c7c7c
1c005da1:	20202020 	ll.w	$r0,$r1,8224(0x2020)
1c005da5:	7c202020 	0x7c202020
1c005da9:	7c7c7c7c 	0x7c7c7c7c
1c005dad:	20202020 	ll.w	$r0,$r1,8224(0x2020)
1c005db1:	7c202020 	0x7c202020
1c005db5:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005db9:	7c7c7c20 	0x7c7c7c20
1c005dbd:	20207c7c 	ll.w	$r28,$r3,8316(0x207c)
1c005dc1:	7c7c7c20 	0x7c7c7c20
1c005dc5:	2020207c 	ll.w	$r28,$r3,8224(0x2020)
1c005dc9:	20202020 	ll.w	$r0,$r1,8224(0x2020)
1c005dcd:	7c7c7c7c 	0x7c7c7c7c
1c005dd1:	2020207c 	ll.w	$r28,$r3,8224(0x2020)
1c005dd5:	7c202020 	0x7c202020
1c005dd9:	7c7c7c7c 	0x7c7c7c7c
1c005ddd:	2020207c 	ll.w	$r28,$r3,8224(0x2020)
1c005de1:	20202020 	ll.w	$r0,$r1,8224(0x2020)
1c005de5:	7c7c7c7c 	0x7c7c7c7c
1c005de9:	7c7c2020 	0x7c7c2020
1c005ded:	207c7c7c 	ll.w	$r28,$r3,31868(0x7c7c)
1c005df1:	7c7c2020 	0x7c7c2020
1c005df5:	7c00000a 	0x7c00000a
1c005df9:	7c7c7c7c 	0x7c7c7c7c
1c005dfd:	7c7c7c7c 	0x7c7c7c7c
1c005e01:	7c7c7c7c 	0x7c7c7c7c
1c005e05:	7c7c7c7c 	0x7c7c7c7c
1c005e09:	7c7c7c7c 	0x7c7c7c7c
1c005e0d:	7c7c7c7c 	0x7c7c7c7c
1c005e11:	7c7c7c7c 	0x7c7c7c7c
1c005e15:	7c7c7c7c 	0x7c7c7c7c
1c005e19:	7c7c7c7c 	0x7c7c7c7c
1c005e1d:	325b7c7c 	xvldrepl.h	$xr28,$r3,-578(0xdbe)
1c005e21:	20303230 	ll.w	$r16,$r17,12336(0x3030)
1c005e25:	4e4f4f4c 	jirl	$r12,$r26,-110772(0x24f4c)
1c005e29:	4e4f5347 	jirl	$r7,$r26,-110768(0x24f50)
1c005e2d:	7c7c7c5d 	0x7c7c7c5d
1c005e31:	7c7c7c7c 	0x7c7c7c7c
1c005e35:	7c7c7c7c 	0x7c7c7c7c
1c005e39:	7c7c7c7c 	0x7c7c7c7c
1c005e3d:	7c7c7c7c 	0x7c7c7c7c
1c005e41:	7c7c7c7c 	0x7c7c7c7c
1c005e45:	7c7c7c7c 	0x7c7c7c7c
1c005e49:	7c7c7c7c 	0x7c7c7c7c
1c005e4d:	7c7c7c7c 	0x7c7c7c7c
1c005e51:	7c7c7c7c 	0x7c7c7c7c
1c005e55:	7c7c7c7c 	0x7c7c7c7c
1c005e59:	0900000a 	0x0900000a
1c005e5d:	0a006425 	0x0a006425
1c005e61:	0d000000 	fsel	$f0,$f0,$f0,$fcc0
1c005e65:	776f440a 	xvssrarni.du.q	$xr10,$xr0,0x51
1c005e69:	0d00006e 	fsel	$f14,$f3,$f0,$fcc0
1c005e6d:	0050550a 	0x0050550a
1c005e71:	0d000000 	fsel	$f0,$f0,$f0,$fcc0
1c005e75:	6c754d0a 	bgeu	$r8,$r10,30028(0x754c) # 1c00d3c1 <_sidata+0x7021>
1c005e79:	776f4469 	xvssrarni.du.q	$xr9,$xr3,0x51
1c005e7d:	0d00006e 	fsel	$f14,$f3,$f0,$fcc0
1c005e81:	756f430a 	0x756f430a
1c005e85:	4f20746e 	jirl	$r14,$r3,-57228(0x32074)
1c005e89:	0d000056 	fsel	$f22,$f2,$f0,$fcc0
1c005e8d:	3030090a 	0x3030090a
1c005e91:	09313009 	0x09313009
1c005e95:	30093230 	0x30093230
1c005e99:	34300933 	0x34300933
1c005e9d:	09353009 	0x09353009
1c005ea1:	30093630 	0x30093630
1c005ea5:	38300937 	fldx.s	$f23,$r9,$r2
1c005ea9:	09393009 	0x09393009
1c005ead:	31093031 	0x31093031
1c005eb1:	0d000031 	fsel	$f17,$f1,$f0,$fcc0
1c005eb5:	746e630a 	0x746e630a
1c005eb9:	09000000 	0x09000000
1c005ebd:	00643425 	bstrins.w	$r5,$r1,0x4,0xd
1c005ec1:	0d000000 	fsel	$f0,$f0,$f0,$fcc0
1c005ec5:	7361420a 	vssrani.w.d	$vr10,$vr16,0x10
1c005ec9:	6c615665 	bgeu	$r19,$r5,24916(0x6154) # 1c00c01d <_sidata+0x5c7d>
1c005ecd:	0d000000 	fsel	$f0,$f0,$f0,$fcc0
1c005ed1:	6275530a 	blt	$r24,$r10,-101040(0x27550) # 1bfed421 <_start-0x12bdf>
1c005ed5:	006c6156 	bstrins.w	$r22,$r10,0xc,0x18
1c005ed9:	09000000 	0x09000000
1c005edd:	00643225 	bstrins.w	$r5,$r17,0x4,0xc
1c005ee1:	09000000 	0x09000000
1c005ee5:	00643325 	bstrins.w	$r5,$r25,0x4,0xc
1c005ee9:	0d000000 	fsel	$f0,$f0,$f0,$fcc0
1c005eed:	203c200a 	ll.w	$r10,$r0,15392(0x3c20)
1c005ef1:	3a515249 	0x3a515249
1c005ef5:	20642520 	ll.w	$r0,$r9,25636(0x6424)
1c005ef9:	636e7566 	blt	$r11,$r6,-37260(0x36e74) # 1bffcd6d <_start-0x3293>
1c005efd:	2073253a 	ll.w	$r26,$r9,29476(0x7324)
1c005f01:	0d3e2020 	0x0d3e2020
1c005f05:	0a00000a 	0x0a00000a
1c005f09:	2e2e2e2e 	0x2e2e2e2e
1c005f0d:	2e2e2e2e 	0x2e2e2e2e
1c005f11:	2e2e2e2e 	0x2e2e2e2e
1c005f15:	464f532e 	bnez	$r25,3821392(0x3a4f50) # 1c3aae65 <_sidata+0x3a4ac5>
1c005f19:	4e495f54 	jirl	$r20,$r26,-112292(0x2495c)
1c005f1d:	2e2e2e54 	0x2e2e2e54
1c005f21:	2e2e2e2e 	0x2e2e2e2e
1c005f25:	2e2e2e2e 	0x2e2e2e2e
1c005f29:	0a2e2e2e 	xvfmadd.d	$xr14,$xr17,$xr11,$xr28
1c005f2d:	0d00000d 	fsel	$f13,$f0,$f0,$fcc0
1c005f31:	2e2e2e0a 	0x2e2e2e0a
1c005f35:	2e2e2e2e 	0x2e2e2e2e
1c005f39:	2e2e2e2e 	0x2e2e2e2e
1c005f3d:	41422e2e 	beqz	$r17,3752492(0x39422c) # 1c39a169 <_sidata+0x393dc9>
1c005f41:	41465f54 	beqz	$r26,-3062180(0x51465c) # 1bd1a59d <_start-0x2e5a63>
1c005f45:	2e2e4c49 	0x2e2e4c49
1c005f49:	2e2e2e2e 	0x2e2e2e2e
1c005f4d:	2e2e2e2e 	0x2e2e2e2e
1c005f51:	2e2e2e2e 	0x2e2e2e2e
1c005f55:	0d000a0d 	fsel	$f13,$f16,$f2,$fcc0
1c005f59:	2e2e2e0a 	0x2e2e2e0a
1c005f5d:	2e2e2e2e 	0x2e2e2e2e
1c005f61:	2e2e2e2e 	0x2e2e2e2e
1c005f65:	44412e2e 	bnez	$r17,3686700(0x38412c) # 1c38a091 <_sidata+0x383cf1>
1c005f69:	2e2e2e43 	0x2e2e2e43
1c005f6d:	2e2e2e2e 	0x2e2e2e2e
1c005f71:	2e2e2e2e 	0x2e2e2e2e
1c005f75:	0d2e2e2e 	xvbitsel.v	$xr14,$xr17,$xr11,$xr28
1c005f79:	5000000a 	b	2621440(0x280000) # 1c285f79 <_sidata+0x27fbd9>
1c005f7d:	70697265 	vavgr.w	$vr5,$vr19,$vr28
1c005f81:	61726568 	blt	$r11,$r8,94820(0x17264) # 1c01d1e5 <_sidata+0x16e45>
1c005f85:	5420736c 	bl	-38789008(0xdb02070) # 19b07ff5 <_start-0x24f800b>
1c005f89:	72656d69 	0x72656d69
1c005f8d:	656c6320 	bge	$r25,$r0,93280(0x16c60) # 1c01cbed <_sidata+0x1684d>
1c005f91:	69207261 	bltu	$r19,$r1,73840(0x12070) # 1c018001 <_sidata+0x11c61>
1c005f95:	7265746e 	0x7265746e
1c005f99:	74707572 	xvmax.b	$xr18,$xr11,$xr29
1c005f9d:	0a0d2e2e 	0x0a0d2e2e
1c005fa1:	43000000 	beqz	$r0,196608(0x30000) # 1c035fa1 <_sidata+0x2fc01>
1c005fa5:	2065726f 	ll.w	$r15,$r19,25968(0x6570)
1c005fa9:	656d6954 	bge	$r10,$r20,93544(0x16d68) # 1c01cd11 <_sidata+0x16971>
1c005fad:	6c632072 	bgeu	$r3,$r18,25376(0x6320) # 1c00c2cd <_sidata+0x5f2d>
1c005fb1:	20726165 	ll.w	$r5,$r11,29280(0x7260)
1c005fb5:	65746e69 	bge	$r19,$r9,95340(0x1746c) # 1c01d421 <_sidata+0x17081>
1c005fb9:	70757272 	vmax.wu	$vr18,$vr19,$vr28
1c005fbd:	0d2e2e74 	xvbitsel.v	$xr20,$xr19,$xr11,$xr28
1c005fc1:	 	0x3000000a

1c005fc4 <Ext_IrqHandle>:
1c005fc4:	1c004130 	pcaddu12i	$r16,521(0x209)
1c005fc8:	1c00417c 	pcaddu12i	$r28,523(0x20b)
1c005fcc:	1c0041c8 	pcaddu12i	$r8,526(0x20e)
1c005fd0:	1c004214 	pcaddu12i	$r20,528(0x210)
1c005fd4:	1c004260 	pcaddu12i	$r0,531(0x213)
1c005fd8:	1c0042ac 	pcaddu12i	$r12,533(0x215)
1c005fdc:	1c0042f8 	pcaddu12i	$r24,535(0x217)
1c005fe0:	1c004344 	pcaddu12i	$r4,538(0x21a)
1c005fe4:	1c004390 	pcaddu12i	$r16,540(0x21c)
1c005fe8:	1c0043dc 	pcaddu12i	$r28,542(0x21e)
1c005fec:	1c004428 	pcaddu12i	$r8,545(0x221)
1c005ff0:	1c004474 	pcaddu12i	$r20,547(0x223)
1c005ff4:	1c0044c0 	pcaddu12i	$r0,550(0x226)
1c005ff8:	1c00450c 	pcaddu12i	$r12,552(0x228)
1c005ffc:	1c004558 	pcaddu12i	$r24,554(0x22a)
1c006000:	1c0045a4 	pcaddu12i	$r4,557(0x22d)
1c006004:	1c0045f0 	pcaddu12i	$r16,559(0x22f)
1c006008:	1c00463c 	pcaddu12i	$r28,561(0x231)
1c00600c:	1c004688 	pcaddu12i	$r8,564(0x234)
1c006010:	1c0046d4 	pcaddu12i	$r20,566(0x236)
1c006014:	1c004720 	pcaddu12i	$r0,569(0x239)
1c006018:	1c00476c 	pcaddu12i	$r12,571(0x23b)
1c00601c:	1c0047b8 	pcaddu12i	$r24,573(0x23d)
1c006020:	1c004804 	pcaddu12i	$r4,576(0x240)
1c006024:	1c004850 	pcaddu12i	$r16,578(0x242)
1c006028:	1c00489c 	pcaddu12i	$r28,580(0x244)
1c00602c:	1c0048e8 	pcaddu12i	$r8,583(0x247)
1c006030:	1c004934 	pcaddu12i	$r20,585(0x249)
1c006034:	1c004980 	pcaddu12i	$r0,588(0x24c)
1c006038:	1c0049cc 	pcaddu12i	$r12,590(0x24e)
1c00603c:	1c004a18 	pcaddu12i	$r24,592(0x250)
1c006040:	1c004a64 	pcaddu12i	$r4,595(0x253)
1c006044:	1c004d48 	pcaddu12i	$r8,618(0x26a)
1c006048:	1c004cf8 	pcaddu12i	$r24,615(0x267)
1c00604c:	1c004d48 	pcaddu12i	$r8,618(0x26a)
1c006050:	1c004d48 	pcaddu12i	$r8,618(0x26a)
1c006054:	1c004d48 	pcaddu12i	$r8,618(0x26a)
1c006058:	1c004d48 	pcaddu12i	$r8,618(0x26a)
1c00605c:	1c004d48 	pcaddu12i	$r8,618(0x26a)
1c006060:	1c004d48 	pcaddu12i	$r8,618(0x26a)
1c006064:	1c004d48 	pcaddu12i	$r8,618(0x26a)
1c006068:	1c004d48 	pcaddu12i	$r8,618(0x26a)
1c00606c:	1c004d48 	pcaddu12i	$r8,618(0x26a)
1c006070:	1c004d48 	pcaddu12i	$r8,618(0x26a)
1c006074:	1c004d48 	pcaddu12i	$r8,618(0x26a)
1c006078:	1c004d48 	pcaddu12i	$r8,618(0x26a)
1c00607c:	1c004d48 	pcaddu12i	$r8,618(0x26a)
1c006080:	1c004d48 	pcaddu12i	$r8,618(0x26a)
1c006084:	1c004d14 	pcaddu12i	$r20,616(0x268)

1c006088 <__FUNCTION__.1573>:
1c006088:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d500 <_sidata+0x17160>
1c00608c:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d0f0 <_sidata+0x16d50>
1c006090:	5f30616f 	bne	$r11,$r15,-53152(0x33060) # 1bff90f0 <_start-0x6f10>
1c006094:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd204 <_start-0x2dfc>
1c006098:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00cef8 <_sidata+0x6b58>
1c00609c:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c0060a0 <__FUNCTION__.1577>:
1c0060a0:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d518 <_sidata+0x17178>
1c0060a4:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d108 <_sidata+0x16d68>
1c0060a8:	5f31616f 	bne	$r11,$r15,-52896(0x33160) # 1bff9208 <_start-0x6df8>
1c0060ac:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd21c <_start-0x2de4>
1c0060b0:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00cf10 <_sidata+0x6b70>
1c0060b4:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c0060b8 <__FUNCTION__.1581>:
1c0060b8:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d530 <_sidata+0x17190>
1c0060bc:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d120 <_sidata+0x16d80>
1c0060c0:	5f32616f 	bne	$r11,$r15,-52640(0x33260) # 1bff9320 <_start-0x6ce0>
1c0060c4:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd234 <_start-0x2dcc>
1c0060c8:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00cf28 <_sidata+0x6b88>
1c0060cc:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c0060d0 <__FUNCTION__.1585>:
1c0060d0:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d548 <_sidata+0x171a8>
1c0060d4:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d138 <_sidata+0x16d98>
1c0060d8:	5f33616f 	bne	$r11,$r15,-52384(0x33360) # 1bff9438 <_start-0x6bc8>
1c0060dc:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd24c <_start-0x2db4>
1c0060e0:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00cf40 <_sidata+0x6ba0>
1c0060e4:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c0060e8 <__FUNCTION__.1589>:
1c0060e8:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d560 <_sidata+0x171c0>
1c0060ec:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d150 <_sidata+0x16db0>
1c0060f0:	5f34616f 	bne	$r11,$r15,-52128(0x33460) # 1bff9550 <_start-0x6ab0>
1c0060f4:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd264 <_start-0x2d9c>
1c0060f8:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00cf58 <_sidata+0x6bb8>
1c0060fc:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c006100 <__FUNCTION__.1593>:
1c006100:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d578 <_sidata+0x171d8>
1c006104:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d168 <_sidata+0x16dc8>
1c006108:	5f35616f 	bne	$r11,$r15,-51872(0x33560) # 1bff9668 <_start-0x6998>
1c00610c:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd27c <_start-0x2d84>
1c006110:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00cf70 <_sidata+0x6bd0>
1c006114:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c006118 <__FUNCTION__.1597>:
1c006118:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d590 <_sidata+0x171f0>
1c00611c:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d180 <_sidata+0x16de0>
1c006120:	5f36616f 	bne	$r11,$r15,-51616(0x33660) # 1bff9780 <_start-0x6880>
1c006124:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd294 <_start-0x2d6c>
1c006128:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00cf88 <_sidata+0x6be8>
1c00612c:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c006130 <__FUNCTION__.1601>:
1c006130:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d5a8 <_sidata+0x17208>
1c006134:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d198 <_sidata+0x16df8>
1c006138:	5f37616f 	bne	$r11,$r15,-51360(0x33760) # 1bff9898 <_start-0x6768>
1c00613c:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd2ac <_start-0x2d54>
1c006140:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00cfa0 <_sidata+0x6c00>
1c006144:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c006148 <__FUNCTION__.1605>:
1c006148:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d5c0 <_sidata+0x17220>
1c00614c:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d1b0 <_sidata+0x16e10>
1c006150:	5f30626f 	bne	$r19,$r15,-53152(0x33060) # 1bff91b0 <_start-0x6e50>
1c006154:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd2c4 <_start-0x2d3c>
1c006158:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00cfb8 <_sidata+0x6c18>
1c00615c:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c006160 <__FUNCTION__.1609>:
1c006160:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d5d8 <_sidata+0x17238>
1c006164:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d1c8 <_sidata+0x16e28>
1c006168:	5f31626f 	bne	$r19,$r15,-52896(0x33160) # 1bff92c8 <_start-0x6d38>
1c00616c:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd2dc <_start-0x2d24>
1c006170:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00cfd0 <_sidata+0x6c30>
1c006174:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c006178 <__FUNCTION__.1613>:
1c006178:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d5f0 <_sidata+0x17250>
1c00617c:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d1e0 <_sidata+0x16e40>
1c006180:	5f32626f 	bne	$r19,$r15,-52640(0x33260) # 1bff93e0 <_start-0x6c20>
1c006184:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd2f4 <_start-0x2d0c>
1c006188:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00cfe8 <_sidata+0x6c48>
1c00618c:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c006190 <__FUNCTION__.1617>:
1c006190:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d608 <_sidata+0x17268>
1c006194:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d1f8 <_sidata+0x16e58>
1c006198:	5f33626f 	bne	$r19,$r15,-52384(0x33360) # 1bff94f8 <_start-0x6b08>
1c00619c:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd30c <_start-0x2cf4>
1c0061a0:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00d000 <_sidata+0x6c60>
1c0061a4:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c0061a8 <__FUNCTION__.1621>:
1c0061a8:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d620 <_sidata+0x17280>
1c0061ac:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d210 <_sidata+0x16e70>
1c0061b0:	5f34626f 	bne	$r19,$r15,-52128(0x33460) # 1bff9610 <_start-0x69f0>
1c0061b4:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd324 <_start-0x2cdc>
1c0061b8:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00d018 <_sidata+0x6c78>
1c0061bc:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c0061c0 <__FUNCTION__.1625>:
1c0061c0:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d638 <_sidata+0x17298>
1c0061c4:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d228 <_sidata+0x16e88>
1c0061c8:	5f35626f 	bne	$r19,$r15,-51872(0x33560) # 1bff9728 <_start-0x68d8>
1c0061cc:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd33c <_start-0x2cc4>
1c0061d0:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00d030 <_sidata+0x6c90>
1c0061d4:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c0061d8 <__FUNCTION__.1629>:
1c0061d8:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d650 <_sidata+0x172b0>
1c0061dc:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d240 <_sidata+0x16ea0>
1c0061e0:	5f36626f 	bne	$r19,$r15,-51616(0x33660) # 1bff9840 <_start-0x67c0>
1c0061e4:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd354 <_start-0x2cac>
1c0061e8:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00d048 <_sidata+0x6ca8>
1c0061ec:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c0061f0 <__FUNCTION__.1633>:
1c0061f0:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d668 <_sidata+0x172c8>
1c0061f4:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d258 <_sidata+0x16eb8>
1c0061f8:	5f37626f 	bne	$r19,$r15,-51360(0x33760) # 1bff9958 <_start-0x66a8>
1c0061fc:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd36c <_start-0x2c94>
1c006200:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00d060 <_sidata+0x6cc0>
1c006204:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c006208 <__FUNCTION__.1637>:
1c006208:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d680 <_sidata+0x172e0>
1c00620c:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d270 <_sidata+0x16ed0>
1c006210:	5f30636f 	bne	$r27,$r15,-53152(0x33060) # 1bff9270 <_start-0x6d90>
1c006214:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd384 <_start-0x2c7c>
1c006218:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00d078 <_sidata+0x6cd8>
1c00621c:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c006220 <__FUNCTION__.1641>:
1c006220:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d698 <_sidata+0x172f8>
1c006224:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d288 <_sidata+0x16ee8>
1c006228:	5f31636f 	bne	$r27,$r15,-52896(0x33160) # 1bff9388 <_start-0x6c78>
1c00622c:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd39c <_start-0x2c64>
1c006230:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00d090 <_sidata+0x6cf0>
1c006234:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c006238 <__FUNCTION__.1645>:
1c006238:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d6b0 <_sidata+0x17310>
1c00623c:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d2a0 <_sidata+0x16f00>
1c006240:	5f32636f 	bne	$r27,$r15,-52640(0x33260) # 1bff94a0 <_start-0x6b60>
1c006244:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd3b4 <_start-0x2c4c>
1c006248:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00d0a8 <_sidata+0x6d08>
1c00624c:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c006250 <__FUNCTION__.1649>:
1c006250:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d6c8 <_sidata+0x17328>
1c006254:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d2b8 <_sidata+0x16f18>
1c006258:	5f33636f 	bne	$r27,$r15,-52384(0x33360) # 1bff95b8 <_start-0x6a48>
1c00625c:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd3cc <_start-0x2c34>
1c006260:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00d0c0 <_sidata+0x6d20>
1c006264:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c006268 <__FUNCTION__.1653>:
1c006268:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d6e0 <_sidata+0x17340>
1c00626c:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d2d0 <_sidata+0x16f30>
1c006270:	5f34636f 	bne	$r27,$r15,-52128(0x33460) # 1bff96d0 <_start-0x6930>
1c006274:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd3e4 <_start-0x2c1c>
1c006278:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00d0d8 <_sidata+0x6d38>
1c00627c:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c006280 <__FUNCTION__.1657>:
1c006280:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d6f8 <_sidata+0x17358>
1c006284:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d2e8 <_sidata+0x16f48>
1c006288:	5f35636f 	bne	$r27,$r15,-51872(0x33560) # 1bff97e8 <_start-0x6818>
1c00628c:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd3fc <_start-0x2c04>
1c006290:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00d0f0 <_sidata+0x6d50>
1c006294:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c006298 <__FUNCTION__.1661>:
1c006298:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d710 <_sidata+0x17370>
1c00629c:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d300 <_sidata+0x16f60>
1c0062a0:	5f36636f 	bne	$r27,$r15,-51616(0x33660) # 1bff9900 <_start-0x6700>
1c0062a4:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd414 <_start-0x2bec>
1c0062a8:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00d108 <_sidata+0x6d68>
1c0062ac:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c0062b0 <__FUNCTION__.1665>:
1c0062b0:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d728 <_sidata+0x17388>
1c0062b4:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d318 <_sidata+0x16f78>
1c0062b8:	5f37636f 	bne	$r27,$r15,-51360(0x33760) # 1bff9a18 <_start-0x65e8>
1c0062bc:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd42c <_start-0x2bd4>
1c0062c0:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00d120 <_sidata+0x6d80>
1c0062c4:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c0062c8 <__FUNCTION__.1669>:
1c0062c8:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d740 <_sidata+0x173a0>
1c0062cc:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d330 <_sidata+0x16f90>
1c0062d0:	5f30646f 	bne	$r3,$r15,-53148(0x33064) # 1bff9334 <_start-0x6ccc>
1c0062d4:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd444 <_start-0x2bbc>
1c0062d8:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00d138 <_sidata+0x6d98>
1c0062dc:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c0062e0 <__FUNCTION__.1673>:
1c0062e0:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d758 <_sidata+0x173b8>
1c0062e4:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d348 <_sidata+0x16fa8>
1c0062e8:	5f31646f 	bne	$r3,$r15,-52892(0x33164) # 1bff944c <_start-0x6bb4>
1c0062ec:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd45c <_start-0x2ba4>
1c0062f0:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00d150 <_sidata+0x6db0>
1c0062f4:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c0062f8 <__FUNCTION__.1677>:
1c0062f8:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d770 <_sidata+0x173d0>
1c0062fc:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d360 <_sidata+0x16fc0>
1c006300:	5f32646f 	bne	$r3,$r15,-52636(0x33264) # 1bff9564 <_start-0x6a9c>
1c006304:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd474 <_start-0x2b8c>
1c006308:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00d168 <_sidata+0x6dc8>
1c00630c:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c006310 <__FUNCTION__.1681>:
1c006310:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d788 <_sidata+0x173e8>
1c006314:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d378 <_sidata+0x16fd8>
1c006318:	5f33646f 	bne	$r3,$r15,-52380(0x33364) # 1bff967c <_start-0x6984>
1c00631c:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd48c <_start-0x2b74>
1c006320:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00d180 <_sidata+0x6de0>
1c006324:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c006328 <__FUNCTION__.1685>:
1c006328:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d7a0 <_sidata+0x17400>
1c00632c:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d390 <_sidata+0x16ff0>
1c006330:	5f34646f 	bne	$r3,$r15,-52124(0x33464) # 1bff9794 <_start-0x686c>
1c006334:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd4a4 <_start-0x2b5c>
1c006338:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00d198 <_sidata+0x6df8>
1c00633c:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c006340 <__FUNCTION__.1689>:
1c006340:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d7b8 <_sidata+0x17418>
1c006344:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d3a8 <_sidata+0x17008>
1c006348:	5f35646f 	bne	$r3,$r15,-51868(0x33564) # 1bff98ac <_start-0x6754>
1c00634c:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd4bc <_start-0x2b44>
1c006350:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00d1b0 <_sidata+0x6e10>
1c006354:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c006358 <__FUNCTION__.1693>:
1c006358:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d7d0 <_sidata+0x17430>
1c00635c:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d3c0 <_sidata+0x17020>
1c006360:	5f36646f 	bne	$r3,$r15,-51612(0x33664) # 1bff99c4 <_start-0x663c>
1c006364:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd4d4 <_start-0x2b2c>
1c006368:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00d1c8 <_sidata+0x6e28>
1c00636c:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c006370 <__FUNCTION__.1697>:
1c006370:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01d7e8 <_sidata+0x17448>
1c006374:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01d3d8 <_sidata+0x17038>
1c006378:	5f37646f 	bne	$r3,$r15,-51356(0x33764) # 1bff9adc <_start-0x6524>
1c00637c:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffd4ec <_start-0x2b14>
1c006380:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00d1e0 <_sidata+0x6e40>
1c006384:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19
1c006388:	00007325 	0x00007325
1c00638c:	30304173 	0x30304173
1c006390:	30303030 	0x30303030
1c006394:	30303030 	0x30303030
1c006398:	30303030 	0x30303030
1c00639c:	00007030 	0x00007030

Disassembly of section .data:

80001000 <_sdata>:
_sdata():
80001000:	00000000 	0x00000000
80001004:	1c0057e9 	pcaddu12i	$r9,703(0x2bf)
80001008:	80001010 	0x80001010
8000100c:	1c0057e0 	pcaddu12i	$r0,703(0x2bf)

80001010 <g_SystemFreq>:
80001010:	007a1200 	bstrins.w	$r0,$r16,0x1a,0x4

Disassembly of section .bss:

80000000 <_sbss>:
_sbss():
80000000:	00000000 	0x00000000

80000004 <data.1431>:
80000004:	00000000 	0x00000000

80000008 <ans.1436>:
80000008:	00000000 	0x00000000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	0x3a434347
   4:	4e472820 	jirl	$r0,$r1,-112856(0x24728)
   8:	38202955 	ldx.bu	$r21,$r10,$r10
   c:	302e332e 	vldrepl.w	$vr14,$r25,-464(0xe30)
	...
