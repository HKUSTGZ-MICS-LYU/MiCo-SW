
matmul_regression.elf:     file format elf32-littleriscv


Disassembly of section .init:

80000000 <_start>:
80000000:	00414117          	auipc	sp,0x414
80000004:	85010113          	addi	sp,sp,-1968 # 80413850 <__freertos_irq_stack_top>
80000008:	0000a517          	auipc	a0,0xa
8000000c:	63850513          	addi	a0,a0,1592 # 8000a640 <_data>
80000010:	0000a597          	auipc	a1,0xa
80000014:	63058593          	addi	a1,a1,1584 # 8000a640 <_data>
80000018:	0000b617          	auipc	a2,0xb
8000001c:	7dc60613          	addi	a2,a2,2012 # 8000b7f4 <SOFTMAX_TIMER>
80000020:	00c5fa63          	bgeu	a1,a2,80000034 <_start+0x34>
80000024:	00052283          	lw	t0,0(a0)
80000028:	0055a023          	sw	t0,0(a1)
8000002c:	0511                	addi	a0,a0,4
8000002e:	0591                	addi	a1,a1,4
80000030:	fec5eae3          	bltu	a1,a2,80000024 <_start+0x24>
80000034:	0000b517          	auipc	a0,0xb
80000038:	7c050513          	addi	a0,a0,1984 # 8000b7f4 <SOFTMAX_TIMER>
8000003c:	00014597          	auipc	a1,0x14
80000040:	80c58593          	addi	a1,a1,-2036 # 80013848 <_end>
80000044:	00b57763          	bgeu	a0,a1,80000052 <_start+0x52>
80000048:	00052023          	sw	zero,0(a0)
8000004c:	0511                	addi	a0,a0,4
8000004e:	feb56de3          	bltu	a0,a1,80000048 <_start+0x48>
80000052:	003080ef          	jal	ra,80008854 <__libc_init_array>
80000056:	6099                	lui	ra,0x6
80000058:	3000b073          	csrc	mstatus,ra
8000005c:	6089                	lui	ra,0x2
8000005e:	3000a073          	csrs	mstatus,ra
80000062:	2031                	jal	8000006e <main>

80000064 <pass>:
80000064:	a001                	j	80000064 <pass>
80000066:	0001                	nop

80000068 <fail>:
80000068:	a001                	j	80000068 <fail>
8000006a:	0001                	nop

8000006c <_init>:
8000006c:	8082                	ret

Disassembly of section .text:

8000006e <main>:
8000006e:	7149                	addi	sp,sp,-368
80000070:	41f00513          	li	a0,1055
80000074:	16112623          	sw	ra,364(sp)
80000078:	16812423          	sw	s0,360(sp)
8000007c:	16912223          	sw	s1,356(sp)
80000080:	17212023          	sw	s2,352(sp)
80000084:	15312e23          	sw	s3,348(sp)
80000088:	15412c23          	sw	s4,344(sp)
8000008c:	15512a23          	sw	s5,340(sp)
80000090:	15612823          	sw	s6,336(sp)
80000094:	15712623          	sw	s7,332(sp)
80000098:	15812423          	sw	s8,328(sp)
8000009c:	15912223          	sw	s9,324(sp)
800000a0:	15a12023          	sw	s10,320(sp)
800000a4:	13b12e23          	sw	s11,316(sp)
800000a8:	017080ef          	jal	ra,800088be <malloc>
800000ac:	89aa                	mv	s3,a0
800000ae:	6505                	lui	a0,0x1
800000b0:	057d                	addi	a0,a0,31
800000b2:	00d080ef          	jal	ra,800088be <malloc>
800000b6:	01f98413          	addi	s0,s3,31
800000ba:	01f50493          	addi	s1,a0,31 # 101f <__stack_size-0x3fefe1>
800000be:	892a                	mv	s2,a0
800000c0:	9801                	andi	s0,s0,-32
800000c2:	9881                	andi	s1,s1,-32
800000c4:	4781                	li	a5,0
800000c6:	06b00593          	li	a1,107
800000ca:	40000613          	li	a2,1024
800000ce:	02b7f6b3          	remu	a3,a5,a1
800000d2:	00f40733          	add	a4,s0,a5
800000d6:	0785                	addi	a5,a5,1
800000d8:	00d70023          	sb	a3,0(a4)
800000dc:	fec799e3          	bne	a5,a2,800000ce <main+0x60>
800000e0:	4781                	li	a5,0
800000e2:	0b100513          	li	a0,177
800000e6:	fb000593          	li	a1,-80
800000ea:	6605                	lui	a2,0x1
800000ec:	02a7f733          	remu	a4,a5,a0
800000f0:	00f486b3          	add	a3,s1,a5
800000f4:	0785                	addi	a5,a5,1
800000f6:	40e58733          	sub	a4,a1,a4
800000fa:	00e68023          	sb	a4,0(a3)
800000fe:	fec797e3          	bne	a5,a2,800000ec <main+0x7e>
80000102:	4711                	li	a4,4
80000104:	10000793          	li	a5,256
80000108:	c4ba                	sw	a4,72(sp)
8000010a:	10000513          	li	a0,256
8000010e:	4741                	li	a4,16
80000110:	c6be                	sw	a5,76(sp)
80000112:	ceba                	sw	a4,92(sp)
80000114:	d0be                	sw	a5,96(sp)
80000116:	7a8080ef          	jal	ra,800088be <malloc>
8000011a:	8baa                	mv	s7,a0
8000011c:	10000513          	li	a0,256
80000120:	79e080ef          	jal	ra,800088be <malloc>
80000124:	8b2a                	mv	s6,a0
80000126:	0000b797          	auipc	a5,0xb
8000012a:	c1278793          	addi	a5,a5,-1006 # 8000ad38 <MiCo_QMatMul+0x2ac>
8000012e:	1898                	addi	a4,sp,112
80000130:	0000b817          	auipc	a6,0xb
80000134:	c4880813          	addi	a6,a6,-952 # 8000ad78 <MiCo_QMatMul+0x2ec>
80000138:	4388                	lw	a0,0(a5)
8000013a:	43cc                	lw	a1,4(a5)
8000013c:	4790                	lw	a2,8(a5)
8000013e:	47d4                	lw	a3,12(a5)
80000140:	c308                	sw	a0,0(a4)
80000142:	c34c                	sw	a1,4(a4)
80000144:	c710                	sw	a2,8(a4)
80000146:	c754                	sw	a3,12(a4)
80000148:	07c1                	addi	a5,a5,16
8000014a:	0741                	addi	a4,a4,16
8000014c:	ff0796e3          	bne	a5,a6,80000138 <main+0xca>
80000150:	0000b797          	auipc	a5,0xb
80000154:	c2878793          	addi	a5,a5,-984 # 8000ad78 <MiCo_QMatMul+0x2ec>
80000158:	1918                	addi	a4,sp,176
8000015a:	0000b817          	auipc	a6,0xb
8000015e:	c5e80813          	addi	a6,a6,-930 # 8000adb8 <MiCo_QMatMul+0x32c>
80000162:	4388                	lw	a0,0(a5)
80000164:	43cc                	lw	a1,4(a5)
80000166:	4790                	lw	a2,8(a5)
80000168:	47d4                	lw	a3,12(a5)
8000016a:	c308                	sw	a0,0(a4)
8000016c:	c34c                	sw	a1,4(a4)
8000016e:	c710                	sw	a2,8(a4)
80000170:	c754                	sw	a3,12(a4)
80000172:	07c1                	addi	a5,a5,16
80000174:	0741                	addi	a4,a4,16
80000176:	ff0796e3          	bne	a5,a6,80000162 <main+0xf4>
8000017a:	0000b797          	auipc	a5,0xb
8000017e:	c3e78793          	addi	a5,a5,-962 # 8000adb8 <MiCo_QMatMul+0x32c>
80000182:	1998                	addi	a4,sp,240
80000184:	0000b817          	auipc	a6,0xb
80000188:	c7480813          	addi	a6,a6,-908 # 8000adf8 <MiCo_QMatMul+0x36c>
8000018c:	4388                	lw	a0,0(a5)
8000018e:	43cc                	lw	a1,4(a5)
80000190:	4790                	lw	a2,8(a5)
80000192:	47d4                	lw	a3,12(a5)
80000194:	c308                	sw	a0,0(a4)
80000196:	c34c                	sw	a1,4(a4)
80000198:	c710                	sw	a2,8(a4)
8000019a:	c754                	sw	a3,12(a4)
8000019c:	07c1                	addi	a5,a5,16
8000019e:	0741                	addi	a4,a4,16
800001a0:	ff0796e3          	bne	a5,a6,8000018c <main+0x11e>
800001a4:	0f010a13          	addi	s4,sp,240
800001a8:	07010d13          	addi	s10,sp,112
800001ac:	0b010a93          	addi	s5,sp,176
800001b0:	13010c93          	addi	s9,sp,304
800001b4:	0000bc17          	auipc	s8,0xb
800001b8:	b60c0c13          	addi	s8,s8,-1184 # 8000ad14 <MiCo_QMatMul+0x288>
800001bc:	000a2d83          	lw	s11,0(s4)
800001c0:	8562                	mv	a0,s8
800001c2:	0a11                	addi	s4,s4,4
800001c4:	85ee                	mv	a1,s11
800001c6:	339070ef          	jal	ra,80007cfe <printf>
800001ca:	4826                	lw	a6,72(sp)
800001cc:	000aa783          	lw	a5,0(s5)
800001d0:	000d2703          	lw	a4,0(s10)
800001d4:	d042                	sw	a6,32(sp)
800001d6:	4836                	lw	a6,76(sp)
800001d8:	868a                	mv	a3,sp
800001da:	1010                	addi	a2,sp,32
800001dc:	d242                	sw	a6,36(sp)
800001de:	4856                	lw	a6,84(sp)
800001e0:	85da                	mv	a1,s6
800001e2:	855e                	mv	a0,s7
800001e4:	d642                	sw	a6,44(sp)
800001e6:	4866                	lw	a6,88(sp)
800001e8:	c8a2                	sw	s0,80(sp)
800001ea:	d2a6                	sw	s1,100(sp)
800001ec:	d842                	sw	a6,48(sp)
800001ee:	4876                	lw	a6,92(sp)
800001f0:	d422                	sw	s0,40(sp)
800001f2:	c426                	sw	s1,8(sp)
800001f4:	c042                	sw	a6,0(sp)
800001f6:	5806                	lw	a6,96(sp)
800001f8:	c242                	sw	a6,4(sp)
800001fa:	5826                	lw	a6,104(sp)
800001fc:	c642                	sw	a6,12(sp)
800001fe:	5836                	lw	a6,108(sp)
80000200:	c842                	sw	a6,16(sp)
80000202:	19a080ef          	jal	ra,8000839c <test_func>
80000206:	e129                	bnez	a0,80000248 <main+0x1da>
80000208:	0d11                	addi	s10,s10,4
8000020a:	0a91                	addi	s5,s5,4
8000020c:	fb4c98e3          	bne	s9,s4,800001bc <main+0x14e>
80000210:	16c12083          	lw	ra,364(sp)
80000214:	16812403          	lw	s0,360(sp)
80000218:	16412483          	lw	s1,356(sp)
8000021c:	16012903          	lw	s2,352(sp)
80000220:	15c12983          	lw	s3,348(sp)
80000224:	15812a03          	lw	s4,344(sp)
80000228:	15412a83          	lw	s5,340(sp)
8000022c:	15012b03          	lw	s6,336(sp)
80000230:	14c12b83          	lw	s7,332(sp)
80000234:	14812c03          	lw	s8,328(sp)
80000238:	14412c83          	lw	s9,324(sp)
8000023c:	14012d03          	lw	s10,320(sp)
80000240:	13c12d83          	lw	s11,316(sp)
80000244:	6175                	addi	sp,sp,368
80000246:	8082                	ret
80000248:	85ee                	mv	a1,s11
8000024a:	0000b517          	auipc	a0,0xb
8000024e:	ada50513          	addi	a0,a0,-1318 # 8000ad24 <MiCo_QMatMul+0x298>
80000252:	2ad070ef          	jal	ra,80007cfe <printf>
80000256:	854e                	mv	a0,s3
80000258:	672080ef          	jal	ra,800088ca <free>
8000025c:	854a                	mv	a0,s2
8000025e:	66c080ef          	jal	ra,800088ca <free>
80000262:	855e                	mv	a0,s7
80000264:	666080ef          	jal	ra,800088ca <free>
80000268:	855a                	mv	a0,s6
8000026a:	660080ef          	jal	ra,800088ca <free>
8000026e:	557d                	li	a0,-1
80000270:	b745                	j	80000210 <main+0x1a2>

80000272 <MiCo_add4d_f32>:
80000272:	1101                	addi	sp,sp,-32
80000274:	451c                	lw	a5,8(a0)
80000276:	cc22                	sw	s0,24(sp)
80000278:	4140                	lw	s0,4(a0)
8000027a:	4258                	lw	a4,4(a2)
8000027c:	ca26                	sw	s1,20(sp)
8000027e:	02f40433          	mul	s0,s0,a5
80000282:	84aa                	mv	s1,a0
80000284:	41c8                	lw	a0,4(a1)
80000286:	44dc                	lw	a5,12(s1)
80000288:	c64e                	sw	s3,12(sp)
8000028a:	8d19                	sub	a0,a0,a4
8000028c:	89ae                	mv	s3,a1
8000028e:	00153513          	seqz	a0,a0
80000292:	0000a597          	auipc	a1,0xa
80000296:	3ae58593          	addi	a1,a1,942 # 8000a640 <__init_array_end>
8000029a:	ce06                	sw	ra,28(sp)
8000029c:	02f40433          	mul	s0,s0,a5
800002a0:	c84a                	sw	s2,16(sp)
800002a2:	8932                	mv	s2,a2
800002a4:	6a5010ef          	jal	ra,80002148 <MiCo_assert>
800002a8:	00892783          	lw	a5,8(s2)
800002ac:	0089a503          	lw	a0,8(s3)
800002b0:	0000a597          	auipc	a1,0xa
800002b4:	3b458593          	addi	a1,a1,948 # 8000a664 <__init_array_end+0x24>
800002b8:	8d1d                	sub	a0,a0,a5
800002ba:	00153513          	seqz	a0,a0
800002be:	68b010ef          	jal	ra,80002148 <MiCo_assert>
800002c2:	00c9a503          	lw	a0,12(s3)
800002c6:	00c92783          	lw	a5,12(s2)
800002ca:	0000a597          	auipc	a1,0xa
800002ce:	3ba58593          	addi	a1,a1,954 # 8000a684 <__init_array_end+0x44>
800002d2:	8d1d                	sub	a0,a0,a5
800002d4:	00153513          	seqz	a0,a0
800002d8:	671010ef          	jal	ra,80002148 <MiCo_assert>
800002dc:	0004ae03          	lw	t3,0(s1)
800002e0:	040e0363          	beqz	t3,80000326 <MiCo_add4d_f32+0xb4>
800002e4:	04805163          	blez	s0,80000326 <MiCo_add4d_f32+0xb4>
800002e8:	0109a883          	lw	a7,16(s3)
800002ec:	01092803          	lw	a6,16(s2)
800002f0:	488c                	lw	a1,16(s1)
800002f2:	00241e93          	slli	t4,s0,0x2
800002f6:	8676                	mv	a2,t4
800002f8:	4301                	li	t1,0
800002fa:	4501                	li	a0,0
800002fc:	00231793          	slli	a5,t1,0x2
80000300:	00f80733          	add	a4,a6,a5
80000304:	00f886b3          	add	a3,a7,a5
80000308:	6318                	flw	fa4,0(a4)
8000030a:	629c                	flw	fa5,0(a3)
8000030c:	00f58733          	add	a4,a1,a5
80000310:	0791                	addi	a5,a5,4
80000312:	00e7f7d3          	fadd.s	fa5,fa5,fa4
80000316:	e31c                	fsw	fa5,0(a4)
80000318:	fec794e3          	bne	a5,a2,80000300 <MiCo_add4d_f32+0x8e>
8000031c:	0505                	addi	a0,a0,1
8000031e:	9322                	add	t1,t1,s0
80000320:	9676                	add	a2,a2,t4
80000322:	fdc51de3          	bne	a0,t3,800002fc <MiCo_add4d_f32+0x8a>
80000326:	40f2                	lw	ra,28(sp)
80000328:	4462                	lw	s0,24(sp)
8000032a:	44d2                	lw	s1,20(sp)
8000032c:	4942                	lw	s2,16(sp)
8000032e:	49b2                	lw	s3,12(sp)
80000330:	6105                	addi	sp,sp,32
80000332:	8082                	ret

80000334 <MiCo_add2d_f32>:
80000334:	41dc                	lw	a5,4(a1)
80000336:	4258                	lw	a4,4(a2)
80000338:	1141                	addi	sp,sp,-16
8000033a:	c422                	sw	s0,8(sp)
8000033c:	8f99                	sub	a5,a5,a4
8000033e:	c04a                	sw	s2,0(sp)
80000340:	842a                	mv	s0,a0
80000342:	892e                	mv	s2,a1
80000344:	0017b513          	seqz	a0,a5
80000348:	0000a597          	auipc	a1,0xa
8000034c:	35c58593          	addi	a1,a1,860 # 8000a6a4 <__init_array_end+0x64>
80000350:	c226                	sw	s1,4(sp)
80000352:	c606                	sw	ra,12(sp)
80000354:	84b2                	mv	s1,a2
80000356:	5f3010ef          	jal	ra,80002148 <MiCo_assert>
8000035a:	00042303          	lw	t1,0(s0)
8000035e:	06030063          	beqz	t1,800003be <MiCo_add2d_f32+0x8a>
80000362:	00442803          	lw	a6,4(s0)
80000366:	04080c63          	beqz	a6,800003be <MiCo_add2d_f32+0x8a>
8000036a:	00892883          	lw	a7,8(s2)
8000036e:	00492f83          	lw	t6,4(s2)
80000372:	0084af03          	lw	t5,8(s1)
80000376:	0044ae83          	lw	t4,4(s1)
8000037a:	00842e03          	lw	t3,8(s0)
8000037e:	4501                	li	a0,0
80000380:	4581                	li	a1,0
80000382:	02bf87b3          	mul	a5,t6,a1
80000386:	00251693          	slli	a3,a0,0x2
8000038a:	96f2                	add	a3,a3,t3
8000038c:	02be8733          	mul	a4,t4,a1
80000390:	01078633          	add	a2,a5,a6
80000394:	060a                	slli	a2,a2,0x2
80000396:	078a                	slli	a5,a5,0x2
80000398:	97c6                	add	a5,a5,a7
8000039a:	9646                	add	a2,a2,a7
8000039c:	070a                	slli	a4,a4,0x2
8000039e:	977a                	add	a4,a4,t5
800003a0:	639c                	flw	fa5,0(a5)
800003a2:	6318                	flw	fa4,0(a4)
800003a4:	0691                	addi	a3,a3,4
800003a6:	0791                	addi	a5,a5,4
800003a8:	00e7f7d3          	fadd.s	fa5,fa5,fa4
800003ac:	0711                	addi	a4,a4,4
800003ae:	fef6ae27          	fsw	fa5,-4(a3)
800003b2:	fef617e3          	bne	a2,a5,800003a0 <MiCo_add2d_f32+0x6c>
800003b6:	0585                	addi	a1,a1,1
800003b8:	9542                	add	a0,a0,a6
800003ba:	fc6594e3          	bne	a1,t1,80000382 <MiCo_add2d_f32+0x4e>
800003be:	40b2                	lw	ra,12(sp)
800003c0:	4422                	lw	s0,8(sp)
800003c2:	4492                	lw	s1,4(sp)
800003c4:	4902                	lw	s2,0(sp)
800003c6:	0141                	addi	sp,sp,16
800003c8:	8082                	ret

800003ca <MiCo_argmax2d_f32>:
800003ca:	419c                	lw	a5,0(a1)
800003cc:	c3bd                	beqz	a5,80000432 <MiCo_argmax2d_f32+0x68>
800003ce:	41d4                	lw	a3,4(a1)
800003d0:	88aa                	mv	a7,a0
800003d2:	4801                	li	a6,0
800003d4:	0000b797          	auipc	a5,0xb
800003d8:	3b47a687          	flw	fa3,948(a5) # 8000b788 <__malloc_trim_threshold+0x18>
800003dc:	cab1                	beqz	a3,80000430 <MiCo_argmax2d_f32+0x66>
800003de:	03068633          	mul	a2,a3,a6
800003e2:	4588                	lw	a0,8(a1)
800003e4:	20d68753          	fmv.s	fa4,fa3
800003e8:	4701                	li	a4,0
800003ea:	00e607b3          	add	a5,a2,a4
800003ee:	078a                	slli	a5,a5,0x2
800003f0:	97aa                	add	a5,a5,a0
800003f2:	639c                	flw	fa5,0(a5)
800003f4:	a0f717d3          	flt.s	a5,fa4,fa5
800003f8:	c39d                	beqz	a5,8000041e <MiCo_argmax2d_f32+0x54>
800003fa:	00e8a023          	sw	a4,0(a7)
800003fe:	41d4                	lw	a3,4(a1)
80000400:	0705                	addi	a4,a4,1
80000402:	20f78753          	fmv.s	fa4,fa5
80000406:	00d77f63          	bgeu	a4,a3,80000424 <MiCo_argmax2d_f32+0x5a>
8000040a:	03068633          	mul	a2,a3,a6
8000040e:	00e607b3          	add	a5,a2,a4
80000412:	078a                	slli	a5,a5,0x2
80000414:	97aa                	add	a5,a5,a0
80000416:	639c                	flw	fa5,0(a5)
80000418:	a0f717d3          	flt.s	a5,fa4,fa5
8000041c:	fff9                	bnez	a5,800003fa <MiCo_argmax2d_f32+0x30>
8000041e:	0705                	addi	a4,a4,1
80000420:	fcd765e3          	bltu	a4,a3,800003ea <MiCo_argmax2d_f32+0x20>
80000424:	419c                	lw	a5,0(a1)
80000426:	0805                	addi	a6,a6,1
80000428:	00f87663          	bgeu	a6,a5,80000434 <MiCo_argmax2d_f32+0x6a>
8000042c:	0891                	addi	a7,a7,4
8000042e:	fac5                	bnez	a3,800003de <MiCo_argmax2d_f32+0x14>
80000430:	8082                	ret
80000432:	8082                	ret
80000434:	8082                	ret

80000436 <MiCo_concat4d_f32>:
80000436:	4218                	lw	a4,0(a2)
80000438:	419c                	lw	a5,0(a1)
8000043a:	715d                	addi	sp,sp,-80
8000043c:	c4a2                	sw	s0,72(sp)
8000043e:	8f99                	sub	a5,a5,a4
80000440:	842a                	mv	s0,a0
80000442:	c2a6                	sw	s1,68(sp)
80000444:	0017b513          	seqz	a0,a5
80000448:	84ae                	mv	s1,a1
8000044a:	0000a597          	auipc	a1,0xa
8000044e:	27658593          	addi	a1,a1,630 # 8000a6c0 <__init_array_end+0x80>
80000452:	c686                	sw	ra,76(sp)
80000454:	c0ca                	sw	s2,64(sp)
80000456:	de4e                	sw	s3,60(sp)
80000458:	8932                	mv	s2,a2
8000045a:	d266                	sw	s9,36(sp)
8000045c:	dc52                	sw	s4,56(sp)
8000045e:	da56                	sw	s5,52(sp)
80000460:	d85a                	sw	s6,48(sp)
80000462:	d65e                	sw	s7,44(sp)
80000464:	d462                	sw	s8,40(sp)
80000466:	d06a                	sw	s10,32(sp)
80000468:	ce6e                	sw	s11,28(sp)
8000046a:	4df010ef          	jal	ra,80002148 <MiCo_assert>
8000046e:	00492703          	lw	a4,4(s2)
80000472:	40c8                	lw	a0,4(s1)
80000474:	405c                	lw	a5,4(s0)
80000476:	0000a597          	auipc	a1,0xa
8000047a:	26e58593          	addi	a1,a1,622 # 8000a6e4 <__init_array_end+0xa4>
8000047e:	953a                	add	a0,a0,a4
80000480:	8d1d                	sub	a0,a0,a5
80000482:	00153513          	seqz	a0,a0
80000486:	4c3010ef          	jal	ra,80002148 <MiCo_assert>
8000048a:	449c                	lw	a5,8(s1)
8000048c:	4408                	lw	a0,8(s0)
8000048e:	0000a597          	auipc	a1,0xa
80000492:	27a58593          	addi	a1,a1,634 # 8000a708 <__init_array_end+0xc8>
80000496:	8d1d                	sub	a0,a0,a5
80000498:	00153513          	seqz	a0,a0
8000049c:	4ad010ef          	jal	ra,80002148 <MiCo_assert>
800004a0:	44dc                	lw	a5,12(s1)
800004a2:	4448                	lw	a0,12(s0)
800004a4:	0000a597          	auipc	a1,0xa
800004a8:	28858593          	addi	a1,a1,648 # 8000a72c <__init_array_end+0xec>
800004ac:	8d1d                	sub	a0,a0,a5
800004ae:	00153513          	seqz	a0,a0
800004b2:	497010ef          	jal	ra,80002148 <MiCo_assert>
800004b6:	00492783          	lw	a5,4(s2)
800004ba:	4098                	lw	a4,0(s1)
800004bc:	0044ac83          	lw	s9,4(s1)
800004c0:	c23e                	sw	a5,4(sp)
800004c2:	c03a                	sw	a4,0(sp)
800004c4:	0084ae03          	lw	t3,8(s1)
800004c8:	44c8                	lw	a0,12(s1)
800004ca:	00fc89b3          	add	s3,s9,a5
800004ce:	c769                	beqz	a4,80000598 <MiCo_concat4d_f32+0x162>
800004d0:	0c098463          	beqz	s3,80000598 <MiCo_concat4d_f32+0x162>
800004d4:	0c0e0263          	beqz	t3,80000598 <MiCo_concat4d_f32+0x162>
800004d8:	01ec9793          	slli	a5,s9,0x1e
800004dc:	419787b3          	sub	a5,a5,s9
800004e0:	97ce                	add	a5,a5,s3
800004e2:	03c787b3          	mul	a5,a5,t3
800004e6:	41900ab3          	neg	s5,s9
800004ea:	00251e93          	slli	t4,a0,0x2
800004ee:	01e51f13          	slli	t5,a0,0x1e
800004f2:	4a01                	li	s4,0
800004f4:	4d01                	li	s10,0
800004f6:	4801                	li	a6,0
800004f8:	4d81                	li	s11,0
800004fa:	02a787b3          	mul	a5,a5,a0
800004fe:	078a                	slli	a5,a5,0x2
80000500:	c43e                	sw	a5,8(sp)
80000502:	03cc87b3          	mul	a5,s9,t3
80000506:	02ae0b33          	mul	s6,t3,a0
8000050a:	02a787b3          	mul	a5,a5,a0
8000050e:	002b1c13          	slli	s8,s6,0x2
80000512:	c63e                	sw	a5,12(sp)
80000514:	0a0c9163          	bnez	s9,800005b6 <MiCo_concat4d_f32+0x180>
80000518:	4781                	li	a5,0
8000051a:	4281                	li	t0,0
8000051c:	01578fb3          	add	t6,a5,s5
80000520:	03cf8fb3          	mul	t6,t6,t3
80000524:	01478333          	add	t1,a5,s4
80000528:	4381                	li	t2,0
8000052a:	03c30333          	mul	t1,t1,t3
8000052e:	01ef9793          	slli	a5,t6,0x1e
80000532:	41f787b3          	sub	a5,a5,t6
80000536:	001f8693          	addi	a3,t6,1
8000053a:	933e                	add	t1,t1,a5
8000053c:	02af8fb3          	mul	t6,t6,a0
80000540:	02a30333          	mul	t1,t1,a0
80000544:	03d686b3          	mul	a3,a3,t4
80000548:	c11d                	beqz	a0,8000056e <MiCo_concat4d_f32+0x138>
8000054a:	01042883          	lw	a7,16(s0)
8000054e:	01092583          	lw	a1,16(s2)
80000552:	002f9793          	slli	a5,t6,0x2
80000556:	00231613          	slli	a2,t1,0x2
8000055a:	00f58733          	add	a4,a1,a5
8000055e:	631c                	flw	fa5,0(a4)
80000560:	00f60733          	add	a4,a2,a5
80000564:	9746                	add	a4,a4,a7
80000566:	e31c                	fsw	fa5,0(a4)
80000568:	0791                	addi	a5,a5,4
8000056a:	fed798e3          	bne	a5,a3,8000055a <MiCo_concat4d_f32+0x124>
8000056e:	0385                	addi	t2,t2,1
80000570:	9faa                	add	t6,t6,a0
80000572:	937a                	add	t1,t1,t5
80000574:	96f6                	add	a3,a3,t4
80000576:	fc7e19e3          	bne	t3,t2,80000548 <MiCo_concat4d_f32+0x112>
8000057a:	0285                	addi	t0,t0,1
8000057c:	8796                	mv	a5,t0
8000057e:	f932efe3          	bltu	t0,s3,8000051c <MiCo_concat4d_f32+0xe6>
80000582:	47a2                	lw	a5,8(sp)
80000584:	0d85                	addi	s11,s11,1
80000586:	9a4e                	add	s4,s4,s3
80000588:	983e                	add	a6,a6,a5
8000058a:	47b2                	lw	a5,12(sp)
8000058c:	9d3e                	add	s10,s10,a5
8000058e:	4792                	lw	a5,4(sp)
80000590:	9abe                	add	s5,s5,a5
80000592:	4782                	lw	a5,0(sp)
80000594:	f8fd90e3          	bne	s11,a5,80000514 <MiCo_concat4d_f32+0xde>
80000598:	40b6                	lw	ra,76(sp)
8000059a:	4426                	lw	s0,72(sp)
8000059c:	4496                	lw	s1,68(sp)
8000059e:	4906                	lw	s2,64(sp)
800005a0:	59f2                	lw	s3,60(sp)
800005a2:	5a62                	lw	s4,56(sp)
800005a4:	5ad2                	lw	s5,52(sp)
800005a6:	5b42                	lw	s6,48(sp)
800005a8:	5bb2                	lw	s7,44(sp)
800005aa:	5c22                	lw	s8,40(sp)
800005ac:	5c92                	lw	s9,36(sp)
800005ae:	5d02                	lw	s10,32(sp)
800005b0:	4df2                	lw	s11,28(sp)
800005b2:	6161                	addi	sp,sp,80
800005b4:	8082                	ret
800005b6:	8be6                	mv	s7,s9
800005b8:	0199f363          	bgeu	s3,s9,800005be <MiCo_concat4d_f32+0x188>
800005bc:	8bce                	mv	s7,s3
800005be:	002d1f93          	slli	t6,s10,0x2
800005c2:	9ff6                	add	t6,t6,t4
800005c4:	83ea                	mv	t2,s10
800005c6:	4281                	li	t0,0
800005c8:	86fe                	mv	a3,t6
800005ca:	831e                	mv	t1,t2
800005cc:	4881                	li	a7,0
800005ce:	cd19                	beqz	a0,800005ec <MiCo_concat4d_f32+0x1b6>
800005d0:	480c                	lw	a1,16(s0)
800005d2:	4890                	lw	a2,16(s1)
800005d4:	00231793          	slli	a5,t1,0x2
800005d8:	00f60733          	add	a4,a2,a5
800005dc:	631c                	flw	fa5,0(a4)
800005de:	01078733          	add	a4,a5,a6
800005e2:	972e                	add	a4,a4,a1
800005e4:	e31c                	fsw	fa5,0(a4)
800005e6:	0791                	addi	a5,a5,4
800005e8:	fed798e3          	bne	a5,a3,800005d8 <MiCo_concat4d_f32+0x1a2>
800005ec:	0885                	addi	a7,a7,1
800005ee:	932a                	add	t1,t1,a0
800005f0:	96f6                	add	a3,a3,t4
800005f2:	fdc89ee3          	bne	a7,t3,800005ce <MiCo_concat4d_f32+0x198>
800005f6:	0285                	addi	t0,t0,1
800005f8:	8796                	mv	a5,t0
800005fa:	93da                	add	t2,t2,s6
800005fc:	9fe2                	add	t6,t6,s8
800005fe:	fd72e5e3          	bltu	t0,s7,800005c8 <MiCo_concat4d_f32+0x192>
80000602:	f132ede3          	bltu	t0,s3,8000051c <MiCo_concat4d_f32+0xe6>
80000606:	bfb5                	j	80000582 <MiCo_concat4d_f32+0x14c>

80000608 <MiCo_concat2d_f32>:
80000608:	4218                	lw	a4,0(a2)
8000060a:	419c                	lw	a5,0(a1)
8000060c:	1101                	addi	sp,sp,-32
8000060e:	cc22                	sw	s0,24(sp)
80000610:	8f99                	sub	a5,a5,a4
80000612:	842e                	mv	s0,a1
80000614:	c84a                	sw	s2,16(sp)
80000616:	0000a597          	auipc	a1,0xa
8000061a:	13a58593          	addi	a1,a1,314 # 8000a750 <__init_array_end+0x110>
8000061e:	892a                	mv	s2,a0
80000620:	0017b513          	seqz	a0,a5
80000624:	ce06                	sw	ra,28(sp)
80000626:	ca26                	sw	s1,20(sp)
80000628:	c64e                	sw	s3,12(sp)
8000062a:	84b2                	mv	s1,a2
8000062c:	c452                	sw	s4,8(sp)
8000062e:	31b010ef          	jal	ra,80002148 <MiCo_assert>
80000632:	405c                	lw	a5,4(s0)
80000634:	40d4                	lw	a3,4(s1)
80000636:	00492703          	lw	a4,4(s2)
8000063a:	0000a597          	auipc	a1,0xa
8000063e:	13a58593          	addi	a1,a1,314 # 8000a774 <__init_array_end+0x134>
80000642:	97b6                	add	a5,a5,a3
80000644:	8f99                	sub	a5,a5,a4
80000646:	0017b513          	seqz	a0,a5
8000064a:	2ff010ef          	jal	ra,80002148 <MiCo_assert>
8000064e:	00442f03          	lw	t5,4(s0)
80000652:	40cc                	lw	a1,4(s1)
80000654:	4010                	lw	a2,0(s0)
80000656:	00bf0833          	add	a6,t5,a1
8000065a:	ca21                	beqz	a2,800006aa <MiCo_concat2d_f32+0xa2>
8000065c:	04080763          	beqz	a6,800006aa <MiCo_concat2d_f32+0xa2>
80000660:	00892e03          	lw	t3,8(s2)
80000664:	41e00333          	neg	t1,t5
80000668:	002f1913          	slli	s2,t5,0x2
8000066c:	00281393          	slli	t2,a6,0x2
80000670:	4e81                	li	t4,0
80000672:	4281                	li	t0,0
80000674:	4881                	li	a7,0
80000676:	4f81                	li	t6,0
80000678:	040f1163          	bnez	t5,800006ba <MiCo_concat2d_f32+0xb2>
8000067c:	4781                	li	a5,0
8000067e:	4701                	li	a4,0
80000680:	4488                	lw	a0,8(s1)
80000682:	006786b3          	add	a3,a5,t1
80000686:	068a                	slli	a3,a3,0x2
80000688:	96aa                	add	a3,a3,a0
8000068a:	629c                	flw	fa5,0(a3)
8000068c:	97c6                	add	a5,a5,a7
8000068e:	078a                	slli	a5,a5,0x2
80000690:	97f2                	add	a5,a5,t3
80000692:	0705                	addi	a4,a4,1
80000694:	e39c                	fsw	fa5,0(a5)
80000696:	87ba                	mv	a5,a4
80000698:	ff0765e3          	bltu	a4,a6,80000682 <MiCo_concat2d_f32+0x7a>
8000069c:	0f85                	addi	t6,t6,1
8000069e:	98c2                	add	a7,a7,a6
800006a0:	932e                	add	t1,t1,a1
800006a2:	92ca                	add	t0,t0,s2
800006a4:	9e9e                	add	t4,t4,t2
800006a6:	fccf99e3          	bne	t6,a2,80000678 <MiCo_concat2d_f32+0x70>
800006aa:	40f2                	lw	ra,28(sp)
800006ac:	4462                	lw	s0,24(sp)
800006ae:	44d2                	lw	s1,20(sp)
800006b0:	4942                	lw	s2,16(sp)
800006b2:	49b2                	lw	s3,12(sp)
800006b4:	4a22                	lw	s4,8(sp)
800006b6:	6105                	addi	sp,sp,32
800006b8:	8082                	ret
800006ba:	89fa                	mv	s3,t5
800006bc:	01e87363          	bgeu	a6,t5,800006c2 <MiCo_concat2d_f32+0xba>
800006c0:	89c2                	mv	s3,a6
800006c2:	00842a03          	lw	s4,8(s0)
800006c6:	41c28533          	sub	a0,t0,t3
800006ca:	01de06b3          	add	a3,t3,t4
800006ce:	4701                	li	a4,0
800006d0:	41d50533          	sub	a0,a0,t4
800006d4:	00da07b3          	add	a5,s4,a3
800006d8:	97aa                	add	a5,a5,a0
800006da:	639c                	flw	fa5,0(a5)
800006dc:	0705                	addi	a4,a4,1
800006de:	87ba                	mv	a5,a4
800006e0:	e29c                	fsw	fa5,0(a3)
800006e2:	0691                	addi	a3,a3,4
800006e4:	ff3768e3          	bltu	a4,s3,800006d4 <MiCo_concat2d_f32+0xcc>
800006e8:	f9076ce3          	bltu	a4,a6,80000680 <MiCo_concat2d_f32+0x78>
800006ec:	0f85                	addi	t6,t6,1
800006ee:	98c2                	add	a7,a7,a6
800006f0:	932e                	add	t1,t1,a1
800006f2:	92ca                	add	t0,t0,s2
800006f4:	9e9e                	add	t4,t4,t2
800006f6:	f8cf91e3          	bne	t6,a2,80000678 <MiCo_concat2d_f32+0x70>
800006fa:	bf45                	j	800006aa <MiCo_concat2d_f32+0xa2>

800006fc <MiCo_conv2d_f32>:
800006fc:	7155                	addi	sp,sp,-208
800006fe:	d562                	sw	s8,168(sp)
80000700:	d16a                	sw	s10,160(sp)
80000702:	00c62c03          	lw	s8,12(a2) # 100c <__stack_size-0x3feff4>
80000706:	00c5ad03          	lw	s10,12(a1)
8000070a:	d366                	sw	s9,164(sp)
8000070c:	cf6e                	sw	s11,156(sp)
8000070e:	0085ac83          	lw	s9,8(a1)
80000712:	00862d83          	lw	s11,8(a2)
80000716:	c5a2                	sw	s0,200(sp)
80000718:	db56                	sw	s5,180(sp)
8000071a:	8432                	mv	s0,a2
8000071c:	418d0ab3          	sub	s5,s10,s8
80000720:	00179613          	slli	a2,a5,0x1
80000724:	c3a6                	sw	s1,196(sp)
80000726:	d95a                	sw	s6,176(sp)
80000728:	84be                	mv	s1,a5
8000072a:	8b2e                	mv	s6,a1
8000072c:	41bc87b3          	sub	a5,s9,s11
80000730:	85ba                	mv	a1,a4
80000732:	9ab2                	add	s5,s5,a2
80000734:	97b2                	add	a5,a5,a2
80000736:	02badab3          	divu	s5,s5,a1
8000073a:	de3a                	sw	a4,60(sp)
8000073c:	c1ca                	sw	s2,192(sp)
8000073e:	df4e                	sw	s3,188(sp)
80000740:	dd52                	sw	s4,184(sp)
80000742:	c786                	sw	ra,204(sp)
80000744:	d75e                	sw	s7,172(sp)
80000746:	c646                	sw	a7,12(sp)
80000748:	00452903          	lw	s2,4(a0)
8000074c:	89aa                	mv	s3,a0
8000074e:	02e7d833          	divu	a6,a5,a4
80000752:	000b2703          	lw	a4,0(s6)
80000756:	451c                	lw	a5,8(a0)
80000758:	4501                	li	a0,0
8000075a:	c43a                	sw	a4,8(sp)
8000075c:	004b2703          	lw	a4,4(s6)
80000760:	c83a                	sw	a4,16(sp)
80000762:	8736                	mv	a4,a3
80000764:	038d86b3          	mul	a3,s11,s8
80000768:	c0c2                	sw	a6,64(sp)
8000076a:	00180a13          	addi	s4,a6,1
8000076e:	ca36                	sw	a3,20(sp)
80000770:	001a8693          	addi	a3,s5,1
80000774:	cc36                	sw	a3,24(sp)
80000776:	01479763          	bne	a5,s4,80000784 <MiCo_conv2d_f32+0x88>
8000077a:	00c9a503          	lw	a0,12(s3)
8000077e:	8d15                	sub	a0,a0,a3
80000780:	00153513          	seqz	a0,a0
80000784:	0000a597          	auipc	a1,0xa
80000788:	01058593          	addi	a1,a1,16 # 8000a794 <__init_array_end+0x154>
8000078c:	ce3a                	sw	a4,28(sp)
8000078e:	1bb010ef          	jal	ra,80002148 <MiCo_assert>
80000792:	47c2                	lw	a5,16(sp)
80000794:	46b2                	lw	a3,12(sp)
80000796:	4772                	lw	a4,28(sp)
80000798:	4501                	li	a0,0
8000079a:	02d7f7b3          	remu	a5,a5,a3
8000079e:	e789                	bnez	a5,800007a8 <MiCo_conv2d_f32+0xac>
800007a0:	02d97533          	remu	a0,s2,a3
800007a4:	00153513          	seqz	a0,a0
800007a8:	0000a597          	auipc	a1,0xa
800007ac:	01058593          	addi	a1,a1,16 # 8000a7b8 <__init_array_end+0x178>
800007b0:	ce3a                	sw	a4,28(sp)
800007b2:	197010ef          	jal	ra,80002148 <MiCo_assert>
800007b6:	46b2                	lw	a3,12(sp)
800007b8:	4642                	lw	a2,16(sp)
800007ba:	4772                	lw	a4,28(sp)
800007bc:	02d65bb3          	divu	s7,a2,a3
800007c0:	431c                	lw	a5,0(a4)
800007c2:	02d956b3          	divu	a3,s2,a3
800007c6:	c4b6                	sw	a3,72(sp)
800007c8:	c7b5                	beqz	a5,80000834 <MiCo_conv2d_f32+0x138>
800007ca:	47a2                	lw	a5,8(sp)
800007cc:	28078963          	beqz	a5,80000a5e <MiCo_conv2d_f32+0x362>
800007d0:	08090563          	beqz	s2,8000085a <MiCo_conv2d_f32+0x15e>
800007d4:	080a0363          	beqz	s4,8000085a <MiCo_conv2d_f32+0x15e>
800007d8:	001a8793          	addi	a5,s5,1
800007dc:	cfbd                	beqz	a5,8000085a <MiCo_conv2d_f32+0x15e>
800007de:	02fa0eb3          	mul	t4,s4,a5
800007e2:	0109ae03          	lw	t3,16(s3)
800007e6:	00472f03          	lw	t5,4(a4)
800007ea:	002a9f93          	slli	t6,s5,0x2
800007ee:	004e0793          	addi	a5,t3,4
800007f2:	4581                	li	a1,0
800007f4:	4601                	li	a2,0
800007f6:	9fbe                	add	t6,t6,a5
800007f8:	032e82b3          	mul	t0,t4,s2
800007fc:	852e                	mv	a0,a1
800007fe:	4781                	li	a5,0
80000800:	00279313          	slli	t1,a5,0x2
80000804:	937a                	add	t1,t1,t5
80000806:	88aa                	mv	a7,a0
80000808:	4801                	li	a6,0
8000080a:	00289713          	slli	a4,a7,0x2
8000080e:	00ee06b3          	add	a3,t3,a4
80000812:	977e                	add	a4,a4,t6
80000814:	00032787          	flw	fa5,0(t1)
80000818:	0691                	addi	a3,a3,4
8000081a:	fef6ae27          	fsw	fa5,-4(a3)
8000081e:	fee69be3          	bne	a3,a4,80000814 <MiCo_conv2d_f32+0x118>
80000822:	46e2                	lw	a3,24(sp)
80000824:	00180713          	addi	a4,a6,1
80000828:	98b6                	add	a7,a7,a3
8000082a:	4686                	lw	a3,64(sp)
8000082c:	27068763          	beq	a3,a6,80000a9a <MiCo_conv2d_f32+0x39e>
80000830:	883a                	mv	a6,a4
80000832:	bfe1                	j	8000080a <MiCo_conv2d_f32+0x10e>
80000834:	47a2                	lw	a5,8(sp)
80000836:	03278633          	mul	a2,a5,s2
8000083a:	001a8793          	addi	a5,s5,1
8000083e:	03460633          	mul	a2,a2,s4
80000842:	02f60633          	mul	a2,a2,a5
80000846:	c619                	beqz	a2,80000854 <MiCo_conv2d_f32+0x158>
80000848:	0109a503          	lw	a0,16(s3)
8000084c:	060a                	slli	a2,a2,0x2
8000084e:	4581                	li	a1,0
80000850:	650080ef          	jal	ra,80008ea0 <memset>
80000854:	47a2                	lw	a5,8(sp)
80000856:	20078463          	beqz	a5,80000a5e <MiCo_conv2d_f32+0x362>
8000085a:	47b2                	lw	a5,12(sp)
8000085c:	20078163          	beqz	a5,80000a5e <MiCo_conv2d_f32+0x362>
80000860:	1ef96f63          	bltu	s2,a5,80000a5e <MiCo_conv2d_f32+0x362>
80000864:	1e0a0d63          	beqz	s4,80000a5e <MiCo_conv2d_f32+0x362>
80000868:	4662                	lw	a2,24(sp)
8000086a:	1e060a63          	beqz	a2,80000a5e <MiCo_conv2d_f32+0x362>
8000086e:	0109a783          	lw	a5,16(s3)
80000872:	002a9693          	slli	a3,s5,0x2
80000876:	02ca0a33          	mul	s4,s4,a2
8000087a:	ccbe                	sw	a5,88(sp)
8000087c:	0791                	addi	a5,a5,4
8000087e:	97b6                	add	a5,a5,a3
80000880:	debe                	sw	a5,124(sp)
80000882:	47c2                	lw	a5,16(sp)
80000884:	4652                	lw	a2,20(sp)
80000886:	41ac0733          	sub	a4,s8,s10
8000088a:	00271a93          	slli	s5,a4,0x2
8000088e:	40900733          	neg	a4,s1
80000892:	039787b3          	mul	a5,a5,s9
80000896:	c53a                	sw	a4,136(sp)
80000898:	409c0733          	sub	a4,s8,s1
8000089c:	86b2                	mv	a3,a2
8000089e:	c33a                	sw	a4,132(sp)
800008a0:	c752                	sw	s4,140(sp)
800008a2:	dc02                	sw	zero,56(sp)
800008a4:	c682                	sw	zero,76(sp)
800008a6:	03a787b3          	mul	a5,a5,s10
800008aa:	03ac83b3          	mul	t2,s9,s10
800008ae:	dabe                	sw	a5,116(sp)
800008b0:	034907b3          	mul	a5,s2,s4
800008b4:	40760733          	sub	a4,a2,t2
800008b8:	4626                	lw	a2,72(sp)
800008ba:	00271993          	slli	s3,a4,0x2
800008be:	409d8733          	sub	a4,s11,s1
800008c2:	c13a                	sw	a4,128(sp)
800008c4:	dcbe                	sw	a5,120(sp)
800008c6:	027b87b3          	mul	a5,s7,t2
800008ca:	02c68733          	mul	a4,a3,a2
800008ce:	d4be                	sw	a5,104(sp)
800008d0:	034607b3          	mul	a5,a2,s4
800008d4:	8a6e                	mv	s4,s11
800008d6:	8de6                	mv	s11,s9
800008d8:	8c9e                	mv	s9,t2
800008da:	d6be                	sw	a5,108(sp)
800008dc:	037707b3          	mul	a5,a4,s7
800008e0:	d8be                	sw	a5,112(sp)
800008e2:	037687b3          	mul	a5,a3,s7
800008e6:	d0be                	sw	a5,96(sp)
800008e8:	57f2                	lw	a5,60(sp)
800008ea:	029d04b3          	mul	s1,s10,s1
800008ee:	02fd07b3          	mul	a5,s10,a5
800008f2:	409005b3          	neg	a1,s1
800008f6:	da2e                	sw	a1,52(sp)
800008f8:	84d6                	mv	s1,s5
800008fa:	8ae2                	mv	s5,s8
800008fc:	8c4e                	mv	s8,s3
800008fe:	cebe                	sw	a5,92(sp)
80000900:	57e2                	lw	a5,56(sp)
80000902:	d802                	sw	zero,48(sp)
80000904:	c282                	sw	zero,68(sp)
80000906:	d63e                	sw	a5,44(sp)
80000908:	57d2                	lw	a5,52(sp)
8000090a:	8952                	mv	s2,s4
8000090c:	d43e                	sw	a5,40(sp)
8000090e:	87e6                	mv	a5,s9
80000910:	8cde                	mv	s9,s7
80000912:	8be2                	mv	s7,s8
80000914:	8c3e                	mv	s8,a5
80000916:	57c2                	lw	a5,48(sp)
80000918:	c882                	sw	zero,80(sp)
8000091a:	d23e                	sw	a5,36(sp)
8000091c:	57b2                	lw	a5,44(sp)
8000091e:	d03e                	sw	a5,32(sp)
80000920:	5792                	lw	a5,36(sp)
80000922:	430a                	lw	t1,128(sp)
80000924:	ca82                	sw	zero,84(sp)
80000926:	078a                	slli	a5,a5,0x2
80000928:	d2be                	sw	a5,100(sp)
8000092a:	57a2                	lw	a5,40(sp)
8000092c:	ca3e                	sw	a5,20(sp)
8000092e:	5782                	lw	a5,32(sp)
80000930:	ce3e                	sw	a5,28(sp)
80000932:	47f2                	lw	a5,28(sp)
80000934:	4e2a                	lw	t3,136(sp)
80000936:	461a                	lw	a2,132(sp)
80000938:	00279393          	slli	t2,a5,0x2
8000093c:	47d2                	lw	a5,20(sp)
8000093e:	412302b3          	sub	t0,t1,s2
80000942:	00279993          	slli	s3,a5,0x2
80000946:	47e6                	lw	a5,88(sp)
80000948:	00778a33          	add	s4,a5,t2
8000094c:	57f6                	lw	a5,124(sp)
8000094e:	93be                	add	t2,t2,a5
80000950:	5796                	lw	a5,100(sp)
80000952:	413789b3          	sub	s3,a5,s3
80000956:	47c2                	lw	a5,16(sp)
80000958:	4732                	lw	a4,12(sp)
8000095a:	12e7e163          	bltu	a5,a4,80000a7c <MiCo_conv2d_f32+0x380>
8000095e:	f00007d3          	fmv.w.x	fa5,zero
80000962:	4fd2                	lw	t6,20(sp)
80000964:	002e1e93          	slli	t4,t3,0x2
80000968:	41d98eb3          	sub	t4,s3,t4
8000096c:	4f01                	li	t5,0
8000096e:	8516                	mv	a0,t0
80000970:	8876                	mv	a6,t4
80000972:	88fe                	mv	a7,t6
80000974:	02090f63          	beqz	s2,800009b2 <MiCo_conv2d_f32+0x2b6>
80000978:	020a8863          	beqz	s5,800009a8 <MiCo_conv2d_f32+0x2ac>
8000097c:	03b57663          	bgeu	a0,s11,800009a8 <MiCo_conv2d_f32+0x2ac>
80000980:	011e0733          	add	a4,t3,a7
80000984:	070a                	slli	a4,a4,0x2
80000986:	87f2                	mv	a5,t3
80000988:	01a7fc63          	bgeu	a5,s10,800009a0 <MiCo_conv2d_f32+0x2a4>
8000098c:	4814                	lw	a3,16(s0)
8000098e:	010b2583          	lw	a1,16(s6)
80000992:	96ba                	add	a3,a3,a4
80000994:	95ba                	add	a1,a1,a4
80000996:	96c2                	add	a3,a3,a6
80000998:	6194                	flw	fa3,0(a1)
8000099a:	6298                	flw	fa4,0(a3)
8000099c:	78e6f7c3          	fmadd.s	fa5,fa3,fa4,fa5
800009a0:	0785                	addi	a5,a5,1
800009a2:	0711                	addi	a4,a4,4
800009a4:	fef612e3          	bne	a2,a5,80000988 <MiCo_conv2d_f32+0x28c>
800009a8:	0505                	addi	a0,a0,1
800009aa:	98ea                	add	a7,a7,s10
800009ac:	9826                	add	a6,a6,s1
800009ae:	fc6515e3          	bne	a0,t1,80000978 <MiCo_conv2d_f32+0x27c>
800009b2:	0f05                	addi	t5,t5,1
800009b4:	9fe2                	add	t6,t6,s8
800009b6:	9ede                	add	t4,t4,s7
800009b8:	fb9f6be3          	bltu	t5,s9,8000096e <MiCo_conv2d_f32+0x272>
800009bc:	000a2707          	flw	fa4,0(s4)
800009c0:	57f2                	lw	a5,60(sp)
800009c2:	0a11                	addi	s4,s4,4
800009c4:	00f777d3          	fadd.s	fa5,fa4,fa5
800009c8:	9e3e                	add	t3,t3,a5
800009ca:	963e                	add	a2,a2,a5
800009cc:	fefa2e27          	fsw	fa5,-4(s4)
800009d0:	f87a13e3          	bne	s4,t2,80000956 <MiCo_conv2d_f32+0x25a>
800009d4:	46f2                	lw	a3,28(sp)
800009d6:	4662                	lw	a2,24(sp)
800009d8:	4756                	lw	a4,84(sp)
800009da:	96b2                	add	a3,a3,a2
800009dc:	ce36                	sw	a3,28(sp)
800009de:	4676                	lw	a2,92(sp)
800009e0:	46d2                	lw	a3,20(sp)
800009e2:	00170793          	addi	a5,a4,1
800009e6:	96b2                	add	a3,a3,a2
800009e8:	ca36                	sw	a3,20(sp)
800009ea:	56f2                	lw	a3,60(sp)
800009ec:	9336                	add	t1,t1,a3
800009ee:	4686                	lw	a3,64(sp)
800009f0:	00e68463          	beq	a3,a4,800009f8 <MiCo_conv2d_f32+0x2fc>
800009f4:	cabe                	sw	a5,84(sp)
800009f6:	bf35                	j	80000932 <MiCo_conv2d_f32+0x236>
800009f8:	5702                	lw	a4,32(sp)
800009fa:	46ba                	lw	a3,140(sp)
800009fc:	47c6                	lw	a5,80(sp)
800009fe:	9736                	add	a4,a4,a3
80000a00:	d03a                	sw	a4,32(sp)
80000a02:	5686                	lw	a3,96(sp)
80000a04:	5712                	lw	a4,36(sp)
80000a06:	0785                	addi	a5,a5,1
80000a08:	c8be                	sw	a5,80(sp)
80000a0a:	9736                	add	a4,a4,a3
80000a0c:	d23a                	sw	a4,36(sp)
80000a0e:	4726                	lw	a4,72(sp)
80000a10:	f0e7e8e3          	bltu	a5,a4,80000920 <MiCo_conv2d_f32+0x224>
80000a14:	5722                	lw	a4,40(sp)
80000a16:	56a6                	lw	a3,104(sp)
80000a18:	4796                	lw	a5,68(sp)
80000a1a:	9736                	add	a4,a4,a3
80000a1c:	d43a                	sw	a4,40(sp)
80000a1e:	56b6                	lw	a3,108(sp)
80000a20:	5732                	lw	a4,44(sp)
80000a22:	0785                	addi	a5,a5,1
80000a24:	c2be                	sw	a5,68(sp)
80000a26:	9736                	add	a4,a4,a3
80000a28:	d63a                	sw	a4,44(sp)
80000a2a:	56c6                	lw	a3,112(sp)
80000a2c:	5742                	lw	a4,48(sp)
80000a2e:	9736                	add	a4,a4,a3
80000a30:	d83a                	sw	a4,48(sp)
80000a32:	4732                	lw	a4,12(sp)
80000a34:	eef711e3          	bne	a4,a5,80000916 <MiCo_conv2d_f32+0x21a>
80000a38:	5752                	lw	a4,52(sp)
80000a3a:	56d6                	lw	a3,116(sp)
80000a3c:	87e2                	mv	a5,s8
80000a3e:	8c5e                	mv	s8,s7
80000a40:	9736                	add	a4,a4,a3
80000a42:	da3a                	sw	a4,52(sp)
80000a44:	56e6                	lw	a3,120(sp)
80000a46:	5762                	lw	a4,56(sp)
80000a48:	8be6                	mv	s7,s9
80000a4a:	8cbe                	mv	s9,a5
80000a4c:	47b6                	lw	a5,76(sp)
80000a4e:	9736                	add	a4,a4,a3
80000a50:	dc3a                	sw	a4,56(sp)
80000a52:	4722                	lw	a4,8(sp)
80000a54:	0785                	addi	a5,a5,1
80000a56:	c6be                	sw	a5,76(sp)
80000a58:	8a4a                	mv	s4,s2
80000a5a:	eae7e3e3          	bltu	a5,a4,80000900 <MiCo_conv2d_f32+0x204>
80000a5e:	40be                	lw	ra,204(sp)
80000a60:	442e                	lw	s0,200(sp)
80000a62:	449e                	lw	s1,196(sp)
80000a64:	490e                	lw	s2,192(sp)
80000a66:	59fa                	lw	s3,188(sp)
80000a68:	5a6a                	lw	s4,184(sp)
80000a6a:	5ada                	lw	s5,180(sp)
80000a6c:	5b4a                	lw	s6,176(sp)
80000a6e:	5bba                	lw	s7,172(sp)
80000a70:	5c2a                	lw	s8,168(sp)
80000a72:	5c9a                	lw	s9,164(sp)
80000a74:	5d0a                	lw	s10,160(sp)
80000a76:	4dfa                	lw	s11,156(sp)
80000a78:	6169                	addi	sp,sp,208
80000a7a:	8082                	ret
80000a7c:	000a2707          	flw	fa4,0(s4)
80000a80:	f00007d3          	fmv.w.x	fa5,zero
80000a84:	57f2                	lw	a5,60(sp)
80000a86:	0a11                	addi	s4,s4,4
80000a88:	00f777d3          	fadd.s	fa5,fa4,fa5
80000a8c:	9e3e                	add	t3,t3,a5
80000a8e:	963e                	add	a2,a2,a5
80000a90:	fefa2e27          	fsw	fa5,-4(s4)
80000a94:	ec7a11e3          	bne	s4,t2,80000956 <MiCo_conv2d_f32+0x25a>
80000a98:	bf35                	j	800009d4 <MiCo_conv2d_f32+0x2d8>
80000a9a:	0785                	addi	a5,a5,1
80000a9c:	9576                	add	a0,a0,t4
80000a9e:	d6f911e3          	bne	s2,a5,80000800 <MiCo_conv2d_f32+0x104>
80000aa2:	47a2                	lw	a5,8(sp)
80000aa4:	0605                	addi	a2,a2,1
80000aa6:	9596                	add	a1,a1,t0
80000aa8:	d4c79ae3          	bne	a5,a2,800007fc <MiCo_conv2d_f32+0x100>
80000aac:	b37d                	j	8000085a <MiCo_conv2d_f32+0x15e>

80000aae <MiCo_flatten2d_f32>:
80000aae:	4594                	lw	a3,8(a1)
80000ab0:	41dc                	lw	a5,4(a1)
80000ab2:	45d8                	lw	a4,12(a1)
80000ab4:	4190                	lw	a2,0(a1)
80000ab6:	02d787b3          	mul	a5,a5,a3
80000aba:	4994                	lw	a3,16(a1)
80000abc:	c110                	sw	a2,0(a0)
80000abe:	c514                	sw	a3,8(a0)
80000ac0:	02e787b3          	mul	a5,a5,a4
80000ac4:	c15c                	sw	a5,4(a0)
80000ac6:	8082                	ret

80000ac8 <im2col_get_pixel>:
80000ac8:	410686b3          	sub	a3,a3,a6
80000acc:	f0000553          	fmv.w.x	fa0,zero
80000ad0:	0206c363          	bltz	a3,80000af6 <im2col_get_pixel+0x2e>
80000ad4:	41070733          	sub	a4,a4,a6
80000ad8:	00074f63          	bltz	a4,80000af6 <im2col_get_pixel+0x2e>
80000adc:	00b6dd63          	bge	a3,a1,80000af6 <im2col_get_pixel+0x2e>
80000ae0:	00c75b63          	bge	a4,a2,80000af6 <im2col_get_pixel+0x2e>
80000ae4:	02f585b3          	mul	a1,a1,a5
80000ae8:	95b6                	add	a1,a1,a3
80000aea:	02c587b3          	mul	a5,a1,a2
80000aee:	97ba                	add	a5,a5,a4
80000af0:	078a                	slli	a5,a5,0x2
80000af2:	953e                	add	a0,a0,a5
80000af4:	6108                	flw	fa0,0(a0)
80000af6:	8082                	ret

80000af8 <im2col>:
80000af8:	7159                	addi	sp,sp,-112
80000afa:	cad6                	sw	s5,84(sp)
80000afc:	c8da                	sw	s6,80(sp)
80000afe:	8ab6                	mv	s5,a3
80000b00:	8b42                	mv	s6,a6
80000b02:	0806                	slli	a6,a6,0x1
80000b04:	86ba                	mv	a3,a4
80000b06:	de6e                	sw	s11,60(sp)
80000b08:	d63a                	sw	a4,44(sp)
80000b0a:	01580db3          	add	s11,a6,s5
80000b0e:	00c80733          	add	a4,a6,a2
80000b12:	8f15                	sub	a4,a4,a3
80000b14:	d0ca                	sw	s2,96(sp)
80000b16:	893e                	mv	s2,a5
80000b18:	40dd87b3          	sub	a5,s11,a3
80000b1c:	03274733          	div	a4,a4,s2
80000b20:	d686                	sw	ra,108(sp)
80000b22:	d4a2                	sw	s0,104(sp)
80000b24:	d2a6                	sw	s1,100(sp)
80000b26:	cece                	sw	s3,92(sp)
80000b28:	ccd2                	sw	s4,88(sp)
80000b2a:	c6de                	sw	s7,76(sp)
80000b2c:	c4e2                	sw	s8,72(sp)
80000b2e:	c2e6                	sw	s9,68(sp)
80000b30:	c0ea                	sw	s10,64(sp)
80000b32:	ca46                	sw	a7,20(sp)
80000b34:	0327c7b3          	div	a5,a5,s2
80000b38:	c63a                	sw	a4,12(sp)
80000b3a:	0705                	addi	a4,a4,1
80000b3c:	d23a                	sw	a4,36(sp)
80000b3e:	02b685b3          	mul	a1,a3,a1
80000b42:	c83e                	sw	a5,16(sp)
80000b44:	0785                	addi	a5,a5,1
80000b46:	c23e                	sw	a5,4(sp)
80000b48:	02d586b3          	mul	a3,a1,a3
80000b4c:	d436                	sw	a3,40(sp)
80000b4e:	08d05b63          	blez	a3,80000be4 <im2col+0xec>
80000b52:	08e05963          	blez	a4,80000be4 <im2col+0xec>
80000b56:	08f05763          	blez	a5,80000be4 <im2col+0xec>
80000b5a:	00488793          	addi	a5,a7,4
80000b5e:	8a32                	mv	s4,a2
80000b60:	8daa                	mv	s11,a0
80000b62:	d002                	sw	zero,32(sp)
80000b64:	ce02                	sw	zero,28(sp)
80000b66:	cc3e                	sw	a5,24(sp)
80000b68:	57b2                	lw	a5,44(sp)
80000b6a:	4772                	lw	a4,28(sp)
80000b6c:	4c01                	li	s8,0
80000b6e:	02f744b3          	div	s1,a4,a5
80000b72:	02f76733          	rem	a4,a4,a5
80000b76:	02f4c9b3          	div	s3,s1,a5
80000b7a:	c43a                	sw	a4,8(sp)
80000b7c:	4712                	lw	a4,4(sp)
80000b7e:	02f4e4b3          	rem	s1,s1,a5
80000b82:	5782                	lw	a5,32(sp)
80000b84:	02e78bb3          	mul	s7,a5,a4
80000b88:	47c2                	lw	a5,16(sp)
80000b8a:	002b9893          	slli	a7,s7,0x2
80000b8e:	4ca2                	lw	s9,8(sp)
80000b90:	01778433          	add	s0,a5,s7
80000b94:	47d2                	lw	a5,20(sp)
80000b96:	040a                	slli	s0,s0,0x2
80000b98:	00f88d33          	add	s10,a7,a5
80000b9c:	47e2                	lw	a5,24(sp)
80000b9e:	943e                	add	s0,s0,a5
80000ba0:	8766                	mv	a4,s9
80000ba2:	885a                	mv	a6,s6
80000ba4:	87ce                	mv	a5,s3
80000ba6:	86a6                	mv	a3,s1
80000ba8:	8656                	mv	a2,s5
80000baa:	85d2                	mv	a1,s4
80000bac:	856e                	mv	a0,s11
80000bae:	3f29                	jal	80000ac8 <im2col_get_pixel>
80000bb0:	0d11                	addi	s10,s10,4
80000bb2:	fead2e27          	fsw	fa0,-4(s10)
80000bb6:	9cca                	add	s9,s9,s2
80000bb8:	fe8d14e3          	bne	s10,s0,80000ba0 <im2col+0xa8>
80000bbc:	4712                	lw	a4,4(sp)
80000bbe:	001c0793          	addi	a5,s8,1
80000bc2:	94ca                	add	s1,s1,s2
80000bc4:	9bba                	add	s7,s7,a4
80000bc6:	4732                	lw	a4,12(sp)
80000bc8:	01870463          	beq	a4,s8,80000bd0 <im2col+0xd8>
80000bcc:	8c3e                	mv	s8,a5
80000bce:	bf6d                	j	80000b88 <im2col+0x90>
80000bd0:	5702                	lw	a4,32(sp)
80000bd2:	5692                	lw	a3,36(sp)
80000bd4:	47f2                	lw	a5,28(sp)
80000bd6:	9736                	add	a4,a4,a3
80000bd8:	d03a                	sw	a4,32(sp)
80000bda:	5722                	lw	a4,40(sp)
80000bdc:	0785                	addi	a5,a5,1
80000bde:	ce3e                	sw	a5,28(sp)
80000be0:	f8f714e3          	bne	a4,a5,80000b68 <im2col+0x70>
80000be4:	50b6                	lw	ra,108(sp)
80000be6:	5426                	lw	s0,104(sp)
80000be8:	5496                	lw	s1,100(sp)
80000bea:	5906                	lw	s2,96(sp)
80000bec:	49f6                	lw	s3,92(sp)
80000bee:	4a66                	lw	s4,88(sp)
80000bf0:	4ad6                	lw	s5,84(sp)
80000bf2:	4b46                	lw	s6,80(sp)
80000bf4:	4bb6                	lw	s7,76(sp)
80000bf6:	4c26                	lw	s8,72(sp)
80000bf8:	4c96                	lw	s9,68(sp)
80000bfa:	4d06                	lw	s10,64(sp)
80000bfc:	5df2                	lw	s11,60(sp)
80000bfe:	6165                	addi	sp,sp,112
80000c00:	8082                	ret

80000c02 <im2col_T>:
80000c02:	7159                	addi	sp,sp,-112
80000c04:	cad6                	sw	s5,84(sp)
80000c06:	8ab6                	mv	s5,a3
80000c08:	86ba                	mv	a3,a4
80000c0a:	02b685b3          	mul	a1,a3,a1
80000c0e:	c8da                	sw	s6,80(sp)
80000c10:	8b42                	mv	s6,a6
80000c12:	0806                	slli	a6,a6,0x1
80000c14:	d43a                	sw	a4,40(sp)
80000c16:	01580733          	add	a4,a6,s5
80000c1a:	9832                	add	a6,a6,a2
80000c1c:	8f15                	sub	a4,a4,a3
80000c1e:	40d80833          	sub	a6,a6,a3
80000c22:	d2a6                	sw	s1,100(sp)
80000c24:	02d586b3          	mul	a3,a1,a3
80000c28:	cece                	sw	s3,92(sp)
80000c2a:	d686                	sw	ra,108(sp)
80000c2c:	d4a2                	sw	s0,104(sp)
80000c2e:	d0ca                	sw	s2,96(sp)
80000c30:	ccd2                	sw	s4,88(sp)
80000c32:	c6de                	sw	s7,76(sp)
80000c34:	c4e2                	sw	s8,72(sp)
80000c36:	c2e6                	sw	s9,68(sp)
80000c38:	c0ea                	sw	s10,64(sp)
80000c3a:	de6e                	sw	s11,60(sp)
80000c3c:	d646                	sw	a7,44(sp)
80000c3e:	d236                	sw	a3,36(sp)
80000c40:	02f749b3          	div	s3,a4,a5
80000c44:	84be                	mv	s1,a5
80000c46:	02f84733          	div	a4,a6,a5
80000c4a:	08d05863          	blez	a3,80000cda <im2col_T+0xd8>
80000c4e:	08074663          	bltz	a4,80000cda <im2col_T+0xd8>
80000c52:	00198793          	addi	a5,s3,1
80000c56:	08f05263          	blez	a5,80000cda <im2col_T+0xd8>
80000c5a:	0705                	addi	a4,a4,1
80000c5c:	8a32                	mv	s4,a2
80000c5e:	8d2a                	mv	s10,a0
80000c60:	00269b93          	slli	s7,a3,0x2
80000c64:	d002                	sw	zero,32(sp)
80000c66:	ce3a                	sw	a4,28(sp)
80000c68:	02d787b3          	mul	a5,a5,a3
80000c6c:	078a                	slli	a5,a5,0x2
80000c6e:	cc3e                	sw	a5,24(sp)
80000c70:	57a2                	lw	a5,40(sp)
80000c72:	5702                	lw	a4,32(sp)
80000c74:	56b2                	lw	a3,44(sp)
80000c76:	c802                	sw	zero,16(sp)
80000c78:	02f74433          	div	s0,a4,a5
80000c7c:	00271c13          	slli	s8,a4,0x2
80000c80:	96e2                	add	a3,a3,s8
80000c82:	c636                	sw	a3,12(sp)
80000c84:	02f76733          	rem	a4,a4,a5
80000c88:	02f44933          	div	s2,s0,a5
80000c8c:	ca3a                	sw	a4,20(sp)
80000c8e:	02f46433          	rem	s0,s0,a5
80000c92:	4cd2                	lw	s9,20(sp)
80000c94:	4c32                	lw	s8,12(sp)
80000c96:	4d81                	li	s11,0
80000c98:	8766                	mv	a4,s9
80000c9a:	885a                	mv	a6,s6
80000c9c:	87ca                	mv	a5,s2
80000c9e:	86a2                	mv	a3,s0
80000ca0:	8656                	mv	a2,s5
80000ca2:	85d2                	mv	a1,s4
80000ca4:	856a                	mv	a0,s10
80000ca6:	350d                	jal	80000ac8 <im2col_get_pixel>
80000ca8:	876e                	mv	a4,s11
80000caa:	00ac2027          	fsw	fa0,0(s8)
80000cae:	9ca6                	add	s9,s9,s1
80000cb0:	0d85                	addi	s11,s11,1
80000cb2:	9c5e                	add	s8,s8,s7
80000cb4:	fee992e3          	bne	s3,a4,80000c98 <im2col_T+0x96>
80000cb8:	4732                	lw	a4,12(sp)
80000cba:	46e2                	lw	a3,24(sp)
80000cbc:	47c2                	lw	a5,16(sp)
80000cbe:	9426                	add	s0,s0,s1
80000cc0:	9736                	add	a4,a4,a3
80000cc2:	c63a                	sw	a4,12(sp)
80000cc4:	4772                	lw	a4,28(sp)
80000cc6:	0785                	addi	a5,a5,1
80000cc8:	c83e                	sw	a5,16(sp)
80000cca:	fce794e3          	bne	a5,a4,80000c92 <im2col_T+0x90>
80000cce:	5782                	lw	a5,32(sp)
80000cd0:	5712                	lw	a4,36(sp)
80000cd2:	0785                	addi	a5,a5,1
80000cd4:	d03e                	sw	a5,32(sp)
80000cd6:	f8f71de3          	bne	a4,a5,80000c70 <im2col_T+0x6e>
80000cda:	50b6                	lw	ra,108(sp)
80000cdc:	5426                	lw	s0,104(sp)
80000cde:	5496                	lw	s1,100(sp)
80000ce0:	5906                	lw	s2,96(sp)
80000ce2:	49f6                	lw	s3,92(sp)
80000ce4:	4a66                	lw	s4,88(sp)
80000ce6:	4ad6                	lw	s5,84(sp)
80000ce8:	4b46                	lw	s6,80(sp)
80000cea:	4bb6                	lw	s7,76(sp)
80000cec:	4c26                	lw	s8,72(sp)
80000cee:	4c96                	lw	s9,68(sp)
80000cf0:	4d06                	lw	s10,64(sp)
80000cf2:	5df2                	lw	s11,60(sp)
80000cf4:	6165                	addi	sp,sp,112
80000cf6:	8082                	ret

80000cf8 <im2col_block_T>:
80000cf8:	7139                	addi	sp,sp,-64
80000cfa:	d456                	sw	s5,40(sp)
80000cfc:	02b70ab3          	mul	s5,a4,a1
80000d00:	dc26                	sw	s1,56(sp)
80000d02:	84ba                	mv	s1,a4
80000d04:	d25a                	sw	s6,36(sp)
80000d06:	8b42                	mv	s6,a6
80000d08:	001b1713          	slli	a4,s6,0x1
80000d0c:	9736                	add	a4,a4,a3
80000d0e:	8f05                	sub	a4,a4,s1
80000d10:	da4a                	sw	s2,52(sp)
80000d12:	d84e                	sw	s3,48(sp)
80000d14:	029a8ab3          	mul	s5,s5,s1
80000d18:	4996                	lw	s3,68(sp)
80000d1a:	8e3e                	mv	t3,a5
80000d1c:	8946                	mv	s2,a7
80000d1e:	de22                	sw	s0,60(sp)
80000d20:	d652                	sw	s4,44(sp)
80000d22:	d05e                	sw	s7,32(sp)
80000d24:	ce62                	sw	s8,28(sp)
80000d26:	cc66                	sw	s9,24(sp)
80000d28:	ca6a                	sw	s10,20(sp)
80000d2a:	02f748b3          	div	a7,a4,a5
80000d2e:	4786                	lw	a5,64(sp)
80000d30:	c86e                	sw	s11,16(sp)
80000d32:	8836                	mv	a6,a3
80000d34:	99be                	add	s3,s3,a5
80000d36:	46a6                	lw	a3,72(sp)
80000d38:	09505d63          	blez	s5,80000dd2 <im2col_block_T+0xda>
80000d3c:	02948d33          	mul	s10,s1,s1
80000d40:	0937d963          	bge	a5,s3,80000dd2 <im2col_block_T+0xda>
80000d44:	4785                	li	a5,1
80000d46:	8c2a                	mv	s8,a0
80000d48:	8f32                	mv	t5,a2
80000d4a:	0efe1663          	bne	t3,a5,80000e36 <im2col_block_T+0x13e>
80000d4e:	4786                	lw	a5,64(sp)
80000d50:	416e0e33          	sub	t3,t3,s6
80000d54:	8a4a                	mv	s4,s2
80000d56:	4381                	li	t2,0
80000d58:	03568fb3          	mul	t6,a3,s5
80000d5c:	41678bb3          	sub	s7,a5,s6
80000d60:	002a9693          	slli	a3,s5,0x2
80000d64:	416989b3          	sub	s3,s3,s6
80000d68:	011e02b3          	add	t0,t3,a7
80000d6c:	00188613          	addi	a2,a7,1
80000d70:	0f8a                	slli	t6,t6,0x2
80000d72:	0293c7b3          	div	a5,t2,s1
80000d76:	8e52                	mv	t3,s4
80000d78:	03a3c533          	div	a0,t2,s10
80000d7c:	0297e7b3          	rem	a5,a5,s1
80000d80:	0293e333          	rem	t1,t2,s1
80000d84:	00fb85b3          	add	a1,s7,a5
80000d88:	00f98eb3          	add	t4,s3,a5
80000d8c:	03e50533          	mul	a0,a0,t5
80000d90:	41630933          	sub	s2,t1,s6
80000d94:	00291413          	slli	s0,s2,0x2
80000d98:	9462                	add	s0,s0,s8
80000d9a:	9316                	add	t1,t1,t0
80000d9c:	955e                	add	a0,a0,s7
80000d9e:	953e                	add	a0,a0,a5
80000da0:	03050533          	mul	a0,a0,a6
80000da4:	0008ce63          	bltz	a7,80000dc0 <im2col_block_T+0xc8>
80000da8:	0405c363          	bltz	a1,80000dee <im2col_block_T+0xf6>
80000dac:	05e5cf63          	blt	a1,t5,80000e0a <im2col_block_T+0x112>
80000db0:	8772                	mv	a4,t3
80000db2:	4781                	li	a5,0
80000db4:	00072023          	sw	zero,0(a4)
80000db8:	0785                	addi	a5,a5,1
80000dba:	9736                	add	a4,a4,a3
80000dbc:	fec79ce3          	bne	a5,a2,80000db4 <im2col_block_T+0xbc>
80000dc0:	0585                	addi	a1,a1,1
80000dc2:	9e7e                	add	t3,t3,t6
80000dc4:	9542                	add	a0,a0,a6
80000dc6:	fdd59fe3          	bne	a1,t4,80000da4 <im2col_block_T+0xac>
80000dca:	0385                	addi	t2,t2,1
80000dcc:	0a11                	addi	s4,s4,4
80000dce:	fa7a92e3          	bne	s5,t2,80000d72 <im2col_block_T+0x7a>
80000dd2:	5472                	lw	s0,60(sp)
80000dd4:	54e2                	lw	s1,56(sp)
80000dd6:	5952                	lw	s2,52(sp)
80000dd8:	59c2                	lw	s3,48(sp)
80000dda:	5a32                	lw	s4,44(sp)
80000ddc:	5aa2                	lw	s5,40(sp)
80000dde:	5b12                	lw	s6,36(sp)
80000de0:	5b82                	lw	s7,32(sp)
80000de2:	4c72                	lw	s8,28(sp)
80000de4:	4ce2                	lw	s9,24(sp)
80000de6:	4d52                	lw	s10,20(sp)
80000de8:	4dc2                	lw	s11,16(sp)
80000dea:	6121                	addi	sp,sp,64
80000dec:	8082                	ret
80000dee:	8772                	mv	a4,t3
80000df0:	4781                	li	a5,0
80000df2:	00072023          	sw	zero,0(a4)
80000df6:	0785                	addi	a5,a5,1
80000df8:	9736                	add	a4,a4,a3
80000dfa:	fef61ce3          	bne	a2,a5,80000df2 <im2col_block_T+0xfa>
80000dfe:	0585                	addi	a1,a1,1
80000e00:	9e7e                	add	t3,t3,t6
80000e02:	9542                	add	a0,a0,a6
80000e04:	fbd590e3          	bne	a1,t4,80000da4 <im2col_block_T+0xac>
80000e08:	b7c9                	j	80000dca <im2col_block_T+0xd2>
80000e0a:	00251c93          	slli	s9,a0,0x2
80000e0e:	87ca                	mv	a5,s2
80000e10:	9ca2                	add	s9,s9,s0
80000e12:	8772                	mv	a4,t3
80000e14:	0007ce63          	bltz	a5,80000e30 <im2col_block_T+0x138>
80000e18:	0107dc63          	bge	a5,a6,80000e30 <im2col_block_T+0x138>
80000e1c:	000ca787          	flw	fa5,0(s9)
80000e20:	e31c                	fsw	fa5,0(a4)
80000e22:	0785                	addi	a5,a5,1
80000e24:	0c91                	addi	s9,s9,4
80000e26:	9736                	add	a4,a4,a3
80000e28:	f8678ce3          	beq	a5,t1,80000dc0 <im2col_block_T+0xc8>
80000e2c:	fe07d6e3          	bgez	a5,80000e18 <im2col_block_T+0x120>
80000e30:	00072023          	sw	zero,0(a4)
80000e34:	b7fd                	j	80000e22 <im2col_block_T+0x12a>
80000e36:	4606                	lw	a2,64(sp)
80000e38:	035686b3          	mul	a3,a3,s5
80000e3c:	002e1413          	slli	s0,t3,0x2
80000e40:	002a9713          	slli	a4,s5,0x2
80000e44:	4c81                	li	s9,0
80000e46:	00188793          	addi	a5,a7,1
80000e4a:	03c60633          	mul	a2,a2,t3
80000e4e:	00269313          	slli	t1,a3,0x2
80000e52:	03c80a33          	mul	s4,a6,t3
80000e56:	416606b3          	sub	a3,a2,s6
80000e5a:	c636                	sw	a3,12(sp)
80000e5c:	4632                	lw	a2,12(sp)
80000e5e:	4286                	lw	t0,64(sp)
80000e60:	83ca                	mv	t2,s2
80000e62:	029cc6b3          	div	a3,s9,s1
80000e66:	03accfb3          	div	t6,s9,s10
80000e6a:	0296e6b3          	rem	a3,a3,s1
80000e6e:	029cebb3          	rem	s7,s9,s1
80000e72:	00d60eb3          	add	t4,a2,a3
80000e76:	03ef8fb3          	mul	t6,t6,t5
80000e7a:	416b8bb3          	sub	s7,s7,s6
80000e7e:	002b9d93          	slli	s11,s7,0x2
80000e82:	9de2                	add	s11,s11,s8
80000e84:	9fb6                	add	t6,t6,a3
80000e86:	9fb2                	add	t6,t6,a2
80000e88:	030f8fb3          	mul	t6,t6,a6
80000e8c:	0008ce63          	bltz	a7,80000ea8 <im2col_block_T+0x1b0>
80000e90:	020ec763          	bltz	t4,80000ebe <im2col_block_T+0x1c6>
80000e94:	03eece63          	blt	t4,t5,80000ed0 <im2col_block_T+0x1d8>
80000e98:	861e                	mv	a2,t2
80000e9a:	4681                	li	a3,0
80000e9c:	00062023          	sw	zero,0(a2)
80000ea0:	0685                	addi	a3,a3,1
80000ea2:	963a                	add	a2,a2,a4
80000ea4:	fef69ce3          	bne	a3,a5,80000e9c <im2col_block_T+0x1a4>
80000ea8:	0285                	addi	t0,t0,1
80000eaa:	939a                	add	t2,t2,t1
80000eac:	9fd2                	add	t6,t6,s4
80000eae:	9ef2                	add	t4,t4,t3
80000eb0:	fc599ee3          	bne	s3,t0,80000e8c <im2col_block_T+0x194>
80000eb4:	0c85                	addi	s9,s9,1
80000eb6:	0911                	addi	s2,s2,4
80000eb8:	fb9a92e3          	bne	s5,s9,80000e5c <im2col_block_T+0x164>
80000ebc:	bf19                	j	80000dd2 <im2col_block_T+0xda>
80000ebe:	861e                	mv	a2,t2
80000ec0:	4681                	li	a3,0
80000ec2:	00062023          	sw	zero,0(a2)
80000ec6:	0685                	addi	a3,a3,1
80000ec8:	963a                	add	a2,a2,a4
80000eca:	fef69ce3          	bne	a3,a5,80000ec2 <im2col_block_T+0x1ca>
80000ece:	bfe9                	j	80000ea8 <im2col_block_T+0x1b0>
80000ed0:	002f9513          	slli	a0,t6,0x2
80000ed4:	86de                	mv	a3,s7
80000ed6:	956e                	add	a0,a0,s11
80000ed8:	859e                	mv	a1,t2
80000eda:	4601                	li	a2,0
80000edc:	0006ce63          	bltz	a3,80000ef8 <im2col_block_T+0x200>
80000ee0:	0106dc63          	bge	a3,a6,80000ef8 <im2col_block_T+0x200>
80000ee4:	611c                	flw	fa5,0(a0)
80000ee6:	e19c                	fsw	fa5,0(a1)
80000ee8:	0605                	addi	a2,a2,1
80000eea:	96f2                	add	a3,a3,t3
80000eec:	9522                	add	a0,a0,s0
80000eee:	95ba                	add	a1,a1,a4
80000ef0:	faf60ce3          	beq	a2,a5,80000ea8 <im2col_block_T+0x1b0>
80000ef4:	fe06d6e3          	bgez	a3,80000ee0 <im2col_block_T+0x1e8>
80000ef8:	0005a023          	sw	zero,0(a1)
80000efc:	b7f5                	j	80000ee8 <im2col_block_T+0x1f0>

80000efe <im2col_block_T_aligned>:
80000efe:	711d                	addi	sp,sp,-96
80000f00:	caa6                	sw	s1,84(sp)
80000f02:	84b6                	mv	s1,a3
80000f04:	00181693          	slli	a3,a6,0x1
80000f08:	96a6                	add	a3,a3,s1
80000f0a:	8e99                	sub	a3,a3,a4
80000f0c:	cca2                	sw	s0,88(sp)
80000f0e:	02f6c433          	div	s0,a3,a5
80000f12:	c0da                	sw	s6,64(sp)
80000f14:	8b3a                	mv	s6,a4
80000f16:	c6ce                	sw	s3,76(sp)
80000f18:	c4d2                	sw	s4,72(sp)
80000f1a:	c2d6                	sw	s5,68(sp)
80000f1c:	d66e                	sw	s11,44(sp)
80000f1e:	8a3e                	mv	s4,a5
80000f20:	ce86                	sw	ra,92(sp)
80000f22:	c8ca                	sw	s2,80(sp)
80000f24:	de5e                	sw	s7,60(sp)
80000f26:	dc62                	sw	s8,56(sp)
80000f28:	da66                	sw	s9,52(sp)
80000f2a:	d86a                	sw	s10,48(sp)
80000f2c:	ca2a                	sw	a0,20(sp)
80000f2e:	cc46                	sw	a7,24(sp)
80000f30:	8dc2                	mv	s11,a6
80000f32:	8ab2                	mv	s5,a2
80000f34:	02b705b3          	mul	a1,a4,a1
80000f38:	00140993          	addi	s3,s0,1
80000f3c:	02e58733          	mul	a4,a1,a4
80000f40:	c83a                	sw	a4,16(sp)
80000f42:	01f77793          	andi	a5,a4,31
80000f46:	c63a                	sw	a4,12(sp)
80000f48:	cb99                	beqz	a5,80000f5e <im2col_block_T_aligned+0x60>
80000f4a:	41f75913          	srai	s2,a4,0x1f
80000f4e:	01f97913          	andi	s2,s2,31
80000f52:	993a                	add	s2,s2,a4
80000f54:	fe097913          	andi	s2,s2,-32
80000f58:	02090793          	addi	a5,s2,32
80000f5c:	c63e                	sw	a5,12(sp)
80000f5e:	5796                	lw	a5,100(sp)
80000f60:	5706                	lw	a4,96(sp)
80000f62:	00f70d33          	add	s10,a4,a5
80000f66:	0fa75663          	bge	a4,s10,80001052 <im2col_block_T_aligned+0x154>
80000f6a:	47b2                	lw	a5,12(sp)
80000f6c:	00279913          	slli	s2,a5,0x2
80000f70:	03305c63          	blez	s3,80000fa8 <im2col_block_T_aligned+0xaa>
80000f74:	8c3a                	mv	s8,a4
80000f76:	5726                	lw	a4,104(sp)
80000f78:	4ce2                	lw	s9,24(sp)
80000f7a:	ce26                	sw	s1,28(sp)
80000f7c:	02e787b3          	mul	a5,a5,a4
80000f80:	078a                	slli	a5,a5,0x2
80000f82:	84be                	mv	s1,a5
80000f84:	87e6                	mv	a5,s9
80000f86:	4b81                	li	s7,0
80000f88:	853e                	mv	a0,a5
80000f8a:	864a                	mv	a2,s2
80000f8c:	4581                	li	a1,0
80000f8e:	713070ef          	jal	ra,80008ea0 <memset>
80000f92:	875e                	mv	a4,s7
80000f94:	012507b3          	add	a5,a0,s2
80000f98:	0b85                	addi	s7,s7,1
80000f9a:	fee417e3          	bne	s0,a4,80000f88 <im2col_block_T_aligned+0x8a>
80000f9e:	0c05                	addi	s8,s8,1
80000fa0:	9ca6                	add	s9,s9,s1
80000fa2:	ff8d11e3          	bne	s10,s8,80000f84 <im2col_block_T_aligned+0x86>
80000fa6:	44f2                	lw	s1,28(sp)
80000fa8:	47c2                	lw	a5,16(sp)
80000faa:	0af05463          	blez	a5,80001052 <im2col_block_T_aligned+0x154>
80000fae:	4785                	li	a5,1
80000fb0:	036b03b3          	mul	t2,s6,s6
80000fb4:	0afa1e63          	bne	s4,a5,80001070 <im2col_block_T_aligned+0x172>
80000fb8:	57a6                	lw	a5,104(sp)
80000fba:	4732                	lw	a4,12(sp)
80000fbc:	4be2                	lw	s7,24(sp)
80000fbe:	4fc2                	lw	t6,16(sp)
80000fc0:	002d9c93          	slli	s9,s11,0x2
80000fc4:	41ba0a33          	sub	s4,s4,s11
80000fc8:	4e81                	li	t4,0
80000fca:	41bd0c33          	sub	s8,s10,s11
80000fce:	02e78e33          	mul	t3,a5,a4
80000fd2:	5786                	lw	a5,96(sp)
80000fd4:	9452                	add	s0,s0,s4
80000fd6:	41b782b3          	sub	t0,a5,s11
80000fda:	47d2                	lw	a5,20(sp)
80000fdc:	41978cb3          	sub	s9,a5,s9
80000fe0:	0e0a                	slli	t3,t3,0x2
80000fe2:	036ec7b3          	div	a5,t4,s6
80000fe6:	885e                	mv	a6,s7
80000fe8:	027ec5b3          	div	a1,t4,t2
80000fec:	0367e7b3          	rem	a5,a5,s6
80000ff0:	036ee333          	rem	t1,t4,s6
80000ff4:	00f28633          	add	a2,t0,a5
80000ff8:	00fc08b3          	add	a7,s8,a5
80000ffc:	035585b3          	mul	a1,a1,s5
80001000:	00231f13          	slli	t5,t1,0x2
80001004:	9f66                	add	t5,t5,s9
80001006:	00640533          	add	a0,s0,t1
8000100a:	9596                	add	a1,a1,t0
8000100c:	95be                	add	a1,a1,a5
8000100e:	029585b3          	mul	a1,a1,s1
80001012:	03305763          	blez	s3,80001040 <im2col_block_T_aligned+0x142>
80001016:	02064563          	bltz	a2,80001040 <im2col_block_T_aligned+0x142>
8000101a:	03565363          	bge	a2,s5,80001040 <im2col_block_T_aligned+0x142>
8000101e:	00259713          	slli	a4,a1,0x2
80001022:	41b307b3          	sub	a5,t1,s11
80001026:	977a                	add	a4,a4,t5
80001028:	86c2                	mv	a3,a6
8000102a:	0007c663          	bltz	a5,80001036 <im2col_block_T_aligned+0x138>
8000102e:	0097d463          	bge	a5,s1,80001036 <im2col_block_T_aligned+0x138>
80001032:	631c                	flw	fa5,0(a4)
80001034:	e29c                	fsw	fa5,0(a3)
80001036:	0785                	addi	a5,a5,1
80001038:	0711                	addi	a4,a4,4
8000103a:	96ca                	add	a3,a3,s2
8000103c:	fea797e3          	bne	a5,a0,8000102a <im2col_block_T_aligned+0x12c>
80001040:	0605                	addi	a2,a2,1
80001042:	95a6                	add	a1,a1,s1
80001044:	9872                	add	a6,a6,t3
80001046:	fd1616e3          	bne	a2,a7,80001012 <im2col_block_T_aligned+0x114>
8000104a:	0e85                	addi	t4,t4,1
8000104c:	0b91                	addi	s7,s7,4
8000104e:	f9df9ae3          	bne	t6,t4,80000fe2 <im2col_block_T_aligned+0xe4>
80001052:	40f6                	lw	ra,92(sp)
80001054:	4466                	lw	s0,88(sp)
80001056:	44d6                	lw	s1,84(sp)
80001058:	4946                	lw	s2,80(sp)
8000105a:	49b6                	lw	s3,76(sp)
8000105c:	4a26                	lw	s4,72(sp)
8000105e:	4a96                	lw	s5,68(sp)
80001060:	4b06                	lw	s6,64(sp)
80001062:	5bf2                	lw	s7,60(sp)
80001064:	5c62                	lw	s8,56(sp)
80001066:	5cd2                	lw	s9,52(sp)
80001068:	5d42                	lw	s10,48(sp)
8000106a:	5db2                	lw	s11,44(sp)
8000106c:	6125                	addi	sp,sp,96
8000106e:	8082                	ret
80001070:	5786                	lw	a5,96(sp)
80001072:	4732                	lw	a4,12(sp)
80001074:	029a0fb3          	mul	t6,s4,s1
80001078:	4be2                	lw	s7,24(sp)
8000107a:	002a1e13          	slli	t3,s4,0x2
8000107e:	4281                	li	t0,0
80001080:	03478cb3          	mul	s9,a5,s4
80001084:	57a6                	lw	a5,104(sp)
80001086:	02e78f33          	mul	t5,a5,a4
8000108a:	41bc8cb3          	sub	s9,s9,s11
8000108e:	0f0a                	slli	t5,t5,0x2
80001090:	0362c7b3          	div	a5,t0,s6
80001094:	4752                	lw	a4,20(sp)
80001096:	5886                	lw	a7,96(sp)
80001098:	835e                	mv	t1,s7
8000109a:	0272c833          	div	a6,t0,t2
8000109e:	0367e7b3          	rem	a5,a5,s6
800010a2:	0362eeb3          	rem	t4,t0,s6
800010a6:	00fc8533          	add	a0,s9,a5
800010aa:	03580833          	mul	a6,a6,s5
800010ae:	41be8eb3          	sub	t4,t4,s11
800010b2:	002e9c13          	slli	s8,t4,0x2
800010b6:	9c3a                	add	s8,s8,a4
800010b8:	983e                	add	a6,a6,a5
800010ba:	9866                	add	a6,a6,s9
800010bc:	02980833          	mul	a6,a6,s1
800010c0:	03305b63          	blez	s3,800010f6 <im2col_block_T_aligned+0x1f8>
800010c4:	02054963          	bltz	a0,800010f6 <im2col_block_T_aligned+0x1f8>
800010c8:	03555763          	bge	a0,s5,800010f6 <im2col_block_T_aligned+0x1f8>
800010cc:	00281693          	slli	a3,a6,0x2
800010d0:	96e2                	add	a3,a3,s8
800010d2:	861a                	mv	a2,t1
800010d4:	87f6                	mv	a5,t4
800010d6:	4701                	li	a4,0
800010d8:	0007c663          	bltz	a5,800010e4 <im2col_block_T_aligned+0x1e6>
800010dc:	0097d463          	bge	a5,s1,800010e4 <im2col_block_T_aligned+0x1e6>
800010e0:	629c                	flw	fa5,0(a3)
800010e2:	e21c                	fsw	fa5,0(a2)
800010e4:	00170593          	addi	a1,a4,1
800010e8:	97d2                	add	a5,a5,s4
800010ea:	96f2                	add	a3,a3,t3
800010ec:	964a                	add	a2,a2,s2
800010ee:	00e40463          	beq	s0,a4,800010f6 <im2col_block_T_aligned+0x1f8>
800010f2:	872e                	mv	a4,a1
800010f4:	b7d5                	j	800010d8 <im2col_block_T_aligned+0x1da>
800010f6:	0885                	addi	a7,a7,1
800010f8:	9552                	add	a0,a0,s4
800010fa:	987e                	add	a6,a6,t6
800010fc:	937a                	add	t1,t1,t5
800010fe:	fd1d11e3          	bne	s10,a7,800010c0 <im2col_block_T_aligned+0x1c2>
80001102:	47c2                	lw	a5,16(sp)
80001104:	0285                	addi	t0,t0,1
80001106:	0b91                	addi	s7,s7,4
80001108:	f85794e3          	bne	a5,t0,80001090 <im2col_block_T_aligned+0x192>
8000110c:	b799                	j	80001052 <im2col_block_T_aligned+0x154>

8000110e <MiCo_linear_f32>:
8000110e:	429c                	lw	a5,0(a3)
80001110:	1101                	addi	sp,sp,-32
80001112:	cc22                	sw	s0,24(sp)
80001114:	ca26                	sw	s1,20(sp)
80001116:	c84a                	sw	s2,16(sp)
80001118:	c64e                	sw	s3,12(sp)
8000111a:	c452                	sw	s4,8(sp)
8000111c:	ce06                	sw	ra,28(sp)
8000111e:	4184                	lw	s1,0(a1)
80001120:	0045aa03          	lw	s4,4(a1)
80001124:	4200                	lw	s0,0(a2)
80001126:	00852e83          	lw	t4,8(a0)
8000112a:	892e                	mv	s2,a1
8000112c:	89b2                	mv	s3,a2
8000112e:	cba1                	beqz	a5,8000117e <MiCo_linear_f32+0x70>
80001130:	c49d                	beqz	s1,8000115e <MiCo_linear_f32+0x50>
80001132:	c415                	beqz	s0,8000115e <MiCo_linear_f32+0x50>
80001134:	42dc                	lw	a5,4(a3)
80001136:	00241893          	slli	a7,s0,0x2
8000113a:	4e01                	li	t3,0
8000113c:	98be                	add	a7,a7,a5
8000113e:	4301                	li	t1,0
80001140:	002e1813          	slli	a6,t3,0x2
80001144:	9876                	add	a6,a6,t4
80001146:	853e                	mv	a0,a5
80001148:	611c                	flw	fa5,0(a0)
8000114a:	0511                	addi	a0,a0,4
8000114c:	0811                	addi	a6,a6,4
8000114e:	fef82e27          	fsw	fa5,-4(a6)
80001152:	fea89be3          	bne	a7,a0,80001148 <MiCo_linear_f32+0x3a>
80001156:	0305                	addi	t1,t1,1
80001158:	9e22                	add	t3,t3,s0
8000115a:	fe6493e3          	bne	s1,t1,80001140 <MiCo_linear_f32+0x32>
8000115e:	87a2                	mv	a5,s0
80001160:	4462                	lw	s0,24(sp)
80001162:	0089a603          	lw	a2,8(s3)
80001166:	00892583          	lw	a1,8(s2)
8000116a:	40f2                	lw	ra,28(sp)
8000116c:	4942                	lw	s2,16(sp)
8000116e:	49b2                	lw	s3,12(sp)
80001170:	8752                	mv	a4,s4
80001172:	86a6                	mv	a3,s1
80001174:	4a22                	lw	s4,8(sp)
80001176:	44d2                	lw	s1,20(sp)
80001178:	8576                	mv	a0,t4
8000117a:	6105                	addi	sp,sp,32
8000117c:	a819                	j	80001192 <MiCo_MatMul_f32>
8000117e:	02848633          	mul	a2,s1,s0
80001182:	de71                	beqz	a2,8000115e <MiCo_linear_f32+0x50>
80001184:	8576                	mv	a0,t4
80001186:	060a                	slli	a2,a2,0x2
80001188:	4581                	li	a1,0
8000118a:	517070ef          	jal	ra,80008ea0 <memset>
8000118e:	8eaa                	mv	t4,a0
80001190:	b7f9                	j	8000115e <MiCo_linear_f32+0x50>

80001192 <MiCo_MatMul_f32>:
80001192:	82b6                	mv	t0,a3
80001194:	882a                	mv	a6,a0
80001196:	8332                	mv	t1,a2
80001198:	88ba                	mv	a7,a4
8000119a:	cea9                	beqz	a3,800011f4 <MiCo_MatMul_f32+0x62>
8000119c:	cfa1                	beqz	a5,800011f4 <MiCo_MatMul_f32+0x62>
8000119e:	cb39                	beqz	a4,800011f4 <MiCo_MatMul_f32+0x62>
800011a0:	40f00fb3          	neg	t6,a5
800011a4:	00271f13          	slli	t5,a4,0x2
800011a8:	078a                	slli	a5,a5,0x2
800011aa:	002f9393          	slli	t2,t6,0x2
800011ae:	852e                	mv	a0,a1
800011b0:	983e                	add	a6,a6,a5
800011b2:	01e58633          	add	a2,a1,t5
800011b6:	4e01                	li	t3,0
800011b8:	0f8e                	slli	t6,t6,0x3
800011ba:	00780eb3          	add	t4,a6,t2
800011be:	86f6                	mv	a3,t4
800011c0:	4581                	li	a1,0
800011c2:	629c                	flw	fa5,0(a3)
800011c4:	00259713          	slli	a4,a1,0x2
800011c8:	971a                	add	a4,a4,t1
800011ca:	87aa                	mv	a5,a0
800011cc:	6394                	flw	fa3,0(a5)
800011ce:	6318                	flw	fa4,0(a4)
800011d0:	0791                	addi	a5,a5,4
800011d2:	0711                	addi	a4,a4,4
800011d4:	78e6f7c3          	fmadd.s	fa5,fa3,fa4,fa5
800011d8:	e29c                	fsw	fa5,0(a3)
800011da:	fec799e3          	bne	a5,a2,800011cc <MiCo_MatMul_f32+0x3a>
800011de:	0691                	addi	a3,a3,4
800011e0:	95c6                	add	a1,a1,a7
800011e2:	ff0690e3          	bne	a3,a6,800011c2 <MiCo_MatMul_f32+0x30>
800011e6:	0e05                	addi	t3,t3,1
800011e8:	41fe8833          	sub	a6,t4,t6
800011ec:	957a                	add	a0,a0,t5
800011ee:	967a                	add	a2,a2,t5
800011f0:	fdc295e3          	bne	t0,t3,800011ba <MiCo_MatMul_f32+0x28>
800011f4:	8082                	ret

800011f6 <MiCo_mul2d_f32>:
800011f6:	0005ae83          	lw	t4,0(a1)
800011fa:	0045ae03          	lw	t3,4(a1)
800011fe:	040e8363          	beqz	t4,80001244 <MiCo_mul2d_f32+0x4e>
80001202:	040e0163          	beqz	t3,80001244 <MiCo_mul2d_f32+0x4e>
80001206:	002e1f13          	slli	t5,t3,0x2
8000120a:	0085a883          	lw	a7,8(a1)
8000120e:	00862803          	lw	a6,8(a2)
80001212:	450c                	lw	a1,8(a0)
80001214:	867a                	mv	a2,t5
80001216:	4301                	li	t1,0
80001218:	4501                	li	a0,0
8000121a:	00231793          	slli	a5,t1,0x2
8000121e:	00f80733          	add	a4,a6,a5
80001222:	00f886b3          	add	a3,a7,a5
80001226:	6318                	flw	fa4,0(a4)
80001228:	629c                	flw	fa5,0(a3)
8000122a:	00f58733          	add	a4,a1,a5
8000122e:	0791                	addi	a5,a5,4
80001230:	10e7f7d3          	fmul.s	fa5,fa5,fa4
80001234:	e31c                	fsw	fa5,0(a4)
80001236:	fec794e3          	bne	a5,a2,8000121e <MiCo_mul2d_f32+0x28>
8000123a:	0505                	addi	a0,a0,1
8000123c:	9372                	add	t1,t1,t3
8000123e:	967a                	add	a2,a2,t5
80001240:	fcae9de3          	bne	t4,a0,8000121a <MiCo_mul2d_f32+0x24>
80001244:	8082                	ret

80001246 <softmax>:
80001246:	7179                	addi	sp,sp,-48
80001248:	d422                	sw	s0,40(sp)
8000124a:	ce4e                	sw	s3,28(sp)
8000124c:	cc52                	sw	s4,24(sp)
8000124e:	e426                	fsw	fs1,8(sp)
80001250:	842a                	mv	s0,a0
80001252:	d606                	sw	ra,44(sp)
80001254:	d226                	sw	s1,36(sp)
80001256:	d04a                	sw	s2,32(sp)
80001258:	e622                	fsw	fs0,12(sp)
8000125a:	8a2e                	mv	s4,a1
8000125c:	17f060ef          	jal	ra,80007bda <MiCo_time>
80001260:	4785                	li	a5,1
80001262:	6004                	flw	fs1,0(s0)
80001264:	89aa                	mv	s3,a0
80001266:	0947d163          	bge	a5,s4,800012e8 <softmax+0xa2>
8000126a:	002a1693          	slli	a3,s4,0x2
8000126e:	00440793          	addi	a5,s0,4
80001272:	96a2                	add	a3,a3,s0
80001274:	639c                	flw	fa5,0(a5)
80001276:	0791                	addi	a5,a5,4
80001278:	a0f49753          	flt.s	a4,fs1,fa5
8000127c:	c319                	beqz	a4,80001282 <softmax+0x3c>
8000127e:	20f784d3          	fmv.s	fs1,fa5
80001282:	fed799e3          	bne	a5,a3,80001274 <softmax+0x2e>
80001286:	f0000453          	fmv.w.x	fs0,zero
8000128a:	84a2                	mv	s1,s0
8000128c:	4901                	li	s2,0
8000128e:	6088                	flw	fa0,0(s1)
80001290:	0491                	addi	s1,s1,4
80001292:	0905                	addi	s2,s2,1
80001294:	08957553          	fsub.s	fa0,fa0,fs1
80001298:	1ca070ef          	jal	ra,80008462 <expf>
8000129c:	fea4ae27          	fsw	fa0,-4(s1)
800012a0:	00a47453          	fadd.s	fs0,fs0,fa0
800012a4:	ff4945e3          	blt	s2,s4,8000128e <softmax+0x48>
800012a8:	4781                	li	a5,0
800012aa:	601c                	flw	fa5,0(s0)
800012ac:	0411                	addi	s0,s0,4
800012ae:	0785                	addi	a5,a5,1
800012b0:	1887f7d3          	fdiv.s	fa5,fa5,fs0
800012b4:	fef42e27          	fsw	fa5,-4(s0)
800012b8:	ff47c9e3          	blt	a5,s4,800012aa <softmax+0x64>
800012bc:	11f060ef          	jal	ra,80007bda <MiCo_time>
800012c0:	0000a797          	auipc	a5,0xa
800012c4:	53478793          	addi	a5,a5,1332 # 8000b7f4 <SOFTMAX_TIMER>
800012c8:	4398                	lw	a4,0(a5)
800012ca:	50b2                	lw	ra,44(sp)
800012cc:	5422                	lw	s0,40(sp)
800012ce:	413509b3          	sub	s3,a0,s3
800012d2:	99ba                	add	s3,s3,a4
800012d4:	0137a023          	sw	s3,0(a5)
800012d8:	5492                	lw	s1,36(sp)
800012da:	5902                	lw	s2,32(sp)
800012dc:	49f2                	lw	s3,28(sp)
800012de:	4a62                	lw	s4,24(sp)
800012e0:	6432                	flw	fs0,12(sp)
800012e2:	64a2                	flw	fs1,8(sp)
800012e4:	6145                	addi	sp,sp,48
800012e6:	8082                	ret
800012e8:	fcfa1ae3          	bne	s4,a5,800012bc <softmax+0x76>
800012ec:	bf69                	j	80001286 <softmax+0x40>

800012ee <MiCo_multihead_attention_f32>:
800012ee:	7119                	addi	sp,sp,-128
800012f0:	cae6                	sw	s9,84(sp)
800012f2:	00482c83          	lw	s9,4(a6)
800012f6:	f00007d3          	fmv.w.x	fa5,zero
800012fa:	fc26                	fsw	fs1,56(sp)
800012fc:	d00cf4d3          	fcvt.s.w	fs1,s9
80001300:	dca2                	sw	s0,120(sp)
80001302:	d6ce                	sw	s3,108(sp)
80001304:	00102473          	frflags	s0
80001308:	a0f49f53          	flt.s	t5,fs1,fa5
8000130c:	00141073          	fsflags	s0
80001310:	00082403          	lw	s0,0(a6)
80001314:	d4d2                	sw	s4,104(sp)
80001316:	d2d6                	sw	s5,100(sp)
80001318:	c222                	sw	s0,4(sp)
8000131a:	00c82403          	lw	s0,12(a6)
8000131e:	d0da                	sw	s6,96(sp)
80001320:	cce2                	sw	s8,88(sp)
80001322:	de86                	sw	ra,124(sp)
80001324:	daa6                	sw	s1,116(sp)
80001326:	d8ca                	sw	s2,112(sp)
80001328:	cede                	sw	s7,92(sp)
8000132a:	c8ea                	sw	s10,80(sp)
8000132c:	c6ee                	sw	s11,76(sp)
8000132e:	fe22                	fsw	fs0,60(sp)
80001330:	ce22                	sw	s0,28(sp)
80001332:	ca2a                	sw	a0,20(sp)
80001334:	cc2e                	sw	a1,24(sp)
80001336:	c43e                	sw	a5,8(sp)
80001338:	00882a03          	lw	s4,8(a6)
8000133c:	01082983          	lw	s3,16(a6)
80001340:	8c32                	mv	s8,a2
80001342:	8ab6                	mv	s5,a3
80001344:	8b3a                	mv	s6,a4
80001346:	140f1e63          	bnez	t5,800014a2 <MiCo_multihead_attention_f32+0x1b4>
8000134a:	4792                	lw	a5,4(sp)
8000134c:	0ef05863          	blez	a5,8000143c <MiCo_multihead_attention_f32+0x14e>
80001350:	f00007d3          	fmv.w.x	fa5,zero
80001354:	47a2                	lw	a5,8(sp)
80001356:	8d62                	mv	s10,s8
80001358:	00102773          	frflags	a4
8000135c:	a0f49bd3          	flt.s	s7,fs1,fa5
80001360:	00171073          	fsflags	a4
80001364:	00279d93          	slli	s11,a5,0x2
80001368:	0785                	addi	a5,a5,1
8000136a:	9dda                	add	s11,s11,s6
8000136c:	c83e                	sw	a5,16(sp)
8000136e:	00299793          	slli	a5,s3,0x2
80001372:	8c5a                	mv	s8,s6
80001374:	89de                	mv	s3,s7
80001376:	c63e                	sw	a5,12(sp)
80001378:	8bd2                	mv	s7,s4
8000137a:	0d91                	addi	s11,s11,4
8000137c:	002c9913          	slli	s2,s9,0x2
80001380:	4481                	li	s1,0
80001382:	4401                	li	s0,0
80001384:	8b66                	mv	s6,s9
80001386:	8a56                	mv	s4,s5
80001388:	47e2                	lw	a5,24(sp)
8000138a:	00249a93          	slli	s5,s1,0x2
8000138e:	4788                	lw	a0,8(a5)
80001390:	47a2                	lw	a5,8(sp)
80001392:	0c07c663          	bltz	a5,8000145e <MiCo_multihead_attention_f32+0x170>
80001396:	47f2                	lw	a5,28(sp)
80001398:	01250733          	add	a4,a0,s2
8000139c:	9756                	add	a4,a4,s5
8000139e:	02f44cb3          	div	s9,s0,a5
800013a2:	9556                	add	a0,a0,s5
800013a4:	8662                	mv	a2,s8
800013a6:	036c85b3          	mul	a1,s9,s6
800013aa:	f0000453          	fmv.w.x	fs0,zero
800013ae:	01605e63          	blez	s6,800013ca <MiCo_multihead_attention_f32+0xdc>
800013b2:	00259693          	slli	a3,a1,0x2
800013b6:	96ea                	add	a3,a3,s10
800013b8:	87aa                	mv	a5,a0
800013ba:	6398                	flw	fa4,0(a5)
800013bc:	629c                	flw	fa5,0(a3)
800013be:	0791                	addi	a5,a5,4
800013c0:	0691                	addi	a3,a3,4
800013c2:	40f77443          	fmadd.s	fs0,fa4,fa5,fs0
800013c6:	fef71ae3          	bne	a4,a5,800013ba <MiCo_multihead_attention_f32+0xcc>
800013ca:	0a099763          	bnez	s3,80001478 <MiCo_multihead_attention_f32+0x18a>
800013ce:	5804f7d3          	fsqrt.s	fa5,fs1
800013d2:	0611                	addi	a2,a2,4
800013d4:	95de                	add	a1,a1,s7
800013d6:	18f47453          	fdiv.s	fs0,fs0,fa5
800013da:	fe862e27          	fsw	fs0,-4(a2)
800013de:	fccd96e3          	bne	s11,a2,800013aa <MiCo_multihead_attention_f32+0xbc>
800013e2:	45c2                	lw	a1,16(sp)
800013e4:	8562                	mv	a0,s8
800013e6:	3585                	jal	80001246 <softmax>
800013e8:	47d2                	lw	a5,20(sp)
800013ea:	479c                	lw	a5,8(a5)
800013ec:	9abe                	add	s5,s5,a5
800013ee:	03605f63          	blez	s6,8000142c <MiCo_multihead_attention_f32+0x13e>
800013f2:	036c8cb3          	mul	s9,s9,s6
800013f6:	864a                	mv	a2,s2
800013f8:	4581                	li	a1,0
800013fa:	8556                	mv	a0,s5
800013fc:	2a5070ef          	jal	ra,80008ea0 <memset>
80001400:	012a8633          	add	a2,s5,s2
80001404:	85e2                	mv	a1,s8
80001406:	6194                	flw	fa3,0(a1)
80001408:	002c9713          	slli	a4,s9,0x2
8000140c:	9752                	add	a4,a4,s4
8000140e:	87d6                	mv	a5,s5
80001410:	631c                	flw	fa5,0(a4)
80001412:	6398                	flw	fa4,0(a5)
80001414:	0791                	addi	a5,a5,4
80001416:	0711                	addi	a4,a4,4
80001418:	70d7f7c3          	fmadd.s	fa5,fa5,fa3,fa4
8000141c:	fef7ae27          	fsw	fa5,-4(a5)
80001420:	fec798e3          	bne	a5,a2,80001410 <MiCo_multihead_attention_f32+0x122>
80001424:	0591                	addi	a1,a1,4
80001426:	9cde                	add	s9,s9,s7
80001428:	fcbd9fe3          	bne	s11,a1,80001406 <MiCo_multihead_attention_f32+0x118>
8000142c:	47b2                	lw	a5,12(sp)
8000142e:	0405                	addi	s0,s0,1
80001430:	94da                	add	s1,s1,s6
80001432:	9dbe                	add	s11,s11,a5
80001434:	9c3e                	add	s8,s8,a5
80001436:	4792                	lw	a5,4(sp)
80001438:	f48798e3          	bne	a5,s0,80001388 <MiCo_multihead_attention_f32+0x9a>
8000143c:	50f6                	lw	ra,124(sp)
8000143e:	5466                	lw	s0,120(sp)
80001440:	54d6                	lw	s1,116(sp)
80001442:	5946                	lw	s2,112(sp)
80001444:	59b6                	lw	s3,108(sp)
80001446:	5a26                	lw	s4,104(sp)
80001448:	5a96                	lw	s5,100(sp)
8000144a:	5b06                	lw	s6,96(sp)
8000144c:	4bf6                	lw	s7,92(sp)
8000144e:	4c66                	lw	s8,88(sp)
80001450:	4cd6                	lw	s9,84(sp)
80001452:	4d46                	lw	s10,80(sp)
80001454:	4db6                	lw	s11,76(sp)
80001456:	7472                	flw	fs0,60(sp)
80001458:	74e2                	flw	fs1,56(sp)
8000145a:	6109                	addi	sp,sp,128
8000145c:	8082                	ret
8000145e:	45c2                	lw	a1,16(sp)
80001460:	8562                	mv	a0,s8
80001462:	33d5                	jal	80001246 <softmax>
80001464:	47d2                	lw	a5,20(sp)
80001466:	4788                	lw	a0,8(a5)
80001468:	9556                	add	a0,a0,s5
8000146a:	fd6051e3          	blez	s6,8000142c <MiCo_multihead_attention_f32+0x13e>
8000146e:	864a                	mv	a2,s2
80001470:	4581                	li	a1,0
80001472:	22f070ef          	jal	ra,80008ea0 <memset>
80001476:	bf5d                	j	8000142c <MiCo_multihead_attention_f32+0x13e>
80001478:	20948553          	fmv.s	fa0,fs1
8000147c:	0611                	addi	a2,a2,4
8000147e:	95de                	add	a1,a1,s7
80001480:	d62a                	sw	a0,44(sp)
80001482:	d43a                	sw	a4,40(sp)
80001484:	d232                	sw	a2,36(sp)
80001486:	d02e                	sw	a1,32(sp)
80001488:	04c070ef          	jal	ra,800084d4 <sqrtf>
8000148c:	18a47453          	fdiv.s	fs0,fs0,fa0
80001490:	5612                	lw	a2,36(sp)
80001492:	5582                	lw	a1,32(sp)
80001494:	5722                	lw	a4,40(sp)
80001496:	5532                	lw	a0,44(sp)
80001498:	fe862e27          	fsw	fs0,-4(a2)
8000149c:	f1b617e3          	bne	a2,s11,800013aa <MiCo_multihead_attention_f32+0xbc>
800014a0:	b789                	j	800013e2 <MiCo_multihead_attention_f32+0xf4>
800014a2:	20948553          	fmv.s	fa0,fs1
800014a6:	02e070ef          	jal	ra,800084d4 <sqrtf>
800014aa:	b545                	j	8000134a <MiCo_multihead_attention_f32+0x5c>

800014ac <MiCo_multihead_attention_f32_kv8>:
800014ac:	7175                	addi	sp,sp,-144
800014ae:	4eca                	lw	t4,144(sp)
800014b0:	d8da                	sw	s6,112(sp)
800014b2:	f00007d3          	fmv.w.x	fa5,zero
800014b6:	004eab03          	lw	s6,4(t4)
800014ba:	e4a6                	fsw	fs1,72(sp)
800014bc:	c522                	sw	s0,136(sp)
800014be:	d00b74d3          	fcvt.s.w	fs1,s6
800014c2:	dece                	sw	s3,124(sp)
800014c4:	dcd2                	sw	s4,120(sp)
800014c6:	00102473          	frflags	s0
800014ca:	a0f492d3          	flt.s	t0,fs1,fa5
800014ce:	00141073          	fsflags	s0
800014d2:	000ea403          	lw	s0,0(t4)
800014d6:	d4e2                	sw	s8,104(sp)
800014d8:	d0ea                	sw	s10,96(sp)
800014da:	c222                	sw	s0,4(sp)
800014dc:	00cea403          	lw	s0,12(t4)
800014e0:	c706                	sw	ra,140(sp)
800014e2:	c326                	sw	s1,132(sp)
800014e4:	d222                	sw	s0,36(sp)
800014e6:	c14a                	sw	s2,128(sp)
800014e8:	dad6                	sw	s5,116(sp)
800014ea:	d6de                	sw	s7,108(sp)
800014ec:	d2e6                	sw	s9,100(sp)
800014ee:	ceee                	sw	s11,92(sp)
800014f0:	e6a2                	fsw	fs0,76(sp)
800014f2:	cc2a                	sw	a0,24(sp)
800014f4:	ce2e                	sw	a1,28(sp)
800014f6:	d43a                	sw	a4,40(sp)
800014f8:	d03e                	sw	a5,32(sp)
800014fa:	c446                	sw	a7,8(sp)
800014fc:	008ea983          	lw	s3,8(t4)
80001500:	010ea403          	lw	s0,16(t4)
80001504:	8c32                	mv	s8,a2
80001506:	8a36                	mv	s4,a3
80001508:	8d42                	mv	s10,a6
8000150a:	1a029963          	bnez	t0,800016bc <MiCo_multihead_attention_f32_kv8+0x210>
8000150e:	4792                	lw	a5,4(sp)
80001510:	12f05a63          	blez	a5,80001644 <MiCo_multihead_attention_f32_kv8+0x198>
80001514:	f00007d3          	fmv.w.x	fa5,zero
80001518:	4722                	lw	a4,8(sp)
8000151a:	8dd2                	mv	s11,s4
8000151c:	001026f3          	frflags	a3
80001520:	a0f49bd3          	flt.s	s7,fs1,fa5
80001524:	00169073          	fsflags	a3
80001528:	5682                	lw	a3,32(sp)
8000152a:	00271793          	slli	a5,a4,0x2
8000152e:	0705                	addi	a4,a4,1
80001530:	00468e93          	addi	t4,a3,4
80001534:	c83a                	sw	a4,16(sp)
80001536:	00241713          	slli	a4,s0,0x2
8000153a:	00fe8cb3          	add	s9,t4,a5
8000153e:	00fd0833          	add	a6,s10,a5
80001542:	c63a                	sw	a4,12(sp)
80001544:	016c07b3          	add	a5,s8,s6
80001548:	002b1713          	slli	a4,s6,0x2
8000154c:	00480a93          	addi	s5,a6,4
80001550:	ca3a                	sw	a4,20(sp)
80001552:	d63e                	sw	a5,44(sp)
80001554:	8766                	mv	a4,s9
80001556:	87de                	mv	a5,s7
80001558:	8cd6                	mv	s9,s5
8000155a:	8a5a                	mv	s4,s6
8000155c:	8bce                	mv	s7,s3
8000155e:	8b62                	mv	s6,s8
80001560:	4901                	li	s2,0
80001562:	4481                	li	s1,0
80001564:	8c6a                	mv	s8,s10
80001566:	89be                	mv	s3,a5
80001568:	8aba                	mv	s5,a4
8000156a:	47f2                	lw	a5,28(sp)
8000156c:	00291393          	slli	t2,s2,0x2
80001570:	4788                	lw	a0,8(a5)
80001572:	47a2                	lw	a5,8(sp)
80001574:	0e07cc63          	bltz	a5,8000166c <MiCo_multihead_attention_f32_kv8+0x1c0>
80001578:	5792                	lw	a5,36(sp)
8000157a:	55a2                	lw	a1,40(sp)
8000157c:	951e                	add	a0,a0,t2
8000157e:	02f4c433          	div	s0,s1,a5
80001582:	57b2                	lw	a5,44(sp)
80001584:	86e2                	mv	a3,s8
80001586:	03440633          	mul	a2,s0,s4
8000158a:	00c78d33          	add	s10,a5,a2
8000158e:	0d405c63          	blez	s4,80001666 <MiCo_multihead_attention_f32_kv8+0x1ba>
80001592:	6194                	flw	fa3,0(a1)
80001594:	f0000453          	fmv.w.x	fs0,zero
80001598:	00cb07b3          	add	a5,s6,a2
8000159c:	872a                	mv	a4,a0
8000159e:	00078803          	lb	a6,0(a5)
800015a2:	6318                	flw	fa4,0(a4)
800015a4:	0785                	addi	a5,a5,1
800015a6:	d00877d3          	fcvt.s.w	fa5,a6
800015aa:	0711                	addi	a4,a4,4
800015ac:	10e7f7d3          	fmul.s	fa5,fa5,fa4
800015b0:	40d7f443          	fmadd.s	fs0,fa5,fa3,fs0
800015b4:	fefd15e3          	bne	s10,a5,8000159e <MiCo_multihead_attention_f32_kv8+0xf2>
800015b8:	0c099963          	bnez	s3,8000168a <MiCo_multihead_attention_f32_kv8+0x1de>
800015bc:	5804f7d3          	fsqrt.s	fa5,fs1
800015c0:	0691                	addi	a3,a3,4
800015c2:	965e                	add	a2,a2,s7
800015c4:	9d5e                	add	s10,s10,s7
800015c6:	0591                	addi	a1,a1,4
800015c8:	18f47453          	fdiv.s	fs0,fs0,fa5
800015cc:	fe86ae27          	fsw	fs0,-4(a3)
800015d0:	fadc9fe3          	bne	s9,a3,8000158e <MiCo_multihead_attention_f32_kv8+0xe2>
800015d4:	45c2                	lw	a1,16(sp)
800015d6:	8562                	mv	a0,s8
800015d8:	c01e                	sw	t2,0(sp)
800015da:	31b5                	jal	80001246 <softmax>
800015dc:	47e2                	lw	a5,24(sp)
800015de:	4382                	lw	t2,0(sp)
800015e0:	479c                	lw	a5,8(a5)
800015e2:	93be                	add	t2,t2,a5
800015e4:	05405863          	blez	s4,80001634 <MiCo_multihead_attention_f32_kv8+0x188>
800015e8:	03440433          	mul	s0,s0,s4
800015ec:	4d52                	lw	s10,20(sp)
800015ee:	4581                	li	a1,0
800015f0:	851e                	mv	a0,t2
800015f2:	866a                	mv	a2,s10
800015f4:	0ad070ef          	jal	ra,80008ea0 <memset>
800015f8:	5602                	lw	a2,32(sp)
800015fa:	83aa                	mv	t2,a0
800015fc:	01a505b3          	add	a1,a0,s10
80001600:	8562                	mv	a0,s8
80001602:	6110                	flw	fa2,0(a0)
80001604:	008d8733          	add	a4,s11,s0
80001608:	879e                	mv	a5,t2
8000160a:	00070683          	lb	a3,0(a4)
8000160e:	6398                	flw	fa4,0(a5)
80001610:	6214                	flw	fa3,0(a2)
80001612:	d006f7d3          	fcvt.s.w	fa5,a3
80001616:	0791                	addi	a5,a5,4
80001618:	0705                	addi	a4,a4,1
8000161a:	10c7f7d3          	fmul.s	fa5,fa5,fa2
8000161e:	70d7f7c3          	fmadd.s	fa5,fa5,fa3,fa4
80001622:	fef7ae27          	fsw	fa5,-4(a5)
80001626:	feb792e3          	bne	a5,a1,8000160a <MiCo_multihead_attention_f32_kv8+0x15e>
8000162a:	0611                	addi	a2,a2,4
8000162c:	0511                	addi	a0,a0,4
8000162e:	945e                	add	s0,s0,s7
80001630:	fcca99e3          	bne	s5,a2,80001602 <MiCo_multihead_attention_f32_kv8+0x156>
80001634:	47b2                	lw	a5,12(sp)
80001636:	0485                	addi	s1,s1,1
80001638:	9952                	add	s2,s2,s4
8000163a:	9c3e                	add	s8,s8,a5
8000163c:	9cbe                	add	s9,s9,a5
8000163e:	4792                	lw	a5,4(sp)
80001640:	f29795e3          	bne	a5,s1,8000156a <MiCo_multihead_attention_f32_kv8+0xbe>
80001644:	40ba                	lw	ra,140(sp)
80001646:	442a                	lw	s0,136(sp)
80001648:	449a                	lw	s1,132(sp)
8000164a:	490a                	lw	s2,128(sp)
8000164c:	59f6                	lw	s3,124(sp)
8000164e:	5a66                	lw	s4,120(sp)
80001650:	5ad6                	lw	s5,116(sp)
80001652:	5b46                	lw	s6,112(sp)
80001654:	5bb6                	lw	s7,108(sp)
80001656:	5c26                	lw	s8,104(sp)
80001658:	5c96                	lw	s9,100(sp)
8000165a:	5d06                	lw	s10,96(sp)
8000165c:	4df6                	lw	s11,92(sp)
8000165e:	6436                	flw	fs0,76(sp)
80001660:	64a6                	flw	fs1,72(sp)
80001662:	6149                	addi	sp,sp,144
80001664:	8082                	ret
80001666:	f0000453          	fmv.w.x	fs0,zero
8000166a:	b7b9                	j	800015b8 <MiCo_multihead_attention_f32_kv8+0x10c>
8000166c:	45c2                	lw	a1,16(sp)
8000166e:	8562                	mv	a0,s8
80001670:	c01e                	sw	t2,0(sp)
80001672:	3ed1                	jal	80001246 <softmax>
80001674:	47e2                	lw	a5,24(sp)
80001676:	4382                	lw	t2,0(sp)
80001678:	4788                	lw	a0,8(a5)
8000167a:	951e                	add	a0,a0,t2
8000167c:	fb405ce3          	blez	s4,80001634 <MiCo_multihead_attention_f32_kv8+0x188>
80001680:	4652                	lw	a2,20(sp)
80001682:	4581                	li	a1,0
80001684:	01d070ef          	jal	ra,80008ea0 <memset>
80001688:	b775                	j	80001634 <MiCo_multihead_attention_f32_kv8+0x188>
8000168a:	20948553          	fmv.s	fa0,fs1
8000168e:	0691                	addi	a3,a3,4
80001690:	965e                	add	a2,a2,s7
80001692:	de1e                	sw	t2,60(sp)
80001694:	dc2a                	sw	a0,56(sp)
80001696:	da2e                	sw	a1,52(sp)
80001698:	d836                	sw	a3,48(sp)
8000169a:	c032                	sw	a2,0(sp)
8000169c:	639060ef          	jal	ra,800084d4 <sqrtf>
800016a0:	18a47453          	fdiv.s	fs0,fs0,fa0
800016a4:	56c2                	lw	a3,48(sp)
800016a6:	55d2                	lw	a1,52(sp)
800016a8:	4602                	lw	a2,0(sp)
800016aa:	5562                	lw	a0,56(sp)
800016ac:	53f2                	lw	t2,60(sp)
800016ae:	9d5e                	add	s10,s10,s7
800016b0:	0591                	addi	a1,a1,4
800016b2:	fe86ae27          	fsw	fs0,-4(a3)
800016b6:	ecdc9ce3          	bne	s9,a3,8000158e <MiCo_multihead_attention_f32_kv8+0xe2>
800016ba:	bf29                	j	800015d4 <MiCo_multihead_attention_f32_kv8+0x128>
800016bc:	20948553          	fmv.s	fa0,fs1
800016c0:	615060ef          	jal	ra,800084d4 <sqrtf>
800016c4:	b5a9                	j	8000150e <MiCo_multihead_attention_f32_kv8+0x62>

800016c6 <MiCo_batchnorm2d_f32>:
800016c6:	7159                	addi	sp,sp,-112
800016c8:	c4e2                	sw	s8,72(sp)
800016ca:	8c2e                	mv	s8,a1
800016cc:	cece                	sw	s3,92(sp)
800016ce:	c0ea                	sw	s10,64(sp)
800016d0:	0085a983          	lw	s3,8(a1)
800016d4:	000c2d03          	lw	s10,0(s8)
800016d8:	45cc                	lw	a1,12(a1)
800016da:	cad6                	sw	s5,84(sp)
800016dc:	d686                	sw	ra,108(sp)
800016de:	d4a2                	sw	s0,104(sp)
800016e0:	d2a6                	sw	s1,100(sp)
800016e2:	d0ca                	sw	s2,96(sp)
800016e4:	ccd2                	sw	s4,88(sp)
800016e6:	c8da                	sw	s6,80(sp)
800016e8:	c6de                	sw	s7,76(sp)
800016ea:	c2e6                	sw	s9,68(sp)
800016ec:	de6e                	sw	s11,60(sp)
800016ee:	f622                	fsw	fs0,44(sp)
800016f0:	f426                	fsw	fs1,40(sp)
800016f2:	f24a                	fsw	fs2,36(sp)
800016f4:	02b989b3          	mul	s3,s3,a1
800016f8:	004c2a83          	lw	s5,4(s8)
800016fc:	0a0d0963          	beqz	s10,800017ae <MiCo_batchnorm2d_f32+0xe8>
80001700:	0a0a8763          	beqz	s5,800017ae <MiCo_batchnorm2d_f32+0xe8>
80001704:	20a504d3          	fmv.s	fs1,fa0
80001708:	f0000953          	fmv.w.x	fs2,zero
8000170c:	8caa                	mv	s9,a0
8000170e:	8b32                	mv	s6,a2
80001710:	8db6                	mv	s11,a3
80001712:	863a                	mv	a2,a4
80001714:	033a8833          	mul	a6,s5,s3
80001718:	8bbe                	mv	s7,a5
8000171a:	00299a13          	slli	s4,s3,0x2
8000171e:	4581                	li	a1,0
80001720:	4501                	li	a0,0
80001722:	00259493          	slli	s1,a1,0x2
80001726:	94d2                	add	s1,s1,s4
80001728:	892e                	mv	s2,a1
8000172a:	4401                	li	s0,0
8000172c:	004ba683          	lw	a3,4(s7)
80001730:	00241793          	slli	a5,s0,0x2
80001734:	004b2703          	lw	a4,4(s6)
80001738:	96be                	add	a3,a3,a5
8000173a:	6288                	flw	fa0,0(a3)
8000173c:	973e                	add	a4,a4,a5
8000173e:	6300                	flw	fs0,0(a4)
80001740:	00a4f553          	fadd.s	fa0,fs1,fa0
80001744:	001026f3          	frflags	a3
80001748:	a1251753          	flt.s	a4,fa0,fs2
8000174c:	00169073          	fsflags	a3
80001750:	e349                	bnez	a4,800017d2 <MiCo_batchnorm2d_f32+0x10c>
80001752:	58057553          	fsqrt.s	fa0,fa0
80001756:	18a47553          	fdiv.s	fa0,fs0,fa0
8000175a:	04098163          	beqz	s3,8000179c <MiCo_batchnorm2d_f32+0xd6>
8000175e:	010c2683          	lw	a3,16(s8)
80001762:	00462303          	lw	t1,4(a2)
80001766:	004da883          	lw	a7,4(s11)
8000176a:	010cae03          	lw	t3,16(s9)
8000176e:	00291713          	slli	a4,s2,0x2
80001772:	933e                	add	t1,t1,a5
80001774:	98be                	add	a7,a7,a5
80001776:	00e687b3          	add	a5,a3,a4
8000177a:	9772                	add	a4,a4,t3
8000177c:	96a6                	add	a3,a3,s1
8000177e:	639c                	flw	fa5,0(a5)
80001780:	00032687          	flw	fa3,0(t1)
80001784:	0008a707          	flw	fa4,0(a7)
80001788:	0711                	addi	a4,a4,4
8000178a:	08d7f7d3          	fsub.s	fa5,fa5,fa3
8000178e:	0791                	addi	a5,a5,4
80001790:	70a7f7c3          	fmadd.s	fa5,fa5,fa0,fa4
80001794:	fef72e27          	fsw	fa5,-4(a4)
80001798:	fed793e3          	bne	a5,a3,8000177e <MiCo_batchnorm2d_f32+0xb8>
8000179c:	0405                	addi	s0,s0,1
8000179e:	994e                	add	s2,s2,s3
800017a0:	94d2                	add	s1,s1,s4
800017a2:	f88a95e3          	bne	s5,s0,8000172c <MiCo_batchnorm2d_f32+0x66>
800017a6:	0505                	addi	a0,a0,1
800017a8:	95c2                	add	a1,a1,a6
800017aa:	f6ad1ce3          	bne	s10,a0,80001722 <MiCo_batchnorm2d_f32+0x5c>
800017ae:	50b6                	lw	ra,108(sp)
800017b0:	5426                	lw	s0,104(sp)
800017b2:	5496                	lw	s1,100(sp)
800017b4:	5906                	lw	s2,96(sp)
800017b6:	49f6                	lw	s3,92(sp)
800017b8:	4a66                	lw	s4,88(sp)
800017ba:	4ad6                	lw	s5,84(sp)
800017bc:	4b46                	lw	s6,80(sp)
800017be:	4bb6                	lw	s7,76(sp)
800017c0:	4c26                	lw	s8,72(sp)
800017c2:	4c96                	lw	s9,68(sp)
800017c4:	4d06                	lw	s10,64(sp)
800017c6:	5df2                	lw	s11,60(sp)
800017c8:	7432                	flw	fs0,44(sp)
800017ca:	74a2                	flw	fs1,40(sp)
800017cc:	7912                	flw	fs2,36(sp)
800017ce:	6165                	addi	sp,sp,112
800017d0:	8082                	ret
800017d2:	ce32                	sw	a2,28(sp)
800017d4:	cc3e                	sw	a5,24(sp)
800017d6:	ca2e                	sw	a1,20(sp)
800017d8:	c842                	sw	a6,16(sp)
800017da:	c62a                	sw	a0,12(sp)
800017dc:	4f9060ef          	jal	ra,800084d4 <sqrtf>
800017e0:	4672                	lw	a2,28(sp)
800017e2:	47e2                	lw	a5,24(sp)
800017e4:	45d2                	lw	a1,20(sp)
800017e6:	4842                	lw	a6,16(sp)
800017e8:	4532                	lw	a0,12(sp)
800017ea:	b7b5                	j	80001756 <MiCo_batchnorm2d_f32+0x90>

800017ec <MiCo_rmsnorm2d_f32>:
800017ec:	7139                	addi	sp,sp,-64
800017ee:	d256                	sw	s5,36(sp)
800017f0:	0005aa83          	lw	s5,0(a1)
800017f4:	da26                	sw	s1,52(sp)
800017f6:	de06                	sw	ra,60(sp)
800017f8:	dc22                	sw	s0,56(sp)
800017fa:	d84a                	sw	s2,48(sp)
800017fc:	d64e                	sw	s3,44(sp)
800017fe:	d452                	sw	s4,40(sp)
80001800:	ee22                	fsw	fs0,28(sp)
80001802:	ec26                	fsw	fs1,24(sp)
80001804:	ea4a                	fsw	fs2,20(sp)
80001806:	e84e                	fsw	fs3,16(sp)
80001808:	41c4                	lw	s1,4(a1)
8000180a:	080a8c63          	beqz	s5,800018a2 <MiCo_rmsnorm2d_f32+0xb6>
8000180e:	20a50453          	fmv.s	fs0,fa0
80001812:	d014f9d3          	fcvt.s.wu	fs3,s1
80001816:	f0000953          	fmv.w.x	fs2,zero
8000181a:	00249a13          	slli	s4,s1,0x2
8000181e:	89d2                	mv	s3,s4
80001820:	4401                	li	s0,0
80001822:	4901                	li	s2,0
80001824:	0000a797          	auipc	a5,0xa
80001828:	f687a487          	flw	fs1,-152(a5) # 8000b78c <__malloc_trim_threshold+0x1c>
8000182c:	f00007d3          	fmv.w.x	fa5,zero
80001830:	cc91                	beqz	s1,8000184c <MiCo_rmsnorm2d_f32+0x60>
80001832:	4598                	lw	a4,8(a1)
80001834:	f00007d3          	fmv.w.x	fa5,zero
80001838:	00241793          	slli	a5,s0,0x2
8000183c:	97ba                	add	a5,a5,a4
8000183e:	974e                	add	a4,a4,s3
80001840:	6398                	flw	fa4,0(a5)
80001842:	0791                	addi	a5,a5,4
80001844:	78e777c3          	fmadd.s	fa5,fa4,fa4,fa5
80001848:	fef71ce3          	bne	a4,a5,80001840 <MiCo_rmsnorm2d_f32+0x54>
8000184c:	1937f7d3          	fdiv.s	fa5,fa5,fs3
80001850:	0087f7d3          	fadd.s	fa5,fa5,fs0
80001854:	00102773          	frflags	a4
80001858:	a12797d3          	flt.s	a5,fa5,fs2
8000185c:	00171073          	fsflags	a4
80001860:	efb1                	bnez	a5,800018bc <MiCo_rmsnorm2d_f32+0xd0>
80001862:	5807f7d3          	fsqrt.s	fa5,fa5
80001866:	18f4f753          	fdiv.s	fa4,fs1,fa5
8000186a:	c49d                	beqz	s1,80001898 <MiCo_rmsnorm2d_f32+0xac>
8000186c:	4594                	lw	a3,8(a1)
8000186e:	425c                	lw	a5,4(a2)
80001870:	4518                	lw	a4,8(a0)
80001872:	00241813          	slli	a6,s0,0x2
80001876:	96c2                	add	a3,a3,a6
80001878:	9742                	add	a4,a4,a6
8000187a:	00fa0833          	add	a6,s4,a5
8000187e:	629c                	flw	fa5,0(a3)
80001880:	6394                	flw	fa3,0(a5)
80001882:	0711                	addi	a4,a4,4
80001884:	10f777d3          	fmul.s	fa5,fa4,fa5
80001888:	0791                	addi	a5,a5,4
8000188a:	0691                	addi	a3,a3,4
8000188c:	10d7f7d3          	fmul.s	fa5,fa5,fa3
80001890:	fef72e27          	fsw	fa5,-4(a4)
80001894:	fef815e3          	bne	a6,a5,8000187e <MiCo_rmsnorm2d_f32+0x92>
80001898:	0905                	addi	s2,s2,1
8000189a:	9426                	add	s0,s0,s1
8000189c:	99d2                	add	s3,s3,s4
8000189e:	f92a97e3          	bne	s5,s2,8000182c <MiCo_rmsnorm2d_f32+0x40>
800018a2:	50f2                	lw	ra,60(sp)
800018a4:	5462                	lw	s0,56(sp)
800018a6:	54d2                	lw	s1,52(sp)
800018a8:	5942                	lw	s2,48(sp)
800018aa:	59b2                	lw	s3,44(sp)
800018ac:	5a22                	lw	s4,40(sp)
800018ae:	5a92                	lw	s5,36(sp)
800018b0:	6472                	flw	fs0,28(sp)
800018b2:	64e2                	flw	fs1,24(sp)
800018b4:	6952                	flw	fs2,20(sp)
800018b6:	69c2                	flw	fs3,16(sp)
800018b8:	6121                	addi	sp,sp,64
800018ba:	8082                	ret
800018bc:	20f78553          	fmv.s	fa0,fa5
800018c0:	c632                	sw	a2,12(sp)
800018c2:	c42e                	sw	a1,8(sp)
800018c4:	c22a                	sw	a0,4(sp)
800018c6:	40f060ef          	jal	ra,800084d4 <sqrtf>
800018ca:	20a507d3          	fmv.s	fa5,fa0
800018ce:	4632                	lw	a2,12(sp)
800018d0:	45a2                	lw	a1,8(sp)
800018d2:	4512                	lw	a0,4(sp)
800018d4:	bf49                	j	80001866 <MiCo_rmsnorm2d_f32+0x7a>

800018d6 <MiCo_avgpool4d_f32>:
800018d6:	7159                	addi	sp,sp,-112
800018d8:	d2a6                	sw	s1,100(sp)
800018da:	4584                	lw	s1,8(a1)
800018dc:	00171793          	slli	a5,a4,0x1
800018e0:	d4a2                	sw	s0,104(sp)
800018e2:	45c0                	lw	s0,12(a1)
800018e4:	8f91                	sub	a5,a5,a2
800018e6:	c2e6                	sw	s9,68(sp)
800018e8:	8cba                	mv	s9,a4
800018ea:	00f48733          	add	a4,s1,a5
800018ee:	d0ca                	sw	s2,96(sp)
800018f0:	97a2                	add	a5,a5,s0
800018f2:	8936                	mv	s2,a3
800018f4:	02d756b3          	divu	a3,a4,a3
800018f8:	c4e2                	sw	s8,72(sp)
800018fa:	cece                	sw	s3,92(sp)
800018fc:	89b2                	mv	s3,a2
800018fe:	4190                	lw	a2,0(a1)
80001900:	4518                	lw	a4,8(a0)
80001902:	ccd2                	sw	s4,88(sp)
80001904:	cad6                	sw	s5,84(sp)
80001906:	c8da                	sw	s6,80(sp)
80001908:	c6de                	sw	s7,76(sp)
8000190a:	c0ea                	sw	s10,64(sp)
8000190c:	de6e                	sw	s11,60(sp)
8000190e:	d686                	sw	ra,108(sp)
80001910:	c232                	sw	a2,4(sp)
80001912:	00452a83          	lw	s5,4(a0)
80001916:	8d2a                	mv	s10,a0
80001918:	0045ab83          	lw	s7,4(a1)
8000191c:	8a2e                	mv	s4,a1
8000191e:	4501                	li	a0,0
80001920:	0327dc33          	divu	s8,a5,s2
80001924:	c636                	sw	a3,12(sp)
80001926:	00168d93          	addi	s11,a3,1
8000192a:	001c0b13          	addi	s6,s8,1
8000192e:	01b71863          	bne	a4,s11,8000193e <MiCo_avgpool4d_f32+0x68>
80001932:	00cd2503          	lw	a0,12(s10)
80001936:	41650533          	sub	a0,a0,s6
8000193a:	00153513          	seqz	a0,a0
8000193e:	00009597          	auipc	a1,0x9
80001942:	e9658593          	addi	a1,a1,-362 # 8000a7d4 <__init_array_end+0x194>
80001946:	003000ef          	jal	ra,80002148 <MiCo_assert>
8000194a:	415b8533          	sub	a0,s7,s5
8000194e:	00009597          	auipc	a1,0x9
80001952:	eae58593          	addi	a1,a1,-338 # 8000a7fc <__init_array_end+0x1bc>
80001956:	00153513          	seqz	a0,a0
8000195a:	7ee000ef          	jal	ra,80002148 <MiCo_assert>
8000195e:	4792                	lw	a5,4(sp)
80001960:	10078c63          	beqz	a5,80001a78 <MiCo_avgpool4d_f32+0x1a2>
80001964:	100a8a63          	beqz	s5,80001a78 <MiCo_avgpool4d_f32+0x1a2>
80001968:	100d8863          	beqz	s11,80001a78 <MiCo_avgpool4d_f32+0x1a2>
8000196c:	100b0663          	beqz	s6,80001a78 <MiCo_avgpool4d_f32+0x1a2>
80001970:	036d8733          	mul	a4,s11,s6
80001974:	010d2783          	lw	a5,16(s10)
80001978:	0c0a                	slli	s8,s8,0x2
8000197a:	419006b3          	neg	a3,s9
8000197e:	ca3e                	sw	a5,20(sp)
80001980:	0791                	addi	a5,a5,4
80001982:	97e2                	add	a5,a5,s8
80001984:	d43e                	sw	a5,40(sp)
80001986:	d636                	sw	a3,44(sp)
80001988:	419986b3          	sub	a3,s3,s9
8000198c:	035707b3          	mul	a5,a4,s5
80001990:	c83a                	sw	a4,16(sp)
80001992:	4381                	li	t2,0
80001994:	4281                	li	t0,0
80001996:	c436                	sw	a3,8(sp)
80001998:	029b8bb3          	mul	s7,s7,s1
8000199c:	d03e                	sw	a5,32(sp)
8000199e:	028b87b3          	mul	a5,s7,s0
800019a2:	d23e                	sw	a5,36(sp)
800019a4:	028487b3          	mul	a5,s1,s0
800019a8:	03940fb3          	mul	t6,s0,s9
800019ac:	ce3e                	sw	a5,28(sp)
800019ae:	032407b3          	mul	a5,s0,s2
800019b2:	41f00fb3          	neg	t6,t6
800019b6:	cc3e                	sw	a5,24(sp)
800019b8:	8cfe                	mv	s9,t6
800019ba:	8c1e                	mv	s8,t2
800019bc:	4b81                	li	s7,0
800019be:	4522                	lw	a0,8(sp)
800019c0:	8f66                	mv	t5,s9
800019c2:	8de2                	mv	s11,s8
800019c4:	4d01                	li	s10,0
800019c6:	47d2                	lw	a5,20(sp)
800019c8:	002d9e13          	slli	t3,s11,0x2
800019cc:	5832                	lw	a6,44(sp)
800019ce:	01c78333          	add	t1,a5,t3
800019d2:	57a2                	lw	a5,40(sp)
800019d4:	4622                	lw	a2,8(sp)
800019d6:	9e3e                	add	t3,t3,a5
800019d8:	06098e63          	beqz	s3,80001a54 <MiCo_avgpool4d_f32+0x17e>
800019dc:	f00007d3          	fmv.w.x	fa5,zero
800019e0:	413506b3          	sub	a3,a0,s3
800019e4:	85fa                	mv	a1,t5
800019e6:	4881                	li	a7,0
800019e8:	0206c863          	bltz	a3,80001a18 <MiCo_avgpool4d_f32+0x142>
800019ec:	0296d663          	bge	a3,s1,80001a18 <MiCo_avgpool4d_f32+0x142>
800019f0:	01058733          	add	a4,a1,a6
800019f4:	070a                	slli	a4,a4,0x2
800019f6:	87c2                	mv	a5,a6
800019f8:	0007cc63          	bltz	a5,80001a10 <MiCo_avgpool4d_f32+0x13a>
800019fc:	0087da63          	bge	a5,s0,80001a10 <MiCo_avgpool4d_f32+0x13a>
80001a00:	010a2e83          	lw	t4,16(s4)
80001a04:	0885                	addi	a7,a7,1
80001a06:	9eba                	add	t4,t4,a4
80001a08:	000ea707          	flw	fa4,0(t4)
80001a0c:	00e7f7d3          	fadd.s	fa5,fa5,fa4
80001a10:	0785                	addi	a5,a5,1
80001a12:	0711                	addi	a4,a4,4
80001a14:	fef612e3          	bne	a2,a5,800019f8 <MiCo_avgpool4d_f32+0x122>
80001a18:	0685                	addi	a3,a3,1
80001a1a:	95a2                	add	a1,a1,s0
80001a1c:	fca696e3          	bne	a3,a0,800019e8 <MiCo_avgpool4d_f32+0x112>
80001a20:	f0000753          	fmv.w.x	fa4,zero
80001a24:	00088663          	beqz	a7,80001a30 <MiCo_avgpool4d_f32+0x15a>
80001a28:	d018f753          	fcvt.s.wu	fa4,a7
80001a2c:	18e7f753          	fdiv.s	fa4,fa5,fa4
80001a30:	00e32027          	fsw	fa4,0(t1)
80001a34:	0311                	addi	t1,t1,4
80001a36:	964a                	add	a2,a2,s2
80001a38:	984a                	add	a6,a6,s2
80001a3a:	f9c31fe3          	bne	t1,t3,800019d8 <MiCo_avgpool4d_f32+0x102>
80001a3e:	4762                	lw	a4,24(sp)
80001a40:	001d0793          	addi	a5,s10,1
80001a44:	9dda                	add	s11,s11,s6
80001a46:	9f3a                	add	t5,t5,a4
80001a48:	4732                	lw	a4,12(sp)
80001a4a:	954a                	add	a0,a0,s2
80001a4c:	01a70763          	beq	a4,s10,80001a5a <MiCo_avgpool4d_f32+0x184>
80001a50:	8d3e                	mv	s10,a5
80001a52:	bf95                	j	800019c6 <MiCo_avgpool4d_f32+0xf0>
80001a54:	f0000753          	fmv.w.x	fa4,zero
80001a58:	bfe1                	j	80001a30 <MiCo_avgpool4d_f32+0x15a>
80001a5a:	47c2                	lw	a5,16(sp)
80001a5c:	0b85                	addi	s7,s7,1
80001a5e:	9c3e                	add	s8,s8,a5
80001a60:	47f2                	lw	a5,28(sp)
80001a62:	9cbe                	add	s9,s9,a5
80001a64:	f57a9de3          	bne	s5,s7,800019be <MiCo_avgpool4d_f32+0xe8>
80001a68:	5782                	lw	a5,32(sp)
80001a6a:	0285                	addi	t0,t0,1
80001a6c:	93be                	add	t2,t2,a5
80001a6e:	5792                	lw	a5,36(sp)
80001a70:	9fbe                	add	t6,t6,a5
80001a72:	4792                	lw	a5,4(sp)
80001a74:	f45792e3          	bne	a5,t0,800019b8 <MiCo_avgpool4d_f32+0xe2>
80001a78:	50b6                	lw	ra,108(sp)
80001a7a:	5426                	lw	s0,104(sp)
80001a7c:	5496                	lw	s1,100(sp)
80001a7e:	5906                	lw	s2,96(sp)
80001a80:	49f6                	lw	s3,92(sp)
80001a82:	4a66                	lw	s4,88(sp)
80001a84:	4ad6                	lw	s5,84(sp)
80001a86:	4b46                	lw	s6,80(sp)
80001a88:	4bb6                	lw	s7,76(sp)
80001a8a:	4c26                	lw	s8,72(sp)
80001a8c:	4c96                	lw	s9,68(sp)
80001a8e:	4d06                	lw	s10,64(sp)
80001a90:	5df2                	lw	s11,60(sp)
80001a92:	6165                	addi	sp,sp,112
80001a94:	8082                	ret

80001a96 <MiCo_maxpool4d_f32>:
80001a96:	7159                	addi	sp,sp,-112
80001a98:	d2a6                	sw	s1,100(sp)
80001a9a:	4584                	lw	s1,8(a1)
80001a9c:	00171793          	slli	a5,a4,0x1
80001aa0:	d4a2                	sw	s0,104(sp)
80001aa2:	45c0                	lw	s0,12(a1)
80001aa4:	8f91                	sub	a5,a5,a2
80001aa6:	c2e6                	sw	s9,68(sp)
80001aa8:	8cba                	mv	s9,a4
80001aaa:	00f48733          	add	a4,s1,a5
80001aae:	d0ca                	sw	s2,96(sp)
80001ab0:	97a2                	add	a5,a5,s0
80001ab2:	8936                	mv	s2,a3
80001ab4:	02d756b3          	divu	a3,a4,a3
80001ab8:	c4e2                	sw	s8,72(sp)
80001aba:	cece                	sw	s3,92(sp)
80001abc:	89b2                	mv	s3,a2
80001abe:	4190                	lw	a2,0(a1)
80001ac0:	4518                	lw	a4,8(a0)
80001ac2:	ccd2                	sw	s4,88(sp)
80001ac4:	cad6                	sw	s5,84(sp)
80001ac6:	c8da                	sw	s6,80(sp)
80001ac8:	c6de                	sw	s7,76(sp)
80001aca:	c0ea                	sw	s10,64(sp)
80001acc:	de6e                	sw	s11,60(sp)
80001ace:	d686                	sw	ra,108(sp)
80001ad0:	c232                	sw	a2,4(sp)
80001ad2:	00452a83          	lw	s5,4(a0)
80001ad6:	8d2a                	mv	s10,a0
80001ad8:	0045ab83          	lw	s7,4(a1)
80001adc:	8a2e                	mv	s4,a1
80001ade:	4501                	li	a0,0
80001ae0:	0327dc33          	divu	s8,a5,s2
80001ae4:	c636                	sw	a3,12(sp)
80001ae6:	00168d93          	addi	s11,a3,1
80001aea:	001c0b13          	addi	s6,s8,1
80001aee:	01b71863          	bne	a4,s11,80001afe <MiCo_maxpool4d_f32+0x68>
80001af2:	00cd2503          	lw	a0,12(s10)
80001af6:	41650533          	sub	a0,a0,s6
80001afa:	00153513          	seqz	a0,a0
80001afe:	00009597          	auipc	a1,0x9
80001b02:	d2658593          	addi	a1,a1,-730 # 8000a824 <__init_array_end+0x1e4>
80001b06:	2589                	jal	80002148 <MiCo_assert>
80001b08:	415b8533          	sub	a0,s7,s5
80001b0c:	00009597          	auipc	a1,0x9
80001b10:	d4058593          	addi	a1,a1,-704 # 8000a84c <__init_array_end+0x20c>
80001b14:	00153513          	seqz	a0,a0
80001b18:	2d05                	jal	80002148 <MiCo_assert>
80001b1a:	4792                	lw	a5,4(sp)
80001b1c:	10078e63          	beqz	a5,80001c38 <MiCo_maxpool4d_f32+0x1a2>
80001b20:	100a8c63          	beqz	s5,80001c38 <MiCo_maxpool4d_f32+0x1a2>
80001b24:	100d8a63          	beqz	s11,80001c38 <MiCo_maxpool4d_f32+0x1a2>
80001b28:	100b0863          	beqz	s6,80001c38 <MiCo_maxpool4d_f32+0x1a2>
80001b2c:	036d8733          	mul	a4,s11,s6
80001b30:	010d2783          	lw	a5,16(s10)
80001b34:	0c0a                	slli	s8,s8,0x2
80001b36:	419006b3          	neg	a3,s9
80001b3a:	ca3e                	sw	a5,20(sp)
80001b3c:	0791                	addi	a5,a5,4
80001b3e:	97e2                	add	a5,a5,s8
80001b40:	d43e                	sw	a5,40(sp)
80001b42:	0000a797          	auipc	a5,0xa
80001b46:	c467a687          	flw	fa3,-954(a5) # 8000b788 <__malloc_trim_threshold+0x18>
80001b4a:	d636                	sw	a3,44(sp)
80001b4c:	035707b3          	mul	a5,a4,s5
80001b50:	419986b3          	sub	a3,s3,s9
80001b54:	c83a                	sw	a4,16(sp)
80001b56:	4381                	li	t2,0
80001b58:	4281                	li	t0,0
80001b5a:	c436                	sw	a3,8(sp)
80001b5c:	029b8bb3          	mul	s7,s7,s1
80001b60:	d03e                	sw	a5,32(sp)
80001b62:	028b87b3          	mul	a5,s7,s0
80001b66:	d23e                	sw	a5,36(sp)
80001b68:	028487b3          	mul	a5,s1,s0
80001b6c:	03940fb3          	mul	t6,s0,s9
80001b70:	ce3e                	sw	a5,28(sp)
80001b72:	032407b3          	mul	a5,s0,s2
80001b76:	41f00fb3          	neg	t6,t6
80001b7a:	cc3e                	sw	a5,24(sp)
80001b7c:	8cfe                	mv	s9,t6
80001b7e:	8c1e                	mv	s8,t2
80001b80:	4b81                	li	s7,0
80001b82:	4522                	lw	a0,8(sp)
80001b84:	8f66                	mv	t5,s9
80001b86:	8de2                	mv	s11,s8
80001b88:	4d01                	li	s10,0
80001b8a:	47d2                	lw	a5,20(sp)
80001b8c:	002d9e93          	slli	t4,s11,0x2
80001b90:	5832                	lw	a6,44(sp)
80001b92:	01d788b3          	add	a7,a5,t4
80001b96:	57a2                	lw	a5,40(sp)
80001b98:	4622                	lw	a2,8(sp)
80001b9a:	9ebe                	add	t4,t4,a5
80001b9c:	06098c63          	beqz	s3,80001c14 <MiCo_maxpool4d_f32+0x17e>
80001ba0:	20d687d3          	fmv.s	fa5,fa3
80001ba4:	413506b3          	sub	a3,a0,s3
80001ba8:	85fa                	mv	a1,t5
80001baa:	4301                	li	t1,0
80001bac:	0206cc63          	bltz	a3,80001be4 <MiCo_maxpool4d_f32+0x14e>
80001bb0:	0296da63          	bge	a3,s1,80001be4 <MiCo_maxpool4d_f32+0x14e>
80001bb4:	01058733          	add	a4,a1,a6
80001bb8:	070a                	slli	a4,a4,0x2
80001bba:	87c2                	mv	a5,a6
80001bbc:	0207c063          	bltz	a5,80001bdc <MiCo_maxpool4d_f32+0x146>
80001bc0:	0087de63          	bge	a5,s0,80001bdc <MiCo_maxpool4d_f32+0x146>
80001bc4:	010a2e03          	lw	t3,16(s4)
80001bc8:	4305                	li	t1,1
80001bca:	9e3a                	add	t3,t3,a4
80001bcc:	000e2707          	flw	fa4,0(t3)
80001bd0:	a0f71e53          	flt.s	t3,fa4,fa5
80001bd4:	000e1463          	bnez	t3,80001bdc <MiCo_maxpool4d_f32+0x146>
80001bd8:	20e707d3          	fmv.s	fa5,fa4
80001bdc:	0785                	addi	a5,a5,1
80001bde:	0711                	addi	a4,a4,4
80001be0:	fcc79ee3          	bne	a5,a2,80001bbc <MiCo_maxpool4d_f32+0x126>
80001be4:	0685                	addi	a3,a3,1
80001be6:	95a2                	add	a1,a1,s0
80001be8:	fca692e3          	bne	a3,a0,80001bac <MiCo_maxpool4d_f32+0x116>
80001bec:	02030463          	beqz	t1,80001c14 <MiCo_maxpool4d_f32+0x17e>
80001bf0:	00f8a027          	fsw	fa5,0(a7)
80001bf4:	0891                	addi	a7,a7,4
80001bf6:	964a                	add	a2,a2,s2
80001bf8:	984a                	add	a6,a6,s2
80001bfa:	fbd891e3          	bne	a7,t4,80001b9c <MiCo_maxpool4d_f32+0x106>
80001bfe:	4762                	lw	a4,24(sp)
80001c00:	001d0793          	addi	a5,s10,1
80001c04:	9dda                	add	s11,s11,s6
80001c06:	9f3a                	add	t5,t5,a4
80001c08:	4732                	lw	a4,12(sp)
80001c0a:	954a                	add	a0,a0,s2
80001c0c:	01a70763          	beq	a4,s10,80001c1a <MiCo_maxpool4d_f32+0x184>
80001c10:	8d3e                	mv	s10,a5
80001c12:	bfa5                	j	80001b8a <MiCo_maxpool4d_f32+0xf4>
80001c14:	f00007d3          	fmv.w.x	fa5,zero
80001c18:	bfe1                	j	80001bf0 <MiCo_maxpool4d_f32+0x15a>
80001c1a:	47c2                	lw	a5,16(sp)
80001c1c:	0b85                	addi	s7,s7,1
80001c1e:	9c3e                	add	s8,s8,a5
80001c20:	47f2                	lw	a5,28(sp)
80001c22:	9cbe                	add	s9,s9,a5
80001c24:	f57a9fe3          	bne	s5,s7,80001b82 <MiCo_maxpool4d_f32+0xec>
80001c28:	5782                	lw	a5,32(sp)
80001c2a:	0285                	addi	t0,t0,1
80001c2c:	93be                	add	t2,t2,a5
80001c2e:	5792                	lw	a5,36(sp)
80001c30:	9fbe                	add	t6,t6,a5
80001c32:	4792                	lw	a5,4(sp)
80001c34:	f45794e3          	bne	a5,t0,80001b7c <MiCo_maxpool4d_f32+0xe6>
80001c38:	50b6                	lw	ra,108(sp)
80001c3a:	5426                	lw	s0,104(sp)
80001c3c:	5496                	lw	s1,100(sp)
80001c3e:	5906                	lw	s2,96(sp)
80001c40:	49f6                	lw	s3,92(sp)
80001c42:	4a66                	lw	s4,88(sp)
80001c44:	4ad6                	lw	s5,84(sp)
80001c46:	4b46                	lw	s6,80(sp)
80001c48:	4bb6                	lw	s7,76(sp)
80001c4a:	4c26                	lw	s8,72(sp)
80001c4c:	4c96                	lw	s9,68(sp)
80001c4e:	4d06                	lw	s10,64(sp)
80001c50:	5df2                	lw	s11,60(sp)
80001c52:	6165                	addi	sp,sp,112
80001c54:	8082                	ret

80001c56 <MiCo_adaptive_avgpool4d_f32>:
80001c56:	459c                	lw	a5,8(a1)
80001c58:	45d8                	lw	a4,12(a1)
80001c5a:	1141                	addi	sp,sp,-16
80001c5c:	c226                	sw	s1,4(sp)
80001c5e:	84aa                	mv	s1,a0
80001c60:	40e78533          	sub	a0,a5,a4
80001c64:	c422                	sw	s0,8(sp)
80001c66:	00153513          	seqz	a0,a0
80001c6a:	842e                	mv	s0,a1
80001c6c:	00009597          	auipc	a1,0x9
80001c70:	c0858593          	addi	a1,a1,-1016 # 8000a874 <__init_array_end+0x234>
80001c74:	c04a                	sw	s2,0(sp)
80001c76:	c606                	sw	ra,12(sp)
80001c78:	8932                	mv	s2,a2
80001c7a:	21f9                	jal	80002148 <MiCo_assert>
80001c7c:	440c                	lw	a1,8(s0)
80001c7e:	4785                	li	a5,1
80001c80:	41278633          	sub	a2,a5,s2
80001c84:	962e                	add	a2,a2,a1
80001c86:	85a2                	mv	a1,s0
80001c88:	4422                	lw	s0,8(sp)
80001c8a:	40b2                	lw	ra,12(sp)
80001c8c:	4902                	lw	s2,0(sp)
80001c8e:	8526                	mv	a0,s1
80001c90:	4492                	lw	s1,4(sp)
80001c92:	4701                	li	a4,0
80001c94:	4685                	li	a3,1
80001c96:	0141                	addi	sp,sp,16
80001c98:	b93d                	j	800018d6 <MiCo_avgpool4d_f32>
80001c9a:	4501                	li	a0,0
80001c9c:	8082                	ret

80001c9e <MiCo_print_profilers>:
80001c9e:	1141                	addi	sp,sp,-16
80001ca0:	0000a597          	auipc	a1,0xa
80001ca4:	b5c5a583          	lw	a1,-1188(a1) # 8000b7fc <QUANT_TIMER>
80001ca8:	00009517          	auipc	a0,0x9
80001cac:	bf850513          	addi	a0,a0,-1032 # 8000a8a0 <__init_array_end+0x260>
80001cb0:	c606                	sw	ra,12(sp)
80001cb2:	04c060ef          	jal	ra,80007cfe <printf>
80001cb6:	0000a597          	auipc	a1,0xa
80001cba:	b4a5a583          	lw	a1,-1206(a1) # 8000b800 <QMATMUL_TIMER>
80001cbe:	00009517          	auipc	a0,0x9
80001cc2:	bf650513          	addi	a0,a0,-1034 # 8000a8b4 <__init_array_end+0x274>
80001cc6:	038060ef          	jal	ra,80007cfe <printf>
80001cca:	40b2                	lw	ra,12(sp)
80001ccc:	0000a597          	auipc	a1,0xa
80001cd0:	b2c5a583          	lw	a1,-1236(a1) # 8000b7f8 <IM2COL_TIMER>
80001cd4:	00009517          	auipc	a0,0x9
80001cd8:	bf450513          	addi	a0,a0,-1036 # 8000a8c8 <__init_array_end+0x288>
80001cdc:	0141                	addi	sp,sp,16
80001cde:	0200606f          	j	80007cfe <printf>

80001ce2 <MiCo_relu2d_f32>:
80001ce2:	4110                	lw	a2,0(a0)
80001ce4:	415c                	lw	a5,4(a0)
80001ce6:	02f60633          	mul	a2,a2,a5
80001cea:	c61d                	beqz	a2,80001d18 <MiCo_relu2d_f32+0x36>
80001cec:	459c                	lw	a5,8(a1)
80001cee:	4518                	lw	a4,8(a0)
80001cf0:	f0000753          	fmv.w.x	fa4,zero
80001cf4:	060a                	slli	a2,a2,0x2
80001cf6:	963e                	add	a2,a2,a5
80001cf8:	639c                	flw	fa5,0(a5)
80001cfa:	a0f716d3          	flt.s	a3,fa4,fa5
80001cfe:	c699                	beqz	a3,80001d0c <MiCo_relu2d_f32+0x2a>
80001d00:	e31c                	fsw	fa5,0(a4)
80001d02:	0791                	addi	a5,a5,4
80001d04:	0711                	addi	a4,a4,4
80001d06:	fec799e3          	bne	a5,a2,80001cf8 <MiCo_relu2d_f32+0x16>
80001d0a:	8082                	ret
80001d0c:	00072023          	sw	zero,0(a4)
80001d10:	0791                	addi	a5,a5,4
80001d12:	0711                	addi	a4,a4,4
80001d14:	fec792e3          	bne	a5,a2,80001cf8 <MiCo_relu2d_f32+0x16>
80001d18:	8082                	ret

80001d1a <MiCo_relu3d_f32>:
80001d1a:	411c                	lw	a5,0(a0)
80001d1c:	4154                	lw	a3,4(a0)
80001d1e:	4518                	lw	a4,8(a0)
80001d20:	02d786b3          	mul	a3,a5,a3
80001d24:	02e686b3          	mul	a3,a3,a4
80001d28:	c69d                	beqz	a3,80001d56 <MiCo_relu3d_f32+0x3c>
80001d2a:	45dc                	lw	a5,12(a1)
80001d2c:	4558                	lw	a4,12(a0)
80001d2e:	f0000753          	fmv.w.x	fa4,zero
80001d32:	068a                	slli	a3,a3,0x2
80001d34:	96be                	add	a3,a3,a5
80001d36:	639c                	flw	fa5,0(a5)
80001d38:	a0f71653          	flt.s	a2,fa4,fa5
80001d3c:	c619                	beqz	a2,80001d4a <MiCo_relu3d_f32+0x30>
80001d3e:	e31c                	fsw	fa5,0(a4)
80001d40:	0791                	addi	a5,a5,4
80001d42:	0711                	addi	a4,a4,4
80001d44:	fed799e3          	bne	a5,a3,80001d36 <MiCo_relu3d_f32+0x1c>
80001d48:	8082                	ret
80001d4a:	00072023          	sw	zero,0(a4)
80001d4e:	0791                	addi	a5,a5,4
80001d50:	0711                	addi	a4,a4,4
80001d52:	fed792e3          	bne	a5,a3,80001d36 <MiCo_relu3d_f32+0x1c>
80001d56:	8082                	ret

80001d58 <MiCo_relu4d_f32>:
80001d58:	411c                	lw	a5,0(a0)
80001d5a:	4150                	lw	a2,4(a0)
80001d5c:	4514                	lw	a3,8(a0)
80001d5e:	4558                	lw	a4,12(a0)
80001d60:	02c787b3          	mul	a5,a5,a2
80001d64:	02d786b3          	mul	a3,a5,a3
80001d68:	02e686b3          	mul	a3,a3,a4
80001d6c:	c69d                	beqz	a3,80001d9a <MiCo_relu4d_f32+0x42>
80001d6e:	499c                	lw	a5,16(a1)
80001d70:	4918                	lw	a4,16(a0)
80001d72:	f0000753          	fmv.w.x	fa4,zero
80001d76:	068a                	slli	a3,a3,0x2
80001d78:	96be                	add	a3,a3,a5
80001d7a:	639c                	flw	fa5,0(a5)
80001d7c:	a0f71653          	flt.s	a2,fa4,fa5
80001d80:	c619                	beqz	a2,80001d8e <MiCo_relu4d_f32+0x36>
80001d82:	e31c                	fsw	fa5,0(a4)
80001d84:	0791                	addi	a5,a5,4
80001d86:	0711                	addi	a4,a4,4
80001d88:	fed799e3          	bne	a5,a3,80001d7a <MiCo_relu4d_f32+0x22>
80001d8c:	8082                	ret
80001d8e:	00072023          	sw	zero,0(a4)
80001d92:	0791                	addi	a5,a5,4
80001d94:	0711                	addi	a4,a4,4
80001d96:	fed792e3          	bne	a5,a3,80001d7a <MiCo_relu4d_f32+0x22>
80001d9a:	8082                	ret

80001d9c <MiCo_relu62d_f32>:
80001d9c:	4110                	lw	a2,0(a0)
80001d9e:	415c                	lw	a5,4(a0)
80001da0:	02f60633          	mul	a2,a2,a5
80001da4:	c231                	beqz	a2,80001de8 <MiCo_relu62d_f32+0x4c>
80001da6:	459c                	lw	a5,8(a1)
80001da8:	060a                	slli	a2,a2,0x2
80001daa:	4518                	lw	a4,8(a0)
80001dac:	f0000753          	fmv.w.x	fa4,zero
80001db0:	963e                	add	a2,a2,a5
80001db2:	0000a697          	auipc	a3,0xa
80001db6:	9de6a687          	flw	fa3,-1570(a3) # 8000b790 <__malloc_trim_threshold+0x20>
80001dba:	a819                	j	80001dd0 <MiCo_relu62d_f32+0x34>
80001dbc:	a0f696d3          	flt.s	a3,fa3,fa5
80001dc0:	c299                	beqz	a3,80001dc6 <MiCo_relu62d_f32+0x2a>
80001dc2:	20d687d3          	fmv.s	fa5,fa3
80001dc6:	0791                	addi	a5,a5,4
80001dc8:	e31c                	fsw	fa5,0(a4)
80001dca:	0711                	addi	a4,a4,4
80001dcc:	00f60e63          	beq	a2,a5,80001de8 <MiCo_relu62d_f32+0x4c>
80001dd0:	639c                	flw	fa5,0(a5)
80001dd2:	a0f716d3          	flt.s	a3,fa4,fa5
80001dd6:	f2fd                	bnez	a3,80001dbc <MiCo_relu62d_f32+0x20>
80001dd8:	f00007d3          	fmv.w.x	fa5,zero
80001ddc:	0791                	addi	a5,a5,4
80001dde:	0711                	addi	a4,a4,4
80001de0:	fef72e27          	fsw	fa5,-4(a4)
80001de4:	fef616e3          	bne	a2,a5,80001dd0 <MiCo_relu62d_f32+0x34>
80001de8:	8082                	ret

80001dea <MiCo_relu64d_f32>:
80001dea:	411c                	lw	a5,0(a0)
80001dec:	4150                	lw	a2,4(a0)
80001dee:	4514                	lw	a3,8(a0)
80001df0:	4558                	lw	a4,12(a0)
80001df2:	02c787b3          	mul	a5,a5,a2
80001df6:	02d786b3          	mul	a3,a5,a3
80001dfa:	02e686b3          	mul	a3,a3,a4
80001dfe:	c2b1                	beqz	a3,80001e42 <MiCo_relu64d_f32+0x58>
80001e00:	499c                	lw	a5,16(a1)
80001e02:	068a                	slli	a3,a3,0x2
80001e04:	4918                	lw	a4,16(a0)
80001e06:	f0000753          	fmv.w.x	fa4,zero
80001e0a:	96be                	add	a3,a3,a5
80001e0c:	0000a617          	auipc	a2,0xa
80001e10:	98462687          	flw	fa3,-1660(a2) # 8000b790 <__malloc_trim_threshold+0x20>
80001e14:	a819                	j	80001e2a <MiCo_relu64d_f32+0x40>
80001e16:	a0f69653          	flt.s	a2,fa3,fa5
80001e1a:	c219                	beqz	a2,80001e20 <MiCo_relu64d_f32+0x36>
80001e1c:	20d687d3          	fmv.s	fa5,fa3
80001e20:	0791                	addi	a5,a5,4
80001e22:	e31c                	fsw	fa5,0(a4)
80001e24:	0711                	addi	a4,a4,4
80001e26:	00f68e63          	beq	a3,a5,80001e42 <MiCo_relu64d_f32+0x58>
80001e2a:	639c                	flw	fa5,0(a5)
80001e2c:	a0f71653          	flt.s	a2,fa4,fa5
80001e30:	f27d                	bnez	a2,80001e16 <MiCo_relu64d_f32+0x2c>
80001e32:	f00007d3          	fmv.w.x	fa5,zero
80001e36:	0791                	addi	a5,a5,4
80001e38:	0711                	addi	a4,a4,4
80001e3a:	fef72e27          	fsw	fa5,-4(a4)
80001e3e:	fef696e3          	bne	a3,a5,80001e2a <MiCo_relu64d_f32+0x40>
80001e42:	8082                	ret

80001e44 <MiCo_channel_shuffle>:
80001e44:	02d677b3          	remu	a5,a2,a3
80001e48:	7179                	addi	sp,sp,-48
80001e4a:	d04a                	sw	s2,32(sp)
80001e4c:	ce4e                	sw	s3,28(sp)
80001e4e:	892a                	mv	s2,a0
80001e50:	89ae                	mv	s3,a1
80001e52:	00009597          	auipc	a1,0x9
80001e56:	a8a58593          	addi	a1,a1,-1398 # 8000a8dc <__init_array_end+0x29c>
80001e5a:	d606                	sw	ra,44(sp)
80001e5c:	d422                	sw	s0,40(sp)
80001e5e:	d226                	sw	s1,36(sp)
80001e60:	8436                	mv	s0,a3
80001e62:	84b2                	mv	s1,a2
80001e64:	cc52                	sw	s4,24(sp)
80001e66:	ca56                	sw	s5,20(sp)
80001e68:	c85a                	sw	s6,16(sp)
80001e6a:	c65e                	sw	s7,12(sp)
80001e6c:	c462                	sw	s8,8(sp)
80001e6e:	c266                	sw	s9,4(sp)
80001e70:	0017b513          	seqz	a0,a5
80001e74:	2cd1                	jal	80002148 <MiCo_assert>
80001e76:	0049a503          	lw	a0,4(s3)
80001e7a:	00009597          	auipc	a1,0x9
80001e7e:	a9a58593          	addi	a1,a1,-1382 # 8000a914 <__init_array_end+0x2d4>
80001e82:	8d05                	sub	a0,a0,s1
80001e84:	00153513          	seqz	a0,a0
80001e88:	24c1                	jal	80002148 <MiCo_assert>
80001e8a:	0089a303          	lw	t1,8(s3)
80001e8e:	00c9a883          	lw	a7,12(s3)
80001e92:	0009aa03          	lw	s4,0(s3)
80001e96:	00992223          	sw	s1,4(s2)
80001e9a:	031302b3          	mul	t0,t1,a7
80001e9e:	01492023          	sw	s4,0(s2)
80001ea2:	00692423          	sw	t1,8(s2)
80001ea6:	01192623          	sw	a7,12(s2)
80001eaa:	0284d3b3          	divu	t2,s1,s0
80001eae:	02548ab3          	mul	s5,s1,t0
80001eb2:	080a0763          	beqz	s4,80001f40 <MiCo_channel_shuffle+0xfc>
80001eb6:	c449                	beqz	s0,80001f40 <MiCo_channel_shuffle+0xfc>
80001eb8:	0884e463          	bltu	s1,s0,80001f40 <MiCo_channel_shuffle+0xfc>
80001ebc:	08030263          	beqz	t1,80001f40 <MiCo_channel_shuffle+0xfc>
80001ec0:	08088063          	beqz	a7,80001f40 <MiCo_channel_shuffle+0xfc>
80001ec4:	4485                	li	s1,1
80001ec6:	00229793          	slli	a5,t0,0x2
80001eca:	407484b3          	sub	s1,s1,t2
80001ece:	fff40f93          	addi	t6,s0,-1
80001ed2:	02538b33          	mul	s6,t2,t0
80001ed6:	0109a803          	lw	a6,16(s3)
80001eda:	01092e03          	lw	t3,16(s2)
80001ede:	088a                	slli	a7,a7,0x2
80001ee0:	4981                	li	s3,0
80001ee2:	4901                	li	s2,0
80001ee4:	02f484b3          	mul	s1,s1,a5
80001ee8:	02ff8fb3          	mul	t6,t6,a5
80001eec:	8cce                	mv	s9,s3
80001eee:	4c01                	li	s8,0
80001ef0:	4b81                	li	s7,0
80001ef2:	8562                	mv	a0,s8
80001ef4:	8f66                	mv	t5,s9
80001ef6:	4e81                	li	t4,0
80001ef8:	002f1613          	slli	a2,t5,0x2
80001efc:	4581                	li	a1,0
80001efe:	00c806b3          	add	a3,a6,a2
80001f02:	00a60733          	add	a4,a2,a0
80001f06:	9646                	add	a2,a2,a7
80001f08:	87b6                	mv	a5,a3
80001f0a:	9772                	add	a4,a4,t3
80001f0c:	00c806b3          	add	a3,a6,a2
80001f10:	639c                	flw	fa5,0(a5)
80001f12:	0791                	addi	a5,a5,4
80001f14:	0711                	addi	a4,a4,4
80001f16:	fef72e27          	fsw	fa5,-4(a4)
80001f1a:	fef69be3          	bne	a3,a5,80001f10 <MiCo_channel_shuffle+0xcc>
80001f1e:	0585                	addi	a1,a1,1
80001f20:	feb311e3          	bne	t1,a1,80001f02 <MiCo_channel_shuffle+0xbe>
80001f24:	0e85                	addi	t4,t4,1
80001f26:	9f16                	add	t5,t5,t0
80001f28:	957e                	add	a0,a0,t6
80001f2a:	fc7ee7e3          	bltu	t4,t2,80001ef8 <MiCo_channel_shuffle+0xb4>
80001f2e:	0b85                	addi	s7,s7,1
80001f30:	9cda                	add	s9,s9,s6
80001f32:	9c26                	add	s8,s8,s1
80001f34:	fb741fe3          	bne	s0,s7,80001ef2 <MiCo_channel_shuffle+0xae>
80001f38:	0905                	addi	s2,s2,1
80001f3a:	99d6                	add	s3,s3,s5
80001f3c:	fb2a18e3          	bne	s4,s2,80001eec <MiCo_channel_shuffle+0xa8>
80001f40:	50b2                	lw	ra,44(sp)
80001f42:	5422                	lw	s0,40(sp)
80001f44:	5492                	lw	s1,36(sp)
80001f46:	5902                	lw	s2,32(sp)
80001f48:	49f2                	lw	s3,28(sp)
80001f4a:	4a62                	lw	s4,24(sp)
80001f4c:	4ad2                	lw	s5,20(sp)
80001f4e:	4b42                	lw	s6,16(sp)
80001f50:	4bb2                	lw	s7,12(sp)
80001f52:	4c22                	lw	s8,8(sp)
80001f54:	4c92                	lw	s9,4(sp)
80001f56:	6145                	addi	sp,sp,48
80001f58:	8082                	ret

80001f5a <MiCo_print_tensor2d_f32>:
80001f5a:	411c                	lw	a5,0(a0)
80001f5c:	cbb5                	beqz	a5,80001fd0 <MiCo_print_tensor2d_f32+0x76>
80001f5e:	1101                	addi	sp,sp,-32
80001f60:	ca26                	sw	s1,20(sp)
80001f62:	c84a                	sw	s2,16(sp)
80001f64:	c64e                	sw	s3,12(sp)
80001f66:	c452                	sw	s4,8(sp)
80001f68:	ce06                	sw	ra,28(sp)
80001f6a:	cc22                	sw	s0,24(sp)
80001f6c:	84aa                	mv	s1,a0
80001f6e:	4901                	li	s2,0
80001f70:	00009a17          	auipc	s4,0x9
80001f74:	9eca0a13          	addi	s4,s4,-1556 # 8000a95c <__init_array_end+0x31c>
80001f78:	00009997          	auipc	s3,0x9
80001f7c:	9f098993          	addi	s3,s3,-1552 # 8000a968 <__init_array_end+0x328>
80001f80:	85ca                	mv	a1,s2
80001f82:	8552                	mv	a0,s4
80001f84:	57b050ef          	jal	ra,80007cfe <printf>
80001f88:	40dc                	lw	a5,4(s1)
80001f8a:	c785                	beqz	a5,80001fb2 <MiCo_print_tensor2d_f32+0x58>
80001f8c:	4401                	li	s0,0
80001f8e:	032787b3          	mul	a5,a5,s2
80001f92:	4498                	lw	a4,8(s1)
80001f94:	97a2                	add	a5,a5,s0
80001f96:	078a                	slli	a5,a5,0x2
80001f98:	97ba                	add	a5,a5,a4
80001f9a:	6388                	flw	fa0,0(a5)
80001f9c:	0405                	addi	s0,s0,1
80001f9e:	5a8080ef          	jal	ra,8000a546 <__extendsfdf2>
80001fa2:	862a                	mv	a2,a0
80001fa4:	86ae                	mv	a3,a1
80001fa6:	854e                	mv	a0,s3
80001fa8:	557050ef          	jal	ra,80007cfe <printf>
80001fac:	40dc                	lw	a5,4(s1)
80001fae:	fef460e3          	bltu	s0,a5,80001f8e <MiCo_print_tensor2d_f32+0x34>
80001fb2:	4529                	li	a0,10
80001fb4:	46d050ef          	jal	ra,80007c20 <putchar>
80001fb8:	409c                	lw	a5,0(s1)
80001fba:	0905                	addi	s2,s2,1
80001fbc:	fcf962e3          	bltu	s2,a5,80001f80 <MiCo_print_tensor2d_f32+0x26>
80001fc0:	40f2                	lw	ra,28(sp)
80001fc2:	4462                	lw	s0,24(sp)
80001fc4:	44d2                	lw	s1,20(sp)
80001fc6:	4942                	lw	s2,16(sp)
80001fc8:	49b2                	lw	s3,12(sp)
80001fca:	4a22                	lw	s4,8(sp)
80001fcc:	6105                	addi	sp,sp,32
80001fce:	8082                	ret
80001fd0:	8082                	ret

80001fd2 <MiCo_print_tensor3d_f32>:
80001fd2:	411c                	lw	a5,0(a0)
80001fd4:	c3d5                	beqz	a5,80002078 <MiCo_print_tensor3d_f32+0xa6>
80001fd6:	1101                	addi	sp,sp,-32
80001fd8:	c84a                	sw	s2,16(sp)
80001fda:	c64e                	sw	s3,12(sp)
80001fdc:	c452                	sw	s4,8(sp)
80001fde:	c256                	sw	s5,4(sp)
80001fe0:	ce06                	sw	ra,28(sp)
80001fe2:	cc22                	sw	s0,24(sp)
80001fe4:	ca26                	sw	s1,20(sp)
80001fe6:	8aaa                	mv	s5,a0
80001fe8:	4901                	li	s2,0
80001fea:	00009a17          	auipc	s4,0x9
80001fee:	972a0a13          	addi	s4,s4,-1678 # 8000a95c <__init_array_end+0x31c>
80001ff2:	00009997          	auipc	s3,0x9
80001ff6:	97698993          	addi	s3,s3,-1674 # 8000a968 <__init_array_end+0x328>
80001ffa:	85ca                	mv	a1,s2
80001ffc:	8552                	mv	a0,s4
80001ffe:	501050ef          	jal	ra,80007cfe <printf>
80002002:	004aa783          	lw	a5,4(s5)
80002006:	4481                	li	s1,0
80002008:	c7b9                	beqz	a5,80002056 <MiCo_print_tensor3d_f32+0x84>
8000200a:	008aa683          	lw	a3,8(s5)
8000200e:	4401                	li	s0,0
80002010:	e681                	bnez	a3,80002018 <MiCo_print_tensor3d_f32+0x46>
80002012:	a815                	j	80002046 <MiCo_print_tensor3d_f32+0x74>
80002014:	004aa783          	lw	a5,4(s5)
80002018:	02f907b3          	mul	a5,s2,a5
8000201c:	00caa703          	lw	a4,12(s5)
80002020:	97a6                	add	a5,a5,s1
80002022:	02d787b3          	mul	a5,a5,a3
80002026:	97a2                	add	a5,a5,s0
80002028:	078a                	slli	a5,a5,0x2
8000202a:	97ba                	add	a5,a5,a4
8000202c:	6388                	flw	fa0,0(a5)
8000202e:	0405                	addi	s0,s0,1
80002030:	516080ef          	jal	ra,8000a546 <__extendsfdf2>
80002034:	862a                	mv	a2,a0
80002036:	86ae                	mv	a3,a1
80002038:	854e                	mv	a0,s3
8000203a:	4c5050ef          	jal	ra,80007cfe <printf>
8000203e:	008aa683          	lw	a3,8(s5)
80002042:	fcd469e3          	bltu	s0,a3,80002014 <MiCo_print_tensor3d_f32+0x42>
80002046:	4529                	li	a0,10
80002048:	3d9050ef          	jal	ra,80007c20 <putchar>
8000204c:	004aa783          	lw	a5,4(s5)
80002050:	0485                	addi	s1,s1,1
80002052:	faf4ece3          	bltu	s1,a5,8000200a <MiCo_print_tensor3d_f32+0x38>
80002056:	4529                	li	a0,10
80002058:	3c9050ef          	jal	ra,80007c20 <putchar>
8000205c:	000aa783          	lw	a5,0(s5)
80002060:	0905                	addi	s2,s2,1
80002062:	f8f96ce3          	bltu	s2,a5,80001ffa <MiCo_print_tensor3d_f32+0x28>
80002066:	40f2                	lw	ra,28(sp)
80002068:	4462                	lw	s0,24(sp)
8000206a:	44d2                	lw	s1,20(sp)
8000206c:	4942                	lw	s2,16(sp)
8000206e:	49b2                	lw	s3,12(sp)
80002070:	4a22                	lw	s4,8(sp)
80002072:	4a92                	lw	s5,4(sp)
80002074:	6105                	addi	sp,sp,32
80002076:	8082                	ret
80002078:	8082                	ret

8000207a <MiCo_print_tensor4d_f32>:
8000207a:	411c                	lw	a5,0(a0)
8000207c:	c7e9                	beqz	a5,80002146 <MiCo_print_tensor4d_f32+0xcc>
8000207e:	1101                	addi	sp,sp,-32
80002080:	c84a                	sw	s2,16(sp)
80002082:	c64e                	sw	s3,12(sp)
80002084:	c452                	sw	s4,8(sp)
80002086:	c256                	sw	s5,4(sp)
80002088:	ce06                	sw	ra,28(sp)
8000208a:	cc22                	sw	s0,24(sp)
8000208c:	ca26                	sw	s1,20(sp)
8000208e:	c05a                	sw	s6,0(sp)
80002090:	8aaa                	mv	s5,a0
80002092:	4901                	li	s2,0
80002094:	00009a17          	auipc	s4,0x9
80002098:	8c8a0a13          	addi	s4,s4,-1848 # 8000a95c <__init_array_end+0x31c>
8000209c:	00009997          	auipc	s3,0x9
800020a0:	8cc98993          	addi	s3,s3,-1844 # 8000a968 <__init_array_end+0x328>
800020a4:	85ca                	mv	a1,s2
800020a6:	8552                	mv	a0,s4
800020a8:	457050ef          	jal	ra,80007cfe <printf>
800020ac:	004aa783          	lw	a5,4(s5)
800020b0:	4481                	li	s1,0
800020b2:	cba5                	beqz	a5,80002122 <MiCo_print_tensor4d_f32+0xa8>
800020b4:	008aa603          	lw	a2,8(s5)
800020b8:	4401                	li	s0,0
800020ba:	ce21                	beqz	a2,80002112 <MiCo_print_tensor4d_f32+0x98>
800020bc:	00caa683          	lw	a3,12(s5)
800020c0:	4b01                	li	s6,0
800020c2:	e681                	bnez	a3,800020ca <MiCo_print_tensor4d_f32+0x50>
800020c4:	a83d                	j	80002102 <MiCo_print_tensor4d_f32+0x88>
800020c6:	008aa603          	lw	a2,8(s5)
800020ca:	004aa783          	lw	a5,4(s5)
800020ce:	010aa703          	lw	a4,16(s5)
800020d2:	02f907b3          	mul	a5,s2,a5
800020d6:	97a6                	add	a5,a5,s1
800020d8:	02c787b3          	mul	a5,a5,a2
800020dc:	97a2                	add	a5,a5,s0
800020de:	02d787b3          	mul	a5,a5,a3
800020e2:	97da                	add	a5,a5,s6
800020e4:	078a                	slli	a5,a5,0x2
800020e6:	97ba                	add	a5,a5,a4
800020e8:	6388                	flw	fa0,0(a5)
800020ea:	0b05                	addi	s6,s6,1
800020ec:	45a080ef          	jal	ra,8000a546 <__extendsfdf2>
800020f0:	862a                	mv	a2,a0
800020f2:	86ae                	mv	a3,a1
800020f4:	854e                	mv	a0,s3
800020f6:	409050ef          	jal	ra,80007cfe <printf>
800020fa:	00caa683          	lw	a3,12(s5)
800020fe:	fcdb64e3          	bltu	s6,a3,800020c6 <MiCo_print_tensor4d_f32+0x4c>
80002102:	4529                	li	a0,10
80002104:	31d050ef          	jal	ra,80007c20 <putchar>
80002108:	008aa603          	lw	a2,8(s5)
8000210c:	0405                	addi	s0,s0,1
8000210e:	fac467e3          	bltu	s0,a2,800020bc <MiCo_print_tensor4d_f32+0x42>
80002112:	4529                	li	a0,10
80002114:	30d050ef          	jal	ra,80007c20 <putchar>
80002118:	004aa783          	lw	a5,4(s5)
8000211c:	0485                	addi	s1,s1,1
8000211e:	f8f4ebe3          	bltu	s1,a5,800020b4 <MiCo_print_tensor4d_f32+0x3a>
80002122:	4529                	li	a0,10
80002124:	2fd050ef          	jal	ra,80007c20 <putchar>
80002128:	000aa783          	lw	a5,0(s5)
8000212c:	0905                	addi	s2,s2,1
8000212e:	f6f96be3          	bltu	s2,a5,800020a4 <MiCo_print_tensor4d_f32+0x2a>
80002132:	40f2                	lw	ra,28(sp)
80002134:	4462                	lw	s0,24(sp)
80002136:	44d2                	lw	s1,20(sp)
80002138:	4942                	lw	s2,16(sp)
8000213a:	49b2                	lw	s3,12(sp)
8000213c:	4a22                	lw	s4,8(sp)
8000213e:	4a92                	lw	s5,4(sp)
80002140:	4b02                	lw	s6,0(sp)
80002142:	6105                	addi	sp,sp,32
80002144:	8082                	ret
80002146:	8082                	ret

80002148 <MiCo_assert>:
80002148:	c111                	beqz	a0,8000214c <MiCo_assert+0x4>
8000214a:	8082                	ret
8000214c:	1141                	addi	sp,sp,-16
8000214e:	852e                	mv	a0,a1
80002150:	c606                	sw	ra,12(sp)
80002152:	66b050ef          	jal	ra,80007fbc <puts>
80002156:	4505                	li	a0,1
80002158:	2b5050ef          	jal	ra,80007c0c <exit>

8000215c <MiCo_alloc>:
8000215c:	c521                	beqz	a0,800021a4 <MiCo_alloc+0x48>
8000215e:	1141                	addi	sp,sp,-16
80002160:	c606                	sw	ra,12(sp)
80002162:	c422                	sw	s0,8(sp)
80002164:	00b05c63          	blez	a1,8000217c <MiCo_alloc+0x20>
80002168:	fff58793          	addi	a5,a1,-1
8000216c:	8fed                	and	a5,a5,a1
8000216e:	842e                	mv	s0,a1
80002170:	c799                	beqz	a5,8000217e <MiCo_alloc+0x22>
80002172:	40b2                	lw	ra,12(sp)
80002174:	4422                	lw	s0,8(sp)
80002176:	4501                	li	a0,0
80002178:	0141                	addi	sp,sp,16
8000217a:	8082                	ret
8000217c:	4411                	li	s0,4
8000217e:	050d                	addi	a0,a0,3
80002180:	9522                	add	a0,a0,s0
80002182:	73c060ef          	jal	ra,800088be <malloc>
80002186:	872a                	mv	a4,a0
80002188:	d56d                	beqz	a0,80002172 <MiCo_alloc+0x16>
8000218a:	00340793          	addi	a5,s0,3
8000218e:	97aa                	add	a5,a5,a0
80002190:	40800433          	neg	s0,s0
80002194:	0087f533          	and	a0,a5,s0
80002198:	40b2                	lw	ra,12(sp)
8000219a:	4422                	lw	s0,8(sp)
8000219c:	fee52e23          	sw	a4,-4(a0)
800021a0:	0141                	addi	sp,sp,16
800021a2:	8082                	ret
800021a4:	4501                	li	a0,0
800021a6:	8082                	ret

800021a8 <MiCo_free>:
800021a8:	c509                	beqz	a0,800021b2 <MiCo_free+0xa>
800021aa:	ffc52503          	lw	a0,-4(a0)
800021ae:	71c0606f          	j	800088ca <free>
800021b2:	8082                	ret

800021b4 <qlog>:
800021b4:	00155793          	srli	a5,a0,0x1
800021b8:	4501                	li	a0,0
800021ba:	c789                	beqz	a5,800021c4 <qlog+0x10>
800021bc:	8385                	srli	a5,a5,0x1
800021be:	0505                	addi	a0,a0,1
800021c0:	fff5                	bnez	a5,800021bc <qlog+0x8>
800021c2:	8082                	ret
800021c4:	8082                	ret

800021c6 <MiCo_bitconv2d_f32>:
800021c6:	7129                	addi	sp,sp,-320
800021c8:	13412423          	sw	s4,296(sp)
800021cc:	8a32                	mv	s4,a2
800021ce:	12812c23          	sw	s0,312(sp)
800021d2:	4610                	lw	a2,8(a2)
800021d4:	4580                	lw	s0,8(a1)
800021d6:	12912a23          	sw	s1,308(sp)
800021da:	13312623          	sw	s3,300(sp)
800021de:	45c4                	lw	s1,12(a1)
800021e0:	00ca2983          	lw	s3,12(s4)
800021e4:	832e                	mv	t1,a1
800021e6:	d72e                	sw	a1,172(sp)
800021e8:	cab2                	sw	a2,84(sp)
800021ea:	00189593          	slli	a1,a7,0x1
800021ee:	c4a2                	sw	s0,72(sp)
800021f0:	d2c6                	sw	a7,100(sp)
800021f2:	88b2                	mv	a7,a2
800021f4:	40c40633          	sub	a2,s0,a2
800021f8:	41348433          	sub	s0,s1,s3
800021fc:	962e                	add	a2,a2,a1
800021fe:	942e                	add	s0,s0,a1
80002200:	85c2                	mv	a1,a6
80002202:	13612023          	sw	s6,288(sp)
80002206:	02b45433          	divu	s0,s0,a1
8000220a:	c6a6                	sw	s1,76(sp)
8000220c:	d0c2                	sw	a6,96(sp)
8000220e:	14412483          	lw	s1,324(sp)
80002212:	13212823          	sw	s2,304(sp)
80002216:	13512223          	sw	s5,292(sp)
8000221a:	11712e23          	sw	s7,284(sp)
8000221e:	11812c23          	sw	s8,280(sp)
80002222:	dc26                	sw	s1,56(sp)
80002224:	00432903          	lw	s2,4(t1)
80002228:	14812483          	lw	s1,328(sp)
8000222c:	12112e23          	sw	ra,316(sp)
80002230:	11912a23          	sw	s9,276(sp)
80002234:	11a12823          	sw	s10,272(sp)
80002238:	11b12623          	sw	s11,268(sp)
8000223c:	ffa2                	fsw	fs0,252(sp)
8000223e:	ceaa                	sw	a0,92(sp)
80002240:	8bbe                	mv	s7,a5
80002242:	8ab6                	mv	s5,a3
80002244:	03065b33          	divu	s6,a2,a6
80002248:	00032803          	lw	a6,0(t1)
8000224c:	4510                	lw	a2,8(a0)
8000224e:	dcc2                	sw	a6,120(sp)
80002250:	4148                	lw	a0,4(a0)
80002252:	c8ba                	sw	a4,80(sp)
80002254:	00140713          	addi	a4,s0,1
80002258:	d82a                	sw	a0,48(sp)
8000225a:	da3a                	sw	a4,52(sp)
8000225c:	4501                	li	a0,0
8000225e:	001b0793          	addi	a5,s6,1
80002262:	d03e                	sw	a5,32(sp)
80002264:	033889b3          	mul	s3,a7,s3
80002268:	02e78c33          	mul	s8,a5,a4
8000226c:	00f61763          	bne	a2,a5,8000227a <MiCo_bitconv2d_f32+0xb4>
80002270:	47f6                	lw	a5,92(sp)
80002272:	47c8                	lw	a0,12(a5)
80002274:	8d19                	sub	a0,a0,a4
80002276:	00153513          	seqz	a0,a0
8000227a:	00008597          	auipc	a1,0x8
8000227e:	51a58593          	addi	a1,a1,1306 # 8000a794 <__init_array_end+0x154>
80002282:	35d9                	jal	80002148 <MiCo_assert>
80002284:	5762                	lw	a4,56(sp)
80002286:	4501                	li	a0,0
80002288:	02e977b3          	remu	a5,s2,a4
8000228c:	e791                	bnez	a5,80002298 <MiCo_bitconv2d_f32+0xd2>
8000228e:	57c2                	lw	a5,48(sp)
80002290:	02e7f533          	remu	a0,a5,a4
80002294:	00153513          	seqz	a0,a0
80002298:	00008597          	auipc	a1,0x8
8000229c:	52058593          	addi	a1,a1,1312 # 8000a7b8 <__init_array_end+0x178>
800022a0:	3565                	jal	80002148 <MiCo_assert>
800022a2:	5762                	lw	a4,56(sp)
800022a4:	000aa783          	lw	a5,0(s5)
800022a8:	02e956b3          	divu	a3,s2,a4
800022ac:	de36                	sw	a3,60(sp)
800022ae:	56c2                	lw	a3,48(sp)
800022b0:	02e6ddb3          	divu	s11,a3,a4
800022b4:	cfb9                	beqz	a5,80002312 <MiCo_bitconv2d_f32+0x14c>
800022b6:	57e6                	lw	a5,120(sp)
800022b8:	cfad                	beqz	a5,80002332 <MiCo_bitconv2d_f32+0x16c>
800022ba:	cea5                	beqz	a3,80002332 <MiCo_bitconv2d_f32+0x16c>
800022bc:	5702                	lw	a4,32(sp)
800022be:	cb35                	beqz	a4,80002332 <MiCo_bitconv2d_f32+0x16c>
800022c0:	58d2                	lw	a7,52(sp)
800022c2:	06088863          	beqz	a7,80002332 <MiCo_bitconv2d_f32+0x16c>
800022c6:	47f6                	lw	a5,92(sp)
800022c8:	004aaf03          	lw	t5,4(s5)
800022cc:	040a                	slli	s0,s0,0x2
800022ce:	0107a803          	lw	a6,16(a5)
800022d2:	4e01                	li	t3,0
800022d4:	4301                	li	t1,0
800022d6:	00480513          	addi	a0,a6,4
800022da:	9522                	add	a0,a0,s0
800022dc:	03868fb3          	mul	t6,a3,s8
800022e0:	82f2                	mv	t0,t3
800022e2:	4e81                	li	t4,0
800022e4:	002e9693          	slli	a3,t4,0x2
800022e8:	96fa                	add	a3,a3,t5
800022ea:	8616                	mv	a2,t0
800022ec:	4581                	li	a1,0
800022ee:	00261713          	slli	a4,a2,0x2
800022f2:	00e807b3          	add	a5,a6,a4
800022f6:	972a                	add	a4,a4,a0
800022f8:	629c                	flw	fa5,0(a3)
800022fa:	0791                	addi	a5,a5,4
800022fc:	fef7ae27          	fsw	fa5,-4(a5)
80002300:	fef71ce3          	bne	a4,a5,800022f8 <MiCo_bitconv2d_f32+0x132>
80002304:	00158793          	addi	a5,a1,1
80002308:	9646                	add	a2,a2,a7
8000230a:	38bb0e63          	beq	s6,a1,800026a6 <MiCo_bitconv2d_f32+0x4e0>
8000230e:	85be                	mv	a1,a5
80002310:	bff9                	j	800022ee <MiCo_bitconv2d_f32+0x128>
80002312:	57e6                	lw	a5,120(sp)
80002314:	02d78633          	mul	a2,a5,a3
80002318:	5782                	lw	a5,32(sp)
8000231a:	02f60633          	mul	a2,a2,a5
8000231e:	57d2                	lw	a5,52(sp)
80002320:	02f60633          	mul	a2,a2,a5
80002324:	c619                	beqz	a2,80002332 <MiCo_bitconv2d_f32+0x16c>
80002326:	47f6                	lw	a5,92(sp)
80002328:	060a                	slli	a2,a2,0x2
8000232a:	4581                	li	a1,0
8000232c:	4b88                	lw	a0,16(a5)
8000232e:	373060ef          	jal	ra,80008ea0 <memset>
80002332:	57f2                	lw	a5,60(sp)
80002334:	02f98733          	mul	a4,s3,a5
80002338:	029777b3          	remu	a5,a4,s1
8000233c:	c0ba                	sw	a4,64(sp)
8000233e:	34079c63          	bnez	a5,80002696 <MiCo_bitconv2d_f32+0x4d0>
80002342:	ce3a                	sw	a4,28(sp)
80002344:	87ba                	mv	a5,a4
80002346:	54d2                	lw	s1,52(sp)
80002348:	00149413          	slli	s0,s1,0x1
8000234c:	02878533          	mul	a0,a5,s0
80002350:	d622                	sw	s0,44(sp)
80002352:	028d89b3          	mul	s3,s11,s0
80002356:	050a                	slli	a0,a0,0x2
80002358:	dace                	sw	s3,116(sp)
8000235a:	564060ef          	jal	ra,800088be <malloc>
8000235e:	d22a                	sw	a0,36(sp)
80002360:	00299513          	slli	a0,s3,0x2
80002364:	55a060ef          	jal	ra,800088be <malloc>
80002368:	47a1                	li	a5,8
8000236a:	0377c733          	div	a4,a5,s7
8000236e:	47f2                	lw	a5,28(sp)
80002370:	8d2a                	mv	s10,a0
80002372:	6521                	lui	a0,0x8
80002374:	00008597          	auipc	a1,0x8
80002378:	5fc58593          	addi	a1,a1,1532 # 8000a970 <__init_array_end+0x330>
8000237c:	028787b3          	mul	a5,a5,s0
80002380:	02e7d7b3          	divu	a5,a5,a4
80002384:	00a7b533          	sltu	a0,a5,a0
80002388:	33c1                	jal	80002148 <MiCo_assert>
8000238a:	5766                	lw	a4,120(sp)
8000238c:	28070263          	beqz	a4,80002610 <MiCo_bitconv2d_f32+0x44a>
80002390:	4726                	lw	a4,72(sp)
80002392:	46b6                	lw	a3,76(sp)
80002394:	02d707b3          	mul	a5,a4,a3
80002398:	5762                	lw	a4,56(sp)
8000239a:	26070b63          	beqz	a4,80002610 <MiCo_bitconv2d_f32+0x44a>
8000239e:	5702                	lw	a4,32(sp)
800023a0:	26070863          	beqz	a4,80002610 <MiCo_bitconv2d_f32+0x44a>
800023a4:	003b0713          	addi	a4,s6,3
800023a8:	deba                	sw	a4,124(sp)
800023aa:	5772                	lw	a4,60(sp)
800023ac:	03278933          	mul	s2,a5,s2
800023b0:	4546                	lw	a0,80(sp)
800023b2:	c102                	sw	zero,128(sp)
800023b4:	c302                	sw	zero,132(sp)
800023b6:	c902                	sw	zero,144(sp)
800023b8:	002c1993          	slli	s3,s8,0x2
800023bc:	8b52                	mv	s6,s4
800023be:	00009c97          	auipc	s9,0x9
800023c2:	43ac8c93          	addi	s9,s9,1082 # 8000b7f8 <IM2COL_TIMER>
800023c6:	00009a97          	auipc	s5,0x9
800023ca:	436a8a93          	addi	s5,s5,1078 # 8000b7fc <QUANT_TIMER>
800023ce:	8a4e                	mv	s4,s3
800023d0:	02e787b3          	mul	a5,a5,a4
800023d4:	00291713          	slli	a4,s2,0x2
800023d8:	d13a                	sw	a4,160(sp)
800023da:	00279713          	slli	a4,a5,0x2
800023de:	d53a                	sw	a4,168(sp)
800023e0:	3bd1                	jal	800021b4 <qlog>
800023e2:	842a                	mv	s0,a0
800023e4:	855e                	mv	a0,s7
800023e6:	33f9                	jal	800021b4 <qlog>
800023e8:	03b48733          	mul	a4,s1,s11
800023ec:	040a                	slli	s0,s0,0x2
800023ee:	409006b3          	neg	a3,s1
800023f2:	0686                	slli	a3,a3,0x1
800023f4:	942a                	add	s0,s0,a0
800023f6:	00241793          	slli	a5,s0,0x2
800023fa:	d4b6                	sw	a3,104(sp)
800023fc:	00008697          	auipc	a3,0x8
80002400:	5c468693          	addi	a3,a3,1476 # 8000a9c0 <MiCo_QMatMul>
80002404:	96be                	add	a3,a3,a5
80002406:	d8b6                	sw	a3,112(sp)
80002408:	40e007b3          	neg	a5,a4
8000240c:	5742                	lw	a4,48(sp)
8000240e:	03870733          	mul	a4,a4,s8
80002412:	cf3a                	sw	a4,156(sp)
80002414:	00179713          	slli	a4,a5,0x1
80002418:	47f2                	lw	a5,28(sp)
8000241a:	d6ba                	sw	a4,108(sp)
8000241c:	03b787b3          	mul	a5,a5,s11
80002420:	d33e                	sw	a5,164(sp)
80002422:	03bc07b3          	mul	a5,s8,s11
80002426:	cd3e                	sw	a5,152(sp)
80002428:	87de                	mv	a5,s7
8000242a:	8be2                	mv	s7,s8
8000242c:	8c3e                	mv	s8,a5
8000242e:	478a                	lw	a5,128(sp)
80002430:	c282                	sw	zero,68(sp)
80002432:	cb02                	sw	zero,148(sp)
80002434:	c53e                	sw	a5,136(sp)
80002436:	479a                	lw	a5,132(sp)
80002438:	c73e                	sw	a5,140(sp)
8000243a:	476a                	lw	a4,152(sp)
8000243c:	57ba                	lw	a5,172(sp)
8000243e:	492a                	lw	s2,136(sp)
80002440:	ca3a                	sw	a4,20(sp)
80002442:	4b9c                	lw	a5,16(a5)
80002444:	473a                	lw	a4,140(sp)
80002446:	cc5e                	sw	s7,24(sp)
80002448:	4401                	li	s0,0
8000244a:	97ba                	add	a5,a5,a4
8000244c:	ccbe                	sw	a5,88(sp)
8000244e:	5782                	lw	a5,32(sp)
80002450:	84a2                	mv	s1,s0
80002452:	0409                	addi	s0,s0,2
80002454:	2087e863          	bltu	a5,s0,80002664 <MiCo_bitconv2d_f32+0x49e>
80002458:	57d6                	lw	a5,116(sp)
8000245a:	59b2                	lw	s3,44(sp)
8000245c:	c83e                	sw	a5,16(sp)
8000245e:	4789                	li	a5,2
80002460:	d43e                	sw	a5,40(sp)
80002462:	778050ef          	jal	ra,80007bda <MiCo_time>
80002466:	5352                	lw	t1,52(sp)
80002468:	8e2a                	mv	t3,a0
8000246a:	5892                	lw	a7,36(sp)
8000246c:	c41a                	sw	t1,8(sp)
8000246e:	5322                	lw	t1,40(sp)
80002470:	5816                	lw	a6,100(sp)
80002472:	4756                	lw	a4,84(sp)
80002474:	46b6                	lw	a3,76(sp)
80002476:	4626                	lw	a2,72(sp)
80002478:	55f2                	lw	a1,60(sp)
8000247a:	5786                	lw	a5,96(sp)
8000247c:	4566                	lw	a0,88(sp)
8000247e:	c21a                	sw	t1,4(sp)
80002480:	c026                	sw	s1,0(sp)
80002482:	84f2                	mv	s1,t3
80002484:	875fe0ef          	jal	ra,80000cf8 <im2col_block_T>
80002488:	5792                	lw	a5,36(sp)
8000248a:	df4e                	sw	s3,188(sp)
8000248c:	c5ce                	sw	s3,200(sp)
8000248e:	c3be                	sw	a5,196(sp)
80002490:	4786                	lw	a5,64(sp)
80002492:	cb82                	sw	zero,212(sp)
80002494:	c1be                	sw	a5,192(sp)
80002496:	00009797          	auipc	a5,0x9
8000249a:	38a78793          	addi	a5,a5,906 # 8000b820 <MiCo_QBuffer>
8000249e:	c9be                	sw	a5,208(sp)
800024a0:	47f2                	lw	a5,28(sp)
800024a2:	c7be                	sw	a5,204(sp)
800024a4:	736050ef          	jal	ra,80007bda <MiCo_time>
800024a8:	000ca783          	lw	a5,0(s9)
800024ac:	8d05                	sub	a0,a0,s1
800024ae:	97aa                	add	a5,a5,a0
800024b0:	00fca023          	sw	a5,0(s9)
800024b4:	726050ef          	jal	ra,80007bda <MiCo_time>
800024b8:	4791                	li	a5,4
800024ba:	84aa                	mv	s1,a0
800024bc:	1afc0b63          	beq	s8,a5,80002672 <MiCo_bitconv2d_f32+0x4ac>
800024c0:	1987ea63          	bltu	a5,s8,80002654 <MiCo_bitconv2d_f32+0x48e>
800024c4:	4785                	li	a5,1
800024c6:	1cfc0363          	beq	s8,a5,8000268c <MiCo_bitconv2d_f32+0x4c6>
800024ca:	4789                	li	a5,2
800024cc:	1afc1863          	bne	s8,a5,8000267c <MiCo_bitconv2d_f32+0x4b6>
800024d0:	196c                	addi	a1,sp,188
800024d2:	01a8                	addi	a0,sp,200
800024d4:	638020ef          	jal	ra,80004b0c <MiCo_2D_FP32toQ2>
800024d8:	702050ef          	jal	ra,80007bda <MiCo_time>
800024dc:	4746                	lw	a4,80(sp)
800024de:	47a1                	li	a5,8
800024e0:	000aa683          	lw	a3,0(s5)
800024e4:	02e7c7b3          	div	a5,a5,a4
800024e8:	409504b3          	sub	s1,a0,s1
800024ec:	96a6                	add	a3,a3,s1
800024ee:	00daa023          	sw	a3,0(s5)
800024f2:	46f2                	lw	a3,28(sp)
800024f4:	010b2703          	lw	a4,16(s6)
800024f8:	014b2787          	flw	fa5,20(s6)
800024fc:	d1b6                	sw	a3,224(sp)
800024fe:	4696                	lw	a3,68(sp)
80002500:	cfee                	sw	s11,220(sp)
80002502:	f5be                	fsw	fa5,232(sp)
80002504:	02f6d7b3          	divu	a5,a3,a5
80002508:	97ba                	add	a5,a5,a4
8000250a:	d3be                	sw	a5,228(sp)
8000250c:	47c2                	lw	a5,16(sp)
8000250e:	c799                	beqz	a5,8000251c <MiCo_bitconv2d_f32+0x356>
80002510:	00279613          	slli	a2,a5,0x2
80002514:	4581                	li	a1,0
80002516:	856a                	mv	a0,s10
80002518:	189060ef          	jal	ra,80008ea0 <memset>
8000251c:	6be050ef          	jal	ra,80007bda <MiCo_time>
80002520:	57c6                	lw	a5,112(sp)
80002522:	84aa                	mv	s1,a0
80002524:	01b0                	addi	a2,sp,200
80002526:	439c                	lw	a5,0(a5)
80002528:	09ec                	addi	a1,sp,220
8000252a:	856a                	mv	a0,s10
8000252c:	9782                	jalr	a5
8000252e:	6ac050ef          	jal	ra,80007bda <MiCo_time>
80002532:	00009717          	auipc	a4,0x9
80002536:	2ce70713          	addi	a4,a4,718 # 8000b800 <QMATMUL_TIMER>
8000253a:	431c                	lw	a5,0(a4)
8000253c:	014b2407          	flw	fs0,20(s6)
80002540:	67de                	flw	fa5,212(sp)
80002542:	8d05                	sub	a0,a0,s1
80002544:	97aa                	add	a5,a5,a0
80002546:	c31c                	sw	a5,0(a4)
80002548:	10f47453          	fmul.s	fs0,fs0,fa5
8000254c:	68e050ef          	jal	ra,80007bda <MiCo_time>
80002550:	57c2                	lw	a5,48(sp)
80002552:	5762                	lw	a4,56(sp)
80002554:	84aa                	mv	s1,a0
80002556:	04e7e763          	bltu	a5,a4,800025a4 <MiCo_bitconv2d_f32+0x3de>
8000255a:	04098563          	beqz	s3,800025a4 <MiCo_bitconv2d_f32+0x3de>
8000255e:	47f6                	lw	a5,92(sp)
80002560:	012985b3          	add	a1,s3,s2
80002564:	058a                	slli	a1,a1,0x2
80002566:	0107ae03          	lw	t3,16(a5)
8000256a:	854a                	mv	a0,s2
8000256c:	4881                	li	a7,0
8000256e:	4801                	li	a6,0
80002570:	00251793          	slli	a5,a0,0x2
80002574:	00289713          	slli	a4,a7,0x2
80002578:	97f2                	add	a5,a5,t3
8000257a:	976a                	add	a4,a4,s10
8000257c:	00be0633          	add	a2,t3,a1
80002580:	4314                	lw	a3,0(a4)
80002582:	6398                	flw	fa4,0(a5)
80002584:	0791                	addi	a5,a5,4
80002586:	d006f7d3          	fcvt.s.w	fa5,a3
8000258a:	0711                	addi	a4,a4,4
8000258c:	7087f7c3          	fmadd.s	fa5,fa5,fs0,fa4
80002590:	fef7ae27          	fsw	fa5,-4(a5)
80002594:	fec796e3          	bne	a5,a2,80002580 <MiCo_bitconv2d_f32+0x3ba>
80002598:	0805                	addi	a6,a6,1
8000259a:	95d2                	add	a1,a1,s4
8000259c:	98ce                	add	a7,a7,s3
8000259e:	955e                	add	a0,a0,s7
800025a0:	fdb868e3          	bltu	a6,s11,80002570 <MiCo_bitconv2d_f32+0x3aa>
800025a4:	636050ef          	jal	ra,80007bda <MiCo_time>
800025a8:	000aa783          	lw	a5,0(s5)
800025ac:	5732                	lw	a4,44(sp)
800025ae:	409504b3          	sub	s1,a0,s1
800025b2:	97a6                	add	a5,a5,s1
800025b4:	993a                	add	s2,s2,a4
800025b6:	00faa023          	sw	a5,0(s5)
800025ba:	5726                	lw	a4,104(sp)
800025bc:	47e2                	lw	a5,24(sp)
800025be:	97ba                	add	a5,a5,a4
800025c0:	cc3e                	sw	a5,24(sp)
800025c2:	5736                	lw	a4,108(sp)
800025c4:	47d2                	lw	a5,20(sp)
800025c6:	97ba                	add	a5,a5,a4
800025c8:	ca3e                	sw	a5,20(sp)
800025ca:	5782                	lw	a5,32(sp)
800025cc:	e8f461e3          	bltu	s0,a5,8000244e <MiCo_bitconv2d_f32+0x288>
800025d0:	473a                	lw	a4,140(sp)
800025d2:	56aa                	lw	a3,168(sp)
800025d4:	47da                	lw	a5,148(sp)
800025d6:	9736                	add	a4,a4,a3
800025d8:	c73a                	sw	a4,140(sp)
800025da:	569a                	lw	a3,164(sp)
800025dc:	4716                	lw	a4,68(sp)
800025de:	0785                	addi	a5,a5,1
800025e0:	cb3e                	sw	a5,148(sp)
800025e2:	9736                	add	a4,a4,a3
800025e4:	c2ba                	sw	a4,68(sp)
800025e6:	46ea                	lw	a3,152(sp)
800025e8:	472a                	lw	a4,136(sp)
800025ea:	9736                	add	a4,a4,a3
800025ec:	c53a                	sw	a4,136(sp)
800025ee:	5762                	lw	a4,56(sp)
800025f0:	e4f715e3          	bne	a4,a5,8000243a <MiCo_bitconv2d_f32+0x274>
800025f4:	471a                	lw	a4,132(sp)
800025f6:	568a                	lw	a3,160(sp)
800025f8:	47ca                	lw	a5,144(sp)
800025fa:	9736                	add	a4,a4,a3
800025fc:	c33a                	sw	a4,132(sp)
800025fe:	46fa                	lw	a3,156(sp)
80002600:	470a                	lw	a4,128(sp)
80002602:	0785                	addi	a5,a5,1
80002604:	c93e                	sw	a5,144(sp)
80002606:	9736                	add	a4,a4,a3
80002608:	c13a                	sw	a4,128(sp)
8000260a:	5766                	lw	a4,120(sp)
8000260c:	e2f711e3          	bne	a4,a5,8000242e <MiCo_bitconv2d_f32+0x268>
80002610:	856a                	mv	a0,s10
80002612:	2b8060ef          	jal	ra,800088ca <free>
80002616:	13812403          	lw	s0,312(sp)
8000261a:	5512                	lw	a0,36(sp)
8000261c:	13c12083          	lw	ra,316(sp)
80002620:	13412483          	lw	s1,308(sp)
80002624:	13012903          	lw	s2,304(sp)
80002628:	12c12983          	lw	s3,300(sp)
8000262c:	12812a03          	lw	s4,296(sp)
80002630:	12412a83          	lw	s5,292(sp)
80002634:	12012b03          	lw	s6,288(sp)
80002638:	11c12b83          	lw	s7,284(sp)
8000263c:	11812c03          	lw	s8,280(sp)
80002640:	11412c83          	lw	s9,276(sp)
80002644:	11012d03          	lw	s10,272(sp)
80002648:	10c12d83          	lw	s11,268(sp)
8000264c:	747e                	flw	fs0,252(sp)
8000264e:	6131                	addi	sp,sp,320
80002650:	27a0606f          	j	800088ca <free>
80002654:	47a1                	li	a5,8
80002656:	02fc1363          	bne	s8,a5,8000267c <MiCo_bitconv2d_f32+0x4b6>
8000265a:	196c                	addi	a1,sp,188
8000265c:	01a8                	addi	a0,sp,200
8000265e:	266020ef          	jal	ra,800048c4 <MiCo_2D_FP32toQ8>
80002662:	bd9d                	j	800024d8 <MiCo_bitconv2d_f32+0x312>
80002664:	57f6                	lw	a5,124(sp)
80002666:	49e2                	lw	s3,24(sp)
80002668:	8f81                	sub	a5,a5,s0
8000266a:	d43e                	sw	a5,40(sp)
8000266c:	47d2                	lw	a5,20(sp)
8000266e:	c83e                	sw	a5,16(sp)
80002670:	bbcd                	j	80002462 <MiCo_bitconv2d_f32+0x29c>
80002672:	196c                	addi	a1,sp,188
80002674:	01a8                	addi	a0,sp,200
80002676:	34e020ef          	jal	ra,800049c4 <MiCo_2D_FP32toQ4>
8000267a:	bdb9                	j	800024d8 <MiCo_bitconv2d_f32+0x312>
8000267c:	85e2                	mv	a1,s8
8000267e:	00008517          	auipc	a0,0x8
80002682:	31250513          	addi	a0,a0,786 # 8000a990 <__init_array_end+0x350>
80002686:	678050ef          	jal	ra,80007cfe <printf>
8000268a:	b5b9                	j	800024d8 <MiCo_bitconv2d_f32+0x312>
8000268c:	196c                	addi	a1,sp,188
8000268e:	01a8                	addi	a0,sp,200
80002690:	668020ef          	jal	ra,80004cf8 <MiCo_2D_FP32toQ1>
80002694:	b591                	j	800024d8 <MiCo_bitconv2d_f32+0x312>
80002696:	029757b3          	divu	a5,a4,s1
8000269a:	0785                	addi	a5,a5,1
8000269c:	029787b3          	mul	a5,a5,s1
800026a0:	ce3e                	sw	a5,28(sp)
800026a2:	87ba                	mv	a5,a4
800026a4:	b14d                	j	80002346 <MiCo_bitconv2d_f32+0x180>
800026a6:	57c2                	lw	a5,48(sp)
800026a8:	0e85                	addi	t4,t4,1
800026aa:	92e2                	add	t0,t0,s8
800026ac:	c3d79ce3          	bne	a5,t4,800022e4 <MiCo_bitconv2d_f32+0x11e>
800026b0:	57e6                	lw	a5,120(sp)
800026b2:	0305                	addi	t1,t1,1
800026b4:	9e7e                	add	t3,t3,t6
800026b6:	c26795e3          	bne	a5,t1,800022e0 <MiCo_bitconv2d_f32+0x11a>
800026ba:	b9a5                	j	80002332 <MiCo_bitconv2d_f32+0x16c>

800026bc <qlog>:
800026bc:	00155793          	srli	a5,a0,0x1
800026c0:	4501                	li	a0,0
800026c2:	c789                	beqz	a5,800026cc <qlog+0x10>
800026c4:	8385                	srli	a5,a5,0x1
800026c6:	0505                	addi	a0,a0,1
800026c8:	fff5                	bnez	a5,800026c4 <qlog+0x8>
800026ca:	8082                	ret
800026cc:	8082                	ret

800026ce <MiCo_bitconv2d_f32_plain>:
800026ce:	7151                	addi	sp,sp,-240
800026d0:	c5e2                	sw	s8,200(sp)
800026d2:	8c32                	mv	s8,a2
800026d4:	00c5ae03          	lw	t3,12(a1)
800026d8:	4610                	lw	a2,8(a2)
800026da:	00cc2303          	lw	t1,12(s8)
800026de:	d5a2                	sw	s0,232(sp)
800026e0:	4580                	lw	s0,8(a1)
800026e2:	d3a6                	sw	s1,228(sp)
800026e4:	c2ae                	sw	a1,68(sp)
800026e6:	84ae                	mv	s1,a1
800026e8:	da32                	sw	a2,52(sp)
800026ea:	00189593          	slli	a1,a7,0x1
800026ee:	d422                	sw	s0,40(sp)
800026f0:	c6c6                	sw	a7,76(sp)
800026f2:	88b2                	mv	a7,a2
800026f4:	40c40633          	sub	a2,s0,a2
800026f8:	406e0433          	sub	s0,t3,t1
800026fc:	962e                	add	a2,a2,a1
800026fe:	942e                	add	s0,s0,a1
80002700:	85c2                	mv	a1,a6
80002702:	02b45433          	divu	s0,s0,a1
80002706:	cdd2                	sw	s4,216(sp)
80002708:	c4c2                	sw	a6,72(sp)
8000270a:	d1ca                	sw	s2,224(sp)
8000270c:	cfce                	sw	s3,220(sp)
8000270e:	cbd6                	sw	s5,212(sp)
80002710:	c9da                	sw	s6,208(sp)
80002712:	c7de                	sw	s7,204(sp)
80002714:	c3e6                	sw	s9,196(sp)
80002716:	c1ea                	sw	s10,192(sp)
80002718:	df6e                	sw	s11,188(sp)
8000271a:	c0aa                	sw	a0,64(sp)
8000271c:	d786                	sw	ra,236(sp)
8000271e:	f722                	fsw	fs0,172(sp)
80002720:	d672                	sw	t3,44(sp)
80002722:	0044a983          	lw	s3,4(s1)
80002726:	00452b83          	lw	s7,4(a0)
8000272a:	8936                	mv	s2,a3
8000272c:	8aba                	mv	s5,a4
8000272e:	03065a33          	divu	s4,a2,a6
80002732:	585e                	lw	a6,244(sp)
80002734:	4510                	lw	a2,8(a0)
80002736:	00140b13          	addi	s6,s0,1
8000273a:	ce42                	sw	a6,28(sp)
8000273c:	0004a803          	lw	a6,0(s1)
80002740:	4501                	li	a0,0
80002742:	84be                	mv	s1,a5
80002744:	d0c2                	sw	a6,96(sp)
80002746:	001a0d13          	addi	s10,s4,1
8000274a:	02688db3          	mul	s11,a7,t1
8000274e:	036d0cb3          	mul	s9,s10,s6
80002752:	01a61863          	bne	a2,s10,80002762 <MiCo_bitconv2d_f32_plain+0x94>
80002756:	4786                	lw	a5,64(sp)
80002758:	47c8                	lw	a0,12(a5)
8000275a:	41650533          	sub	a0,a0,s6
8000275e:	00153513          	seqz	a0,a0
80002762:	00008597          	auipc	a1,0x8
80002766:	03258593          	addi	a1,a1,50 # 8000a794 <__init_array_end+0x154>
8000276a:	3af9                	jal	80002148 <MiCo_assert>
8000276c:	4772                	lw	a4,28(sp)
8000276e:	4501                	li	a0,0
80002770:	02e9f7b3          	remu	a5,s3,a4
80002774:	e789                	bnez	a5,8000277e <MiCo_bitconv2d_f32_plain+0xb0>
80002776:	02ebf533          	remu	a0,s7,a4
8000277a:	00153513          	seqz	a0,a0
8000277e:	00008597          	auipc	a1,0x8
80002782:	03a58593          	addi	a1,a1,58 # 8000a7b8 <__init_array_end+0x178>
80002786:	32c9                	jal	80002148 <MiCo_assert>
80002788:	46f2                	lw	a3,28(sp)
8000278a:	00092783          	lw	a5,0(s2)
8000278e:	02d9d733          	divu	a4,s3,a3
80002792:	02dbd6b3          	divu	a3,s7,a3
80002796:	d23a                	sw	a4,36(sp)
80002798:	c436                	sw	a3,8(sp)
8000279a:	c7bd                	beqz	a5,80002808 <MiCo_bitconv2d_f32_plain+0x13a>
8000279c:	02dc87b3          	mul	a5,s9,a3
800027a0:	c63e                	sw	a5,12(sp)
800027a2:	078a                	slli	a5,a5,0x2
800027a4:	d83e                	sw	a5,48(sp)
800027a6:	5786                	lw	a5,96(sp)
800027a8:	02ed8db3          	mul	s11,s11,a4
800027ac:	36078d63          	beqz	a5,80002b26 <MiCo_bitconv2d_f32_plain+0x458>
800027b0:	340b8563          	beqz	s7,80002afa <MiCo_bitconv2d_f32_plain+0x42c>
800027b4:	340d0363          	beqz	s10,80002afa <MiCo_bitconv2d_f32_plain+0x42c>
800027b8:	340b0163          	beqz	s6,80002afa <MiCo_bitconv2d_f32_plain+0x42c>
800027bc:	4786                	lw	a5,64(sp)
800027be:	00492e03          	lw	t3,4(s2)
800027c2:	040a                	slli	s0,s0,0x2
800027c4:	0107a803          	lw	a6,16(a5)
800027c8:	039b8fb3          	mul	t6,s7,s9
800027cc:	4f01                	li	t5,0
800027ce:	00480513          	addi	a0,a6,4
800027d2:	4e81                	li	t4,0
800027d4:	9522                	add	a0,a0,s0
800027d6:	837a                	mv	t1,t5
800027d8:	4881                	li	a7,0
800027da:	00289693          	slli	a3,a7,0x2
800027de:	96f2                	add	a3,a3,t3
800027e0:	861a                	mv	a2,t1
800027e2:	4581                	li	a1,0
800027e4:	00261713          	slli	a4,a2,0x2
800027e8:	00e807b3          	add	a5,a6,a4
800027ec:	972a                	add	a4,a4,a0
800027ee:	629c                	flw	fa5,0(a3)
800027f0:	0791                	addi	a5,a5,4
800027f2:	fef7ae27          	fsw	fa5,-4(a5)
800027f6:	fef71ce3          	bne	a4,a5,800027ee <MiCo_bitconv2d_f32_plain+0x120>
800027fa:	00158793          	addi	a5,a1,1
800027fe:	965a                	add	a2,a2,s6
80002800:	2eba0463          	beq	s4,a1,80002ae8 <MiCo_bitconv2d_f32_plain+0x41a>
80002804:	85be                	mv	a1,a5
80002806:	bff9                	j	800027e4 <MiCo_bitconv2d_f32_plain+0x116>
80002808:	5786                	lw	a5,96(sp)
8000280a:	03778633          	mul	a2,a5,s7
8000280e:	03a60633          	mul	a2,a2,s10
80002812:	03660633          	mul	a2,a2,s6
80002816:	c619                	beqz	a2,80002824 <MiCo_bitconv2d_f32_plain+0x156>
80002818:	4786                	lw	a5,64(sp)
8000281a:	060a                	slli	a2,a2,0x2
8000281c:	4581                	li	a1,0
8000281e:	4b88                	lw	a0,16(a5)
80002820:	680060ef          	jal	ra,80008ea0 <memset>
80002824:	5792                	lw	a5,36(sp)
80002826:	02fd8db3          	mul	s11,s11,a5
8000282a:	47a2                	lw	a5,8(sp)
8000282c:	039d8433          	mul	s0,s11,s9
80002830:	02fc8933          	mul	s2,s9,a5
80002834:	00241513          	slli	a0,s0,0x2
80002838:	caa2                	sw	s0,84(sp)
8000283a:	c64a                	sw	s2,12(sp)
8000283c:	082060ef          	jal	ra,800088be <malloc>
80002840:	00291793          	slli	a5,s2,0x2
80002844:	ca2a                	sw	a0,20(sp)
80002846:	853e                	mv	a0,a5
80002848:	d83e                	sw	a5,48(sp)
8000284a:	074060ef          	jal	ra,800088be <malloc>
8000284e:	47a1                	li	a5,8
80002850:	0297c7b3          	div	a5,a5,s1
80002854:	8a2a                	mv	s4,a0
80002856:	02f45533          	divu	a0,s0,a5
8000285a:	064060ef          	jal	ra,800088be <malloc>
8000285e:	5786                	lw	a5,96(sp)
80002860:	cc2a                	sw	a0,24(sp)
80002862:	1c078763          	beqz	a5,80002a30 <MiCo_bitconv2d_f32_plain+0x362>
80002866:	57a2                	lw	a5,40(sp)
80002868:	5732                	lw	a4,44(sp)
8000286a:	02e78b33          	mul	s6,a5,a4
8000286e:	47f2                	lw	a5,28(sp)
80002870:	1c078063          	beqz	a5,80002a30 <MiCo_bitconv2d_f32_plain+0x362>
80002874:	57c2                	lw	a5,48(sp)
80002876:	8556                	mv	a0,s5
80002878:	cc82                	sw	zero,88(sp)
8000287a:	00fa0433          	add	s0,s4,a5
8000287e:	ce82                	sw	zero,92(sp)
80002880:	036989b3          	mul	s3,s3,s6
80002884:	d282                	sw	zero,100(sp)
80002886:	00009917          	auipc	s2,0x9
8000288a:	f7690913          	addi	s2,s2,-138 # 8000b7fc <QUANT_TIMER>
8000288e:	00009d17          	auipc	s10,0x9
80002892:	f72d0d13          	addi	s10,s10,-142 # 8000b800 <QMATMUL_TIMER>
80002896:	00299793          	slli	a5,s3,0x2
8000289a:	d6be                	sw	a5,108(sp)
8000289c:	3505                	jal	800026bc <qlog>
8000289e:	89aa                	mv	s3,a0
800028a0:	8526                	mv	a0,s1
800028a2:	3d29                	jal	800026bc <qlog>
800028a4:	5792                	lw	a5,36(sp)
800028a6:	098a                	slli	s3,s3,0x2
800028a8:	99aa                	add	s3,s3,a0
800028aa:	03678b33          	mul	s6,a5,s6
800028ae:	00008717          	auipc	a4,0x8
800028b2:	17670713          	addi	a4,a4,374 # 8000aa24 <MiCo_QMatMul>
800028b6:	00299793          	slli	a5,s3,0x2
800028ba:	97ba                	add	a5,a5,a4
800028bc:	c8be                	sw	a5,80(sp)
800028be:	d066                	sw	s9,32(sp)
800028c0:	039b87b3          	mul	a5,s7,s9
800028c4:	d4be                	sw	a5,104(sp)
800028c6:	002b1793          	slli	a5,s6,0x2
800028ca:	dc3e                	sw	a5,56(sp)
800028cc:	47a2                	lw	a5,8(sp)
800028ce:	03b787b3          	mul	a5,a5,s11
800028d2:	de3e                	sw	a5,60(sp)
800028d4:	4ce6                	lw	s9,88(sp)
800028d6:	4bf6                	lw	s7,92(sp)
800028d8:	4b01                	li	s6,0
800028da:	4a81                	li	s5,0
800028dc:	4796                	lw	a5,68(sp)
800028de:	0107a303          	lw	t1,16(a5)
800028e2:	935e                	add	t1,t1,s7
800028e4:	c81a                	sw	t1,16(sp)
800028e6:	2f4050ef          	jal	ra,80007bda <MiCo_time>
800028ea:	4342                	lw	t1,16(sp)
800028ec:	48d2                	lw	a7,20(sp)
800028ee:	4836                	lw	a6,76(sp)
800028f0:	47a6                	lw	a5,72(sp)
800028f2:	5752                	lw	a4,52(sp)
800028f4:	56b2                	lw	a3,44(sp)
800028f6:	5622                	lw	a2,40(sp)
800028f8:	5592                	lw	a1,36(sp)
800028fa:	89aa                	mv	s3,a0
800028fc:	851a                	mv	a0,t1
800028fe:	b04fe0ef          	jal	ra,80000c02 <im2col_T>
80002902:	2d8050ef          	jal	ra,80007bda <MiCo_time>
80002906:	00009717          	auipc	a4,0x9
8000290a:	ef270713          	addi	a4,a4,-270 # 8000b7f8 <IM2COL_TIMER>
8000290e:	431c                	lw	a5,0(a4)
80002910:	41350533          	sub	a0,a0,s3
80002914:	97aa                	add	a5,a5,a0
80002916:	c31c                	sw	a5,0(a4)
80002918:	2c2050ef          	jal	ra,80007bda <MiCo_time>
8000291c:	4791                	li	a5,4
8000291e:	89aa                	mv	s3,a0
80002920:	16f48563          	beq	s1,a5,80002a8a <MiCo_bitconv2d_f32_plain+0x3bc>
80002924:	1297ee63          	bltu	a5,s1,80002a60 <MiCo_bitconv2d_f32_plain+0x392>
80002928:	4785                	li	a5,1
8000292a:	16f48863          	beq	s1,a5,80002a9a <MiCo_bitconv2d_f32_plain+0x3cc>
8000292e:	4789                	li	a5,2
80002930:	14f49363          	bne	s1,a5,80002a76 <MiCo_bitconv2d_f32_plain+0x3a8>
80002934:	4656                	lw	a2,84(sp)
80002936:	45d2                	lw	a1,20(sp)
80002938:	4562                	lw	a0,24(sp)
8000293a:	5a9010ef          	jal	ra,800046e2 <__FP32toQ2>
8000293e:	20a50453          	fmv.s	fs0,fa0
80002942:	298050ef          	jal	ra,80007bda <MiCo_time>
80002946:	00092703          	lw	a4,0(s2)
8000294a:	413509b3          	sub	s3,a0,s3
8000294e:	010c2783          	lw	a5,16(s8)
80002952:	974e                	add	a4,a4,s3
80002954:	00e92023          	sw	a4,0(s2)
80002958:	4762                	lw	a4,24(sp)
8000295a:	97da                	add	a5,a5,s6
8000295c:	014c2787          	flw	fa5,20(s8)
80002960:	5982                	lw	s3,32(sp)
80002962:	cb3e                	sw	a5,148(sp)
80002964:	47a2                	lw	a5,8(sp)
80002966:	c13a                	sw	a4,128(sp)
80002968:	4732                	lw	a4,12(sp)
8000296a:	dcce                	sw	s3,120(sp)
8000296c:	deee                	sw	s11,124(sp)
8000296e:	e322                	fsw	fs0,132(sp)
80002970:	c73e                	sw	a5,140(sp)
80002972:	c96e                	sw	s11,144(sp)
80002974:	ed3e                	fsw	fa5,152(sp)
80002976:	12070a63          	beqz	a4,80002aaa <MiCo_bitconv2d_f32_plain+0x3dc>
8000297a:	5642                	lw	a2,48(sp)
8000297c:	4581                	li	a1,0
8000297e:	8552                	mv	a0,s4
80002980:	520060ef          	jal	ra,80008ea0 <memset>
80002984:	45a2                	lw	a1,8(sp)
80002986:	86ce                	mv	a3,s3
80002988:	866e                	mv	a2,s11
8000298a:	00008517          	auipc	a0,0x8
8000298e:	07650513          	addi	a0,a0,118 # 8000aa00 <MiCo_QMatMul+0x40>
80002992:	36c050ef          	jal	ra,80007cfe <printf>
80002996:	244050ef          	jal	ra,80007bda <MiCo_time>
8000299a:	47c6                	lw	a5,80(sp)
8000299c:	89aa                	mv	s3,a0
8000299e:	18b0                	addi	a2,sp,120
800029a0:	4398                	lw	a4,0(a5)
800029a2:	016c                	addi	a1,sp,140
800029a4:	8552                	mv	a0,s4
800029a6:	9702                	jalr	a4
800029a8:	232050ef          	jal	ra,80007bda <MiCo_time>
800029ac:	000d2703          	lw	a4,0(s10)
800029b0:	014c2787          	flw	fa5,20(s8)
800029b4:	641a                	flw	fs0,132(sp)
800029b6:	413507b3          	sub	a5,a0,s3
800029ba:	97ba                	add	a5,a5,a4
800029bc:	00fd2023          	sw	a5,0(s10)
800029c0:	10f47453          	fmul.s	fs0,fs0,fa5
800029c4:	216050ef          	jal	ra,80007bda <MiCo_time>
800029c8:	4786                	lw	a5,64(sp)
800029ca:	89aa                	mv	s3,a0
800029cc:	4b98                	lw	a4,16(a5)
800029ce:	002c9793          	slli	a5,s9,0x2
800029d2:	97ba                	add	a5,a5,a4
800029d4:	8752                	mv	a4,s4
800029d6:	4314                	lw	a3,0(a4)
800029d8:	6398                	flw	fa4,0(a5)
800029da:	0791                	addi	a5,a5,4
800029dc:	d006f7d3          	fcvt.s.w	fa5,a3
800029e0:	0711                	addi	a4,a4,4
800029e2:	7087f7c3          	fmadd.s	fa5,fa5,fs0,fa4
800029e6:	fef7ae27          	fsw	fa5,-4(a5)
800029ea:	fee416e3          	bne	s0,a4,800029d6 <MiCo_bitconv2d_f32_plain+0x308>
800029ee:	1ec050ef          	jal	ra,80007bda <MiCo_time>
800029f2:	00092783          	lw	a5,0(s2)
800029f6:	413509b3          	sub	s3,a0,s3
800029fa:	0a85                	addi	s5,s5,1
800029fc:	97ce                	add	a5,a5,s3
800029fe:	00f92023          	sw	a5,0(s2)
80002a02:	57e2                	lw	a5,56(sp)
80002a04:	9bbe                	add	s7,s7,a5
80002a06:	47b2                	lw	a5,12(sp)
80002a08:	9cbe                	add	s9,s9,a5
80002a0a:	57f2                	lw	a5,60(sp)
80002a0c:	9b3e                	add	s6,s6,a5
80002a0e:	47f2                	lw	a5,28(sp)
80002a10:	ed5796e3          	bne	a5,s5,800028dc <MiCo_bitconv2d_f32_plain+0x20e>
80002a14:	4776                	lw	a4,92(sp)
80002a16:	56b6                	lw	a3,108(sp)
80002a18:	5796                	lw	a5,100(sp)
80002a1a:	9736                	add	a4,a4,a3
80002a1c:	ceba                	sw	a4,92(sp)
80002a1e:	56a6                	lw	a3,104(sp)
80002a20:	4766                	lw	a4,88(sp)
80002a22:	0785                	addi	a5,a5,1
80002a24:	d2be                	sw	a5,100(sp)
80002a26:	9736                	add	a4,a4,a3
80002a28:	ccba                	sw	a4,88(sp)
80002a2a:	5706                	lw	a4,96(sp)
80002a2c:	eae7e4e3          	bltu	a5,a4,800028d4 <MiCo_bitconv2d_f32_plain+0x206>
80002a30:	4562                	lw	a0,24(sp)
80002a32:	699050ef          	jal	ra,800088ca <free>
80002a36:	8552                	mv	a0,s4
80002a38:	693050ef          	jal	ra,800088ca <free>
80002a3c:	542e                	lw	s0,232(sp)
80002a3e:	4552                	lw	a0,20(sp)
80002a40:	50be                	lw	ra,236(sp)
80002a42:	549e                	lw	s1,228(sp)
80002a44:	590e                	lw	s2,224(sp)
80002a46:	49fe                	lw	s3,220(sp)
80002a48:	4a6e                	lw	s4,216(sp)
80002a4a:	4ade                	lw	s5,212(sp)
80002a4c:	4b4e                	lw	s6,208(sp)
80002a4e:	4bbe                	lw	s7,204(sp)
80002a50:	4c2e                	lw	s8,200(sp)
80002a52:	4c9e                	lw	s9,196(sp)
80002a54:	4d0e                	lw	s10,192(sp)
80002a56:	5dfa                	lw	s11,188(sp)
80002a58:	743a                	flw	fs0,172(sp)
80002a5a:	616d                	addi	sp,sp,240
80002a5c:	66f0506f          	j	800088ca <free>
80002a60:	47a1                	li	a5,8
80002a62:	00f49a63          	bne	s1,a5,80002a76 <MiCo_bitconv2d_f32_plain+0x3a8>
80002a66:	4656                	lw	a2,84(sp)
80002a68:	45d2                	lw	a1,20(sp)
80002a6a:	4562                	lw	a0,24(sp)
80002a6c:	399010ef          	jal	ra,80004604 <__FP32toQ8>
80002a70:	20a50453          	fmv.s	fs0,fa0
80002a74:	b5f9                	j	80002942 <MiCo_bitconv2d_f32_plain+0x274>
80002a76:	85a6                	mv	a1,s1
80002a78:	00008517          	auipc	a0,0x8
80002a7c:	f1850513          	addi	a0,a0,-232 # 8000a990 <__init_array_end+0x350>
80002a80:	f0000453          	fmv.w.x	fs0,zero
80002a84:	27a050ef          	jal	ra,80007cfe <printf>
80002a88:	bd6d                	j	80002942 <MiCo_bitconv2d_f32_plain+0x274>
80002a8a:	4656                	lw	a2,84(sp)
80002a8c:	45d2                	lw	a1,20(sp)
80002a8e:	4562                	lw	a0,24(sp)
80002a90:	3cd010ef          	jal	ra,8000465c <__FP32toQ4>
80002a94:	20a50453          	fmv.s	fs0,fa0
80002a98:	b56d                	j	80002942 <MiCo_bitconv2d_f32_plain+0x274>
80002a9a:	4656                	lw	a2,84(sp)
80002a9c:	45d2                	lw	a1,20(sp)
80002a9e:	4562                	lw	a0,24(sp)
80002aa0:	55f010ef          	jal	ra,800047fe <__FP32toQ1>
80002aa4:	20a50453          	fmv.s	fs0,fa0
80002aa8:	bd69                	j	80002942 <MiCo_bitconv2d_f32_plain+0x274>
80002aaa:	86ce                	mv	a3,s3
80002aac:	85be                	mv	a1,a5
80002aae:	866e                	mv	a2,s11
80002ab0:	00008517          	auipc	a0,0x8
80002ab4:	f5050513          	addi	a0,a0,-176 # 8000aa00 <MiCo_QMatMul+0x40>
80002ab8:	246050ef          	jal	ra,80007cfe <printf>
80002abc:	11e050ef          	jal	ra,80007bda <MiCo_time>
80002ac0:	47c6                	lw	a5,80(sp)
80002ac2:	89aa                	mv	s3,a0
80002ac4:	18b0                	addi	a2,sp,120
80002ac6:	439c                	lw	a5,0(a5)
80002ac8:	016c                	addi	a1,sp,140
80002aca:	8552                	mv	a0,s4
80002acc:	9782                	jalr	a5
80002ace:	10c050ef          	jal	ra,80007bda <MiCo_time>
80002ad2:	000d2783          	lw	a5,0(s10)
80002ad6:	41350733          	sub	a4,a0,s3
80002ada:	97ba                	add	a5,a5,a4
80002adc:	00fd2023          	sw	a5,0(s10)
80002ae0:	0fa050ef          	jal	ra,80007bda <MiCo_time>
80002ae4:	89aa                	mv	s3,a0
80002ae6:	b721                	j	800029ee <MiCo_bitconv2d_f32_plain+0x320>
80002ae8:	0885                	addi	a7,a7,1
80002aea:	9366                	add	t1,t1,s9
80002aec:	cf1b97e3          	bne	s7,a7,800027da <MiCo_bitconv2d_f32_plain+0x10c>
80002af0:	5786                	lw	a5,96(sp)
80002af2:	0e85                	addi	t4,t4,1
80002af4:	9f7e                	add	t5,t5,t6
80002af6:	cfd790e3          	bne	a5,t4,800027d6 <MiCo_bitconv2d_f32_plain+0x108>
80002afa:	03bc8433          	mul	s0,s9,s11
80002afe:	00241513          	slli	a0,s0,0x2
80002b02:	caa2                	sw	s0,84(sp)
80002b04:	5bb050ef          	jal	ra,800088be <malloc>
80002b08:	8d2a                	mv	s10,a0
80002b0a:	5542                	lw	a0,48(sp)
80002b0c:	ca6a                	sw	s10,20(sp)
80002b0e:	5b1050ef          	jal	ra,800088be <malloc>
80002b12:	47a1                	li	a5,8
80002b14:	0297c7b3          	div	a5,a5,s1
80002b18:	8a2a                	mv	s4,a0
80002b1a:	02f45533          	divu	a0,s0,a5
80002b1e:	5a1050ef          	jal	ra,800088be <malloc>
80002b22:	cc2a                	sw	a0,24(sp)
80002b24:	b389                	j	80002866 <MiCo_bitconv2d_f32_plain+0x198>
80002b26:	03bc8433          	mul	s0,s9,s11
80002b2a:	00241513          	slli	a0,s0,0x2
80002b2e:	591050ef          	jal	ra,800088be <malloc>
80002b32:	8d2a                	mv	s10,a0
80002b34:	5542                	lw	a0,48(sp)
80002b36:	ca6a                	sw	s10,20(sp)
80002b38:	587050ef          	jal	ra,800088be <malloc>
80002b3c:	47a1                	li	a5,8
80002b3e:	0297c4b3          	div	s1,a5,s1
80002b42:	8a2a                	mv	s4,a0
80002b44:	02945533          	divu	a0,s0,s1
80002b48:	577050ef          	jal	ra,800088be <malloc>
80002b4c:	cc2a                	sw	a0,24(sp)
80002b4e:	b5cd                	j	80002a30 <MiCo_bitconv2d_f32_plain+0x362>

80002b50 <qlog>:
80002b50:	00155793          	srli	a5,a0,0x1
80002b54:	4501                	li	a0,0
80002b56:	c789                	beqz	a5,80002b60 <qlog+0x10>
80002b58:	8385                	srli	a5,a5,0x1
80002b5a:	0505                	addi	a0,a0,1
80002b5c:	fff5                	bnez	a5,80002b58 <qlog+0x8>
80002b5e:	8082                	ret
80002b60:	8082                	ret

80002b62 <MiCo_bitlinear_f32>:
80002b62:	7159                	addi	sp,sp,-112
80002b64:	d0ca                	sw	s2,96(sp)
80002b66:	d686                	sw	ra,108(sp)
80002b68:	893a                	mv	s2,a4
80002b6a:	d4a2                	sw	s0,104(sp)
80002b6c:	d2a6                	sw	s1,100(sp)
80002b6e:	cece                	sw	s3,92(sp)
80002b70:	ccd2                	sw	s4,88(sp)
80002b72:	cad6                	sw	s5,84(sp)
80002b74:	c8da                	sw	s6,80(sp)
80002b76:	c6de                	sw	s7,76(sp)
80002b78:	c4e2                	sw	s8,72(sp)
80002b7a:	c2e6                	sw	s9,68(sp)
80002b7c:	c0ea                	sw	s10,64(sp)
80002b7e:	de6e                	sw	s11,60(sp)
80002b80:	f622                	fsw	fs0,44(sp)
80002b82:	4721                	li	a4,8
80002b84:	1f276163          	bltu	a4,s2,80002d66 <MiCo_bitlinear_f32+0x204>
80002b88:	8bbe                	mv	s7,a5
80002b8a:	1cf76e63          	bltu	a4,a5,80002d66 <MiCo_bitlinear_f32+0x204>
80002b8e:	0005ab03          	lw	s6,0(a1)
80002b92:	4200                	lw	s0,0(a2)
80002b94:	429c                	lw	a5,0(a3)
80002b96:	0045aa83          	lw	s5,4(a1)
80002b9a:	028b0d33          	mul	s10,s6,s0
80002b9e:	89aa                	mv	s3,a0
80002ba0:	8a2e                	mv	s4,a1
80002ba2:	84b2                	mv	s1,a2
80002ba4:	8cc2                	mv	s9,a6
80002ba6:	16079563          	bnez	a5,80002d10 <MiCo_bitlinear_f32+0x1ae>
80002baa:	200d0b63          	beqz	s10,80002dc0 <MiCo_bitlinear_f32+0x25e>
80002bae:	4508                	lw	a0,8(a0)
80002bb0:	002d1d93          	slli	s11,s10,0x2
80002bb4:	866e                	mv	a2,s11
80002bb6:	4581                	li	a1,0
80002bb8:	2e8060ef          	jal	ra,80008ea0 <memset>
80002bbc:	856e                	mv	a0,s11
80002bbe:	501050ef          	jal	ra,800088be <malloc>
80002bc2:	8c2a                	mv	s8,a0
80002bc4:	866e                	mv	a2,s11
80002bc6:	4581                	li	a1,0
80002bc8:	8562                	mv	a0,s8
80002bca:	2d6060ef          	jal	ra,80008ea0 <memset>
80002bce:	fffc8793          	addi	a5,s9,-1
80002bd2:	9abe                	add	s5,s5,a5
80002bd4:	039adab3          	divu	s5,s5,s9
80002bd8:	4d21                	li	s10,8
80002bda:	c65a                	sw	s6,12(sp)
80002bdc:	039a8ab3          	mul	s5,s5,s9
80002be0:	c856                	sw	s5,16(sp)
80002be2:	7f9040ef          	jal	ra,80007bda <MiCo_time>
80002be6:	037d4733          	div	a4,s10,s7
80002bea:	8caa                	mv	s9,a0
80002bec:	6521                	lui	a0,0x8
80002bee:	00008597          	auipc	a1,0x8
80002bf2:	d8258593          	addi	a1,a1,-638 # 8000a970 <__init_array_end+0x330>
80002bf6:	035b07b3          	mul	a5,s6,s5
80002bfa:	02e7d7b3          	divu	a5,a5,a4
80002bfe:	00a7b533          	sltu	a0,a5,a0
80002c02:	d46ff0ef          	jal	ra,80002148 <MiCo_assert>
80002c06:	00009797          	auipc	a5,0x9
80002c0a:	c1a78793          	addi	a5,a5,-998 # 8000b820 <MiCo_QBuffer>
80002c0e:	ca3e                	sw	a5,20(sp)
80002c10:	4791                	li	a5,4
80002c12:	16fb8f63          	beq	s7,a5,80002d90 <MiCo_bitlinear_f32+0x22e>
80002c16:	1377ef63          	bltu	a5,s7,80002d54 <MiCo_bitlinear_f32+0x1f2>
80002c1a:	4785                	li	a5,1
80002c1c:	18fb8163          	beq	s7,a5,80002d9e <MiCo_bitlinear_f32+0x23c>
80002c20:	4789                	li	a5,2
80002c22:	18fb9563          	bne	s7,a5,80002dac <MiCo_bitlinear_f32+0x24a>
80002c26:	00c10d13          	addi	s10,sp,12
80002c2a:	85d2                	mv	a1,s4
80002c2c:	856a                	mv	a0,s10
80002c2e:	6df010ef          	jal	ra,80004b0c <MiCo_2D_FP32toQ2>
80002c32:	7a9040ef          	jal	ra,80007bda <MiCo_time>
80002c36:	00009a97          	auipc	s5,0x9
80002c3a:	bc6a8a93          	addi	s5,s5,-1082 # 8000b7fc <QUANT_TIMER>
80002c3e:	000aa783          	lw	a5,0(s5)
80002c42:	41950cb3          	sub	s9,a0,s9
80002c46:	97e6                	add	a5,a5,s9
80002c48:	00faa023          	sw	a5,0(s5)
80002c4c:	78f040ef          	jal	ra,80007bda <MiCo_time>
80002c50:	87aa                	mv	a5,a0
80002c52:	855e                	mv	a0,s7
80002c54:	8bbe                	mv	s7,a5
80002c56:	3ded                	jal	80002b50 <qlog>
80002c58:	8a2a                	mv	s4,a0
80002c5a:	854a                	mv	a0,s2
80002c5c:	3dd5                	jal	80002b50 <qlog>
80002c5e:	0a0a                	slli	s4,s4,0x2
80002c60:	9a2a                	add	s4,s4,a0
80002c62:	00008717          	auipc	a4,0x8
80002c66:	e2a70713          	addi	a4,a4,-470 # 8000aa8c <MiCo_QMatMul>
80002c6a:	002a1793          	slli	a5,s4,0x2
80002c6e:	97ba                	add	a5,a5,a4
80002c70:	439c                	lw	a5,0(a5)
80002c72:	8626                	mv	a2,s1
80002c74:	85ea                	mv	a1,s10
80002c76:	8562                	mv	a0,s8
80002c78:	9782                	jalr	a5
80002c7a:	761040ef          	jal	ra,80007bda <MiCo_time>
80002c7e:	00009717          	auipc	a4,0x9
80002c82:	b8270713          	addi	a4,a4,-1150 # 8000b800 <QMATMUL_TIMER>
80002c86:	431c                	lw	a5,0(a4)
80002c88:	64c0                	flw	fs0,12(s1)
80002c8a:	67e2                	flw	fa5,24(sp)
80002c8c:	41750533          	sub	a0,a0,s7
80002c90:	97aa                	add	a5,a5,a0
80002c92:	10f47453          	fmul.s	fs0,fs0,fa5
80002c96:	c31c                	sw	a5,0(a4)
80002c98:	743040ef          	jal	ra,80007bda <MiCo_time>
80002c9c:	84aa                	mv	s1,a0
80002c9e:	020b0e63          	beqz	s6,80002cda <MiCo_bitlinear_f32+0x178>
80002ca2:	cc05                	beqz	s0,80002cda <MiCo_bitlinear_f32+0x178>
80002ca4:	0089a883          	lw	a7,8(s3)
80002ca8:	040a                	slli	s0,s0,0x2
80002caa:	4581                	li	a1,0
80002cac:	4801                	li	a6,0
80002cae:	8646                	mv	a2,a7
80002cb0:	00bc0733          	add	a4,s8,a1
80002cb4:	95a2                	add	a1,a1,s0
80002cb6:	87b2                	mv	a5,a2
80002cb8:	00b88633          	add	a2,a7,a1
80002cbc:	4314                	lw	a3,0(a4)
80002cbe:	6398                	flw	fa4,0(a5)
80002cc0:	0791                	addi	a5,a5,4
80002cc2:	d006f7d3          	fcvt.s.w	fa5,a3
80002cc6:	0711                	addi	a4,a4,4
80002cc8:	7087f7c3          	fmadd.s	fa5,fa5,fs0,fa4
80002ccc:	fef7ae27          	fsw	fa5,-4(a5)
80002cd0:	fec796e3          	bne	a5,a2,80002cbc <MiCo_bitlinear_f32+0x15a>
80002cd4:	0805                	addi	a6,a6,1
80002cd6:	fd0b1de3          	bne	s6,a6,80002cb0 <MiCo_bitlinear_f32+0x14e>
80002cda:	701040ef          	jal	ra,80007bda <MiCo_time>
80002cde:	000aa783          	lw	a5,0(s5)
80002ce2:	409504b3          	sub	s1,a0,s1
80002ce6:	5426                	lw	s0,104(sp)
80002ce8:	97a6                	add	a5,a5,s1
80002cea:	50b6                	lw	ra,108(sp)
80002cec:	5496                	lw	s1,100(sp)
80002cee:	5906                	lw	s2,96(sp)
80002cf0:	49f6                	lw	s3,92(sp)
80002cf2:	4a66                	lw	s4,88(sp)
80002cf4:	4b46                	lw	s6,80(sp)
80002cf6:	4bb6                	lw	s7,76(sp)
80002cf8:	4c96                	lw	s9,68(sp)
80002cfa:	4d06                	lw	s10,64(sp)
80002cfc:	5df2                	lw	s11,60(sp)
80002cfe:	7432                	flw	fs0,44(sp)
80002d00:	00faa023          	sw	a5,0(s5)
80002d04:	8562                	mv	a0,s8
80002d06:	4ad6                	lw	s5,84(sp)
80002d08:	4c26                	lw	s8,72(sp)
80002d0a:	6165                	addi	sp,sp,112
80002d0c:	3bf0506f          	j	800088ca <free>
80002d10:	0a0b0863          	beqz	s6,80002dc0 <MiCo_bitlinear_f32+0x25e>
80002d14:	c455                	beqz	s0,80002dc0 <MiCo_bitlinear_f32+0x25e>
80002d16:	42d0                	lw	a2,4(a3)
80002d18:	450c                	lw	a1,8(a0)
80002d1a:	00241313          	slli	t1,s0,0x2
80002d1e:	9332                	add	t1,t1,a2
80002d20:	4701                	li	a4,0
80002d22:	4781                	li	a5,0
80002d24:	00271893          	slli	a7,a4,0x2
80002d28:	98ae                	add	a7,a7,a1
80002d2a:	86b2                	mv	a3,a2
80002d2c:	629c                	flw	fa5,0(a3)
80002d2e:	0691                	addi	a3,a3,4
80002d30:	0891                	addi	a7,a7,4
80002d32:	fef8ae27          	fsw	fa5,-4(a7)
80002d36:	fed31be3          	bne	t1,a3,80002d2c <MiCo_bitlinear_f32+0x1ca>
80002d3a:	0785                	addi	a5,a5,1
80002d3c:	9722                	add	a4,a4,s0
80002d3e:	fefb13e3          	bne	s6,a5,80002d24 <MiCo_bitlinear_f32+0x1c2>
80002d42:	002d1d93          	slli	s11,s10,0x2
80002d46:	856e                	mv	a0,s11
80002d48:	377050ef          	jal	ra,800088be <malloc>
80002d4c:	8c2a                	mv	s8,a0
80002d4e:	e60d1be3          	bnez	s10,80002bc4 <MiCo_bitlinear_f32+0x62>
80002d52:	bdb5                	j	80002bce <MiCo_bitlinear_f32+0x6c>
80002d54:	05ab9c63          	bne	s7,s10,80002dac <MiCo_bitlinear_f32+0x24a>
80002d58:	00c10d13          	addi	s10,sp,12
80002d5c:	85d2                	mv	a1,s4
80002d5e:	856a                	mv	a0,s10
80002d60:	365010ef          	jal	ra,800048c4 <MiCo_2D_FP32toQ8>
80002d64:	b5f9                	j	80002c32 <MiCo_bitlinear_f32+0xd0>
80002d66:	5426                	lw	s0,104(sp)
80002d68:	50b6                	lw	ra,108(sp)
80002d6a:	5496                	lw	s1,100(sp)
80002d6c:	5906                	lw	s2,96(sp)
80002d6e:	49f6                	lw	s3,92(sp)
80002d70:	4a66                	lw	s4,88(sp)
80002d72:	4ad6                	lw	s5,84(sp)
80002d74:	4b46                	lw	s6,80(sp)
80002d76:	4bb6                	lw	s7,76(sp)
80002d78:	4c26                	lw	s8,72(sp)
80002d7a:	4c96                	lw	s9,68(sp)
80002d7c:	4d06                	lw	s10,64(sp)
80002d7e:	5df2                	lw	s11,60(sp)
80002d80:	7432                	flw	fs0,44(sp)
80002d82:	00008517          	auipc	a0,0x8
80002d86:	ce250513          	addi	a0,a0,-798 # 8000aa64 <MiCo_QMatMul+0x40>
80002d8a:	6165                	addi	sp,sp,112
80002d8c:	2300506f          	j	80007fbc <puts>
80002d90:	00c10d13          	addi	s10,sp,12
80002d94:	85d2                	mv	a1,s4
80002d96:	856a                	mv	a0,s10
80002d98:	42d010ef          	jal	ra,800049c4 <MiCo_2D_FP32toQ4>
80002d9c:	bd59                	j	80002c32 <MiCo_bitlinear_f32+0xd0>
80002d9e:	00c10d13          	addi	s10,sp,12
80002da2:	85d2                	mv	a1,s4
80002da4:	856a                	mv	a0,s10
80002da6:	753010ef          	jal	ra,80004cf8 <MiCo_2D_FP32toQ1>
80002daa:	b561                	j	80002c32 <MiCo_bitlinear_f32+0xd0>
80002dac:	85de                	mv	a1,s7
80002dae:	00008517          	auipc	a0,0x8
80002db2:	be250513          	addi	a0,a0,-1054 # 8000a990 <__init_array_end+0x350>
80002db6:	749040ef          	jal	ra,80007cfe <printf>
80002dba:	00c10d13          	addi	s10,sp,12
80002dbe:	bd95                	j	80002c32 <MiCo_bitlinear_f32+0xd0>
80002dc0:	002d1513          	slli	a0,s10,0x2
80002dc4:	2fb050ef          	jal	ra,800088be <malloc>
80002dc8:	8c2a                	mv	s8,a0
80002dca:	b511                	j	80002bce <MiCo_bitlinear_f32+0x6c>
80002dcc:	1141                	addi	sp,sp,-16
80002dce:	c426                	sw	s1,8(sp)
80002dd0:	4184                	lw	s1,0(a1)
80002dd2:	c622                	sw	s0,12(sp)
80002dd4:	c24a                	sw	s2,4(sp)
80002dd6:	0045a883          	lw	a7,4(a1)
80002dda:	421c                	lw	a5,0(a2)
80002ddc:	c4b5                	beqz	s1,80002e48 <MiCo_bitlinear_f32+0x2e6>
80002dde:	c7ad                	beqz	a5,80002e48 <MiCo_bitlinear_f32+0x2e6>
80002de0:	40f00433          	neg	s0,a5
80002de4:	078a                	slli	a5,a5,0x2
80002de6:	00241913          	slli	s2,s0,0x2
80002dea:	8f2e                	mv	t5,a1
80002dec:	8fb2                	mv	t6,a2
80002dee:	00f50eb3          	add	t4,a0,a5
80002df2:	4e01                	li	t3,0
80002df4:	4281                	li	t0,0
80002df6:	040e                	slli	s0,s0,0x3
80002df8:	01d903b3          	add	t2,s2,t4
80002dfc:	881e                	mv	a6,t2
80002dfe:	4301                	li	t1,0
80002e00:	4601                	li	a2,0
80002e02:	02088763          	beqz	a7,80002e30 <MiCo_bitlinear_f32+0x2ce>
80002e06:	008f2783          	lw	a5,8(t5)
80002e0a:	008fa683          	lw	a3,8(t6)
80002e0e:	4601                	li	a2,0
80002e10:	01178533          	add	a0,a5,a7
80002e14:	969a                	add	a3,a3,t1
80002e16:	97f2                	add	a5,a5,t3
80002e18:	9572                	add	a0,a0,t3
80002e1a:	00078703          	lb	a4,0(a5)
80002e1e:	00068583          	lb	a1,0(a3)
80002e22:	0785                	addi	a5,a5,1
80002e24:	0685                	addi	a3,a3,1
80002e26:	02b70733          	mul	a4,a4,a1
80002e2a:	963a                	add	a2,a2,a4
80002e2c:	fef517e3          	bne	a0,a5,80002e1a <MiCo_bitlinear_f32+0x2b8>
80002e30:	00c82023          	sw	a2,0(a6)
80002e34:	0811                	addi	a6,a6,4
80002e36:	9346                	add	t1,t1,a7
80002e38:	fd0e94e3          	bne	t4,a6,80002e00 <MiCo_bitlinear_f32+0x29e>
80002e3c:	0285                	addi	t0,t0,1
80002e3e:	40838eb3          	sub	t4,t2,s0
80002e42:	9e46                	add	t3,t3,a7
80002e44:	fa549ae3          	bne	s1,t0,80002df8 <MiCo_bitlinear_f32+0x296>
80002e48:	4432                	lw	s0,12(sp)
80002e4a:	44a2                	lw	s1,8(sp)
80002e4c:	4912                	lw	s2,4(sp)
80002e4e:	0141                	addi	sp,sp,16
80002e50:	8082                	ret
80002e52:	1101                	addi	sp,sp,-32
80002e54:	cc26                	sw	s1,24(sp)
80002e56:	4184                	lw	s1,0(a1)
80002e58:	ce22                	sw	s0,28(sp)
80002e5a:	ca4a                	sw	s2,20(sp)
80002e5c:	c84e                	sw	s3,16(sp)
80002e5e:	c652                	sw	s4,12(sp)
80002e60:	0045a803          	lw	a6,4(a1)
80002e64:	421c                	lw	a5,0(a2)
80002e66:	c0d1                	beqz	s1,80002eea <MiCo_bitlinear_f32+0x388>
80002e68:	c3c9                	beqz	a5,80002eea <MiCo_bitlinear_f32+0x388>
80002e6a:	40f00933          	neg	s2,a5
80002e6e:	078a                	slli	a5,a5,0x2
80002e70:	00291993          	slli	s3,s2,0x2
80002e74:	8fae                	mv	t6,a1
80002e76:	82b2                	mv	t0,a2
80002e78:	00f50f33          	add	t5,a0,a5
80002e7c:	4e01                	li	t3,0
80002e7e:	4381                	li	t2,0
80002e80:	090e                	slli	s2,s2,0x3
80002e82:	013f0433          	add	s0,t5,s3
80002e86:	8ea2                	mv	t4,s0
80002e88:	4501                	li	a0,0
80002e8a:	4581                	li	a1,0
80002e8c:	04080363          	beqz	a6,80002ed2 <MiCo_bitlinear_f32+0x370>
80002e90:	0082a303          	lw	t1,8(t0)
80002e94:	008fa883          	lw	a7,8(t6)
80002e98:	4701                	li	a4,0
80002e9a:	4581                	li	a1,0
80002e9c:	00e507b3          	add	a5,a0,a4
80002ea0:	8385                	srli	a5,a5,0x1
80002ea2:	979a                	add	a5,a5,t1
80002ea4:	00078603          	lb	a2,0(a5)
80002ea8:	00ee06b3          	add	a3,t3,a4
80002eac:	00177a13          	andi	s4,a4,1
80002eb0:	96c6                	add	a3,a3,a7
80002eb2:	0705                	addi	a4,a4,1
80002eb4:	00f67793          	andi	a5,a2,15
80002eb8:	000a0463          	beqz	s4,80002ec0 <MiCo_bitlinear_f32+0x35e>
80002ebc:	40465793          	srai	a5,a2,0x4
80002ec0:	00068683          	lb	a3,0(a3)
80002ec4:	07f2                	slli	a5,a5,0x1c
80002ec6:	87f1                	srai	a5,a5,0x1c
80002ec8:	02f687b3          	mul	a5,a3,a5
80002ecc:	95be                	add	a1,a1,a5
80002ece:	fce817e3          	bne	a6,a4,80002e9c <MiCo_bitlinear_f32+0x33a>
80002ed2:	00bea023          	sw	a1,0(t4)
80002ed6:	0e91                	addi	t4,t4,4
80002ed8:	9542                	add	a0,a0,a6
80002eda:	fbee98e3          	bne	t4,t5,80002e8a <MiCo_bitlinear_f32+0x328>
80002ede:	0385                	addi	t2,t2,1
80002ee0:	41240f33          	sub	t5,s0,s2
80002ee4:	9e42                	add	t3,t3,a6
80002ee6:	f8749ee3          	bne	s1,t2,80002e82 <MiCo_bitlinear_f32+0x320>
80002eea:	4472                	lw	s0,28(sp)
80002eec:	44e2                	lw	s1,24(sp)
80002eee:	4952                	lw	s2,20(sp)
80002ef0:	49c2                	lw	s3,16(sp)
80002ef2:	4a32                	lw	s4,12(sp)
80002ef4:	6105                	addi	sp,sp,32
80002ef6:	8082                	ret
80002ef8:	1101                	addi	sp,sp,-32
80002efa:	ca4a                	sw	s2,20(sp)
80002efc:	0005a903          	lw	s2,0(a1)
80002f00:	ce22                	sw	s0,28(sp)
80002f02:	cc26                	sw	s1,24(sp)
80002f04:	c84e                	sw	s3,16(sp)
80002f06:	c652                	sw	s4,12(sp)
80002f08:	c456                	sw	s5,8(sp)
80002f0a:	c25a                	sw	s6,4(sp)
80002f0c:	82ae                	mv	t0,a1
80002f0e:	421c                	lw	a5,0(a2)
80002f10:	41cc                	lw	a1,4(a1)
80002f12:	08090b63          	beqz	s2,80002fa8 <MiCo_bitlinear_f32+0x446>
80002f16:	cbc9                	beqz	a5,80002fa8 <MiCo_bitlinear_f32+0x446>
80002f18:	40f009b3          	neg	s3,a5
80002f1c:	078a                	slli	a5,a5,0x2
80002f1e:	00299a13          	slli	s4,s3,0x2
80002f22:	83b2                	mv	t2,a2
80002f24:	00f50fb3          	add	t6,a0,a5
80002f28:	4301                	li	t1,0
80002f2a:	4401                	li	s0,0
80002f2c:	4e05                	li	t3,1
80002f2e:	4e89                	li	t4,2
80002f30:	098e                	slli	s3,s3,0x3
80002f32:	01fa04b3          	add	s1,s4,t6
80002f36:	8f26                	mv	t5,s1
80002f38:	4501                	li	a0,0
80002f3a:	4601                	li	a2,0
80002f3c:	c9b1                	beqz	a1,80002f90 <MiCo_bitlinear_f32+0x42e>
80002f3e:	0083a883          	lw	a7,8(t2)
80002f42:	0082a803          	lw	a6,8(t0)
80002f46:	4701                	li	a4,0
80002f48:	4601                	li	a2,0
80002f4a:	00e507b3          	add	a5,a0,a4
80002f4e:	8389                	srli	a5,a5,0x2
80002f50:	97c6                	add	a5,a5,a7
80002f52:	00078783          	lb	a5,0(a5)
80002f56:	00377a93          	andi	s5,a4,3
80002f5a:	0a86                	slli	s5,s5,0x1
80002f5c:	4157d7b3          	sra	a5,a5,s5
80002f60:	8b8d                	andi	a5,a5,3
80002f62:	006706b3          	add	a3,a4,t1
80002f66:	ffd78a93          	addi	s5,a5,-3
80002f6a:	96c2                	add	a3,a3,a6
80002f6c:	0705                	addi	a4,a4,1
80002f6e:	001aba93          	seqz	s5,s5
80002f72:	4b05                	li	s6,1
80002f74:	01c78763          	beq	a5,t3,80002f82 <MiCo_bitlinear_f32+0x420>
80002f78:	5b79                	li	s6,-2
80002f7a:	01d78463          	beq	a5,t4,80002f82 <MiCo_bitlinear_f32+0x420>
80002f7e:	41500b33          	neg	s6,s5
80002f82:	00068783          	lb	a5,0(a3)
80002f86:	036787b3          	mul	a5,a5,s6
80002f8a:	963e                	add	a2,a2,a5
80002f8c:	fae59fe3          	bne	a1,a4,80002f4a <MiCo_bitlinear_f32+0x3e8>
80002f90:	00cf2023          	sw	a2,0(t5)
80002f94:	0f11                	addi	t5,t5,4
80002f96:	952e                	add	a0,a0,a1
80002f98:	fbff11e3          	bne	t5,t6,80002f3a <MiCo_bitlinear_f32+0x3d8>
80002f9c:	0405                	addi	s0,s0,1
80002f9e:	41348fb3          	sub	t6,s1,s3
80002fa2:	932e                	add	t1,t1,a1
80002fa4:	f88917e3          	bne	s2,s0,80002f32 <MiCo_bitlinear_f32+0x3d0>
80002fa8:	4472                	lw	s0,28(sp)
80002faa:	44e2                	lw	s1,24(sp)
80002fac:	4952                	lw	s2,20(sp)
80002fae:	49c2                	lw	s3,16(sp)
80002fb0:	4a32                	lw	s4,12(sp)
80002fb2:	4aa2                	lw	s5,8(sp)
80002fb4:	4b12                	lw	s6,4(sp)
80002fb6:	6105                	addi	sp,sp,32
80002fb8:	8082                	ret
80002fba:	1101                	addi	sp,sp,-32
80002fbc:	cc26                	sw	s1,24(sp)
80002fbe:	4184                	lw	s1,0(a1)
80002fc0:	ce22                	sw	s0,28(sp)
80002fc2:	ca4a                	sw	s2,20(sp)
80002fc4:	c84e                	sw	s3,16(sp)
80002fc6:	c652                	sw	s4,12(sp)
80002fc8:	0045a883          	lw	a7,4(a1)
80002fcc:	421c                	lw	a5,0(a2)
80002fce:	cca5                	beqz	s1,80003046 <MiCo_bitlinear_f32+0x4e4>
80002fd0:	cbbd                	beqz	a5,80003046 <MiCo_bitlinear_f32+0x4e4>
80002fd2:	40f00933          	neg	s2,a5
80002fd6:	078a                	slli	a5,a5,0x2
80002fd8:	00291993          	slli	s3,s2,0x2
80002fdc:	8fae                	mv	t6,a1
80002fde:	82b2                	mv	t0,a2
80002fe0:	00f50f33          	add	t5,a0,a5
80002fe4:	4801                	li	a6,0
80002fe6:	4381                	li	t2,0
80002fe8:	090e                	slli	s2,s2,0x3
80002fea:	013f0433          	add	s0,t5,s3
80002fee:	8ea2                	mv	t4,s0
80002ff0:	4301                	li	t1,0
80002ff2:	4581                	li	a1,0
80002ff4:	02088d63          	beqz	a7,8000302e <MiCo_bitlinear_f32+0x4cc>
80002ff8:	0082ae03          	lw	t3,8(t0)
80002ffc:	008fa503          	lw	a0,8(t6)
80003000:	4781                	li	a5,0
80003002:	4581                	li	a1,0
80003004:	00f30733          	add	a4,t1,a5
80003008:	830d                	srli	a4,a4,0x3
8000300a:	9772                	add	a4,a4,t3
8000300c:	00070703          	lb	a4,0(a4)
80003010:	0077fa13          	andi	s4,a5,7
80003014:	01078633          	add	a2,a5,a6
80003018:	41475733          	sra	a4,a4,s4
8000301c:	8b05                	andi	a4,a4,1
8000301e:	962a                	add	a2,a2,a0
80003020:	cb15                	beqz	a4,80003054 <MiCo_bitlinear_f32+0x4f2>
80003022:	00060703          	lb	a4,0(a2)
80003026:	0785                	addi	a5,a5,1
80003028:	8d99                	sub	a1,a1,a4
8000302a:	fd179de3          	bne	a5,a7,80003004 <MiCo_bitlinear_f32+0x4a2>
8000302e:	00bea023          	sw	a1,0(t4)
80003032:	0e91                	addi	t4,t4,4
80003034:	9346                	add	t1,t1,a7
80003036:	fbee9ee3          	bne	t4,t5,80002ff2 <MiCo_bitlinear_f32+0x490>
8000303a:	0385                	addi	t2,t2,1
8000303c:	41240f33          	sub	t5,s0,s2
80003040:	9846                	add	a6,a6,a7
80003042:	fa7494e3          	bne	s1,t2,80002fea <MiCo_bitlinear_f32+0x488>
80003046:	4472                	lw	s0,28(sp)
80003048:	44e2                	lw	s1,24(sp)
8000304a:	4952                	lw	s2,20(sp)
8000304c:	49c2                	lw	s3,16(sp)
8000304e:	4a32                	lw	s4,12(sp)
80003050:	6105                	addi	sp,sp,32
80003052:	8082                	ret
80003054:	00060703          	lb	a4,0(a2)
80003058:	0785                	addi	a5,a5,1
8000305a:	95ba                	add	a1,a1,a4
8000305c:	faf894e3          	bne	a7,a5,80003004 <MiCo_bitlinear_f32+0x4a2>
80003060:	00bea023          	sw	a1,0(t4)
80003064:	0e91                	addi	t4,t4,4
80003066:	9346                	add	t1,t1,a7
80003068:	f9ee95e3          	bne	t4,t5,80002ff2 <MiCo_bitlinear_f32+0x490>
8000306c:	b7f9                	j	8000303a <MiCo_bitlinear_f32+0x4d8>
8000306e:	1141                	addi	sp,sp,-16
80003070:	c622                	sw	s0,12(sp)
80003072:	4180                	lw	s0,0(a1)
80003074:	c426                	sw	s1,8(sp)
80003076:	c24a                	sw	s2,4(sp)
80003078:	c04e                	sw	s3,0(sp)
8000307a:	8f2e                	mv	t5,a1
8000307c:	421c                	lw	a5,0(a2)
8000307e:	41cc                	lw	a1,4(a1)
80003080:	c051                	beqz	s0,80003104 <MiCo_bitlinear_f32+0x5a2>
80003082:	c3c9                	beqz	a5,80003104 <MiCo_bitlinear_f32+0x5a2>
80003084:	40f004b3          	neg	s1,a5
80003088:	078a                	slli	a5,a5,0x2
8000308a:	00249913          	slli	s2,s1,0x2
8000308e:	8fb2                	mv	t6,a2
80003090:	00f50eb3          	add	t4,a0,a5
80003094:	4301                	li	t1,0
80003096:	4281                	li	t0,0
80003098:	048e                	slli	s1,s1,0x3
8000309a:	01d903b3          	add	t2,s2,t4
8000309e:	8e1e                	mv	t3,t2
800030a0:	4501                	li	a0,0
800030a2:	4601                	li	a2,0
800030a4:	c5a1                	beqz	a1,800030ec <MiCo_bitlinear_f32+0x58a>
800030a6:	008fa883          	lw	a7,8(t6)
800030aa:	008f2803          	lw	a6,8(t5)
800030ae:	4681                	li	a3,0
800030b0:	4601                	li	a2,0
800030b2:	00a68733          	add	a4,a3,a0
800030b6:	006687b3          	add	a5,a3,t1
800030ba:	8305                	srli	a4,a4,0x1
800030bc:	8385                	srli	a5,a5,0x1
800030be:	9746                	add	a4,a4,a7
800030c0:	97c2                	add	a5,a5,a6
800030c2:	00070703          	lb	a4,0(a4)
800030c6:	00078783          	lb	a5,0(a5)
800030ca:	0016f993          	andi	s3,a3,1
800030ce:	098a                	slli	s3,s3,0x2
800030d0:	41375733          	sra	a4,a4,s3
800030d4:	4137d7b3          	sra	a5,a5,s3
800030d8:	0772                	slli	a4,a4,0x1c
800030da:	07f2                	slli	a5,a5,0x1c
800030dc:	87f1                	srai	a5,a5,0x1c
800030de:	8771                	srai	a4,a4,0x1c
800030e0:	02e787b3          	mul	a5,a5,a4
800030e4:	0685                	addi	a3,a3,1
800030e6:	963e                	add	a2,a2,a5
800030e8:	fcd595e3          	bne	a1,a3,800030b2 <MiCo_bitlinear_f32+0x550>
800030ec:	00ce2023          	sw	a2,0(t3)
800030f0:	0e11                	addi	t3,t3,4
800030f2:	952e                	add	a0,a0,a1
800030f4:	fbce97e3          	bne	t4,t3,800030a2 <MiCo_bitlinear_f32+0x540>
800030f8:	0285                	addi	t0,t0,1
800030fa:	40938eb3          	sub	t4,t2,s1
800030fe:	932e                	add	t1,t1,a1
80003100:	f8541de3          	bne	s0,t0,8000309a <MiCo_bitlinear_f32+0x538>
80003104:	4432                	lw	s0,12(sp)
80003106:	44a2                	lw	s1,8(sp)
80003108:	4912                	lw	s2,4(sp)
8000310a:	4982                	lw	s3,0(sp)
8000310c:	0141                	addi	sp,sp,16
8000310e:	8082                	ret
80003110:	1101                	addi	sp,sp,-32
80003112:	c84e                	sw	s3,16(sp)
80003114:	0005a983          	lw	s3,0(a1)
80003118:	ce22                	sw	s0,28(sp)
8000311a:	cc26                	sw	s1,24(sp)
8000311c:	ca4a                	sw	s2,20(sp)
8000311e:	c652                	sw	s4,12(sp)
80003120:	c456                	sw	s5,8(sp)
80003122:	c25a                	sw	s6,4(sp)
80003124:	c05e                	sw	s7,0(sp)
80003126:	0045a803          	lw	a6,4(a1)
8000312a:	421c                	lw	a5,0(a2)
8000312c:	0a098663          	beqz	s3,800031d8 <MiCo_bitlinear_f32+0x676>
80003130:	c7c5                	beqz	a5,800031d8 <MiCo_bitlinear_f32+0x676>
80003132:	40f00a33          	neg	s4,a5
80003136:	078a                	slli	a5,a5,0x2
80003138:	002a1a93          	slli	s5,s4,0x2
8000313c:	83ae                	mv	t2,a1
8000313e:	8432                	mv	s0,a2
80003140:	00f502b3          	add	t0,a0,a5
80003144:	4e01                	li	t3,0
80003146:	4481                	li	s1,0
80003148:	4e85                	li	t4,1
8000314a:	4f09                	li	t5,2
8000314c:	0a0e                	slli	s4,s4,0x3
8000314e:	005a8933          	add	s2,s5,t0
80003152:	8fca                	mv	t6,s2
80003154:	4501                	li	a0,0
80003156:	4581                	li	a1,0
80003158:	06080463          	beqz	a6,800031c0 <MiCo_bitlinear_f32+0x65e>
8000315c:	00842303          	lw	t1,8(s0)
80003160:	0083a883          	lw	a7,8(t2)
80003164:	4681                	li	a3,0
80003166:	4581                	li	a1,0
80003168:	00d50733          	add	a4,a0,a3
8000316c:	8309                	srli	a4,a4,0x2
8000316e:	971a                	add	a4,a4,t1
80003170:	0016f793          	andi	a5,a3,1
80003174:	00070703          	lb	a4,0(a4)
80003178:	00279b13          	slli	s6,a5,0x2
8000317c:	0036f793          	andi	a5,a3,3
80003180:	0786                	slli	a5,a5,0x1
80003182:	40f75733          	sra	a4,a4,a5
80003186:	00de0633          	add	a2,t3,a3
8000318a:	8b0d                	andi	a4,a4,3
8000318c:	8205                	srli	a2,a2,0x1
8000318e:	ffd70793          	addi	a5,a4,-3
80003192:	9646                	add	a2,a2,a7
80003194:	0685                	addi	a3,a3,1
80003196:	0017b793          	seqz	a5,a5
8000319a:	4b85                	li	s7,1
8000319c:	01d70763          	beq	a4,t4,800031aa <MiCo_bitlinear_f32+0x648>
800031a0:	5bf9                	li	s7,-2
800031a2:	01e70463          	beq	a4,t5,800031aa <MiCo_bitlinear_f32+0x648>
800031a6:	40f00bb3          	neg	s7,a5
800031aa:	00060783          	lb	a5,0(a2)
800031ae:	4167d7b3          	sra	a5,a5,s6
800031b2:	07f2                	slli	a5,a5,0x1c
800031b4:	87f1                	srai	a5,a5,0x1c
800031b6:	037787b3          	mul	a5,a5,s7
800031ba:	95be                	add	a1,a1,a5
800031bc:	fad816e3          	bne	a6,a3,80003168 <MiCo_bitlinear_f32+0x606>
800031c0:	00bfa023          	sw	a1,0(t6)
800031c4:	0f91                	addi	t6,t6,4
800031c6:	9542                	add	a0,a0,a6
800031c8:	f85f97e3          	bne	t6,t0,80003156 <MiCo_bitlinear_f32+0x5f4>
800031cc:	0485                	addi	s1,s1,1
800031ce:	414902b3          	sub	t0,s2,s4
800031d2:	9e42                	add	t3,t3,a6
800031d4:	f6999de3          	bne	s3,s1,8000314e <MiCo_bitlinear_f32+0x5ec>
800031d8:	4472                	lw	s0,28(sp)
800031da:	44e2                	lw	s1,24(sp)
800031dc:	4952                	lw	s2,20(sp)
800031de:	49c2                	lw	s3,16(sp)
800031e0:	4a32                	lw	s4,12(sp)
800031e2:	4aa2                	lw	s5,8(sp)
800031e4:	4b12                	lw	s6,4(sp)
800031e6:	4b82                	lw	s7,0(sp)
800031e8:	6105                	addi	sp,sp,32
800031ea:	8082                	ret
800031ec:	1101                	addi	sp,sp,-32
800031ee:	ce22                	sw	s0,28(sp)
800031f0:	4180                	lw	s0,0(a1)
800031f2:	cc26                	sw	s1,24(sp)
800031f4:	ca4a                	sw	s2,20(sp)
800031f6:	c84e                	sw	s3,16(sp)
800031f8:	c652                	sw	s4,12(sp)
800031fa:	8f2e                	mv	t5,a1
800031fc:	421c                	lw	a5,0(a2)
800031fe:	41cc                	lw	a1,4(a1)
80003200:	c459                	beqz	s0,8000328e <MiCo_bitlinear_f32+0x72c>
80003202:	c7d1                	beqz	a5,8000328e <MiCo_bitlinear_f32+0x72c>
80003204:	40f004b3          	neg	s1,a5
80003208:	078a                	slli	a5,a5,0x2
8000320a:	00249913          	slli	s2,s1,0x2
8000320e:	8fb2                	mv	t6,a2
80003210:	00f50eb3          	add	t4,a0,a5
80003214:	4301                	li	t1,0
80003216:	4281                	li	t0,0
80003218:	048e                	slli	s1,s1,0x3
8000321a:	01d903b3          	add	t2,s2,t4
8000321e:	8e1e                	mv	t3,t2
80003220:	4501                	li	a0,0
80003222:	4601                	li	a2,0
80003224:	c9a9                	beqz	a1,80003276 <MiCo_bitlinear_f32+0x714>
80003226:	008fa883          	lw	a7,8(t6)
8000322a:	008f2803          	lw	a6,8(t5)
8000322e:	4681                	li	a3,0
80003230:	4601                	li	a2,0
80003232:	00d50733          	add	a4,a0,a3
80003236:	00d307b3          	add	a5,t1,a3
8000323a:	830d                	srli	a4,a4,0x3
8000323c:	9746                	add	a4,a4,a7
8000323e:	8385                	srli	a5,a5,0x1
80003240:	00070703          	lb	a4,0(a4)
80003244:	97c2                	add	a5,a5,a6
80003246:	00078783          	lb	a5,0(a5)
8000324a:	0076fa13          	andi	s4,a3,7
8000324e:	0016f993          	andi	s3,a3,1
80003252:	41475733          	sra	a4,a4,s4
80003256:	098a                	slli	s3,s3,0x2
80003258:	8b05                	andi	a4,a4,1
8000325a:	4137d7b3          	sra	a5,a5,s3
8000325e:	40e00733          	neg	a4,a4
80003262:	07f2                	slli	a5,a5,0x1c
80003264:	00176713          	ori	a4,a4,1
80003268:	87f1                	srai	a5,a5,0x1c
8000326a:	02e787b3          	mul	a5,a5,a4
8000326e:	0685                	addi	a3,a3,1
80003270:	963e                	add	a2,a2,a5
80003272:	fcd590e3          	bne	a1,a3,80003232 <MiCo_bitlinear_f32+0x6d0>
80003276:	00ce2023          	sw	a2,0(t3)
8000327a:	0e11                	addi	t3,t3,4
8000327c:	952e                	add	a0,a0,a1
8000327e:	fbde12e3          	bne	t3,t4,80003222 <MiCo_bitlinear_f32+0x6c0>
80003282:	0285                	addi	t0,t0,1
80003284:	40938eb3          	sub	t4,t2,s1
80003288:	932e                	add	t1,t1,a1
8000328a:	f85418e3          	bne	s0,t0,8000321a <MiCo_bitlinear_f32+0x6b8>
8000328e:	4472                	lw	s0,28(sp)
80003290:	44e2                	lw	s1,24(sp)
80003292:	4952                	lw	s2,20(sp)
80003294:	49c2                	lw	s3,16(sp)
80003296:	4a32                	lw	s4,12(sp)
80003298:	6105                	addi	sp,sp,32
8000329a:	8082                	ret
8000329c:	1101                	addi	sp,sp,-32
8000329e:	ca4a                	sw	s2,20(sp)
800032a0:	0005a903          	lw	s2,0(a1)
800032a4:	ce22                	sw	s0,28(sp)
800032a6:	cc26                	sw	s1,24(sp)
800032a8:	c84e                	sw	s3,16(sp)
800032aa:	c652                	sw	s4,12(sp)
800032ac:	c456                	sw	s5,8(sp)
800032ae:	c25a                	sw	s6,4(sp)
800032b0:	c05e                	sw	s7,0(sp)
800032b2:	0045a803          	lw	a6,4(a1)
800032b6:	421c                	lw	a5,0(a2)
800032b8:	0c090363          	beqz	s2,8000337e <MiCo_bitlinear_f32+0x81c>
800032bc:	c3e9                	beqz	a5,8000337e <MiCo_bitlinear_f32+0x81c>
800032be:	40f009b3          	neg	s3,a5
800032c2:	078a                	slli	a5,a5,0x2
800032c4:	82ae                	mv	t0,a1
800032c6:	00f50fb3          	add	t6,a0,a5
800032ca:	00299a13          	slli	s4,s3,0x2
800032ce:	83b2                	mv	t2,a2
800032d0:	4e81                	li	t4,0
800032d2:	4401                	li	s0,0
800032d4:	4585                	li	a1,1
800032d6:	4509                	li	a0,2
800032d8:	098e                	slli	s3,s3,0x3
800032da:	01fa04b3          	add	s1,s4,t6
800032de:	8f26                	mv	t5,s1
800032e0:	4881                	li	a7,0
800032e2:	4601                	li	a2,0
800032e4:	08080163          	beqz	a6,80003366 <MiCo_bitlinear_f32+0x804>
800032e8:	0083ae03          	lw	t3,8(t2)
800032ec:	0082a303          	lw	t1,8(t0)
800032f0:	4681                	li	a3,0
800032f2:	4601                	li	a2,0
800032f4:	a039                	j	80003302 <MiCo_bitlinear_f32+0x7a0>
800032f6:	02ea8ab3          	mul	s5,s5,a4
800032fa:	0685                	addi	a3,a3,1
800032fc:	9656                	add	a2,a2,s5
800032fe:	06d80463          	beq	a6,a3,80003366 <MiCo_bitlinear_f32+0x804>
80003302:	00d88733          	add	a4,a7,a3
80003306:	8309                	srli	a4,a4,0x2
80003308:	9772                	add	a4,a4,t3
8000330a:	00070703          	lb	a4,0(a4)
8000330e:	0036fb13          	andi	s6,a3,3
80003312:	0b06                	slli	s6,s6,0x1
80003314:	41675733          	sra	a4,a4,s6
80003318:	00de87b3          	add	a5,t4,a3
8000331c:	8b0d                	andi	a4,a4,3
8000331e:	ffd70a93          	addi	s5,a4,-3
80003322:	8389                	srli	a5,a5,0x2
80003324:	001abb93          	seqz	s7,s5
80003328:	979a                	add	a5,a5,t1
8000332a:	4a85                	li	s5,1
8000332c:	00b70763          	beq	a4,a1,8000333a <MiCo_bitlinear_f32+0x7d8>
80003330:	5af9                	li	s5,-2
80003332:	00a70463          	beq	a4,a0,8000333a <MiCo_bitlinear_f32+0x7d8>
80003336:	41700ab3          	neg	s5,s7
8000333a:	00078783          	lb	a5,0(a5)
8000333e:	4167d7b3          	sra	a5,a5,s6
80003342:	8b8d                	andi	a5,a5,3
80003344:	ffd78713          	addi	a4,a5,-3
80003348:	00173713          	seqz	a4,a4
8000334c:	40e00733          	neg	a4,a4
80003350:	fab785e3          	beq	a5,a1,800032fa <MiCo_bitlinear_f32+0x798>
80003354:	faa791e3          	bne	a5,a0,800032f6 <MiCo_bitlinear_f32+0x794>
80003358:	41500ab3          	neg	s5,s5
8000335c:	0a86                	slli	s5,s5,0x1
8000335e:	0685                	addi	a3,a3,1
80003360:	9656                	add	a2,a2,s5
80003362:	fad810e3          	bne	a6,a3,80003302 <MiCo_bitlinear_f32+0x7a0>
80003366:	00cf2023          	sw	a2,0(t5)
8000336a:	0f11                	addi	t5,t5,4
8000336c:	98c2                	add	a7,a7,a6
8000336e:	f7ff1ae3          	bne	t5,t6,800032e2 <MiCo_bitlinear_f32+0x780>
80003372:	0405                	addi	s0,s0,1
80003374:	41348fb3          	sub	t6,s1,s3
80003378:	9ec2                	add	t4,t4,a6
8000337a:	f68910e3          	bne	s2,s0,800032da <MiCo_bitlinear_f32+0x778>
8000337e:	4472                	lw	s0,28(sp)
80003380:	44e2                	lw	s1,24(sp)
80003382:	4952                	lw	s2,20(sp)
80003384:	49c2                	lw	s3,16(sp)
80003386:	4a32                	lw	s4,12(sp)
80003388:	4aa2                	lw	s5,8(sp)
8000338a:	4b12                	lw	s6,4(sp)
8000338c:	4b82                	lw	s7,0(sp)
8000338e:	6105                	addi	sp,sp,32
80003390:	8082                	ret
80003392:	1101                	addi	sp,sp,-32
80003394:	ca4a                	sw	s2,20(sp)
80003396:	0005a903          	lw	s2,0(a1)
8000339a:	ce22                	sw	s0,28(sp)
8000339c:	cc26                	sw	s1,24(sp)
8000339e:	c84e                	sw	s3,16(sp)
800033a0:	c652                	sw	s4,12(sp)
800033a2:	c456                	sw	s5,8(sp)
800033a4:	c25a                	sw	s6,4(sp)
800033a6:	82ae                	mv	t0,a1
800033a8:	421c                	lw	a5,0(a2)
800033aa:	41cc                	lw	a1,4(a1)
800033ac:	0a090a63          	beqz	s2,80003460 <MiCo_bitlinear_f32+0x8fe>
800033b0:	cbc5                	beqz	a5,80003460 <MiCo_bitlinear_f32+0x8fe>
800033b2:	40f009b3          	neg	s3,a5
800033b6:	078a                	slli	a5,a5,0x2
800033b8:	00299a13          	slli	s4,s3,0x2
800033bc:	83b2                	mv	t2,a2
800033be:	00f50fb3          	add	t6,a0,a5
800033c2:	4301                	li	t1,0
800033c4:	4401                	li	s0,0
800033c6:	4e89                	li	t4,2
800033c8:	4e05                	li	t3,1
800033ca:	098e                	slli	s3,s3,0x3
800033cc:	014f84b3          	add	s1,t6,s4
800033d0:	8f26                	mv	t5,s1
800033d2:	4501                	li	a0,0
800033d4:	4601                	li	a2,0
800033d6:	c9ad                	beqz	a1,80003448 <MiCo_bitlinear_f32+0x8e6>
800033d8:	0083a883          	lw	a7,8(t2)
800033dc:	0082a803          	lw	a6,8(t0)
800033e0:	4701                	li	a4,0
800033e2:	4601                	li	a2,0
800033e4:	a039                	j	800033f2 <MiCo_bitlinear_f32+0x890>
800033e6:	035686b3          	mul	a3,a3,s5
800033ea:	0705                	addi	a4,a4,1
800033ec:	9636                	add	a2,a2,a3
800033ee:	04e58d63          	beq	a1,a4,80003448 <MiCo_bitlinear_f32+0x8e6>
800033f2:	00e507b3          	add	a5,a0,a4
800033f6:	838d                	srli	a5,a5,0x3
800033f8:	97c6                	add	a5,a5,a7
800033fa:	00078a83          	lb	s5,0(a5)
800033fe:	00777793          	andi	a5,a4,7
80003402:	56fd                	li	a3,-1
80003404:	40fad7b3          	sra	a5,s5,a5
80003408:	8b85                	andi	a5,a5,1
8000340a:	4b09                	li	s6,2
8000340c:	e399                	bnez	a5,80003412 <MiCo_bitlinear_f32+0x8b0>
8000340e:	5b79                	li	s6,-2
80003410:	4685                	li	a3,1
80003412:	00e307b3          	add	a5,t1,a4
80003416:	8389                	srli	a5,a5,0x2
80003418:	97c2                	add	a5,a5,a6
8000341a:	00078783          	lb	a5,0(a5)
8000341e:	00377a93          	andi	s5,a4,3
80003422:	0a86                	slli	s5,s5,0x1
80003424:	4157d7b3          	sra	a5,a5,s5
80003428:	8b8d                	andi	a5,a5,3
8000342a:	ffd78a93          	addi	s5,a5,-3
8000342e:	001aba93          	seqz	s5,s5
80003432:	41500ab3          	neg	s5,s5
80003436:	fbc78ae3          	beq	a5,t3,800033ea <MiCo_bitlinear_f32+0x888>
8000343a:	fbd796e3          	bne	a5,t4,800033e6 <MiCo_bitlinear_f32+0x884>
8000343e:	86da                	mv	a3,s6
80003440:	0705                	addi	a4,a4,1
80003442:	9636                	add	a2,a2,a3
80003444:	fae597e3          	bne	a1,a4,800033f2 <MiCo_bitlinear_f32+0x890>
80003448:	00cf2023          	sw	a2,0(t5)
8000344c:	0f11                	addi	t5,t5,4
8000344e:	952e                	add	a0,a0,a1
80003450:	f9ff12e3          	bne	t5,t6,800033d4 <MiCo_bitlinear_f32+0x872>
80003454:	0405                	addi	s0,s0,1
80003456:	41348fb3          	sub	t6,s1,s3
8000345a:	932e                	add	t1,t1,a1
8000345c:	f68918e3          	bne	s2,s0,800033cc <MiCo_bitlinear_f32+0x86a>
80003460:	4472                	lw	s0,28(sp)
80003462:	44e2                	lw	s1,24(sp)
80003464:	4952                	lw	s2,20(sp)
80003466:	49c2                	lw	s3,16(sp)
80003468:	4a32                	lw	s4,12(sp)
8000346a:	4aa2                	lw	s5,8(sp)
8000346c:	4b12                	lw	s6,4(sp)
8000346e:	6105                	addi	sp,sp,32
80003470:	8082                	ret
80003472:	1101                	addi	sp,sp,-32
80003474:	ce22                	sw	s0,28(sp)
80003476:	4180                	lw	s0,0(a1)
80003478:	cc26                	sw	s1,24(sp)
8000347a:	ca4a                	sw	s2,20(sp)
8000347c:	c84e                	sw	s3,16(sp)
8000347e:	c652                	sw	s4,12(sp)
80003480:	c456                	sw	s5,8(sp)
80003482:	8f2e                	mv	t5,a1
80003484:	421c                	lw	a5,0(a2)
80003486:	41cc                	lw	a1,4(a1)
80003488:	c059                	beqz	s0,8000350e <MiCo_bitlinear_f32+0x9ac>
8000348a:	c3d1                	beqz	a5,8000350e <MiCo_bitlinear_f32+0x9ac>
8000348c:	40f004b3          	neg	s1,a5
80003490:	078a                	slli	a5,a5,0x2
80003492:	00249913          	slli	s2,s1,0x2
80003496:	8fb2                	mv	t6,a2
80003498:	00f50eb3          	add	t4,a0,a5
8000349c:	4301                	li	t1,0
8000349e:	4281                	li	t0,0
800034a0:	048e                	slli	s1,s1,0x3
800034a2:	012e83b3          	add	t2,t4,s2
800034a6:	8e1e                	mv	t3,t2
800034a8:	4501                	li	a0,0
800034aa:	4601                	li	a2,0
800034ac:	c5a9                	beqz	a1,800034f6 <MiCo_bitlinear_f32+0x994>
800034ae:	008fa883          	lw	a7,8(t6)
800034b2:	008f2803          	lw	a6,8(t5)
800034b6:	4781                	li	a5,0
800034b8:	4601                	li	a2,0
800034ba:	00f50733          	add	a4,a0,a5
800034be:	830d                	srli	a4,a4,0x3
800034c0:	9746                	add	a4,a4,a7
800034c2:	00070683          	lb	a3,0(a4)
800034c6:	0077f993          	andi	s3,a5,7
800034ca:	5a7d                	li	s4,-1
800034cc:	4136d6b3          	sra	a3,a3,s3
800034d0:	8a85                	andi	a3,a3,1
800034d2:	4a85                	li	s5,1
800034d4:	c299                	beqz	a3,800034da <MiCo_bitlinear_f32+0x978>
800034d6:	4a05                	li	s4,1
800034d8:	5afd                	li	s5,-1
800034da:	006786b3          	add	a3,a5,t1
800034de:	828d                	srli	a3,a3,0x3
800034e0:	96c2                	add	a3,a3,a6
800034e2:	00068703          	lb	a4,0(a3)
800034e6:	0785                	addi	a5,a5,1
800034e8:	41375733          	sra	a4,a4,s3
800034ec:	8b05                	andi	a4,a4,1
800034ee:	cb05                	beqz	a4,8000351e <MiCo_bitlinear_f32+0x9bc>
800034f0:	9652                	add	a2,a2,s4
800034f2:	fcb794e3          	bne	a5,a1,800034ba <MiCo_bitlinear_f32+0x958>
800034f6:	00ce2023          	sw	a2,0(t3)
800034fa:	0e11                	addi	t3,t3,4
800034fc:	952e                	add	a0,a0,a1
800034fe:	fbde16e3          	bne	t3,t4,800034aa <MiCo_bitlinear_f32+0x948>
80003502:	0285                	addi	t0,t0,1
80003504:	40938eb3          	sub	t4,t2,s1
80003508:	932e                	add	t1,t1,a1
8000350a:	f8541ce3          	bne	s0,t0,800034a2 <MiCo_bitlinear_f32+0x940>
8000350e:	4472                	lw	s0,28(sp)
80003510:	44e2                	lw	s1,24(sp)
80003512:	4952                	lw	s2,20(sp)
80003514:	49c2                	lw	s3,16(sp)
80003516:	4a32                	lw	s4,12(sp)
80003518:	4aa2                	lw	s5,8(sp)
8000351a:	6105                	addi	sp,sp,32
8000351c:	8082                	ret
8000351e:	9656                	add	a2,a2,s5
80003520:	f8f59de3          	bne	a1,a5,800034ba <MiCo_bitlinear_f32+0x958>
80003524:	00ce2023          	sw	a2,0(t3)
80003528:	0e11                	addi	t3,t3,4
8000352a:	952e                	add	a0,a0,a1
8000352c:	f7de1fe3          	bne	t3,t4,800034aa <MiCo_bitlinear_f32+0x948>
80003530:	bfc9                	j	80003502 <MiCo_bitlinear_f32+0x9a0>
80003532:	1141                	addi	sp,sp,-16
80003534:	c426                	sw	s1,8(sp)
80003536:	4184                	lw	s1,0(a1)
80003538:	c622                	sw	s0,12(sp)
8000353a:	c24a                	sw	s2,4(sp)
8000353c:	c04e                	sw	s3,0(sp)
8000353e:	0045a803          	lw	a6,4(a1)
80003542:	421c                	lw	a5,0(a2)
80003544:	ccbd                	beqz	s1,800035c2 <MiCo_bitlinear_f32+0xa60>
80003546:	cfb5                	beqz	a5,800035c2 <MiCo_bitlinear_f32+0xa60>
80003548:	40f00933          	neg	s2,a5
8000354c:	078a                	slli	a5,a5,0x2
8000354e:	00291993          	slli	s3,s2,0x2
80003552:	8fae                	mv	t6,a1
80003554:	82b2                	mv	t0,a2
80003556:	00f50f33          	add	t5,a0,a5
8000355a:	4e01                	li	t3,0
8000355c:	4381                	li	t2,0
8000355e:	090e                	slli	s2,s2,0x3
80003560:	01e98433          	add	s0,s3,t5
80003564:	8ea2                	mv	t4,s0
80003566:	4501                	li	a0,0
80003568:	4581                	li	a1,0
8000356a:	04080063          	beqz	a6,800035aa <MiCo_bitlinear_f32+0xa48>
8000356e:	008fa303          	lw	t1,8(t6)
80003572:	0082a883          	lw	a7,8(t0)
80003576:	4701                	li	a4,0
80003578:	4581                	li	a1,0
8000357a:	01c707b3          	add	a5,a4,t3
8000357e:	8385                	srli	a5,a5,0x1
80003580:	979a                	add	a5,a5,t1
80003582:	00078783          	lb	a5,0(a5)
80003586:	00177613          	andi	a2,a4,1
8000358a:	00a706b3          	add	a3,a4,a0
8000358e:	060a                	slli	a2,a2,0x2
80003590:	96c6                	add	a3,a3,a7
80003592:	00068683          	lb	a3,0(a3)
80003596:	40c7d7b3          	sra	a5,a5,a2
8000359a:	07f2                	slli	a5,a5,0x1c
8000359c:	87f1                	srai	a5,a5,0x1c
8000359e:	02f687b3          	mul	a5,a3,a5
800035a2:	0705                	addi	a4,a4,1
800035a4:	95be                	add	a1,a1,a5
800035a6:	fce81ae3          	bne	a6,a4,8000357a <MiCo_bitlinear_f32+0xa18>
800035aa:	00bea023          	sw	a1,0(t4)
800035ae:	0e91                	addi	t4,t4,4
800035b0:	9542                	add	a0,a0,a6
800035b2:	fbdf1be3          	bne	t5,t4,80003568 <MiCo_bitlinear_f32+0xa06>
800035b6:	0385                	addi	t2,t2,1
800035b8:	41240f33          	sub	t5,s0,s2
800035bc:	9e42                	add	t3,t3,a6
800035be:	fa7491e3          	bne	s1,t2,80003560 <MiCo_bitlinear_f32+0x9fe>
800035c2:	4432                	lw	s0,12(sp)
800035c4:	44a2                	lw	s1,8(sp)
800035c6:	4912                	lw	s2,4(sp)
800035c8:	4982                	lw	s3,0(sp)
800035ca:	0141                	addi	sp,sp,16
800035cc:	8082                	ret
800035ce:	1101                	addi	sp,sp,-32
800035d0:	ca4a                	sw	s2,20(sp)
800035d2:	0005a903          	lw	s2,0(a1)
800035d6:	ce22                	sw	s0,28(sp)
800035d8:	cc26                	sw	s1,24(sp)
800035da:	c84e                	sw	s3,16(sp)
800035dc:	c652                	sw	s4,12(sp)
800035de:	c456                	sw	s5,8(sp)
800035e0:	c25a                	sw	s6,4(sp)
800035e2:	82ae                	mv	t0,a1
800035e4:	421c                	lw	a5,0(a2)
800035e6:	41cc                	lw	a1,4(a1)
800035e8:	08090b63          	beqz	s2,8000367e <MiCo_bitlinear_f32+0xb1c>
800035ec:	cbc9                	beqz	a5,8000367e <MiCo_bitlinear_f32+0xb1c>
800035ee:	40f009b3          	neg	s3,a5
800035f2:	078a                	slli	a5,a5,0x2
800035f4:	00299a13          	slli	s4,s3,0x2
800035f8:	83b2                	mv	t2,a2
800035fa:	00f50fb3          	add	t6,a0,a5
800035fe:	4301                	li	t1,0
80003600:	4401                	li	s0,0
80003602:	4e05                	li	t3,1
80003604:	4e89                	li	t4,2
80003606:	098e                	slli	s3,s3,0x3
80003608:	01fa04b3          	add	s1,s4,t6
8000360c:	8f26                	mv	t5,s1
8000360e:	4501                	li	a0,0
80003610:	4601                	li	a2,0
80003612:	c9b1                	beqz	a1,80003666 <MiCo_bitlinear_f32+0xb04>
80003614:	0082a883          	lw	a7,8(t0)
80003618:	0083a803          	lw	a6,8(t2)
8000361c:	4701                	li	a4,0
8000361e:	4601                	li	a2,0
80003620:	006707b3          	add	a5,a4,t1
80003624:	8389                	srli	a5,a5,0x2
80003626:	97c6                	add	a5,a5,a7
80003628:	00078783          	lb	a5,0(a5)
8000362c:	00377a93          	andi	s5,a4,3
80003630:	0a86                	slli	s5,s5,0x1
80003632:	4157d7b3          	sra	a5,a5,s5
80003636:	8b8d                	andi	a5,a5,3
80003638:	00e506b3          	add	a3,a0,a4
8000363c:	ffd78a93          	addi	s5,a5,-3
80003640:	96c2                	add	a3,a3,a6
80003642:	0705                	addi	a4,a4,1
80003644:	001aba93          	seqz	s5,s5
80003648:	4b05                	li	s6,1
8000364a:	01c78763          	beq	a5,t3,80003658 <MiCo_bitlinear_f32+0xaf6>
8000364e:	5b79                	li	s6,-2
80003650:	01d78463          	beq	a5,t4,80003658 <MiCo_bitlinear_f32+0xaf6>
80003654:	41500b33          	neg	s6,s5
80003658:	00068783          	lb	a5,0(a3)
8000365c:	036787b3          	mul	a5,a5,s6
80003660:	963e                	add	a2,a2,a5
80003662:	fae59fe3          	bne	a1,a4,80003620 <MiCo_bitlinear_f32+0xabe>
80003666:	00cf2023          	sw	a2,0(t5)
8000366a:	0f11                	addi	t5,t5,4
8000366c:	952e                	add	a0,a0,a1
8000366e:	fbff11e3          	bne	t5,t6,80003610 <MiCo_bitlinear_f32+0xaae>
80003672:	0405                	addi	s0,s0,1
80003674:	41348fb3          	sub	t6,s1,s3
80003678:	932e                	add	t1,t1,a1
8000367a:	f88917e3          	bne	s2,s0,80003608 <MiCo_bitlinear_f32+0xaa6>
8000367e:	4472                	lw	s0,28(sp)
80003680:	44e2                	lw	s1,24(sp)
80003682:	4952                	lw	s2,20(sp)
80003684:	49c2                	lw	s3,16(sp)
80003686:	4a32                	lw	s4,12(sp)
80003688:	4aa2                	lw	s5,8(sp)
8000368a:	4b12                	lw	s6,4(sp)
8000368c:	6105                	addi	sp,sp,32
8000368e:	8082                	ret
80003690:	1101                	addi	sp,sp,-32
80003692:	cc26                	sw	s1,24(sp)
80003694:	4184                	lw	s1,0(a1)
80003696:	ce22                	sw	s0,28(sp)
80003698:	ca4a                	sw	s2,20(sp)
8000369a:	c84e                	sw	s3,16(sp)
8000369c:	c652                	sw	s4,12(sp)
8000369e:	0045a883          	lw	a7,4(a1)
800036a2:	421c                	lw	a5,0(a2)
800036a4:	cca5                	beqz	s1,8000371c <MiCo_bitlinear_f32+0xbba>
800036a6:	cbbd                	beqz	a5,8000371c <MiCo_bitlinear_f32+0xbba>
800036a8:	40f00933          	neg	s2,a5
800036ac:	078a                	slli	a5,a5,0x2
800036ae:	00291993          	slli	s3,s2,0x2
800036b2:	8fae                	mv	t6,a1
800036b4:	82b2                	mv	t0,a2
800036b6:	00f50f33          	add	t5,a0,a5
800036ba:	4e01                	li	t3,0
800036bc:	4381                	li	t2,0
800036be:	090e                	slli	s2,s2,0x3
800036c0:	013f0433          	add	s0,t5,s3
800036c4:	8ea2                	mv	t4,s0
800036c6:	4581                	li	a1,0
800036c8:	4501                	li	a0,0
800036ca:	02088d63          	beqz	a7,80003704 <MiCo_bitlinear_f32+0xba2>
800036ce:	008fa303          	lw	t1,8(t6)
800036d2:	0082a803          	lw	a6,8(t0)
800036d6:	4781                	li	a5,0
800036d8:	4501                	li	a0,0
800036da:	01c78733          	add	a4,a5,t3
800036de:	830d                	srli	a4,a4,0x3
800036e0:	971a                	add	a4,a4,t1
800036e2:	00070703          	lb	a4,0(a4)
800036e6:	0077fa13          	andi	s4,a5,7
800036ea:	00f58633          	add	a2,a1,a5
800036ee:	41475733          	sra	a4,a4,s4
800036f2:	8b05                	andi	a4,a4,1
800036f4:	9642                	add	a2,a2,a6
800036f6:	cb15                	beqz	a4,8000372a <MiCo_bitlinear_f32+0xbc8>
800036f8:	00060703          	lb	a4,0(a2)
800036fc:	0785                	addi	a5,a5,1
800036fe:	8d19                	sub	a0,a0,a4
80003700:	fd179de3          	bne	a5,a7,800036da <MiCo_bitlinear_f32+0xb78>
80003704:	00aea023          	sw	a0,0(t4)
80003708:	0e91                	addi	t4,t4,4
8000370a:	95c6                	add	a1,a1,a7
8000370c:	fbee9ee3          	bne	t4,t5,800036c8 <MiCo_bitlinear_f32+0xb66>
80003710:	0385                	addi	t2,t2,1
80003712:	41240f33          	sub	t5,s0,s2
80003716:	9e46                	add	t3,t3,a7
80003718:	fa7494e3          	bne	s1,t2,800036c0 <MiCo_bitlinear_f32+0xb5e>
8000371c:	4472                	lw	s0,28(sp)
8000371e:	44e2                	lw	s1,24(sp)
80003720:	4952                	lw	s2,20(sp)
80003722:	49c2                	lw	s3,16(sp)
80003724:	4a32                	lw	s4,12(sp)
80003726:	6105                	addi	sp,sp,32
80003728:	8082                	ret
8000372a:	00060703          	lb	a4,0(a2)
8000372e:	0785                	addi	a5,a5,1
80003730:	953a                	add	a0,a0,a4
80003732:	faf894e3          	bne	a7,a5,800036da <MiCo_bitlinear_f32+0xb78>
80003736:	00aea023          	sw	a0,0(t4)
8000373a:	0e91                	addi	t4,t4,4
8000373c:	95c6                	add	a1,a1,a7
8000373e:	f9ee95e3          	bne	t4,t5,800036c8 <MiCo_bitlinear_f32+0xb66>
80003742:	b7f9                	j	80003710 <MiCo_bitlinear_f32+0xbae>
80003744:	1101                	addi	sp,sp,-32
80003746:	c84e                	sw	s3,16(sp)
80003748:	0005a983          	lw	s3,0(a1)
8000374c:	ce22                	sw	s0,28(sp)
8000374e:	cc26                	sw	s1,24(sp)
80003750:	ca4a                	sw	s2,20(sp)
80003752:	c652                	sw	s4,12(sp)
80003754:	c456                	sw	s5,8(sp)
80003756:	c25a                	sw	s6,4(sp)
80003758:	c05e                	sw	s7,0(sp)
8000375a:	0045a803          	lw	a6,4(a1)
8000375e:	421c                	lw	a5,0(a2)
80003760:	0a098663          	beqz	s3,8000380c <MiCo_bitlinear_f32+0xcaa>
80003764:	c7c5                	beqz	a5,8000380c <MiCo_bitlinear_f32+0xcaa>
80003766:	40f00a33          	neg	s4,a5
8000376a:	078a                	slli	a5,a5,0x2
8000376c:	002a1a93          	slli	s5,s4,0x2
80003770:	83ae                	mv	t2,a1
80003772:	8432                	mv	s0,a2
80003774:	00f502b3          	add	t0,a0,a5
80003778:	4e01                	li	t3,0
8000377a:	4481                	li	s1,0
8000377c:	4e85                	li	t4,1
8000377e:	4f09                	li	t5,2
80003780:	0a0e                	slli	s4,s4,0x3
80003782:	005a8933          	add	s2,s5,t0
80003786:	8fca                	mv	t6,s2
80003788:	4501                	li	a0,0
8000378a:	4581                	li	a1,0
8000378c:	06080463          	beqz	a6,800037f4 <MiCo_bitlinear_f32+0xc92>
80003790:	0083a303          	lw	t1,8(t2)
80003794:	00842883          	lw	a7,8(s0)
80003798:	4681                	li	a3,0
8000379a:	4581                	li	a1,0
8000379c:	00de0733          	add	a4,t3,a3
800037a0:	8309                	srli	a4,a4,0x2
800037a2:	971a                	add	a4,a4,t1
800037a4:	0016f793          	andi	a5,a3,1
800037a8:	00070703          	lb	a4,0(a4)
800037ac:	00279b13          	slli	s6,a5,0x2
800037b0:	0036f793          	andi	a5,a3,3
800037b4:	0786                	slli	a5,a5,0x1
800037b6:	40f75733          	sra	a4,a4,a5
800037ba:	00d50633          	add	a2,a0,a3
800037be:	8b0d                	andi	a4,a4,3
800037c0:	8205                	srli	a2,a2,0x1
800037c2:	ffd70793          	addi	a5,a4,-3
800037c6:	9646                	add	a2,a2,a7
800037c8:	0685                	addi	a3,a3,1
800037ca:	0017b793          	seqz	a5,a5
800037ce:	4b85                	li	s7,1
800037d0:	01d70763          	beq	a4,t4,800037de <MiCo_bitlinear_f32+0xc7c>
800037d4:	5bf9                	li	s7,-2
800037d6:	01e70463          	beq	a4,t5,800037de <MiCo_bitlinear_f32+0xc7c>
800037da:	40f00bb3          	neg	s7,a5
800037de:	00060783          	lb	a5,0(a2)
800037e2:	4167d7b3          	sra	a5,a5,s6
800037e6:	07f2                	slli	a5,a5,0x1c
800037e8:	87f1                	srai	a5,a5,0x1c
800037ea:	037787b3          	mul	a5,a5,s7
800037ee:	95be                	add	a1,a1,a5
800037f0:	fad816e3          	bne	a6,a3,8000379c <MiCo_bitlinear_f32+0xc3a>
800037f4:	00bfa023          	sw	a1,0(t6)
800037f8:	0f91                	addi	t6,t6,4
800037fa:	9542                	add	a0,a0,a6
800037fc:	f85f97e3          	bne	t6,t0,8000378a <MiCo_bitlinear_f32+0xc28>
80003800:	0485                	addi	s1,s1,1
80003802:	414902b3          	sub	t0,s2,s4
80003806:	9e42                	add	t3,t3,a6
80003808:	f6999de3          	bne	s3,s1,80003782 <MiCo_bitlinear_f32+0xc20>
8000380c:	4472                	lw	s0,28(sp)
8000380e:	44e2                	lw	s1,24(sp)
80003810:	4952                	lw	s2,20(sp)
80003812:	49c2                	lw	s3,16(sp)
80003814:	4a32                	lw	s4,12(sp)
80003816:	4aa2                	lw	s5,8(sp)
80003818:	4b12                	lw	s6,4(sp)
8000381a:	4b82                	lw	s7,0(sp)
8000381c:	6105                	addi	sp,sp,32
8000381e:	8082                	ret
80003820:	1101                	addi	sp,sp,-32
80003822:	ce22                	sw	s0,28(sp)
80003824:	4180                	lw	s0,0(a1)
80003826:	cc26                	sw	s1,24(sp)
80003828:	ca4a                	sw	s2,20(sp)
8000382a:	c84e                	sw	s3,16(sp)
8000382c:	c652                	sw	s4,12(sp)
8000382e:	8f2e                	mv	t5,a1
80003830:	421c                	lw	a5,0(a2)
80003832:	41cc                	lw	a1,4(a1)
80003834:	c459                	beqz	s0,800038c2 <MiCo_bitlinear_f32+0xd60>
80003836:	c7d1                	beqz	a5,800038c2 <MiCo_bitlinear_f32+0xd60>
80003838:	40f004b3          	neg	s1,a5
8000383c:	078a                	slli	a5,a5,0x2
8000383e:	00249913          	slli	s2,s1,0x2
80003842:	8fb2                	mv	t6,a2
80003844:	00f50eb3          	add	t4,a0,a5
80003848:	4301                	li	t1,0
8000384a:	4281                	li	t0,0
8000384c:	048e                	slli	s1,s1,0x3
8000384e:	01d903b3          	add	t2,s2,t4
80003852:	8e1e                	mv	t3,t2
80003854:	4501                	li	a0,0
80003856:	4601                	li	a2,0
80003858:	c9a9                	beqz	a1,800038aa <MiCo_bitlinear_f32+0xd48>
8000385a:	008f2883          	lw	a7,8(t5)
8000385e:	008fa803          	lw	a6,8(t6)
80003862:	4681                	li	a3,0
80003864:	4601                	li	a2,0
80003866:	00d30733          	add	a4,t1,a3
8000386a:	00d507b3          	add	a5,a0,a3
8000386e:	830d                	srli	a4,a4,0x3
80003870:	9746                	add	a4,a4,a7
80003872:	8385                	srli	a5,a5,0x1
80003874:	00070703          	lb	a4,0(a4)
80003878:	97c2                	add	a5,a5,a6
8000387a:	00078783          	lb	a5,0(a5)
8000387e:	0076fa13          	andi	s4,a3,7
80003882:	0016f993          	andi	s3,a3,1
80003886:	41475733          	sra	a4,a4,s4
8000388a:	098a                	slli	s3,s3,0x2
8000388c:	8b05                	andi	a4,a4,1
8000388e:	4137d7b3          	sra	a5,a5,s3
80003892:	40e00733          	neg	a4,a4
80003896:	07f2                	slli	a5,a5,0x1c
80003898:	00176713          	ori	a4,a4,1
8000389c:	87f1                	srai	a5,a5,0x1c
8000389e:	02e787b3          	mul	a5,a5,a4
800038a2:	0685                	addi	a3,a3,1
800038a4:	963e                	add	a2,a2,a5
800038a6:	fcd590e3          	bne	a1,a3,80003866 <MiCo_bitlinear_f32+0xd04>
800038aa:	00ce2023          	sw	a2,0(t3)
800038ae:	0e11                	addi	t3,t3,4
800038b0:	952e                	add	a0,a0,a1
800038b2:	fbde12e3          	bne	t3,t4,80003856 <MiCo_bitlinear_f32+0xcf4>
800038b6:	0285                	addi	t0,t0,1
800038b8:	40938eb3          	sub	t4,t2,s1
800038bc:	932e                	add	t1,t1,a1
800038be:	f85418e3          	bne	s0,t0,8000384e <MiCo_bitlinear_f32+0xcec>
800038c2:	4472                	lw	s0,28(sp)
800038c4:	44e2                	lw	s1,24(sp)
800038c6:	4952                	lw	s2,20(sp)
800038c8:	49c2                	lw	s3,16(sp)
800038ca:	4a32                	lw	s4,12(sp)
800038cc:	6105                	addi	sp,sp,32
800038ce:	8082                	ret
800038d0:	1101                	addi	sp,sp,-32
800038d2:	ca4a                	sw	s2,20(sp)
800038d4:	0005a903          	lw	s2,0(a1)
800038d8:	ce22                	sw	s0,28(sp)
800038da:	cc26                	sw	s1,24(sp)
800038dc:	c84e                	sw	s3,16(sp)
800038de:	c652                	sw	s4,12(sp)
800038e0:	c456                	sw	s5,8(sp)
800038e2:	c25a                	sw	s6,4(sp)
800038e4:	82ae                	mv	t0,a1
800038e6:	421c                	lw	a5,0(a2)
800038e8:	41cc                	lw	a1,4(a1)
800038ea:	0a090a63          	beqz	s2,8000399e <MiCo_bitlinear_f32+0xe3c>
800038ee:	cbc5                	beqz	a5,8000399e <MiCo_bitlinear_f32+0xe3c>
800038f0:	40f009b3          	neg	s3,a5
800038f4:	078a                	slli	a5,a5,0x2
800038f6:	00299a13          	slli	s4,s3,0x2
800038fa:	83b2                	mv	t2,a2
800038fc:	00f50fb3          	add	t6,a0,a5
80003900:	4301                	li	t1,0
80003902:	4401                	li	s0,0
80003904:	4e89                	li	t4,2
80003906:	4e05                	li	t3,1
80003908:	098e                	slli	s3,s3,0x3
8000390a:	014f84b3          	add	s1,t6,s4
8000390e:	8f26                	mv	t5,s1
80003910:	4501                	li	a0,0
80003912:	4601                	li	a2,0
80003914:	c9ad                	beqz	a1,80003986 <MiCo_bitlinear_f32+0xe24>
80003916:	0082a883          	lw	a7,8(t0)
8000391a:	0083a803          	lw	a6,8(t2)
8000391e:	4701                	li	a4,0
80003920:	4601                	li	a2,0
80003922:	a039                	j	80003930 <MiCo_bitlinear_f32+0xdce>
80003924:	035686b3          	mul	a3,a3,s5
80003928:	0705                	addi	a4,a4,1
8000392a:	9636                	add	a2,a2,a3
8000392c:	04e58d63          	beq	a1,a4,80003986 <MiCo_bitlinear_f32+0xe24>
80003930:	00e307b3          	add	a5,t1,a4
80003934:	838d                	srli	a5,a5,0x3
80003936:	97c6                	add	a5,a5,a7
80003938:	00078a83          	lb	s5,0(a5)
8000393c:	00777793          	andi	a5,a4,7
80003940:	56fd                	li	a3,-1
80003942:	40fad7b3          	sra	a5,s5,a5
80003946:	8b85                	andi	a5,a5,1
80003948:	4b09                	li	s6,2
8000394a:	e399                	bnez	a5,80003950 <MiCo_bitlinear_f32+0xdee>
8000394c:	5b79                	li	s6,-2
8000394e:	4685                	li	a3,1
80003950:	00e507b3          	add	a5,a0,a4
80003954:	8389                	srli	a5,a5,0x2
80003956:	97c2                	add	a5,a5,a6
80003958:	00078783          	lb	a5,0(a5)
8000395c:	00377a93          	andi	s5,a4,3
80003960:	0a86                	slli	s5,s5,0x1
80003962:	4157d7b3          	sra	a5,a5,s5
80003966:	8b8d                	andi	a5,a5,3
80003968:	ffd78a93          	addi	s5,a5,-3
8000396c:	001aba93          	seqz	s5,s5
80003970:	41500ab3          	neg	s5,s5
80003974:	fbc78ae3          	beq	a5,t3,80003928 <MiCo_bitlinear_f32+0xdc6>
80003978:	fbd796e3          	bne	a5,t4,80003924 <MiCo_bitlinear_f32+0xdc2>
8000397c:	86da                	mv	a3,s6
8000397e:	0705                	addi	a4,a4,1
80003980:	9636                	add	a2,a2,a3
80003982:	fae597e3          	bne	a1,a4,80003930 <MiCo_bitlinear_f32+0xdce>
80003986:	00cf2023          	sw	a2,0(t5)
8000398a:	0f11                	addi	t5,t5,4
8000398c:	952e                	add	a0,a0,a1
8000398e:	f9ff12e3          	bne	t5,t6,80003912 <MiCo_bitlinear_f32+0xdb0>
80003992:	0405                	addi	s0,s0,1
80003994:	41348fb3          	sub	t6,s1,s3
80003998:	932e                	add	t1,t1,a1
8000399a:	f68918e3          	bne	s2,s0,8000390a <MiCo_bitlinear_f32+0xda8>
8000399e:	4472                	lw	s0,28(sp)
800039a0:	44e2                	lw	s1,24(sp)
800039a2:	4952                	lw	s2,20(sp)
800039a4:	49c2                	lw	s3,16(sp)
800039a6:	4a32                	lw	s4,12(sp)
800039a8:	4aa2                	lw	s5,8(sp)
800039aa:	4b12                	lw	s6,4(sp)
800039ac:	6105                	addi	sp,sp,32
800039ae:	8082                	ret

800039b0 <MiCo_Q8_MatMul_Ref>:
800039b0:	1141                	addi	sp,sp,-16
800039b2:	c426                	sw	s1,8(sp)
800039b4:	4184                	lw	s1,0(a1)
800039b6:	c622                	sw	s0,12(sp)
800039b8:	c24a                	sw	s2,4(sp)
800039ba:	0045a883          	lw	a7,4(a1)
800039be:	421c                	lw	a5,0(a2)
800039c0:	c4b5                	beqz	s1,80003a2c <MiCo_Q8_MatMul_Ref+0x7c>
800039c2:	c7ad                	beqz	a5,80003a2c <MiCo_Q8_MatMul_Ref+0x7c>
800039c4:	40f00433          	neg	s0,a5
800039c8:	078a                	slli	a5,a5,0x2
800039ca:	00241913          	slli	s2,s0,0x2
800039ce:	8f2e                	mv	t5,a1
800039d0:	8fb2                	mv	t6,a2
800039d2:	00f50eb3          	add	t4,a0,a5
800039d6:	4e01                	li	t3,0
800039d8:	4281                	li	t0,0
800039da:	040e                	slli	s0,s0,0x3
800039dc:	01d903b3          	add	t2,s2,t4
800039e0:	881e                	mv	a6,t2
800039e2:	4301                	li	t1,0
800039e4:	4601                	li	a2,0
800039e6:	02088763          	beqz	a7,80003a14 <MiCo_Q8_MatMul_Ref+0x64>
800039ea:	008f2783          	lw	a5,8(t5)
800039ee:	008fa683          	lw	a3,8(t6)
800039f2:	4601                	li	a2,0
800039f4:	01178533          	add	a0,a5,a7
800039f8:	969a                	add	a3,a3,t1
800039fa:	97f2                	add	a5,a5,t3
800039fc:	9572                	add	a0,a0,t3
800039fe:	00078703          	lb	a4,0(a5)
80003a02:	00068583          	lb	a1,0(a3)
80003a06:	0785                	addi	a5,a5,1
80003a08:	0685                	addi	a3,a3,1
80003a0a:	02b70733          	mul	a4,a4,a1
80003a0e:	963a                	add	a2,a2,a4
80003a10:	fef517e3          	bne	a0,a5,800039fe <MiCo_Q8_MatMul_Ref+0x4e>
80003a14:	00c82023          	sw	a2,0(a6)
80003a18:	0811                	addi	a6,a6,4
80003a1a:	9346                	add	t1,t1,a7
80003a1c:	fd0e94e3          	bne	t4,a6,800039e4 <MiCo_Q8_MatMul_Ref+0x34>
80003a20:	0285                	addi	t0,t0,1
80003a22:	40838eb3          	sub	t4,t2,s0
80003a26:	9e46                	add	t3,t3,a7
80003a28:	fa549ae3          	bne	s1,t0,800039dc <MiCo_Q8_MatMul_Ref+0x2c>
80003a2c:	4432                	lw	s0,12(sp)
80003a2e:	44a2                	lw	s1,8(sp)
80003a30:	4912                	lw	s2,4(sp)
80003a32:	0141                	addi	sp,sp,16
80003a34:	8082                	ret

80003a36 <MiCo_Q8x4_MatMul_Ref>:
80003a36:	1101                	addi	sp,sp,-32
80003a38:	cc26                	sw	s1,24(sp)
80003a3a:	4184                	lw	s1,0(a1)
80003a3c:	ce22                	sw	s0,28(sp)
80003a3e:	ca4a                	sw	s2,20(sp)
80003a40:	c84e                	sw	s3,16(sp)
80003a42:	c652                	sw	s4,12(sp)
80003a44:	0045a803          	lw	a6,4(a1)
80003a48:	421c                	lw	a5,0(a2)
80003a4a:	c0d1                	beqz	s1,80003ace <MiCo_Q8x4_MatMul_Ref+0x98>
80003a4c:	c3c9                	beqz	a5,80003ace <MiCo_Q8x4_MatMul_Ref+0x98>
80003a4e:	40f00933          	neg	s2,a5
80003a52:	078a                	slli	a5,a5,0x2
80003a54:	00291993          	slli	s3,s2,0x2
80003a58:	8fae                	mv	t6,a1
80003a5a:	82b2                	mv	t0,a2
80003a5c:	00f50f33          	add	t5,a0,a5
80003a60:	4e01                	li	t3,0
80003a62:	4381                	li	t2,0
80003a64:	090e                	slli	s2,s2,0x3
80003a66:	013f0433          	add	s0,t5,s3
80003a6a:	8ea2                	mv	t4,s0
80003a6c:	4501                	li	a0,0
80003a6e:	4581                	li	a1,0
80003a70:	04080363          	beqz	a6,80003ab6 <MiCo_Q8x4_MatMul_Ref+0x80>
80003a74:	0082a303          	lw	t1,8(t0)
80003a78:	008fa883          	lw	a7,8(t6)
80003a7c:	4701                	li	a4,0
80003a7e:	4581                	li	a1,0
80003a80:	00e507b3          	add	a5,a0,a4
80003a84:	8385                	srli	a5,a5,0x1
80003a86:	979a                	add	a5,a5,t1
80003a88:	00078603          	lb	a2,0(a5)
80003a8c:	00ee06b3          	add	a3,t3,a4
80003a90:	00177a13          	andi	s4,a4,1
80003a94:	96c6                	add	a3,a3,a7
80003a96:	0705                	addi	a4,a4,1
80003a98:	00f67793          	andi	a5,a2,15
80003a9c:	000a0463          	beqz	s4,80003aa4 <MiCo_Q8x4_MatMul_Ref+0x6e>
80003aa0:	40465793          	srai	a5,a2,0x4
80003aa4:	00068683          	lb	a3,0(a3)
80003aa8:	07f2                	slli	a5,a5,0x1c
80003aaa:	87f1                	srai	a5,a5,0x1c
80003aac:	02f687b3          	mul	a5,a3,a5
80003ab0:	95be                	add	a1,a1,a5
80003ab2:	fce817e3          	bne	a6,a4,80003a80 <MiCo_Q8x4_MatMul_Ref+0x4a>
80003ab6:	00bea023          	sw	a1,0(t4)
80003aba:	0e91                	addi	t4,t4,4
80003abc:	9542                	add	a0,a0,a6
80003abe:	fbee98e3          	bne	t4,t5,80003a6e <MiCo_Q8x4_MatMul_Ref+0x38>
80003ac2:	0385                	addi	t2,t2,1
80003ac4:	41240f33          	sub	t5,s0,s2
80003ac8:	9e42                	add	t3,t3,a6
80003aca:	f8749ee3          	bne	s1,t2,80003a66 <MiCo_Q8x4_MatMul_Ref+0x30>
80003ace:	4472                	lw	s0,28(sp)
80003ad0:	44e2                	lw	s1,24(sp)
80003ad2:	4952                	lw	s2,20(sp)
80003ad4:	49c2                	lw	s3,16(sp)
80003ad6:	4a32                	lw	s4,12(sp)
80003ad8:	6105                	addi	sp,sp,32
80003ada:	8082                	ret

80003adc <MiCo_Q8x2_MatMul_Ref>:
80003adc:	1101                	addi	sp,sp,-32
80003ade:	ca4a                	sw	s2,20(sp)
80003ae0:	0005a903          	lw	s2,0(a1)
80003ae4:	ce22                	sw	s0,28(sp)
80003ae6:	cc26                	sw	s1,24(sp)
80003ae8:	c84e                	sw	s3,16(sp)
80003aea:	c652                	sw	s4,12(sp)
80003aec:	c456                	sw	s5,8(sp)
80003aee:	c25a                	sw	s6,4(sp)
80003af0:	82ae                	mv	t0,a1
80003af2:	421c                	lw	a5,0(a2)
80003af4:	41cc                	lw	a1,4(a1)
80003af6:	08090b63          	beqz	s2,80003b8c <MiCo_Q8x2_MatMul_Ref+0xb0>
80003afa:	cbc9                	beqz	a5,80003b8c <MiCo_Q8x2_MatMul_Ref+0xb0>
80003afc:	40f009b3          	neg	s3,a5
80003b00:	078a                	slli	a5,a5,0x2
80003b02:	00299a13          	slli	s4,s3,0x2
80003b06:	83b2                	mv	t2,a2
80003b08:	00f50fb3          	add	t6,a0,a5
80003b0c:	4301                	li	t1,0
80003b0e:	4401                	li	s0,0
80003b10:	4e05                	li	t3,1
80003b12:	4e89                	li	t4,2
80003b14:	098e                	slli	s3,s3,0x3
80003b16:	01fa04b3          	add	s1,s4,t6
80003b1a:	8f26                	mv	t5,s1
80003b1c:	4501                	li	a0,0
80003b1e:	4601                	li	a2,0
80003b20:	c9b1                	beqz	a1,80003b74 <MiCo_Q8x2_MatMul_Ref+0x98>
80003b22:	0083a883          	lw	a7,8(t2)
80003b26:	0082a803          	lw	a6,8(t0)
80003b2a:	4701                	li	a4,0
80003b2c:	4601                	li	a2,0
80003b2e:	00e507b3          	add	a5,a0,a4
80003b32:	8389                	srli	a5,a5,0x2
80003b34:	97c6                	add	a5,a5,a7
80003b36:	00078783          	lb	a5,0(a5)
80003b3a:	00377a93          	andi	s5,a4,3
80003b3e:	0a86                	slli	s5,s5,0x1
80003b40:	4157d7b3          	sra	a5,a5,s5
80003b44:	8b8d                	andi	a5,a5,3
80003b46:	006706b3          	add	a3,a4,t1
80003b4a:	ffd78a93          	addi	s5,a5,-3
80003b4e:	96c2                	add	a3,a3,a6
80003b50:	0705                	addi	a4,a4,1
80003b52:	001aba93          	seqz	s5,s5
80003b56:	4b05                	li	s6,1
80003b58:	01c78763          	beq	a5,t3,80003b66 <MiCo_Q8x2_MatMul_Ref+0x8a>
80003b5c:	5b79                	li	s6,-2
80003b5e:	01d78463          	beq	a5,t4,80003b66 <MiCo_Q8x2_MatMul_Ref+0x8a>
80003b62:	41500b33          	neg	s6,s5
80003b66:	00068783          	lb	a5,0(a3)
80003b6a:	036787b3          	mul	a5,a5,s6
80003b6e:	963e                	add	a2,a2,a5
80003b70:	fae59fe3          	bne	a1,a4,80003b2e <MiCo_Q8x2_MatMul_Ref+0x52>
80003b74:	00cf2023          	sw	a2,0(t5)
80003b78:	0f11                	addi	t5,t5,4
80003b7a:	952e                	add	a0,a0,a1
80003b7c:	fbff11e3          	bne	t5,t6,80003b1e <MiCo_Q8x2_MatMul_Ref+0x42>
80003b80:	0405                	addi	s0,s0,1
80003b82:	41348fb3          	sub	t6,s1,s3
80003b86:	932e                	add	t1,t1,a1
80003b88:	f88917e3          	bne	s2,s0,80003b16 <MiCo_Q8x2_MatMul_Ref+0x3a>
80003b8c:	4472                	lw	s0,28(sp)
80003b8e:	44e2                	lw	s1,24(sp)
80003b90:	4952                	lw	s2,20(sp)
80003b92:	49c2                	lw	s3,16(sp)
80003b94:	4a32                	lw	s4,12(sp)
80003b96:	4aa2                	lw	s5,8(sp)
80003b98:	4b12                	lw	s6,4(sp)
80003b9a:	6105                	addi	sp,sp,32
80003b9c:	8082                	ret

80003b9e <MiCo_Q8x1_MatMul_Ref>:
80003b9e:	1101                	addi	sp,sp,-32
80003ba0:	cc26                	sw	s1,24(sp)
80003ba2:	4184                	lw	s1,0(a1)
80003ba4:	ce22                	sw	s0,28(sp)
80003ba6:	ca4a                	sw	s2,20(sp)
80003ba8:	c84e                	sw	s3,16(sp)
80003baa:	c652                	sw	s4,12(sp)
80003bac:	0045a883          	lw	a7,4(a1)
80003bb0:	421c                	lw	a5,0(a2)
80003bb2:	cca5                	beqz	s1,80003c2a <MiCo_Q8x1_MatMul_Ref+0x8c>
80003bb4:	cbbd                	beqz	a5,80003c2a <MiCo_Q8x1_MatMul_Ref+0x8c>
80003bb6:	40f00933          	neg	s2,a5
80003bba:	078a                	slli	a5,a5,0x2
80003bbc:	00291993          	slli	s3,s2,0x2
80003bc0:	8fae                	mv	t6,a1
80003bc2:	82b2                	mv	t0,a2
80003bc4:	00f50f33          	add	t5,a0,a5
80003bc8:	4801                	li	a6,0
80003bca:	4381                	li	t2,0
80003bcc:	090e                	slli	s2,s2,0x3
80003bce:	013f0433          	add	s0,t5,s3
80003bd2:	8ea2                	mv	t4,s0
80003bd4:	4301                	li	t1,0
80003bd6:	4581                	li	a1,0
80003bd8:	02088d63          	beqz	a7,80003c12 <MiCo_Q8x1_MatMul_Ref+0x74>
80003bdc:	0082ae03          	lw	t3,8(t0)
80003be0:	008fa503          	lw	a0,8(t6)
80003be4:	4781                	li	a5,0
80003be6:	4581                	li	a1,0
80003be8:	00f30733          	add	a4,t1,a5
80003bec:	830d                	srli	a4,a4,0x3
80003bee:	9772                	add	a4,a4,t3
80003bf0:	00070703          	lb	a4,0(a4)
80003bf4:	0077fa13          	andi	s4,a5,7
80003bf8:	01078633          	add	a2,a5,a6
80003bfc:	41475733          	sra	a4,a4,s4
80003c00:	8b05                	andi	a4,a4,1
80003c02:	962a                	add	a2,a2,a0
80003c04:	cb15                	beqz	a4,80003c38 <MiCo_Q8x1_MatMul_Ref+0x9a>
80003c06:	00060703          	lb	a4,0(a2)
80003c0a:	0785                	addi	a5,a5,1
80003c0c:	8d99                	sub	a1,a1,a4
80003c0e:	fd179de3          	bne	a5,a7,80003be8 <MiCo_Q8x1_MatMul_Ref+0x4a>
80003c12:	00bea023          	sw	a1,0(t4)
80003c16:	0e91                	addi	t4,t4,4
80003c18:	9346                	add	t1,t1,a7
80003c1a:	fbee9ee3          	bne	t4,t5,80003bd6 <MiCo_Q8x1_MatMul_Ref+0x38>
80003c1e:	0385                	addi	t2,t2,1
80003c20:	41240f33          	sub	t5,s0,s2
80003c24:	9846                	add	a6,a6,a7
80003c26:	fa7494e3          	bne	s1,t2,80003bce <MiCo_Q8x1_MatMul_Ref+0x30>
80003c2a:	4472                	lw	s0,28(sp)
80003c2c:	44e2                	lw	s1,24(sp)
80003c2e:	4952                	lw	s2,20(sp)
80003c30:	49c2                	lw	s3,16(sp)
80003c32:	4a32                	lw	s4,12(sp)
80003c34:	6105                	addi	sp,sp,32
80003c36:	8082                	ret
80003c38:	00060703          	lb	a4,0(a2)
80003c3c:	0785                	addi	a5,a5,1
80003c3e:	95ba                	add	a1,a1,a4
80003c40:	faf894e3          	bne	a7,a5,80003be8 <MiCo_Q8x1_MatMul_Ref+0x4a>
80003c44:	00bea023          	sw	a1,0(t4)
80003c48:	0e91                	addi	t4,t4,4
80003c4a:	9346                	add	t1,t1,a7
80003c4c:	f9ee95e3          	bne	t4,t5,80003bd6 <MiCo_Q8x1_MatMul_Ref+0x38>
80003c50:	b7f9                	j	80003c1e <MiCo_Q8x1_MatMul_Ref+0x80>

80003c52 <MiCo_Q4_MatMul_Ref>:
80003c52:	1141                	addi	sp,sp,-16
80003c54:	c622                	sw	s0,12(sp)
80003c56:	4180                	lw	s0,0(a1)
80003c58:	c426                	sw	s1,8(sp)
80003c5a:	c24a                	sw	s2,4(sp)
80003c5c:	c04e                	sw	s3,0(sp)
80003c5e:	8f2e                	mv	t5,a1
80003c60:	421c                	lw	a5,0(a2)
80003c62:	41cc                	lw	a1,4(a1)
80003c64:	c051                	beqz	s0,80003ce8 <MiCo_Q4_MatMul_Ref+0x96>
80003c66:	c3c9                	beqz	a5,80003ce8 <MiCo_Q4_MatMul_Ref+0x96>
80003c68:	40f004b3          	neg	s1,a5
80003c6c:	078a                	slli	a5,a5,0x2
80003c6e:	00249913          	slli	s2,s1,0x2
80003c72:	8fb2                	mv	t6,a2
80003c74:	00f50eb3          	add	t4,a0,a5
80003c78:	4301                	li	t1,0
80003c7a:	4281                	li	t0,0
80003c7c:	048e                	slli	s1,s1,0x3
80003c7e:	01d903b3          	add	t2,s2,t4
80003c82:	8e1e                	mv	t3,t2
80003c84:	4501                	li	a0,0
80003c86:	4601                	li	a2,0
80003c88:	c5a1                	beqz	a1,80003cd0 <MiCo_Q4_MatMul_Ref+0x7e>
80003c8a:	008fa883          	lw	a7,8(t6)
80003c8e:	008f2803          	lw	a6,8(t5)
80003c92:	4681                	li	a3,0
80003c94:	4601                	li	a2,0
80003c96:	00a68733          	add	a4,a3,a0
80003c9a:	006687b3          	add	a5,a3,t1
80003c9e:	8305                	srli	a4,a4,0x1
80003ca0:	8385                	srli	a5,a5,0x1
80003ca2:	9746                	add	a4,a4,a7
80003ca4:	97c2                	add	a5,a5,a6
80003ca6:	00070703          	lb	a4,0(a4)
80003caa:	00078783          	lb	a5,0(a5)
80003cae:	0016f993          	andi	s3,a3,1
80003cb2:	098a                	slli	s3,s3,0x2
80003cb4:	41375733          	sra	a4,a4,s3
80003cb8:	4137d7b3          	sra	a5,a5,s3
80003cbc:	0772                	slli	a4,a4,0x1c
80003cbe:	07f2                	slli	a5,a5,0x1c
80003cc0:	87f1                	srai	a5,a5,0x1c
80003cc2:	8771                	srai	a4,a4,0x1c
80003cc4:	02e787b3          	mul	a5,a5,a4
80003cc8:	0685                	addi	a3,a3,1
80003cca:	963e                	add	a2,a2,a5
80003ccc:	fcd595e3          	bne	a1,a3,80003c96 <MiCo_Q4_MatMul_Ref+0x44>
80003cd0:	00ce2023          	sw	a2,0(t3)
80003cd4:	0e11                	addi	t3,t3,4
80003cd6:	952e                	add	a0,a0,a1
80003cd8:	fbce97e3          	bne	t4,t3,80003c86 <MiCo_Q4_MatMul_Ref+0x34>
80003cdc:	0285                	addi	t0,t0,1
80003cde:	40938eb3          	sub	t4,t2,s1
80003ce2:	932e                	add	t1,t1,a1
80003ce4:	f8541de3          	bne	s0,t0,80003c7e <MiCo_Q4_MatMul_Ref+0x2c>
80003ce8:	4432                	lw	s0,12(sp)
80003cea:	44a2                	lw	s1,8(sp)
80003cec:	4912                	lw	s2,4(sp)
80003cee:	4982                	lw	s3,0(sp)
80003cf0:	0141                	addi	sp,sp,16
80003cf2:	8082                	ret

80003cf4 <MiCo_Q4x2_MatMul_Ref>:
80003cf4:	1101                	addi	sp,sp,-32
80003cf6:	c84e                	sw	s3,16(sp)
80003cf8:	0005a983          	lw	s3,0(a1)
80003cfc:	ce22                	sw	s0,28(sp)
80003cfe:	cc26                	sw	s1,24(sp)
80003d00:	ca4a                	sw	s2,20(sp)
80003d02:	c652                	sw	s4,12(sp)
80003d04:	c456                	sw	s5,8(sp)
80003d06:	c25a                	sw	s6,4(sp)
80003d08:	c05e                	sw	s7,0(sp)
80003d0a:	0045a803          	lw	a6,4(a1)
80003d0e:	421c                	lw	a5,0(a2)
80003d10:	0a098663          	beqz	s3,80003dbc <MiCo_Q4x2_MatMul_Ref+0xc8>
80003d14:	c7c5                	beqz	a5,80003dbc <MiCo_Q4x2_MatMul_Ref+0xc8>
80003d16:	40f00a33          	neg	s4,a5
80003d1a:	078a                	slli	a5,a5,0x2
80003d1c:	002a1a93          	slli	s5,s4,0x2
80003d20:	83ae                	mv	t2,a1
80003d22:	8432                	mv	s0,a2
80003d24:	00f502b3          	add	t0,a0,a5
80003d28:	4e01                	li	t3,0
80003d2a:	4481                	li	s1,0
80003d2c:	4e85                	li	t4,1
80003d2e:	4f09                	li	t5,2
80003d30:	0a0e                	slli	s4,s4,0x3
80003d32:	005a8933          	add	s2,s5,t0
80003d36:	8fca                	mv	t6,s2
80003d38:	4501                	li	a0,0
80003d3a:	4581                	li	a1,0
80003d3c:	06080463          	beqz	a6,80003da4 <MiCo_Q4x2_MatMul_Ref+0xb0>
80003d40:	00842303          	lw	t1,8(s0)
80003d44:	0083a883          	lw	a7,8(t2)
80003d48:	4681                	li	a3,0
80003d4a:	4581                	li	a1,0
80003d4c:	00d50733          	add	a4,a0,a3
80003d50:	8309                	srli	a4,a4,0x2
80003d52:	971a                	add	a4,a4,t1
80003d54:	0016f793          	andi	a5,a3,1
80003d58:	00070703          	lb	a4,0(a4)
80003d5c:	00279b13          	slli	s6,a5,0x2
80003d60:	0036f793          	andi	a5,a3,3
80003d64:	0786                	slli	a5,a5,0x1
80003d66:	40f75733          	sra	a4,a4,a5
80003d6a:	00de0633          	add	a2,t3,a3
80003d6e:	8b0d                	andi	a4,a4,3
80003d70:	8205                	srli	a2,a2,0x1
80003d72:	ffd70793          	addi	a5,a4,-3
80003d76:	9646                	add	a2,a2,a7
80003d78:	0685                	addi	a3,a3,1
80003d7a:	0017b793          	seqz	a5,a5
80003d7e:	4b85                	li	s7,1
80003d80:	01d70763          	beq	a4,t4,80003d8e <MiCo_Q4x2_MatMul_Ref+0x9a>
80003d84:	5bf9                	li	s7,-2
80003d86:	01e70463          	beq	a4,t5,80003d8e <MiCo_Q4x2_MatMul_Ref+0x9a>
80003d8a:	40f00bb3          	neg	s7,a5
80003d8e:	00060783          	lb	a5,0(a2)
80003d92:	4167d7b3          	sra	a5,a5,s6
80003d96:	07f2                	slli	a5,a5,0x1c
80003d98:	87f1                	srai	a5,a5,0x1c
80003d9a:	037787b3          	mul	a5,a5,s7
80003d9e:	95be                	add	a1,a1,a5
80003da0:	fad816e3          	bne	a6,a3,80003d4c <MiCo_Q4x2_MatMul_Ref+0x58>
80003da4:	00bfa023          	sw	a1,0(t6)
80003da8:	0f91                	addi	t6,t6,4
80003daa:	9542                	add	a0,a0,a6
80003dac:	f85f97e3          	bne	t6,t0,80003d3a <MiCo_Q4x2_MatMul_Ref+0x46>
80003db0:	0485                	addi	s1,s1,1
80003db2:	414902b3          	sub	t0,s2,s4
80003db6:	9e42                	add	t3,t3,a6
80003db8:	f6999de3          	bne	s3,s1,80003d32 <MiCo_Q4x2_MatMul_Ref+0x3e>
80003dbc:	4472                	lw	s0,28(sp)
80003dbe:	44e2                	lw	s1,24(sp)
80003dc0:	4952                	lw	s2,20(sp)
80003dc2:	49c2                	lw	s3,16(sp)
80003dc4:	4a32                	lw	s4,12(sp)
80003dc6:	4aa2                	lw	s5,8(sp)
80003dc8:	4b12                	lw	s6,4(sp)
80003dca:	4b82                	lw	s7,0(sp)
80003dcc:	6105                	addi	sp,sp,32
80003dce:	8082                	ret

80003dd0 <MiCo_Q4x1_MatMul_Ref>:
80003dd0:	1101                	addi	sp,sp,-32
80003dd2:	ce22                	sw	s0,28(sp)
80003dd4:	4180                	lw	s0,0(a1)
80003dd6:	cc26                	sw	s1,24(sp)
80003dd8:	ca4a                	sw	s2,20(sp)
80003dda:	c84e                	sw	s3,16(sp)
80003ddc:	c652                	sw	s4,12(sp)
80003dde:	8f2e                	mv	t5,a1
80003de0:	421c                	lw	a5,0(a2)
80003de2:	41cc                	lw	a1,4(a1)
80003de4:	c459                	beqz	s0,80003e72 <MiCo_Q4x1_MatMul_Ref+0xa2>
80003de6:	c7d1                	beqz	a5,80003e72 <MiCo_Q4x1_MatMul_Ref+0xa2>
80003de8:	40f004b3          	neg	s1,a5
80003dec:	078a                	slli	a5,a5,0x2
80003dee:	00249913          	slli	s2,s1,0x2
80003df2:	8fb2                	mv	t6,a2
80003df4:	00f50eb3          	add	t4,a0,a5
80003df8:	4301                	li	t1,0
80003dfa:	4281                	li	t0,0
80003dfc:	048e                	slli	s1,s1,0x3
80003dfe:	01d903b3          	add	t2,s2,t4
80003e02:	8e1e                	mv	t3,t2
80003e04:	4501                	li	a0,0
80003e06:	4601                	li	a2,0
80003e08:	c9a9                	beqz	a1,80003e5a <MiCo_Q4x1_MatMul_Ref+0x8a>
80003e0a:	008fa883          	lw	a7,8(t6)
80003e0e:	008f2803          	lw	a6,8(t5)
80003e12:	4681                	li	a3,0
80003e14:	4601                	li	a2,0
80003e16:	00d50733          	add	a4,a0,a3
80003e1a:	00d307b3          	add	a5,t1,a3
80003e1e:	830d                	srli	a4,a4,0x3
80003e20:	9746                	add	a4,a4,a7
80003e22:	8385                	srli	a5,a5,0x1
80003e24:	00070703          	lb	a4,0(a4)
80003e28:	97c2                	add	a5,a5,a6
80003e2a:	00078783          	lb	a5,0(a5)
80003e2e:	0076fa13          	andi	s4,a3,7
80003e32:	0016f993          	andi	s3,a3,1
80003e36:	41475733          	sra	a4,a4,s4
80003e3a:	098a                	slli	s3,s3,0x2
80003e3c:	8b05                	andi	a4,a4,1
80003e3e:	4137d7b3          	sra	a5,a5,s3
80003e42:	40e00733          	neg	a4,a4
80003e46:	07f2                	slli	a5,a5,0x1c
80003e48:	00176713          	ori	a4,a4,1
80003e4c:	87f1                	srai	a5,a5,0x1c
80003e4e:	02e787b3          	mul	a5,a5,a4
80003e52:	0685                	addi	a3,a3,1
80003e54:	963e                	add	a2,a2,a5
80003e56:	fcd590e3          	bne	a1,a3,80003e16 <MiCo_Q4x1_MatMul_Ref+0x46>
80003e5a:	00ce2023          	sw	a2,0(t3)
80003e5e:	0e11                	addi	t3,t3,4
80003e60:	952e                	add	a0,a0,a1
80003e62:	fbde12e3          	bne	t3,t4,80003e06 <MiCo_Q4x1_MatMul_Ref+0x36>
80003e66:	0285                	addi	t0,t0,1
80003e68:	40938eb3          	sub	t4,t2,s1
80003e6c:	932e                	add	t1,t1,a1
80003e6e:	f85418e3          	bne	s0,t0,80003dfe <MiCo_Q4x1_MatMul_Ref+0x2e>
80003e72:	4472                	lw	s0,28(sp)
80003e74:	44e2                	lw	s1,24(sp)
80003e76:	4952                	lw	s2,20(sp)
80003e78:	49c2                	lw	s3,16(sp)
80003e7a:	4a32                	lw	s4,12(sp)
80003e7c:	6105                	addi	sp,sp,32
80003e7e:	8082                	ret

80003e80 <MiCo_Q2_MatMul_Ref>:
80003e80:	1101                	addi	sp,sp,-32
80003e82:	ca4a                	sw	s2,20(sp)
80003e84:	0005a903          	lw	s2,0(a1)
80003e88:	ce22                	sw	s0,28(sp)
80003e8a:	cc26                	sw	s1,24(sp)
80003e8c:	c84e                	sw	s3,16(sp)
80003e8e:	c652                	sw	s4,12(sp)
80003e90:	c456                	sw	s5,8(sp)
80003e92:	c25a                	sw	s6,4(sp)
80003e94:	c05e                	sw	s7,0(sp)
80003e96:	0045a803          	lw	a6,4(a1)
80003e9a:	421c                	lw	a5,0(a2)
80003e9c:	0c090363          	beqz	s2,80003f62 <MiCo_Q2_MatMul_Ref+0xe2>
80003ea0:	c3e9                	beqz	a5,80003f62 <MiCo_Q2_MatMul_Ref+0xe2>
80003ea2:	40f009b3          	neg	s3,a5
80003ea6:	078a                	slli	a5,a5,0x2
80003ea8:	82ae                	mv	t0,a1
80003eaa:	00f50fb3          	add	t6,a0,a5
80003eae:	00299a13          	slli	s4,s3,0x2
80003eb2:	83b2                	mv	t2,a2
80003eb4:	4e81                	li	t4,0
80003eb6:	4401                	li	s0,0
80003eb8:	4585                	li	a1,1
80003eba:	4509                	li	a0,2
80003ebc:	098e                	slli	s3,s3,0x3
80003ebe:	01fa04b3          	add	s1,s4,t6
80003ec2:	8f26                	mv	t5,s1
80003ec4:	4881                	li	a7,0
80003ec6:	4601                	li	a2,0
80003ec8:	08080163          	beqz	a6,80003f4a <MiCo_Q2_MatMul_Ref+0xca>
80003ecc:	0083ae03          	lw	t3,8(t2)
80003ed0:	0082a303          	lw	t1,8(t0)
80003ed4:	4681                	li	a3,0
80003ed6:	4601                	li	a2,0
80003ed8:	a039                	j	80003ee6 <MiCo_Q2_MatMul_Ref+0x66>
80003eda:	02ea8ab3          	mul	s5,s5,a4
80003ede:	0685                	addi	a3,a3,1
80003ee0:	9656                	add	a2,a2,s5
80003ee2:	06d80463          	beq	a6,a3,80003f4a <MiCo_Q2_MatMul_Ref+0xca>
80003ee6:	00d88733          	add	a4,a7,a3
80003eea:	8309                	srli	a4,a4,0x2
80003eec:	9772                	add	a4,a4,t3
80003eee:	00070703          	lb	a4,0(a4)
80003ef2:	0036fb13          	andi	s6,a3,3
80003ef6:	0b06                	slli	s6,s6,0x1
80003ef8:	41675733          	sra	a4,a4,s6
80003efc:	00de87b3          	add	a5,t4,a3
80003f00:	8b0d                	andi	a4,a4,3
80003f02:	ffd70a93          	addi	s5,a4,-3
80003f06:	8389                	srli	a5,a5,0x2
80003f08:	001abb93          	seqz	s7,s5
80003f0c:	979a                	add	a5,a5,t1
80003f0e:	4a85                	li	s5,1
80003f10:	00b70763          	beq	a4,a1,80003f1e <MiCo_Q2_MatMul_Ref+0x9e>
80003f14:	5af9                	li	s5,-2
80003f16:	00a70463          	beq	a4,a0,80003f1e <MiCo_Q2_MatMul_Ref+0x9e>
80003f1a:	41700ab3          	neg	s5,s7
80003f1e:	00078783          	lb	a5,0(a5)
80003f22:	4167d7b3          	sra	a5,a5,s6
80003f26:	8b8d                	andi	a5,a5,3
80003f28:	ffd78713          	addi	a4,a5,-3
80003f2c:	00173713          	seqz	a4,a4
80003f30:	40e00733          	neg	a4,a4
80003f34:	fab785e3          	beq	a5,a1,80003ede <MiCo_Q2_MatMul_Ref+0x5e>
80003f38:	faa791e3          	bne	a5,a0,80003eda <MiCo_Q2_MatMul_Ref+0x5a>
80003f3c:	41500ab3          	neg	s5,s5
80003f40:	0a86                	slli	s5,s5,0x1
80003f42:	0685                	addi	a3,a3,1
80003f44:	9656                	add	a2,a2,s5
80003f46:	fad810e3          	bne	a6,a3,80003ee6 <MiCo_Q2_MatMul_Ref+0x66>
80003f4a:	00cf2023          	sw	a2,0(t5)
80003f4e:	0f11                	addi	t5,t5,4
80003f50:	98c2                	add	a7,a7,a6
80003f52:	f7ff1ae3          	bne	t5,t6,80003ec6 <MiCo_Q2_MatMul_Ref+0x46>
80003f56:	0405                	addi	s0,s0,1
80003f58:	41348fb3          	sub	t6,s1,s3
80003f5c:	9ec2                	add	t4,t4,a6
80003f5e:	f68910e3          	bne	s2,s0,80003ebe <MiCo_Q2_MatMul_Ref+0x3e>
80003f62:	4472                	lw	s0,28(sp)
80003f64:	44e2                	lw	s1,24(sp)
80003f66:	4952                	lw	s2,20(sp)
80003f68:	49c2                	lw	s3,16(sp)
80003f6a:	4a32                	lw	s4,12(sp)
80003f6c:	4aa2                	lw	s5,8(sp)
80003f6e:	4b12                	lw	s6,4(sp)
80003f70:	4b82                	lw	s7,0(sp)
80003f72:	6105                	addi	sp,sp,32
80003f74:	8082                	ret

80003f76 <MiCo_Q2x1_MatMul_Ref>:
80003f76:	1101                	addi	sp,sp,-32
80003f78:	ca4a                	sw	s2,20(sp)
80003f7a:	0005a903          	lw	s2,0(a1)
80003f7e:	ce22                	sw	s0,28(sp)
80003f80:	cc26                	sw	s1,24(sp)
80003f82:	c84e                	sw	s3,16(sp)
80003f84:	c652                	sw	s4,12(sp)
80003f86:	c456                	sw	s5,8(sp)
80003f88:	c25a                	sw	s6,4(sp)
80003f8a:	82ae                	mv	t0,a1
80003f8c:	421c                	lw	a5,0(a2)
80003f8e:	41cc                	lw	a1,4(a1)
80003f90:	0a090a63          	beqz	s2,80004044 <MiCo_Q2x1_MatMul_Ref+0xce>
80003f94:	cbc5                	beqz	a5,80004044 <MiCo_Q2x1_MatMul_Ref+0xce>
80003f96:	40f009b3          	neg	s3,a5
80003f9a:	078a                	slli	a5,a5,0x2
80003f9c:	00299a13          	slli	s4,s3,0x2
80003fa0:	83b2                	mv	t2,a2
80003fa2:	00f50fb3          	add	t6,a0,a5
80003fa6:	4301                	li	t1,0
80003fa8:	4401                	li	s0,0
80003faa:	4e89                	li	t4,2
80003fac:	4e05                	li	t3,1
80003fae:	098e                	slli	s3,s3,0x3
80003fb0:	014f84b3          	add	s1,t6,s4
80003fb4:	8f26                	mv	t5,s1
80003fb6:	4501                	li	a0,0
80003fb8:	4601                	li	a2,0
80003fba:	c9ad                	beqz	a1,8000402c <MiCo_Q2x1_MatMul_Ref+0xb6>
80003fbc:	0083a883          	lw	a7,8(t2)
80003fc0:	0082a803          	lw	a6,8(t0)
80003fc4:	4701                	li	a4,0
80003fc6:	4601                	li	a2,0
80003fc8:	a039                	j	80003fd6 <MiCo_Q2x1_MatMul_Ref+0x60>
80003fca:	035686b3          	mul	a3,a3,s5
80003fce:	0705                	addi	a4,a4,1
80003fd0:	9636                	add	a2,a2,a3
80003fd2:	04e58d63          	beq	a1,a4,8000402c <MiCo_Q2x1_MatMul_Ref+0xb6>
80003fd6:	00e507b3          	add	a5,a0,a4
80003fda:	838d                	srli	a5,a5,0x3
80003fdc:	97c6                	add	a5,a5,a7
80003fde:	00078a83          	lb	s5,0(a5)
80003fe2:	00777793          	andi	a5,a4,7
80003fe6:	56fd                	li	a3,-1
80003fe8:	40fad7b3          	sra	a5,s5,a5
80003fec:	8b85                	andi	a5,a5,1
80003fee:	4b09                	li	s6,2
80003ff0:	e399                	bnez	a5,80003ff6 <MiCo_Q2x1_MatMul_Ref+0x80>
80003ff2:	5b79                	li	s6,-2
80003ff4:	4685                	li	a3,1
80003ff6:	00e307b3          	add	a5,t1,a4
80003ffa:	8389                	srli	a5,a5,0x2
80003ffc:	97c2                	add	a5,a5,a6
80003ffe:	00078783          	lb	a5,0(a5)
80004002:	00377a93          	andi	s5,a4,3
80004006:	0a86                	slli	s5,s5,0x1
80004008:	4157d7b3          	sra	a5,a5,s5
8000400c:	8b8d                	andi	a5,a5,3
8000400e:	ffd78a93          	addi	s5,a5,-3
80004012:	001aba93          	seqz	s5,s5
80004016:	41500ab3          	neg	s5,s5
8000401a:	fbc78ae3          	beq	a5,t3,80003fce <MiCo_Q2x1_MatMul_Ref+0x58>
8000401e:	fbd796e3          	bne	a5,t4,80003fca <MiCo_Q2x1_MatMul_Ref+0x54>
80004022:	86da                	mv	a3,s6
80004024:	0705                	addi	a4,a4,1
80004026:	9636                	add	a2,a2,a3
80004028:	fae597e3          	bne	a1,a4,80003fd6 <MiCo_Q2x1_MatMul_Ref+0x60>
8000402c:	00cf2023          	sw	a2,0(t5)
80004030:	0f11                	addi	t5,t5,4
80004032:	952e                	add	a0,a0,a1
80004034:	f9ff12e3          	bne	t5,t6,80003fb8 <MiCo_Q2x1_MatMul_Ref+0x42>
80004038:	0405                	addi	s0,s0,1
8000403a:	41348fb3          	sub	t6,s1,s3
8000403e:	932e                	add	t1,t1,a1
80004040:	f68918e3          	bne	s2,s0,80003fb0 <MiCo_Q2x1_MatMul_Ref+0x3a>
80004044:	4472                	lw	s0,28(sp)
80004046:	44e2                	lw	s1,24(sp)
80004048:	4952                	lw	s2,20(sp)
8000404a:	49c2                	lw	s3,16(sp)
8000404c:	4a32                	lw	s4,12(sp)
8000404e:	4aa2                	lw	s5,8(sp)
80004050:	4b12                	lw	s6,4(sp)
80004052:	6105                	addi	sp,sp,32
80004054:	8082                	ret

80004056 <MiCo_Q1_MatMul_Ref>:
80004056:	1101                	addi	sp,sp,-32
80004058:	ce22                	sw	s0,28(sp)
8000405a:	4180                	lw	s0,0(a1)
8000405c:	cc26                	sw	s1,24(sp)
8000405e:	ca4a                	sw	s2,20(sp)
80004060:	c84e                	sw	s3,16(sp)
80004062:	c652                	sw	s4,12(sp)
80004064:	c456                	sw	s5,8(sp)
80004066:	8f2e                	mv	t5,a1
80004068:	421c                	lw	a5,0(a2)
8000406a:	41cc                	lw	a1,4(a1)
8000406c:	c059                	beqz	s0,800040f2 <MiCo_Q1_MatMul_Ref+0x9c>
8000406e:	c3d1                	beqz	a5,800040f2 <MiCo_Q1_MatMul_Ref+0x9c>
80004070:	40f004b3          	neg	s1,a5
80004074:	078a                	slli	a5,a5,0x2
80004076:	00249913          	slli	s2,s1,0x2
8000407a:	8fb2                	mv	t6,a2
8000407c:	00f50eb3          	add	t4,a0,a5
80004080:	4301                	li	t1,0
80004082:	4281                	li	t0,0
80004084:	048e                	slli	s1,s1,0x3
80004086:	012e83b3          	add	t2,t4,s2
8000408a:	8e1e                	mv	t3,t2
8000408c:	4501                	li	a0,0
8000408e:	4601                	li	a2,0
80004090:	c5a9                	beqz	a1,800040da <MiCo_Q1_MatMul_Ref+0x84>
80004092:	008fa883          	lw	a7,8(t6)
80004096:	008f2803          	lw	a6,8(t5)
8000409a:	4781                	li	a5,0
8000409c:	4601                	li	a2,0
8000409e:	00f50733          	add	a4,a0,a5
800040a2:	830d                	srli	a4,a4,0x3
800040a4:	9746                	add	a4,a4,a7
800040a6:	00070683          	lb	a3,0(a4)
800040aa:	0077f993          	andi	s3,a5,7
800040ae:	5a7d                	li	s4,-1
800040b0:	4136d6b3          	sra	a3,a3,s3
800040b4:	8a85                	andi	a3,a3,1
800040b6:	4a85                	li	s5,1
800040b8:	c299                	beqz	a3,800040be <MiCo_Q1_MatMul_Ref+0x68>
800040ba:	4a05                	li	s4,1
800040bc:	5afd                	li	s5,-1
800040be:	006786b3          	add	a3,a5,t1
800040c2:	828d                	srli	a3,a3,0x3
800040c4:	96c2                	add	a3,a3,a6
800040c6:	00068703          	lb	a4,0(a3)
800040ca:	0785                	addi	a5,a5,1
800040cc:	41375733          	sra	a4,a4,s3
800040d0:	8b05                	andi	a4,a4,1
800040d2:	cb05                	beqz	a4,80004102 <MiCo_Q1_MatMul_Ref+0xac>
800040d4:	9652                	add	a2,a2,s4
800040d6:	fcb794e3          	bne	a5,a1,8000409e <MiCo_Q1_MatMul_Ref+0x48>
800040da:	00ce2023          	sw	a2,0(t3)
800040de:	0e11                	addi	t3,t3,4
800040e0:	952e                	add	a0,a0,a1
800040e2:	fbde16e3          	bne	t3,t4,8000408e <MiCo_Q1_MatMul_Ref+0x38>
800040e6:	0285                	addi	t0,t0,1
800040e8:	40938eb3          	sub	t4,t2,s1
800040ec:	932e                	add	t1,t1,a1
800040ee:	f8541ce3          	bne	s0,t0,80004086 <MiCo_Q1_MatMul_Ref+0x30>
800040f2:	4472                	lw	s0,28(sp)
800040f4:	44e2                	lw	s1,24(sp)
800040f6:	4952                	lw	s2,20(sp)
800040f8:	49c2                	lw	s3,16(sp)
800040fa:	4a32                	lw	s4,12(sp)
800040fc:	4aa2                	lw	s5,8(sp)
800040fe:	6105                	addi	sp,sp,32
80004100:	8082                	ret
80004102:	9656                	add	a2,a2,s5
80004104:	f8f59de3          	bne	a1,a5,8000409e <MiCo_Q1_MatMul_Ref+0x48>
80004108:	00ce2023          	sw	a2,0(t3)
8000410c:	0e11                	addi	t3,t3,4
8000410e:	952e                	add	a0,a0,a1
80004110:	f7de1fe3          	bne	t3,t4,8000408e <MiCo_Q1_MatMul_Ref+0x38>
80004114:	bfc9                	j	800040e6 <MiCo_Q1_MatMul_Ref+0x90>

80004116 <MiCo_Q4x8_MatMul_Ref>:
80004116:	1141                	addi	sp,sp,-16
80004118:	c426                	sw	s1,8(sp)
8000411a:	4184                	lw	s1,0(a1)
8000411c:	c622                	sw	s0,12(sp)
8000411e:	c24a                	sw	s2,4(sp)
80004120:	c04e                	sw	s3,0(sp)
80004122:	0045a803          	lw	a6,4(a1)
80004126:	421c                	lw	a5,0(a2)
80004128:	ccbd                	beqz	s1,800041a6 <MiCo_Q4x8_MatMul_Ref+0x90>
8000412a:	cfb5                	beqz	a5,800041a6 <MiCo_Q4x8_MatMul_Ref+0x90>
8000412c:	40f00933          	neg	s2,a5
80004130:	078a                	slli	a5,a5,0x2
80004132:	00291993          	slli	s3,s2,0x2
80004136:	8fae                	mv	t6,a1
80004138:	82b2                	mv	t0,a2
8000413a:	00f50f33          	add	t5,a0,a5
8000413e:	4e01                	li	t3,0
80004140:	4381                	li	t2,0
80004142:	090e                	slli	s2,s2,0x3
80004144:	01e98433          	add	s0,s3,t5
80004148:	8ea2                	mv	t4,s0
8000414a:	4501                	li	a0,0
8000414c:	4581                	li	a1,0
8000414e:	04080063          	beqz	a6,8000418e <MiCo_Q4x8_MatMul_Ref+0x78>
80004152:	008fa303          	lw	t1,8(t6)
80004156:	0082a883          	lw	a7,8(t0)
8000415a:	4701                	li	a4,0
8000415c:	4581                	li	a1,0
8000415e:	01c707b3          	add	a5,a4,t3
80004162:	8385                	srli	a5,a5,0x1
80004164:	979a                	add	a5,a5,t1
80004166:	00078783          	lb	a5,0(a5)
8000416a:	00177613          	andi	a2,a4,1
8000416e:	00a706b3          	add	a3,a4,a0
80004172:	060a                	slli	a2,a2,0x2
80004174:	96c6                	add	a3,a3,a7
80004176:	00068683          	lb	a3,0(a3)
8000417a:	40c7d7b3          	sra	a5,a5,a2
8000417e:	07f2                	slli	a5,a5,0x1c
80004180:	87f1                	srai	a5,a5,0x1c
80004182:	02f687b3          	mul	a5,a3,a5
80004186:	0705                	addi	a4,a4,1
80004188:	95be                	add	a1,a1,a5
8000418a:	fce81ae3          	bne	a6,a4,8000415e <MiCo_Q4x8_MatMul_Ref+0x48>
8000418e:	00bea023          	sw	a1,0(t4)
80004192:	0e91                	addi	t4,t4,4
80004194:	9542                	add	a0,a0,a6
80004196:	fbdf1be3          	bne	t5,t4,8000414c <MiCo_Q4x8_MatMul_Ref+0x36>
8000419a:	0385                	addi	t2,t2,1
8000419c:	41240f33          	sub	t5,s0,s2
800041a0:	9e42                	add	t3,t3,a6
800041a2:	fa7491e3          	bne	s1,t2,80004144 <MiCo_Q4x8_MatMul_Ref+0x2e>
800041a6:	4432                	lw	s0,12(sp)
800041a8:	44a2                	lw	s1,8(sp)
800041aa:	4912                	lw	s2,4(sp)
800041ac:	4982                	lw	s3,0(sp)
800041ae:	0141                	addi	sp,sp,16
800041b0:	8082                	ret

800041b2 <MiCo_Q2x8_MatMul_Ref>:
800041b2:	1101                	addi	sp,sp,-32
800041b4:	ca4a                	sw	s2,20(sp)
800041b6:	0005a903          	lw	s2,0(a1)
800041ba:	ce22                	sw	s0,28(sp)
800041bc:	cc26                	sw	s1,24(sp)
800041be:	c84e                	sw	s3,16(sp)
800041c0:	c652                	sw	s4,12(sp)
800041c2:	c456                	sw	s5,8(sp)
800041c4:	c25a                	sw	s6,4(sp)
800041c6:	82ae                	mv	t0,a1
800041c8:	421c                	lw	a5,0(a2)
800041ca:	41cc                	lw	a1,4(a1)
800041cc:	08090b63          	beqz	s2,80004262 <MiCo_Q2x8_MatMul_Ref+0xb0>
800041d0:	cbc9                	beqz	a5,80004262 <MiCo_Q2x8_MatMul_Ref+0xb0>
800041d2:	40f009b3          	neg	s3,a5
800041d6:	078a                	slli	a5,a5,0x2
800041d8:	00299a13          	slli	s4,s3,0x2
800041dc:	83b2                	mv	t2,a2
800041de:	00f50fb3          	add	t6,a0,a5
800041e2:	4301                	li	t1,0
800041e4:	4401                	li	s0,0
800041e6:	4e05                	li	t3,1
800041e8:	4e89                	li	t4,2
800041ea:	098e                	slli	s3,s3,0x3
800041ec:	01fa04b3          	add	s1,s4,t6
800041f0:	8f26                	mv	t5,s1
800041f2:	4501                	li	a0,0
800041f4:	4601                	li	a2,0
800041f6:	c9b1                	beqz	a1,8000424a <MiCo_Q2x8_MatMul_Ref+0x98>
800041f8:	0082a883          	lw	a7,8(t0)
800041fc:	0083a803          	lw	a6,8(t2)
80004200:	4701                	li	a4,0
80004202:	4601                	li	a2,0
80004204:	006707b3          	add	a5,a4,t1
80004208:	8389                	srli	a5,a5,0x2
8000420a:	97c6                	add	a5,a5,a7
8000420c:	00078783          	lb	a5,0(a5)
80004210:	00377a93          	andi	s5,a4,3
80004214:	0a86                	slli	s5,s5,0x1
80004216:	4157d7b3          	sra	a5,a5,s5
8000421a:	8b8d                	andi	a5,a5,3
8000421c:	00e506b3          	add	a3,a0,a4
80004220:	ffd78a93          	addi	s5,a5,-3
80004224:	96c2                	add	a3,a3,a6
80004226:	0705                	addi	a4,a4,1
80004228:	001aba93          	seqz	s5,s5
8000422c:	4b05                	li	s6,1
8000422e:	01c78763          	beq	a5,t3,8000423c <MiCo_Q2x8_MatMul_Ref+0x8a>
80004232:	5b79                	li	s6,-2
80004234:	01d78463          	beq	a5,t4,8000423c <MiCo_Q2x8_MatMul_Ref+0x8a>
80004238:	41500b33          	neg	s6,s5
8000423c:	00068783          	lb	a5,0(a3)
80004240:	036787b3          	mul	a5,a5,s6
80004244:	963e                	add	a2,a2,a5
80004246:	fae59fe3          	bne	a1,a4,80004204 <MiCo_Q2x8_MatMul_Ref+0x52>
8000424a:	00cf2023          	sw	a2,0(t5)
8000424e:	0f11                	addi	t5,t5,4
80004250:	952e                	add	a0,a0,a1
80004252:	fbff11e3          	bne	t5,t6,800041f4 <MiCo_Q2x8_MatMul_Ref+0x42>
80004256:	0405                	addi	s0,s0,1
80004258:	41348fb3          	sub	t6,s1,s3
8000425c:	932e                	add	t1,t1,a1
8000425e:	f88917e3          	bne	s2,s0,800041ec <MiCo_Q2x8_MatMul_Ref+0x3a>
80004262:	4472                	lw	s0,28(sp)
80004264:	44e2                	lw	s1,24(sp)
80004266:	4952                	lw	s2,20(sp)
80004268:	49c2                	lw	s3,16(sp)
8000426a:	4a32                	lw	s4,12(sp)
8000426c:	4aa2                	lw	s5,8(sp)
8000426e:	4b12                	lw	s6,4(sp)
80004270:	6105                	addi	sp,sp,32
80004272:	8082                	ret

80004274 <MiCo_Q1x8_MatMul_Ref>:
80004274:	1101                	addi	sp,sp,-32
80004276:	cc26                	sw	s1,24(sp)
80004278:	4184                	lw	s1,0(a1)
8000427a:	ce22                	sw	s0,28(sp)
8000427c:	ca4a                	sw	s2,20(sp)
8000427e:	c84e                	sw	s3,16(sp)
80004280:	c652                	sw	s4,12(sp)
80004282:	0045a883          	lw	a7,4(a1)
80004286:	421c                	lw	a5,0(a2)
80004288:	cca5                	beqz	s1,80004300 <MiCo_Q1x8_MatMul_Ref+0x8c>
8000428a:	cbbd                	beqz	a5,80004300 <MiCo_Q1x8_MatMul_Ref+0x8c>
8000428c:	40f00933          	neg	s2,a5
80004290:	078a                	slli	a5,a5,0x2
80004292:	00291993          	slli	s3,s2,0x2
80004296:	8fae                	mv	t6,a1
80004298:	82b2                	mv	t0,a2
8000429a:	00f50f33          	add	t5,a0,a5
8000429e:	4e01                	li	t3,0
800042a0:	4381                	li	t2,0
800042a2:	090e                	slli	s2,s2,0x3
800042a4:	013f0433          	add	s0,t5,s3
800042a8:	8ea2                	mv	t4,s0
800042aa:	4581                	li	a1,0
800042ac:	4501                	li	a0,0
800042ae:	02088d63          	beqz	a7,800042e8 <MiCo_Q1x8_MatMul_Ref+0x74>
800042b2:	008fa303          	lw	t1,8(t6)
800042b6:	0082a803          	lw	a6,8(t0)
800042ba:	4781                	li	a5,0
800042bc:	4501                	li	a0,0
800042be:	01c78733          	add	a4,a5,t3
800042c2:	830d                	srli	a4,a4,0x3
800042c4:	971a                	add	a4,a4,t1
800042c6:	00070703          	lb	a4,0(a4)
800042ca:	0077fa13          	andi	s4,a5,7
800042ce:	00f58633          	add	a2,a1,a5
800042d2:	41475733          	sra	a4,a4,s4
800042d6:	8b05                	andi	a4,a4,1
800042d8:	9642                	add	a2,a2,a6
800042da:	cb15                	beqz	a4,8000430e <MiCo_Q1x8_MatMul_Ref+0x9a>
800042dc:	00060703          	lb	a4,0(a2)
800042e0:	0785                	addi	a5,a5,1
800042e2:	8d19                	sub	a0,a0,a4
800042e4:	fd179de3          	bne	a5,a7,800042be <MiCo_Q1x8_MatMul_Ref+0x4a>
800042e8:	00aea023          	sw	a0,0(t4)
800042ec:	0e91                	addi	t4,t4,4
800042ee:	95c6                	add	a1,a1,a7
800042f0:	fbee9ee3          	bne	t4,t5,800042ac <MiCo_Q1x8_MatMul_Ref+0x38>
800042f4:	0385                	addi	t2,t2,1
800042f6:	41240f33          	sub	t5,s0,s2
800042fa:	9e46                	add	t3,t3,a7
800042fc:	fa7494e3          	bne	s1,t2,800042a4 <MiCo_Q1x8_MatMul_Ref+0x30>
80004300:	4472                	lw	s0,28(sp)
80004302:	44e2                	lw	s1,24(sp)
80004304:	4952                	lw	s2,20(sp)
80004306:	49c2                	lw	s3,16(sp)
80004308:	4a32                	lw	s4,12(sp)
8000430a:	6105                	addi	sp,sp,32
8000430c:	8082                	ret
8000430e:	00060703          	lb	a4,0(a2)
80004312:	0785                	addi	a5,a5,1
80004314:	953a                	add	a0,a0,a4
80004316:	faf894e3          	bne	a7,a5,800042be <MiCo_Q1x8_MatMul_Ref+0x4a>
8000431a:	00aea023          	sw	a0,0(t4)
8000431e:	0e91                	addi	t4,t4,4
80004320:	95c6                	add	a1,a1,a7
80004322:	f9ee95e3          	bne	t4,t5,800042ac <MiCo_Q1x8_MatMul_Ref+0x38>
80004326:	b7f9                	j	800042f4 <MiCo_Q1x8_MatMul_Ref+0x80>

80004328 <MiCo_Q2x4_MatMul_Ref>:
80004328:	1101                	addi	sp,sp,-32
8000432a:	c84e                	sw	s3,16(sp)
8000432c:	0005a983          	lw	s3,0(a1)
80004330:	ce22                	sw	s0,28(sp)
80004332:	cc26                	sw	s1,24(sp)
80004334:	ca4a                	sw	s2,20(sp)
80004336:	c652                	sw	s4,12(sp)
80004338:	c456                	sw	s5,8(sp)
8000433a:	c25a                	sw	s6,4(sp)
8000433c:	c05e                	sw	s7,0(sp)
8000433e:	0045a803          	lw	a6,4(a1)
80004342:	421c                	lw	a5,0(a2)
80004344:	0a098663          	beqz	s3,800043f0 <MiCo_Q2x4_MatMul_Ref+0xc8>
80004348:	c7c5                	beqz	a5,800043f0 <MiCo_Q2x4_MatMul_Ref+0xc8>
8000434a:	40f00a33          	neg	s4,a5
8000434e:	078a                	slli	a5,a5,0x2
80004350:	002a1a93          	slli	s5,s4,0x2
80004354:	83ae                	mv	t2,a1
80004356:	8432                	mv	s0,a2
80004358:	00f502b3          	add	t0,a0,a5
8000435c:	4e01                	li	t3,0
8000435e:	4481                	li	s1,0
80004360:	4e85                	li	t4,1
80004362:	4f09                	li	t5,2
80004364:	0a0e                	slli	s4,s4,0x3
80004366:	005a8933          	add	s2,s5,t0
8000436a:	8fca                	mv	t6,s2
8000436c:	4501                	li	a0,0
8000436e:	4581                	li	a1,0
80004370:	06080463          	beqz	a6,800043d8 <MiCo_Q2x4_MatMul_Ref+0xb0>
80004374:	0083a303          	lw	t1,8(t2)
80004378:	00842883          	lw	a7,8(s0)
8000437c:	4681                	li	a3,0
8000437e:	4581                	li	a1,0
80004380:	00de0733          	add	a4,t3,a3
80004384:	8309                	srli	a4,a4,0x2
80004386:	971a                	add	a4,a4,t1
80004388:	0016f793          	andi	a5,a3,1
8000438c:	00070703          	lb	a4,0(a4)
80004390:	00279b13          	slli	s6,a5,0x2
80004394:	0036f793          	andi	a5,a3,3
80004398:	0786                	slli	a5,a5,0x1
8000439a:	40f75733          	sra	a4,a4,a5
8000439e:	00d50633          	add	a2,a0,a3
800043a2:	8b0d                	andi	a4,a4,3
800043a4:	8205                	srli	a2,a2,0x1
800043a6:	ffd70793          	addi	a5,a4,-3
800043aa:	9646                	add	a2,a2,a7
800043ac:	0685                	addi	a3,a3,1
800043ae:	0017b793          	seqz	a5,a5
800043b2:	4b85                	li	s7,1
800043b4:	01d70763          	beq	a4,t4,800043c2 <MiCo_Q2x4_MatMul_Ref+0x9a>
800043b8:	5bf9                	li	s7,-2
800043ba:	01e70463          	beq	a4,t5,800043c2 <MiCo_Q2x4_MatMul_Ref+0x9a>
800043be:	40f00bb3          	neg	s7,a5
800043c2:	00060783          	lb	a5,0(a2)
800043c6:	4167d7b3          	sra	a5,a5,s6
800043ca:	07f2                	slli	a5,a5,0x1c
800043cc:	87f1                	srai	a5,a5,0x1c
800043ce:	037787b3          	mul	a5,a5,s7
800043d2:	95be                	add	a1,a1,a5
800043d4:	fad816e3          	bne	a6,a3,80004380 <MiCo_Q2x4_MatMul_Ref+0x58>
800043d8:	00bfa023          	sw	a1,0(t6)
800043dc:	0f91                	addi	t6,t6,4
800043de:	9542                	add	a0,a0,a6
800043e0:	f85f97e3          	bne	t6,t0,8000436e <MiCo_Q2x4_MatMul_Ref+0x46>
800043e4:	0485                	addi	s1,s1,1
800043e6:	414902b3          	sub	t0,s2,s4
800043ea:	9e42                	add	t3,t3,a6
800043ec:	f6999de3          	bne	s3,s1,80004366 <MiCo_Q2x4_MatMul_Ref+0x3e>
800043f0:	4472                	lw	s0,28(sp)
800043f2:	44e2                	lw	s1,24(sp)
800043f4:	4952                	lw	s2,20(sp)
800043f6:	49c2                	lw	s3,16(sp)
800043f8:	4a32                	lw	s4,12(sp)
800043fa:	4aa2                	lw	s5,8(sp)
800043fc:	4b12                	lw	s6,4(sp)
800043fe:	4b82                	lw	s7,0(sp)
80004400:	6105                	addi	sp,sp,32
80004402:	8082                	ret

80004404 <MiCo_Q1x4_MatMul_Ref>:
80004404:	1101                	addi	sp,sp,-32
80004406:	ce22                	sw	s0,28(sp)
80004408:	4180                	lw	s0,0(a1)
8000440a:	cc26                	sw	s1,24(sp)
8000440c:	ca4a                	sw	s2,20(sp)
8000440e:	c84e                	sw	s3,16(sp)
80004410:	c652                	sw	s4,12(sp)
80004412:	8f2e                	mv	t5,a1
80004414:	421c                	lw	a5,0(a2)
80004416:	41cc                	lw	a1,4(a1)
80004418:	c459                	beqz	s0,800044a6 <MiCo_Q1x4_MatMul_Ref+0xa2>
8000441a:	c7d1                	beqz	a5,800044a6 <MiCo_Q1x4_MatMul_Ref+0xa2>
8000441c:	40f004b3          	neg	s1,a5
80004420:	078a                	slli	a5,a5,0x2
80004422:	00249913          	slli	s2,s1,0x2
80004426:	8fb2                	mv	t6,a2
80004428:	00f50eb3          	add	t4,a0,a5
8000442c:	4301                	li	t1,0
8000442e:	4281                	li	t0,0
80004430:	048e                	slli	s1,s1,0x3
80004432:	01d903b3          	add	t2,s2,t4
80004436:	8e1e                	mv	t3,t2
80004438:	4501                	li	a0,0
8000443a:	4601                	li	a2,0
8000443c:	c9a9                	beqz	a1,8000448e <MiCo_Q1x4_MatMul_Ref+0x8a>
8000443e:	008f2883          	lw	a7,8(t5)
80004442:	008fa803          	lw	a6,8(t6)
80004446:	4681                	li	a3,0
80004448:	4601                	li	a2,0
8000444a:	00d30733          	add	a4,t1,a3
8000444e:	00d507b3          	add	a5,a0,a3
80004452:	830d                	srli	a4,a4,0x3
80004454:	9746                	add	a4,a4,a7
80004456:	8385                	srli	a5,a5,0x1
80004458:	00070703          	lb	a4,0(a4)
8000445c:	97c2                	add	a5,a5,a6
8000445e:	00078783          	lb	a5,0(a5)
80004462:	0076fa13          	andi	s4,a3,7
80004466:	0016f993          	andi	s3,a3,1
8000446a:	41475733          	sra	a4,a4,s4
8000446e:	098a                	slli	s3,s3,0x2
80004470:	8b05                	andi	a4,a4,1
80004472:	4137d7b3          	sra	a5,a5,s3
80004476:	40e00733          	neg	a4,a4
8000447a:	07f2                	slli	a5,a5,0x1c
8000447c:	00176713          	ori	a4,a4,1
80004480:	87f1                	srai	a5,a5,0x1c
80004482:	02e787b3          	mul	a5,a5,a4
80004486:	0685                	addi	a3,a3,1
80004488:	963e                	add	a2,a2,a5
8000448a:	fcd590e3          	bne	a1,a3,8000444a <MiCo_Q1x4_MatMul_Ref+0x46>
8000448e:	00ce2023          	sw	a2,0(t3)
80004492:	0e11                	addi	t3,t3,4
80004494:	952e                	add	a0,a0,a1
80004496:	fbde12e3          	bne	t3,t4,8000443a <MiCo_Q1x4_MatMul_Ref+0x36>
8000449a:	0285                	addi	t0,t0,1
8000449c:	40938eb3          	sub	t4,t2,s1
800044a0:	932e                	add	t1,t1,a1
800044a2:	f85418e3          	bne	s0,t0,80004432 <MiCo_Q1x4_MatMul_Ref+0x2e>
800044a6:	4472                	lw	s0,28(sp)
800044a8:	44e2                	lw	s1,24(sp)
800044aa:	4952                	lw	s2,20(sp)
800044ac:	49c2                	lw	s3,16(sp)
800044ae:	4a32                	lw	s4,12(sp)
800044b0:	6105                	addi	sp,sp,32
800044b2:	8082                	ret

800044b4 <MiCo_Q1x2_MatMul_Ref>:
800044b4:	1101                	addi	sp,sp,-32
800044b6:	ca4a                	sw	s2,20(sp)
800044b8:	0005a903          	lw	s2,0(a1)
800044bc:	ce22                	sw	s0,28(sp)
800044be:	cc26                	sw	s1,24(sp)
800044c0:	c84e                	sw	s3,16(sp)
800044c2:	c652                	sw	s4,12(sp)
800044c4:	c456                	sw	s5,8(sp)
800044c6:	c25a                	sw	s6,4(sp)
800044c8:	82ae                	mv	t0,a1
800044ca:	421c                	lw	a5,0(a2)
800044cc:	41cc                	lw	a1,4(a1)
800044ce:	0a090a63          	beqz	s2,80004582 <MiCo_Q1x2_MatMul_Ref+0xce>
800044d2:	cbc5                	beqz	a5,80004582 <MiCo_Q1x2_MatMul_Ref+0xce>
800044d4:	40f009b3          	neg	s3,a5
800044d8:	078a                	slli	a5,a5,0x2
800044da:	00299a13          	slli	s4,s3,0x2
800044de:	83b2                	mv	t2,a2
800044e0:	00f50fb3          	add	t6,a0,a5
800044e4:	4301                	li	t1,0
800044e6:	4401                	li	s0,0
800044e8:	4e89                	li	t4,2
800044ea:	4e05                	li	t3,1
800044ec:	098e                	slli	s3,s3,0x3
800044ee:	014f84b3          	add	s1,t6,s4
800044f2:	8f26                	mv	t5,s1
800044f4:	4501                	li	a0,0
800044f6:	4601                	li	a2,0
800044f8:	c9ad                	beqz	a1,8000456a <MiCo_Q1x2_MatMul_Ref+0xb6>
800044fa:	0082a883          	lw	a7,8(t0)
800044fe:	0083a803          	lw	a6,8(t2)
80004502:	4701                	li	a4,0
80004504:	4601                	li	a2,0
80004506:	a039                	j	80004514 <MiCo_Q1x2_MatMul_Ref+0x60>
80004508:	035686b3          	mul	a3,a3,s5
8000450c:	0705                	addi	a4,a4,1
8000450e:	9636                	add	a2,a2,a3
80004510:	04e58d63          	beq	a1,a4,8000456a <MiCo_Q1x2_MatMul_Ref+0xb6>
80004514:	00e307b3          	add	a5,t1,a4
80004518:	838d                	srli	a5,a5,0x3
8000451a:	97c6                	add	a5,a5,a7
8000451c:	00078a83          	lb	s5,0(a5)
80004520:	00777793          	andi	a5,a4,7
80004524:	56fd                	li	a3,-1
80004526:	40fad7b3          	sra	a5,s5,a5
8000452a:	8b85                	andi	a5,a5,1
8000452c:	4b09                	li	s6,2
8000452e:	e399                	bnez	a5,80004534 <MiCo_Q1x2_MatMul_Ref+0x80>
80004530:	5b79                	li	s6,-2
80004532:	4685                	li	a3,1
80004534:	00e507b3          	add	a5,a0,a4
80004538:	8389                	srli	a5,a5,0x2
8000453a:	97c2                	add	a5,a5,a6
8000453c:	00078783          	lb	a5,0(a5)
80004540:	00377a93          	andi	s5,a4,3
80004544:	0a86                	slli	s5,s5,0x1
80004546:	4157d7b3          	sra	a5,a5,s5
8000454a:	8b8d                	andi	a5,a5,3
8000454c:	ffd78a93          	addi	s5,a5,-3
80004550:	001aba93          	seqz	s5,s5
80004554:	41500ab3          	neg	s5,s5
80004558:	fbc78ae3          	beq	a5,t3,8000450c <MiCo_Q1x2_MatMul_Ref+0x58>
8000455c:	fbd796e3          	bne	a5,t4,80004508 <MiCo_Q1x2_MatMul_Ref+0x54>
80004560:	86da                	mv	a3,s6
80004562:	0705                	addi	a4,a4,1
80004564:	9636                	add	a2,a2,a3
80004566:	fae597e3          	bne	a1,a4,80004514 <MiCo_Q1x2_MatMul_Ref+0x60>
8000456a:	00cf2023          	sw	a2,0(t5)
8000456e:	0f11                	addi	t5,t5,4
80004570:	952e                	add	a0,a0,a1
80004572:	f9ff12e3          	bne	t5,t6,800044f6 <MiCo_Q1x2_MatMul_Ref+0x42>
80004576:	0405                	addi	s0,s0,1
80004578:	41348fb3          	sub	t6,s1,s3
8000457c:	932e                	add	t1,t1,a1
8000457e:	f68918e3          	bne	s2,s0,800044ee <MiCo_Q1x2_MatMul_Ref+0x3a>
80004582:	4472                	lw	s0,28(sp)
80004584:	44e2                	lw	s1,24(sp)
80004586:	4952                	lw	s2,20(sp)
80004588:	49c2                	lw	s3,16(sp)
8000458a:	4a32                	lw	s4,12(sp)
8000458c:	4aa2                	lw	s5,8(sp)
8000458e:	4b12                	lw	s6,4(sp)
80004590:	6105                	addi	sp,sp,32
80004592:	8082                	ret

80004594 <roundf2i>:
80004594:	c0054553          	fcvt.w.s	a0,fa0,rmm
80004598:	8082                	ret

8000459a <roundf2f>:
8000459a:	c00547d3          	fcvt.w.s	a5,fa0,rmm
8000459e:	d007f553          	fcvt.s.w	fa0,a5
800045a2:	8082                	ret

800045a4 <MiCo_absmax>:
800045a4:	f0000553          	fmv.w.x	fa0,zero
800045a8:	c58d                	beqz	a1,800045d2 <MiCo_absmax+0x2e>
800045aa:	20a50753          	fmv.s	fa4,fa0
800045ae:	058a                	slli	a1,a1,0x2
800045b0:	00b50733          	add	a4,a0,a1
800045b4:	611c                	flw	fa5,0(a0)
800045b6:	0511                	addi	a0,a0,4
800045b8:	a0e797d3          	flt.s	a5,fa5,fa4
800045bc:	c399                	beqz	a5,800045c2 <MiCo_absmax+0x1e>
800045be:	20f797d3          	fneg.s	fa5,fa5
800045c2:	a0f517d3          	flt.s	a5,fa0,fa5
800045c6:	c399                	beqz	a5,800045cc <MiCo_absmax+0x28>
800045c8:	20f78553          	fmv.s	fa0,fa5
800045cc:	fea714e3          	bne	a4,a0,800045b4 <MiCo_absmax+0x10>
800045d0:	8082                	ret
800045d2:	8082                	ret

800045d4 <MiCo_absmean>:
800045d4:	f0000753          	fmv.w.x	fa4,zero
800045d8:	c18d                	beqz	a1,800045fa <MiCo_absmean+0x26>
800045da:	20e706d3          	fmv.s	fa3,fa4
800045de:	00259713          	slli	a4,a1,0x2
800045e2:	972a                	add	a4,a4,a0
800045e4:	611c                	flw	fa5,0(a0)
800045e6:	0511                	addi	a0,a0,4
800045e8:	a0f697d3          	flt.s	a5,fa3,fa5
800045ec:	e399                	bnez	a5,800045f2 <MiCo_absmean+0x1e>
800045ee:	20f797d3          	fneg.s	fa5,fa5
800045f2:	00f77753          	fadd.s	fa4,fa4,fa5
800045f6:	fea717e3          	bne	a4,a0,800045e4 <MiCo_absmean+0x10>
800045fa:	d005f553          	fcvt.s.w	fa0,a1
800045fe:	18a77553          	fdiv.s	fa0,fa4,fa0
80004602:	8082                	ret

80004604 <__FP32toQ8>:
80004604:	1101                	addi	sp,sp,-32
80004606:	ca26                	sw	s1,20(sp)
80004608:	84ae                	mv	s1,a1
8000460a:	cc22                	sw	s0,24(sp)
8000460c:	85b2                	mv	a1,a2
8000460e:	842a                	mv	s0,a0
80004610:	8526                	mv	a0,s1
80004612:	c84a                	sw	s2,16(sp)
80004614:	e622                	fsw	fs0,12(sp)
80004616:	ce06                	sw	ra,28(sp)
80004618:	8932                	mv	s2,a2
8000461a:	3769                	jal	800045a4 <MiCo_absmax>
8000461c:	00007797          	auipc	a5,0x7
80004620:	1787a407          	flw	fs0,376(a5) # 8000b794 <__malloc_trim_threshold+0x24>
80004624:	18a47453          	fdiv.s	fs0,fs0,fa0
80004628:	00090d63          	beqz	s2,80004642 <__FP32toQ8+0x3e>
8000462c:	9922                	add	s2,s2,s0
8000462e:	6088                	flw	fa0,0(s1)
80004630:	0405                	addi	s0,s0,1
80004632:	0491                	addi	s1,s1,4
80004634:	10a47553          	fmul.s	fa0,fs0,fa0
80004638:	3fb1                	jal	80004594 <roundf2i>
8000463a:	fea40fa3          	sb	a0,-1(s0)
8000463e:	ff2418e3          	bne	s0,s2,8000462e <__FP32toQ8+0x2a>
80004642:	40f2                	lw	ra,28(sp)
80004644:	4462                	lw	s0,24(sp)
80004646:	00007797          	auipc	a5,0x7
8000464a:	1467a507          	flw	fa0,326(a5) # 8000b78c <__malloc_trim_threshold+0x1c>
8000464e:	44d2                	lw	s1,20(sp)
80004650:	4942                	lw	s2,16(sp)
80004652:	18857553          	fdiv.s	fa0,fa0,fs0
80004656:	6432                	flw	fs0,12(sp)
80004658:	6105                	addi	sp,sp,32
8000465a:	8082                	ret

8000465c <__FP32toQ4>:
8000465c:	7179                	addi	sp,sp,-48
8000465e:	d226                	sw	s1,36(sp)
80004660:	84ae                	mv	s1,a1
80004662:	cc52                	sw	s4,24(sp)
80004664:	85b2                	mv	a1,a2
80004666:	8a2a                	mv	s4,a0
80004668:	8526                	mv	a0,s1
8000466a:	ce4e                	sw	s3,28(sp)
8000466c:	e622                	fsw	fs0,12(sp)
8000466e:	d606                	sw	ra,44(sp)
80004670:	d422                	sw	s0,40(sp)
80004672:	d04a                	sw	s2,32(sp)
80004674:	ca56                	sw	s5,20(sp)
80004676:	89b2                	mv	s3,a2
80004678:	3735                	jal	800045a4 <MiCo_absmax>
8000467a:	00007797          	auipc	a5,0x7
8000467e:	11e7a407          	flw	fs0,286(a5) # 8000b798 <__malloc_trim_threshold+0x28>
80004682:	18a47453          	fdiv.s	fs0,fs0,fa0
80004686:	02098e63          	beqz	s3,800046c2 <__FP32toQ4+0x66>
8000468a:	6a85                	lui	s5,0x1
8000468c:	4901                	li	s2,0
8000468e:	1ac1                	addi	s5,s5,-16
80004690:	6088                	flw	fa0,0(s1)
80004692:	04a1                	addi	s1,s1,8
80004694:	10a47553          	fmul.s	fa0,fs0,fa0
80004698:	3df5                	jal	80004594 <roundf2i>
8000469a:	ffc4a507          	flw	fa0,-4(s1)
8000469e:	842a                	mv	s0,a0
800046a0:	883d                	andi	s0,s0,15
800046a2:	10a47553          	fmul.s	fa0,fs0,fa0
800046a6:	35fd                	jal	80004594 <roundf2i>
800046a8:	00451793          	slli	a5,a0,0x4
800046ac:	40195713          	srai	a4,s2,0x1
800046b0:	0157f7b3          	and	a5,a5,s5
800046b4:	9752                	add	a4,a4,s4
800046b6:	8fc1                	or	a5,a5,s0
800046b8:	00f70023          	sb	a5,0(a4)
800046bc:	0909                	addi	s2,s2,2
800046be:	fd3969e3          	bltu	s2,s3,80004690 <__FP32toQ4+0x34>
800046c2:	50b2                	lw	ra,44(sp)
800046c4:	5422                	lw	s0,40(sp)
800046c6:	00007797          	auipc	a5,0x7
800046ca:	0c67a507          	flw	fa0,198(a5) # 8000b78c <__malloc_trim_threshold+0x1c>
800046ce:	18857553          	fdiv.s	fa0,fa0,fs0
800046d2:	5492                	lw	s1,36(sp)
800046d4:	5902                	lw	s2,32(sp)
800046d6:	49f2                	lw	s3,28(sp)
800046d8:	4a62                	lw	s4,24(sp)
800046da:	4ad2                	lw	s5,20(sp)
800046dc:	6432                	flw	fs0,12(sp)
800046de:	6145                	addi	sp,sp,48
800046e0:	8082                	ret

800046e2 <__FP32toQ2>:
800046e2:	7179                	addi	sp,sp,-48
800046e4:	d422                	sw	s0,40(sp)
800046e6:	842e                	mv	s0,a1
800046e8:	ce4e                	sw	s3,28(sp)
800046ea:	85b2                	mv	a1,a2
800046ec:	89aa                	mv	s3,a0
800046ee:	8522                	mv	a0,s0
800046f0:	cc52                	sw	s4,24(sp)
800046f2:	e622                	fsw	fs0,12(sp)
800046f4:	e426                	fsw	fs1,8(sp)
800046f6:	d606                	sw	ra,44(sp)
800046f8:	d226                	sw	s1,36(sp)
800046fa:	d04a                	sw	s2,32(sp)
800046fc:	ca56                	sw	s5,20(sp)
800046fe:	c85a                	sw	s6,16(sp)
80004700:	8a32                	mv	s4,a2
80004702:	354d                	jal	800045a4 <MiCo_absmax>
80004704:	00007797          	auipc	a5,0x7
80004708:	0887a487          	flw	fs1,136(a5) # 8000b78c <__malloc_trim_threshold+0x1c>
8000470c:	18a4f453          	fdiv.s	fs0,fs1,fa0
80004710:	060a0f63          	beqz	s4,8000478e <__FP32toQ2+0xac>
80004714:	6a91                	lui	s5,0x4
80004716:	4901                	li	s2,0
80004718:	fc0a8a93          	addi	s5,s5,-64 # 3fc0 <__stack_size-0x3fc040>
8000471c:	6008                	flw	fa0,0(s0)
8000471e:	4b05                	li	s6,1
80004720:	10a47553          	fmul.s	fa0,fs0,fa0
80004724:	3d85                	jal	80004594 <roundf2i>
80004726:	6008                	flw	fa0,0(s0)
80004728:	10a47553          	fmul.s	fa0,fs0,fa0
8000472c:	35a5                	jal	80004594 <roundf2i>
8000472e:	8909                	andi	a0,a0,2
80004730:	c161                	beqz	a0,800047f0 <__FP32toQ2+0x10e>
80004732:	6048                	flw	fa0,4(s0)
80004734:	4491                	li	s1,4
80004736:	10a47553          	fmul.s	fa0,fs0,fa0
8000473a:	3da9                	jal	80004594 <roundf2i>
8000473c:	6048                	flw	fa0,4(s0)
8000473e:	10a47553          	fmul.s	fa0,fs0,fa0
80004742:	3d89                	jal	80004594 <roundf2i>
80004744:	8909                	andi	a0,a0,2
80004746:	cd49                	beqz	a0,800047e0 <__FP32toQ2+0xfe>
80004748:	6408                	flw	fa0,8(s0)
8000474a:	009b64b3          	or	s1,s6,s1
8000474e:	10a47553          	fmul.s	fa0,fs0,fa0
80004752:	3589                	jal	80004594 <roundf2i>
80004754:	6408                	flw	fa0,8(s0)
80004756:	10a47553          	fmul.s	fa0,fs0,fa0
8000475a:	3d2d                	jal	80004594 <roundf2i>
8000475c:	8909                	andi	a0,a0,2
8000475e:	47c1                	li	a5,16
80004760:	c53d                	beqz	a0,800047ce <__FP32toQ2+0xec>
80004762:	6448                	flw	fa0,12(s0)
80004764:	8cdd                	or	s1,s1,a5
80004766:	10a47553          	fmul.s	fa0,fs0,fa0
8000476a:	352d                	jal	80004594 <roundf2i>
8000476c:	6448                	flw	fa0,12(s0)
8000476e:	10a47553          	fmul.s	fa0,fs0,fa0
80004772:	350d                	jal	80004594 <roundf2i>
80004774:	40295793          	srai	a5,s2,0x2
80004778:	8909                	andi	a0,a0,2
8000477a:	97ce                	add	a5,a5,s3
8000477c:	0404e713          	ori	a4,s1,64
80004780:	c50d                	beqz	a0,800047aa <__FP32toQ2+0xc8>
80004782:	00e78023          	sb	a4,0(a5)
80004786:	0911                	addi	s2,s2,4
80004788:	0441                	addi	s0,s0,16
8000478a:	f94969e3          	bltu	s2,s4,8000471c <__FP32toQ2+0x3a>
8000478e:	50b2                	lw	ra,44(sp)
80004790:	5422                	lw	s0,40(sp)
80004792:	1884f553          	fdiv.s	fa0,fs1,fs0
80004796:	5492                	lw	s1,36(sp)
80004798:	5902                	lw	s2,32(sp)
8000479a:	49f2                	lw	s3,28(sp)
8000479c:	4a62                	lw	s4,24(sp)
8000479e:	4ad2                	lw	s5,20(sp)
800047a0:	4b42                	lw	s6,16(sp)
800047a2:	6432                	flw	fs0,12(sp)
800047a4:	64a2                	flw	fs1,8(sp)
800047a6:	6145                	addi	sp,sp,48
800047a8:	8082                	ret
800047aa:	6448                	flw	fa0,12(s0)
800047ac:	0441                	addi	s0,s0,16
800047ae:	10a47553          	fmul.s	fa0,fs0,fa0
800047b2:	33cd                	jal	80004594 <roundf2i>
800047b4:	051a                	slli	a0,a0,0x6
800047b6:	40295793          	srai	a5,s2,0x2
800047ba:	01557533          	and	a0,a0,s5
800047be:	97ce                	add	a5,a5,s3
800047c0:	8cc9                	or	s1,s1,a0
800047c2:	00978023          	sb	s1,0(a5)
800047c6:	0911                	addi	s2,s2,4
800047c8:	f5496ae3          	bltu	s2,s4,8000471c <__FP32toQ2+0x3a>
800047cc:	b7c9                	j	8000478e <__FP32toQ2+0xac>
800047ce:	6408                	flw	fa0,8(s0)
800047d0:	10a47553          	fmul.s	fa0,fs0,fa0
800047d4:	33c1                	jal	80004594 <roundf2i>
800047d6:	00451793          	slli	a5,a0,0x4
800047da:	0307f793          	andi	a5,a5,48
800047de:	b751                	j	80004762 <__FP32toQ2+0x80>
800047e0:	6048                	flw	fa0,4(s0)
800047e2:	10a47553          	fmul.s	fa0,fs0,fa0
800047e6:	337d                	jal	80004594 <roundf2i>
800047e8:	00251493          	slli	s1,a0,0x2
800047ec:	88b1                	andi	s1,s1,12
800047ee:	bfa9                	j	80004748 <__FP32toQ2+0x66>
800047f0:	6008                	flw	fa0,0(s0)
800047f2:	10a47553          	fmul.s	fa0,fs0,fa0
800047f6:	3b79                	jal	80004594 <roundf2i>
800047f8:	00357b13          	andi	s6,a0,3
800047fc:	bf1d                	j	80004732 <__FP32toQ2+0x50>

800047fe <__FP32toQ1>:
800047fe:	1141                	addi	sp,sp,-16
80004800:	c04a                	sw	s2,0(sp)
80004802:	892e                	mv	s2,a1
80004804:	c422                	sw	s0,8(sp)
80004806:	c226                	sw	s1,4(sp)
80004808:	842a                	mv	s0,a0
8000480a:	84b2                	mv	s1,a2
8000480c:	85b2                	mv	a1,a2
8000480e:	854a                	mv	a0,s2
80004810:	c606                	sw	ra,12(sp)
80004812:	33c9                	jal	800045d4 <MiCo_absmean>
80004814:	c0d5                	beqz	s1,800048b8 <__FP32toQ1+0xba>
80004816:	f00007d3          	fmv.w.x	fa5,zero
8000481a:	86ca                	mv	a3,s2
8000481c:	4801                	li	a6,0
8000481e:	40385713          	srai	a4,a6,0x3
80004822:	9722                	add	a4,a4,s0
80004824:	00070023          	sb	zero,0(a4)
80004828:	6298                	flw	fa4,0(a3)
8000482a:	02068693          	addi	a3,a3,32
8000482e:	0821                	addi	a6,a6,8
80004830:	a0f707d3          	fle.s	a5,fa4,fa5
80004834:	00f70023          	sb	a5,0(a4)
80004838:	fe46a707          	flw	fa4,-28(a3)
8000483c:	a0f70653          	fle.s	a2,fa4,fa5
80004840:	0606                	slli	a2,a2,0x1
80004842:	8fd1                	or	a5,a5,a2
80004844:	00f70023          	sb	a5,0(a4)
80004848:	fe86a707          	flw	fa4,-24(a3)
8000484c:	a0f708d3          	fle.s	a7,fa4,fa5
80004850:	088a                	slli	a7,a7,0x2
80004852:	0117e7b3          	or	a5,a5,a7
80004856:	00f70023          	sb	a5,0(a4)
8000485a:	fec6a707          	flw	fa4,-20(a3)
8000485e:	a0f708d3          	fle.s	a7,fa4,fa5
80004862:	088e                	slli	a7,a7,0x3
80004864:	0117e7b3          	or	a5,a5,a7
80004868:	00f70023          	sb	a5,0(a4)
8000486c:	ff06a707          	flw	fa4,-16(a3)
80004870:	a0f708d3          	fle.s	a7,fa4,fa5
80004874:	0892                	slli	a7,a7,0x4
80004876:	0117e7b3          	or	a5,a5,a7
8000487a:	00f70023          	sb	a5,0(a4)
8000487e:	ff46a707          	flw	fa4,-12(a3)
80004882:	a0f708d3          	fle.s	a7,fa4,fa5
80004886:	0896                	slli	a7,a7,0x5
80004888:	0117e7b3          	or	a5,a5,a7
8000488c:	00f70023          	sb	a5,0(a4)
80004890:	ff86a707          	flw	fa4,-8(a3)
80004894:	a0f708d3          	fle.s	a7,fa4,fa5
80004898:	089a                	slli	a7,a7,0x6
8000489a:	0117e7b3          	or	a5,a5,a7
8000489e:	00f70023          	sb	a5,0(a4)
800048a2:	ffc6a707          	flw	fa4,-4(a3)
800048a6:	a0f708d3          	fle.s	a7,fa4,fa5
800048aa:	089e                	slli	a7,a7,0x7
800048ac:	0117e7b3          	or	a5,a5,a7
800048b0:	00f70023          	sb	a5,0(a4)
800048b4:	f69865e3          	bltu	a6,s1,8000481e <__FP32toQ1+0x20>
800048b8:	40b2                	lw	ra,12(sp)
800048ba:	4422                	lw	s0,8(sp)
800048bc:	4492                	lw	s1,4(sp)
800048be:	4902                	lw	s2,0(sp)
800048c0:	0141                	addi	sp,sp,16
800048c2:	8082                	ret

800048c4 <MiCo_2D_FP32toQ8>:
800048c4:	715d                	addi	sp,sp,-80
800048c6:	c4a2                	sw	s0,72(sp)
800048c8:	da56                	sw	s5,52(sp)
800048ca:	4180                	lw	s0,0(a1)
800048cc:	00052a83          	lw	s5,0(a0)
800048d0:	c0ca                	sw	s2,64(sp)
800048d2:	d266                	sw	s9,36(sp)
800048d4:	0045a903          	lw	s2,4(a1)
800048d8:	8caa                	mv	s9,a0
800048da:	41540533          	sub	a0,s0,s5
800048de:	ce6e                	sw	s11,28(sp)
800048e0:	00153513          	seqz	a0,a0
800048e4:	8dae                	mv	s11,a1
800048e6:	00006597          	auipc	a1,0x6
800048ea:	1e658593          	addi	a1,a1,486 # 8000aacc <MiCo_QMatMul+0x40>
800048ee:	c686                	sw	ra,76(sp)
800048f0:	c2a6                	sw	s1,68(sp)
800048f2:	e622                	fsw	fs0,12(sp)
800048f4:	004ca483          	lw	s1,4(s9)
800048f8:	de4e                	sw	s3,60(sp)
800048fa:	dc52                	sw	s4,56(sp)
800048fc:	d85a                	sw	s6,48(sp)
800048fe:	d65e                	sw	s7,44(sp)
80004900:	d462                	sw	s8,40(sp)
80004902:	d06a                	sw	s10,32(sp)
80004904:	845fd0ef          	jal	ra,80002148 <MiCo_assert>
80004908:	032405b3          	mul	a1,s0,s2
8000490c:	008da503          	lw	a0,8(s11)
80004910:	3951                	jal	800045a4 <MiCo_absmax>
80004912:	00007797          	auipc	a5,0x7
80004916:	e827a407          	flw	fs0,-382(a5) # 8000b794 <__malloc_trim_threshold+0x24>
8000491a:	18a47453          	fdiv.s	fs0,fs0,fa0
8000491e:	020a8963          	beqz	s5,80004950 <MiCo_2D_FP32toQ8+0x8c>
80004922:	c49d                	beqz	s1,80004950 <MiCo_2D_FP32toQ8+0x8c>
80004924:	4a01                	li	s4,0
80004926:	4c01                	li	s8,0
80004928:	4981                	li	s3,0
8000492a:	04091b63          	bnez	s2,80004980 <MiCo_2D_FP32toQ8+0xbc>
8000492e:	4681                	li	a3,0
80004930:	4401                	li	s0,0
80004932:	008ca783          	lw	a5,8(s9)
80004936:	0405                	addi	s0,s0,1
80004938:	97e2                	add	a5,a5,s8
8000493a:	97b6                	add	a5,a5,a3
8000493c:	00078023          	sb	zero,0(a5)
80004940:	86a2                	mv	a3,s0
80004942:	fe9468e3          	bltu	s0,s1,80004932 <MiCo_2D_FP32toQ8+0x6e>
80004946:	0985                	addi	s3,s3,1
80004948:	9c26                	add	s8,s8,s1
8000494a:	9a4a                	add	s4,s4,s2
8000494c:	fd3a9fe3          	bne	s5,s3,8000492a <MiCo_2D_FP32toQ8+0x66>
80004950:	00007797          	auipc	a5,0x7
80004954:	e3c7a507          	flw	fa0,-452(a5) # 8000b78c <__malloc_trim_threshold+0x1c>
80004958:	18857453          	fdiv.s	fs0,fa0,fs0
8000495c:	40b6                	lw	ra,76(sp)
8000495e:	4426                	lw	s0,72(sp)
80004960:	4496                	lw	s1,68(sp)
80004962:	4906                	lw	s2,64(sp)
80004964:	59f2                	lw	s3,60(sp)
80004966:	5a62                	lw	s4,56(sp)
80004968:	5ad2                	lw	s5,52(sp)
8000496a:	5b42                	lw	s6,48(sp)
8000496c:	5bb2                	lw	s7,44(sp)
8000496e:	5c22                	lw	s8,40(sp)
80004970:	5d02                	lw	s10,32(sp)
80004972:	4df2                	lw	s11,28(sp)
80004974:	008ca627          	fsw	fs0,12(s9)
80004978:	5c92                	lw	s9,36(sp)
8000497a:	6432                	flw	fs0,12(sp)
8000497c:	6161                	addi	sp,sp,80
8000497e:	8082                	ret
80004980:	8b4a                	mv	s6,s2
80004982:	0124f363          	bgeu	s1,s2,80004988 <MiCo_2D_FP32toQ8+0xc4>
80004986:	8b26                	mv	s6,s1
80004988:	002a1b93          	slli	s7,s4,0x2
8000498c:	4401                	li	s0,0
8000498e:	008da783          	lw	a5,8(s11)
80004992:	01840d33          	add	s10,s0,s8
80004996:	0405                	addi	s0,s0,1
80004998:	97de                	add	a5,a5,s7
8000499a:	6388                	flw	fa0,0(a5)
8000499c:	0b91                	addi	s7,s7,4
8000499e:	10a47553          	fmul.s	fa0,fs0,fa0
800049a2:	3ecd                	jal	80004594 <roundf2i>
800049a4:	008ca703          	lw	a4,8(s9)
800049a8:	86a2                	mv	a3,s0
800049aa:	976a                	add	a4,a4,s10
800049ac:	00a70023          	sb	a0,0(a4)
800049b0:	fd646fe3          	bltu	s0,s6,8000498e <MiCo_2D_FP32toQ8+0xca>
800049b4:	f6946fe3          	bltu	s0,s1,80004932 <MiCo_2D_FP32toQ8+0x6e>
800049b8:	0985                	addi	s3,s3,1
800049ba:	9c26                	add	s8,s8,s1
800049bc:	9a4a                	add	s4,s4,s2
800049be:	f73a96e3          	bne	s5,s3,8000492a <MiCo_2D_FP32toQ8+0x66>
800049c2:	b779                	j	80004950 <MiCo_2D_FP32toQ8+0x8c>

800049c4 <MiCo_2D_FP32toQ4>:
800049c4:	711d                	addi	sp,sp,-96
800049c6:	cca2                	sw	s0,88(sp)
800049c8:	caa6                	sw	s1,84(sp)
800049ca:	4180                	lw	s0,0(a1)
800049cc:	4104                	lw	s1,0(a0)
800049ce:	c4d2                	sw	s4,72(sp)
800049d0:	da66                	sw	s9,52(sp)
800049d2:	0045aa03          	lw	s4,4(a1)
800049d6:	8caa                	mv	s9,a0
800049d8:	40940533          	sub	a0,s0,s1
800049dc:	c6ce                	sw	s3,76(sp)
800049de:	00153513          	seqz	a0,a0
800049e2:	89ae                	mv	s3,a1
800049e4:	00006597          	auipc	a1,0x6
800049e8:	0e858593          	addi	a1,a1,232 # 8000aacc <MiCo_QMatMul+0x40>
800049ec:	ce86                	sw	ra,92(sp)
800049ee:	c8ca                	sw	s2,80(sp)
800049f0:	ee22                	fsw	fs0,28(sp)
800049f2:	004ca903          	lw	s2,4(s9)
800049f6:	c2d6                	sw	s5,68(sp)
800049f8:	c0da                	sw	s6,64(sp)
800049fa:	de5e                	sw	s7,60(sp)
800049fc:	dc62                	sw	s8,56(sp)
800049fe:	d86a                	sw	s10,48(sp)
80004a00:	d66e                	sw	s11,44(sp)
80004a02:	c626                	sw	s1,12(sp)
80004a04:	f44fd0ef          	jal	ra,80002148 <MiCo_assert>
80004a08:	034405b3          	mul	a1,s0,s4
80004a0c:	0089a503          	lw	a0,8(s3)
80004a10:	3e51                	jal	800045a4 <MiCo_absmax>
80004a12:	00007797          	auipc	a5,0x7
80004a16:	d867a407          	flw	fs0,-634(a5) # 8000b798 <__malloc_trim_threshold+0x28>
80004a1a:	18a47453          	fdiv.s	fs0,fs0,fa0
80004a1e:	c0a9                	beqz	s1,80004a60 <MiCo_2D_FP32toQ4+0x9c>
80004a20:	04090063          	beqz	s2,80004a60 <MiCo_2D_FP32toQ4+0x9c>
80004a24:	fffa0793          	addi	a5,s4,-1
80004a28:	6c05                	lui	s8,0x1
80004a2a:	c43e                	sw	a5,8(sp)
80004a2c:	ff0c0793          	addi	a5,s8,-16 # ff0 <__stack_size-0x3ff010>
80004a30:	4b01                	li	s6,0
80004a32:	4481                	li	s1,0
80004a34:	4a81                	li	s5,0
80004a36:	c23e                	sw	a5,4(sp)
80004a38:	47a2                	lw	a5,8(sp)
80004a3a:	ebb9                	bnez	a5,80004a90 <MiCo_2D_FP32toQ4+0xcc>
80004a3c:	4401                	li	s0,0
80004a3e:	008ca703          	lw	a4,8(s9)
80004a42:	97a6                	add	a5,a5,s1
80004a44:	8385                	srli	a5,a5,0x1
80004a46:	97ba                	add	a5,a5,a4
80004a48:	0409                	addi	s0,s0,2
80004a4a:	00078023          	sb	zero,0(a5)
80004a4e:	87a2                	mv	a5,s0
80004a50:	ff2467e3          	bltu	s0,s2,80004a3e <MiCo_2D_FP32toQ4+0x7a>
80004a54:	47b2                	lw	a5,12(sp)
80004a56:	0a85                	addi	s5,s5,1
80004a58:	94ca                	add	s1,s1,s2
80004a5a:	9b52                	add	s6,s6,s4
80004a5c:	fd579ee3          	bne	a5,s5,80004a38 <MiCo_2D_FP32toQ4+0x74>
80004a60:	00007797          	auipc	a5,0x7
80004a64:	d2c7a507          	flw	fa0,-724(a5) # 8000b78c <__malloc_trim_threshold+0x1c>
80004a68:	18857453          	fdiv.s	fs0,fa0,fs0
80004a6c:	40f6                	lw	ra,92(sp)
80004a6e:	4466                	lw	s0,88(sp)
80004a70:	44d6                	lw	s1,84(sp)
80004a72:	4946                	lw	s2,80(sp)
80004a74:	49b6                	lw	s3,76(sp)
80004a76:	4a26                	lw	s4,72(sp)
80004a78:	4a96                	lw	s5,68(sp)
80004a7a:	4b06                	lw	s6,64(sp)
80004a7c:	5bf2                	lw	s7,60(sp)
80004a7e:	5c62                	lw	s8,56(sp)
80004a80:	5d42                	lw	s10,48(sp)
80004a82:	5db2                	lw	s11,44(sp)
80004a84:	008ca627          	fsw	fs0,12(s9)
80004a88:	5cd2                	lw	s9,52(sp)
80004a8a:	6472                	flw	fs0,28(sp)
80004a8c:	6125                	addi	sp,sp,96
80004a8e:	8082                	ret
80004a90:	8d4a                	mv	s10,s2
80004a92:	0127f363          	bgeu	a5,s2,80004a98 <MiCo_2D_FP32toQ4+0xd4>
80004a96:	8d3e                	mv	s10,a5
80004a98:	002b1c13          	slli	s8,s6,0x2
80004a9c:	4401                	li	s0,0
80004a9e:	a015                	j	80004ac2 <MiCo_2D_FP32toQ4+0xfe>
80004aa0:	9762                	add	a4,a4,s8
80004aa2:	6308                	flw	fa0,0(a4)
80004aa4:	0c21                	addi	s8,s8,8
80004aa6:	10a47553          	fmul.s	fa0,fs0,fa0
80004aaa:	34ed                	jal	80004594 <roundf2i>
80004aac:	008ca703          	lw	a4,8(s9)
80004ab0:	893d                	andi	a0,a0,15
80004ab2:	00abe7b3          	or	a5,s7,a0
80004ab6:	976e                	add	a4,a4,s11
80004ab8:	00f70023          	sb	a5,0(a4)
80004abc:	87a2                	mv	a5,s0
80004abe:	03a47e63          	bgeu	s0,s10,80004afa <MiCo_2D_FP32toQ4+0x136>
80004ac2:	00848db3          	add	s11,s1,s0
80004ac6:	00140593          	addi	a1,s0,1
80004aca:	0089a703          	lw	a4,8(s3)
80004ace:	001ddd93          	srli	s11,s11,0x1
80004ad2:	0409                	addi	s0,s0,2
80004ad4:	4b81                	li	s7,0
80004ad6:	fd45f5e3          	bgeu	a1,s4,80004aa0 <MiCo_2D_FP32toQ4+0xdc>
80004ada:	9762                	add	a4,a4,s8
80004adc:	6348                	flw	fa0,4(a4)
80004ade:	10a47553          	fmul.s	fa0,fs0,fa0
80004ae2:	3c4d                	jal	80004594 <roundf2i>
80004ae4:	4692                	lw	a3,4(sp)
80004ae6:	00451793          	slli	a5,a0,0x4
80004aea:	0089a703          	lw	a4,8(s3)
80004aee:	8ff5                	and	a5,a5,a3
80004af0:	01879b93          	slli	s7,a5,0x18
80004af4:	418bdb93          	srai	s7,s7,0x18
80004af8:	b765                	j	80004aa0 <MiCo_2D_FP32toQ4+0xdc>
80004afa:	f52462e3          	bltu	s0,s2,80004a3e <MiCo_2D_FP32toQ4+0x7a>
80004afe:	47b2                	lw	a5,12(sp)
80004b00:	0a85                	addi	s5,s5,1
80004b02:	94ca                	add	s1,s1,s2
80004b04:	9b52                	add	s6,s6,s4
80004b06:	f35799e3          	bne	a5,s5,80004a38 <MiCo_2D_FP32toQ4+0x74>
80004b0a:	bf99                	j	80004a60 <MiCo_2D_FP32toQ4+0x9c>

80004b0c <MiCo_2D_FP32toQ2>:
80004b0c:	7159                	addi	sp,sp,-112
80004b0e:	d4a2                	sw	s0,104(sp)
80004b10:	d0ca                	sw	s2,96(sp)
80004b12:	4180                	lw	s0,0(a1)
80004b14:	00052903          	lw	s2,0(a0)
80004b18:	c4e2                	sw	s8,72(sp)
80004b1a:	de6e                	sw	s11,60(sp)
80004b1c:	0045ac03          	lw	s8,4(a1)
80004b20:	8daa                	mv	s11,a0
80004b22:	41240533          	sub	a0,s0,s2
80004b26:	ccd2                	sw	s4,88(sp)
80004b28:	00153513          	seqz	a0,a0
80004b2c:	8a2e                	mv	s4,a1
80004b2e:	00006597          	auipc	a1,0x6
80004b32:	f9e58593          	addi	a1,a1,-98 # 8000aacc <MiCo_QMatMul+0x40>
80004b36:	d686                	sw	ra,108(sp)
80004b38:	d2a6                	sw	s1,100(sp)
80004b3a:	f622                	fsw	fs0,44(sp)
80004b3c:	f426                	fsw	fs1,40(sp)
80004b3e:	004da483          	lw	s1,4(s11)
80004b42:	cece                	sw	s3,92(sp)
80004b44:	cad6                	sw	s5,84(sp)
80004b46:	c8da                	sw	s6,80(sp)
80004b48:	c6de                	sw	s7,76(sp)
80004b4a:	c2e6                	sw	s9,68(sp)
80004b4c:	c0ea                	sw	s10,64(sp)
80004b4e:	ce4a                	sw	s2,28(sp)
80004b50:	df8fd0ef          	jal	ra,80002148 <MiCo_assert>
80004b54:	038405b3          	mul	a1,s0,s8
80004b58:	008a2503          	lw	a0,8(s4)
80004b5c:	34a1                	jal	800045a4 <MiCo_absmax>
80004b5e:	00007797          	auipc	a5,0x7
80004b62:	c2e7a487          	flw	fs1,-978(a5) # 8000b78c <__malloc_trim_threshold+0x1c>
80004b66:	18a4f453          	fdiv.s	fs0,fs1,fa0
80004b6a:	04090263          	beqz	s2,80004bae <MiCo_2D_FP32toQ2+0xa2>
80004b6e:	c0a1                	beqz	s1,80004bae <MiCo_2D_FP32toQ2+0xa2>
80004b70:	ffdc0793          	addi	a5,s8,-3
80004b74:	cc3e                	sw	a5,24(sp)
80004b76:	478d                	li	a5,3
80004b78:	c83e                	sw	a5,16(sp)
80004b7a:	4a81                	li	s5,0
80004b7c:	ca02                	sw	zero,20(sp)
80004b7e:	47e2                	lw	a5,24(sp)
80004b80:	efa1                	bnez	a5,80004bd8 <MiCo_2D_FP32toQ2+0xcc>
80004b82:	4401                	li	s0,0
80004b84:	008da703          	lw	a4,8(s11)
80004b88:	97d6                	add	a5,a5,s5
80004b8a:	8389                	srli	a5,a5,0x2
80004b8c:	97ba                	add	a5,a5,a4
80004b8e:	0411                	addi	s0,s0,4
80004b90:	00078023          	sb	zero,0(a5)
80004b94:	87a2                	mv	a5,s0
80004b96:	fe9467e3          	bltu	s0,s1,80004b84 <MiCo_2D_FP32toQ2+0x78>
80004b9a:	4742                	lw	a4,16(sp)
80004b9c:	47d2                	lw	a5,20(sp)
80004b9e:	9aa6                	add	s5,s5,s1
80004ba0:	9762                	add	a4,a4,s8
80004ba2:	c83a                	sw	a4,16(sp)
80004ba4:	4772                	lw	a4,28(sp)
80004ba6:	0785                	addi	a5,a5,1
80004ba8:	ca3e                	sw	a5,20(sp)
80004baa:	fce79ae3          	bne	a5,a4,80004b7e <MiCo_2D_FP32toQ2+0x72>
80004bae:	1884f453          	fdiv.s	fs0,fs1,fs0
80004bb2:	50b6                	lw	ra,108(sp)
80004bb4:	5426                	lw	s0,104(sp)
80004bb6:	5496                	lw	s1,100(sp)
80004bb8:	5906                	lw	s2,96(sp)
80004bba:	49f6                	lw	s3,92(sp)
80004bbc:	4a66                	lw	s4,88(sp)
80004bbe:	4ad6                	lw	s5,84(sp)
80004bc0:	4b46                	lw	s6,80(sp)
80004bc2:	4bb6                	lw	s7,76(sp)
80004bc4:	4c26                	lw	s8,72(sp)
80004bc6:	4c96                	lw	s9,68(sp)
80004bc8:	4d06                	lw	s10,64(sp)
80004bca:	74a2                	flw	fs1,40(sp)
80004bcc:	008da627          	fsw	fs0,12(s11)
80004bd0:	5df2                	lw	s11,60(sp)
80004bd2:	7432                	flw	fs0,44(sp)
80004bd4:	6165                	addi	sp,sp,112
80004bd6:	8082                	ret
80004bd8:	c226                	sw	s1,4(sp)
80004bda:	0097f363          	bgeu	a5,s1,80004be0 <MiCo_2D_FP32toQ2+0xd4>
80004bde:	c23e                	sw	a5,4(sp)
80004be0:	47c2                	lw	a5,16(sp)
80004be2:	4401                	li	s0,0
80004be4:	00279d13          	slli	s10,a5,0x2
80004be8:	a829                	j	80004c02 <MiCo_2D_FP32toQ2+0xf6>
80004bea:	0e9a                	slli	t4,t4,0x6
80004bec:	01d7e7b3          	or	a5,a5,t4
80004bf0:	9bba                	add	s7,s7,a4
80004bf2:	00fb8023          	sb	a5,0(s7)
80004bf6:	4712                	lw	a4,4(sp)
80004bf8:	0411                	addi	s0,s0,4
80004bfa:	87a2                	mv	a5,s0
80004bfc:	0d41                	addi	s10,s10,16
80004bfe:	06e47e63          	bgeu	s0,a4,80004c7a <MiCo_2D_FP32toQ2+0x16e>
80004c02:	008a8bb3          	add	s7,s5,s0
80004c06:	002bdb93          	srli	s7,s7,0x2
80004c0a:	4c81                	li	s9,0
80004c0c:	4b01                	li	s6,0
80004c0e:	0d846663          	bltu	s0,s8,80004cda <MiCo_2D_FP32toQ2+0x1ce>
80004c12:	00140713          	addi	a4,s0,1
80004c16:	4801                	li	a6,0
80004c18:	4881                	li	a7,0
80004c1a:	0b876363          	bltu	a4,s8,80004cc0 <MiCo_2D_FP32toQ2+0x1b4>
80004c1e:	00240713          	addi	a4,s0,2
80004c22:	4981                	li	s3,0
80004c24:	4901                	li	s2,0
80004c26:	07876c63          	bltu	a4,s8,80004c9e <MiCo_2D_FP32toQ2+0x192>
80004c2a:	00340713          	addi	a4,s0,3
80004c2e:	4501                	li	a0,0
80004c30:	4e81                	li	t4,0
80004c32:	05876763          	bltu	a4,s8,80004c80 <MiCo_2D_FP32toQ2+0x174>
80004c36:	4785                	li	a5,1
80004c38:	000c9463          	bnez	s9,80004c40 <MiCo_2D_FP32toQ2+0x134>
80004c3c:	003b7793          	andi	a5,s6,3
80004c40:	4711                	li	a4,4
80004c42:	00081563          	bnez	a6,80004c4c <MiCo_2D_FP32toQ2+0x140>
80004c46:	088a                	slli	a7,a7,0x2
80004c48:	00c8f713          	andi	a4,a7,12
80004c4c:	8fd9                	or	a5,a5,a4
80004c4e:	4741                	li	a4,16
80004c50:	00099663          	bnez	s3,80004c5c <MiCo_2D_FP32toQ2+0x150>
80004c54:	00491e13          	slli	t3,s2,0x4
80004c58:	030e7713          	andi	a4,t3,48
80004c5c:	8fd9                	or	a5,a5,a4
80004c5e:	008da703          	lw	a4,8(s11)
80004c62:	d541                	beqz	a0,80004bea <MiCo_2D_FP32toQ2+0xde>
80004c64:	0407e793          	ori	a5,a5,64
80004c68:	9bba                	add	s7,s7,a4
80004c6a:	00fb8023          	sb	a5,0(s7)
80004c6e:	4712                	lw	a4,4(sp)
80004c70:	0411                	addi	s0,s0,4
80004c72:	87a2                	mv	a5,s0
80004c74:	0d41                	addi	s10,s10,16
80004c76:	f8e466e3          	bltu	s0,a4,80004c02 <MiCo_2D_FP32toQ2+0xf6>
80004c7a:	f09465e3          	bltu	s0,s1,80004b84 <MiCo_2D_FP32toQ2+0x78>
80004c7e:	bf31                	j	80004b9a <MiCo_2D_FP32toQ2+0x8e>
80004c80:	008a2783          	lw	a5,8(s4)
80004c84:	c642                	sw	a6,12(sp)
80004c86:	c446                	sw	a7,8(sp)
80004c88:	97ea                	add	a5,a5,s10
80004c8a:	6388                	flw	fa0,0(a5)
80004c8c:	10a47553          	fmul.s	fa0,fs0,fa0
80004c90:	3211                	jal	80004594 <roundf2i>
80004c92:	0ff57e93          	andi	t4,a0,255
80004c96:	4832                	lw	a6,12(sp)
80004c98:	48a2                	lw	a7,8(sp)
80004c9a:	8909                	andi	a0,a0,2
80004c9c:	bf69                	j	80004c36 <MiCo_2D_FP32toQ2+0x12a>
80004c9e:	008a2783          	lw	a5,8(s4)
80004ca2:	c642                	sw	a6,12(sp)
80004ca4:	c446                	sw	a7,8(sp)
80004ca6:	97ea                	add	a5,a5,s10
80004ca8:	ffc7a507          	flw	fa0,-4(a5)
80004cac:	10a47553          	fmul.s	fa0,fs0,fa0
80004cb0:	30d5                	jal	80004594 <roundf2i>
80004cb2:	4832                	lw	a6,12(sp)
80004cb4:	48a2                	lw	a7,8(sp)
80004cb6:	0ff57913          	andi	s2,a0,255
80004cba:	00257993          	andi	s3,a0,2
80004cbe:	b7b5                	j	80004c2a <MiCo_2D_FP32toQ2+0x11e>
80004cc0:	008a2783          	lw	a5,8(s4)
80004cc4:	97ea                	add	a5,a5,s10
80004cc6:	ff87a507          	flw	fa0,-8(a5)
80004cca:	10a47553          	fmul.s	fa0,fs0,fa0
80004cce:	30d9                	jal	80004594 <roundf2i>
80004cd0:	0ff57893          	andi	a7,a0,255
80004cd4:	00257813          	andi	a6,a0,2
80004cd8:	b799                	j	80004c1e <MiCo_2D_FP32toQ2+0x112>
80004cda:	008a2783          	lw	a5,8(s4)
80004cde:	97ea                	add	a5,a5,s10
80004ce0:	ff47a507          	flw	fa0,-12(a5)
80004ce4:	10a47553          	fmul.s	fa0,fs0,fa0
80004ce8:	3075                	jal	80004594 <roundf2i>
80004cea:	01851b13          	slli	s6,a0,0x18
80004cee:	418b5b13          	srai	s6,s6,0x18
80004cf2:	00257c93          	andi	s9,a0,2
80004cf6:	bf31                	j	80004c12 <MiCo_2D_FP32toQ2+0x106>

80004cf8 <MiCo_2D_FP32toQ1>:
80004cf8:	1101                	addi	sp,sp,-32
80004cfa:	c452                	sw	s4,8(sp)
80004cfc:	c256                	sw	s5,4(sp)
80004cfe:	00052a03          	lw	s4,0(a0)
80004d02:	0005aa83          	lw	s5,0(a1)
80004d06:	cc22                	sw	s0,24(sp)
80004d08:	ca26                	sw	s1,20(sp)
80004d0a:	842a                	mv	s0,a0
80004d0c:	41c4                	lw	s1,4(a1)
80004d0e:	414a8533          	sub	a0,s5,s4
80004d12:	c84a                	sw	s2,16(sp)
80004d14:	00153513          	seqz	a0,a0
80004d18:	892e                	mv	s2,a1
80004d1a:	00006597          	auipc	a1,0x6
80004d1e:	db258593          	addi	a1,a1,-590 # 8000aacc <MiCo_QMatMul+0x40>
80004d22:	c64e                	sw	s3,12(sp)
80004d24:	ce06                	sw	ra,28(sp)
80004d26:	00442983          	lw	s3,4(s0)
80004d2a:	c1efd0ef          	jal	ra,80002148 <MiCo_assert>
80004d2e:	029a85b3          	mul	a1,s5,s1
80004d32:	00892503          	lw	a0,8(s2)
80004d36:	3879                	jal	800045d4 <MiCo_absmean>
80004d38:	020a0e63          	beqz	s4,80004d74 <MiCo_2D_FP32toQ1+0x7c>
80004d3c:	02098c63          	beqz	s3,80004d74 <MiCo_2D_FP32toQ1+0x7c>
80004d40:	f00007d3          	fmv.w.x	fa5,zero
80004d44:	ff948893          	addi	a7,s1,-7
80004d48:	481d                	li	a6,7
80004d4a:	4581                	li	a1,0
80004d4c:	4501                	li	a0,0
80004d4e:	02089d63          	bnez	a7,80004d88 <MiCo_2D_FP32toQ1+0x90>
80004d52:	4701                	li	a4,0
80004d54:	4781                	li	a5,0
80004d56:	4414                	lw	a3,8(s0)
80004d58:	972e                	add	a4,a4,a1
80004d5a:	830d                	srli	a4,a4,0x3
80004d5c:	9736                	add	a4,a4,a3
80004d5e:	07a1                	addi	a5,a5,8
80004d60:	00070023          	sb	zero,0(a4)
80004d64:	873e                	mv	a4,a5
80004d66:	ff37e8e3          	bltu	a5,s3,80004d56 <MiCo_2D_FP32toQ1+0x5e>
80004d6a:	0505                	addi	a0,a0,1
80004d6c:	95ce                	add	a1,a1,s3
80004d6e:	9826                	add	a6,a6,s1
80004d70:	fd451fe3          	bne	a0,s4,80004d4e <MiCo_2D_FP32toQ1+0x56>
80004d74:	40f2                	lw	ra,28(sp)
80004d76:	e448                	fsw	fa0,12(s0)
80004d78:	4462                	lw	s0,24(sp)
80004d7a:	44d2                	lw	s1,20(sp)
80004d7c:	4942                	lw	s2,16(sp)
80004d7e:	49b2                	lw	s3,12(sp)
80004d80:	4a22                	lw	s4,8(sp)
80004d82:	4a92                	lw	s5,4(sp)
80004d84:	6105                	addi	sp,sp,32
80004d86:	8082                	ret
80004d88:	834e                	mv	t1,s3
80004d8a:	0138f363          	bgeu	a7,s3,80004d90 <MiCo_2D_FP32toQ1+0x98>
80004d8e:	8346                	mv	t1,a7
80004d90:	00281613          	slli	a2,a6,0x2
80004d94:	4781                	li	a5,0
80004d96:	4414                	lw	a3,8(s0)
80004d98:	00b78733          	add	a4,a5,a1
80004d9c:	830d                	srli	a4,a4,0x3
80004d9e:	96ba                	add	a3,a3,a4
80004da0:	00068023          	sb	zero,0(a3)
80004da4:	0297f163          	bgeu	a5,s1,80004dc6 <MiCo_2D_FP32toQ1+0xce>
80004da8:	00892e03          	lw	t3,8(s2)
80004dac:	4414                	lw	a3,8(s0)
80004dae:	9e32                	add	t3,t3,a2
80004db0:	fe4e2707          	flw	fa4,-28(t3)
80004db4:	96ba                	add	a3,a3,a4
80004db6:	0006ce83          	lbu	t4,0(a3)
80004dba:	a0f70e53          	fle.s	t3,fa4,fa5
80004dbe:	01de6e33          	or	t3,t3,t4
80004dc2:	01c68023          	sb	t3,0(a3)
80004dc6:	00178693          	addi	a3,a5,1
80004dca:	0296f363          	bgeu	a3,s1,80004df0 <MiCo_2D_FP32toQ1+0xf8>
80004dce:	00892683          	lw	a3,8(s2)
80004dd2:	00842e03          	lw	t3,8(s0)
80004dd6:	96b2                	add	a3,a3,a2
80004dd8:	fe86a707          	flw	fa4,-24(a3)
80004ddc:	9e3a                	add	t3,t3,a4
80004dde:	000e4e83          	lbu	t4,0(t3)
80004de2:	a0f706d3          	fle.s	a3,fa4,fa5
80004de6:	0686                	slli	a3,a3,0x1
80004de8:	01d6e6b3          	or	a3,a3,t4
80004dec:	00de0023          	sb	a3,0(t3)
80004df0:	00278693          	addi	a3,a5,2
80004df4:	0296f363          	bgeu	a3,s1,80004e1a <MiCo_2D_FP32toQ1+0x122>
80004df8:	00892683          	lw	a3,8(s2)
80004dfc:	00842e03          	lw	t3,8(s0)
80004e00:	96b2                	add	a3,a3,a2
80004e02:	fec6a707          	flw	fa4,-20(a3)
80004e06:	9e3a                	add	t3,t3,a4
80004e08:	000e4e83          	lbu	t4,0(t3)
80004e0c:	a0f706d3          	fle.s	a3,fa4,fa5
80004e10:	068a                	slli	a3,a3,0x2
80004e12:	01d6e6b3          	or	a3,a3,t4
80004e16:	00de0023          	sb	a3,0(t3)
80004e1a:	00378693          	addi	a3,a5,3
80004e1e:	0296f363          	bgeu	a3,s1,80004e44 <MiCo_2D_FP32toQ1+0x14c>
80004e22:	00892683          	lw	a3,8(s2)
80004e26:	00842e03          	lw	t3,8(s0)
80004e2a:	96b2                	add	a3,a3,a2
80004e2c:	ff06a707          	flw	fa4,-16(a3)
80004e30:	9e3a                	add	t3,t3,a4
80004e32:	000e4e83          	lbu	t4,0(t3)
80004e36:	a0f706d3          	fle.s	a3,fa4,fa5
80004e3a:	068e                	slli	a3,a3,0x3
80004e3c:	01d6e6b3          	or	a3,a3,t4
80004e40:	00de0023          	sb	a3,0(t3)
80004e44:	00478693          	addi	a3,a5,4
80004e48:	0296f363          	bgeu	a3,s1,80004e6e <MiCo_2D_FP32toQ1+0x176>
80004e4c:	00892683          	lw	a3,8(s2)
80004e50:	00842e03          	lw	t3,8(s0)
80004e54:	96b2                	add	a3,a3,a2
80004e56:	ff46a707          	flw	fa4,-12(a3)
80004e5a:	9e3a                	add	t3,t3,a4
80004e5c:	000e4e83          	lbu	t4,0(t3)
80004e60:	a0f706d3          	fle.s	a3,fa4,fa5
80004e64:	0692                	slli	a3,a3,0x4
80004e66:	01d6e6b3          	or	a3,a3,t4
80004e6a:	00de0023          	sb	a3,0(t3)
80004e6e:	00578693          	addi	a3,a5,5
80004e72:	0296f363          	bgeu	a3,s1,80004e98 <MiCo_2D_FP32toQ1+0x1a0>
80004e76:	00892683          	lw	a3,8(s2)
80004e7a:	00842e03          	lw	t3,8(s0)
80004e7e:	96b2                	add	a3,a3,a2
80004e80:	ff86a707          	flw	fa4,-8(a3)
80004e84:	9e3a                	add	t3,t3,a4
80004e86:	000e4e83          	lbu	t4,0(t3)
80004e8a:	a0f706d3          	fle.s	a3,fa4,fa5
80004e8e:	0696                	slli	a3,a3,0x5
80004e90:	01d6e6b3          	or	a3,a3,t4
80004e94:	00de0023          	sb	a3,0(t3)
80004e98:	00678693          	addi	a3,a5,6
80004e9c:	0296f363          	bgeu	a3,s1,80004ec2 <MiCo_2D_FP32toQ1+0x1ca>
80004ea0:	00892683          	lw	a3,8(s2)
80004ea4:	00842e03          	lw	t3,8(s0)
80004ea8:	96b2                	add	a3,a3,a2
80004eaa:	ffc6a707          	flw	fa4,-4(a3)
80004eae:	9e3a                	add	t3,t3,a4
80004eb0:	000e4e83          	lbu	t4,0(t3)
80004eb4:	a0f706d3          	fle.s	a3,fa4,fa5
80004eb8:	069a                	slli	a3,a3,0x6
80004eba:	01d6e6b3          	or	a3,a3,t4
80004ebe:	00de0023          	sb	a3,0(t3)
80004ec2:	00778693          	addi	a3,a5,7
80004ec6:	0296f263          	bgeu	a3,s1,80004eea <MiCo_2D_FP32toQ1+0x1f2>
80004eca:	00892e03          	lw	t3,8(s2)
80004ece:	4414                	lw	a3,8(s0)
80004ed0:	9e32                	add	t3,t3,a2
80004ed2:	000e2707          	flw	fa4,0(t3)
80004ed6:	9736                	add	a4,a4,a3
80004ed8:	00074e03          	lbu	t3,0(a4)
80004edc:	a0f706d3          	fle.s	a3,fa4,fa5
80004ee0:	069e                	slli	a3,a3,0x7
80004ee2:	01c6e6b3          	or	a3,a3,t3
80004ee6:	00d70023          	sb	a3,0(a4)
80004eea:	07a1                	addi	a5,a5,8
80004eec:	873e                	mv	a4,a5
80004eee:	02060613          	addi	a2,a2,32
80004ef2:	ea67e2e3          	bltu	a5,t1,80004d96 <MiCo_2D_FP32toQ1+0x9e>
80004ef6:	e737e0e3          	bltu	a5,s3,80004d56 <MiCo_2D_FP32toQ1+0x5e>
80004efa:	0505                	addi	a0,a0,1
80004efc:	95ce                	add	a1,a1,s3
80004efe:	9826                	add	a6,a6,s1
80004f00:	e54517e3          	bne	a0,s4,80004d4e <MiCo_2D_FP32toQ1+0x56>
80004f04:	bd85                	j	80004d74 <MiCo_2D_FP32toQ1+0x7c>

80004f06 <MiCo_4D_FP32toQ8>:
80004f06:	41dc                	lw	a5,4(a1)
80004f08:	4194                	lw	a3,0(a1)
80004f0a:	4598                	lw	a4,8(a1)
80004f0c:	45d0                	lw	a2,12(a1)
80004f0e:	02d787b3          	mul	a5,a5,a3
80004f12:	1141                	addi	sp,sp,-16
80004f14:	c422                	sw	s0,8(sp)
80004f16:	498c                	lw	a1,16(a1)
80004f18:	842a                	mv	s0,a0
80004f1a:	4908                	lw	a0,16(a0)
80004f1c:	c606                	sw	ra,12(sp)
80004f1e:	02e787b3          	mul	a5,a5,a4
80004f22:	02c78633          	mul	a2,a5,a2
80004f26:	edeff0ef          	jal	ra,80004604 <__FP32toQ8>
80004f2a:	40b2                	lw	ra,12(sp)
80004f2c:	e848                	fsw	fa0,20(s0)
80004f2e:	4422                	lw	s0,8(sp)
80004f30:	0141                	addi	sp,sp,16
80004f32:	8082                	ret

80004f34 <MiCo_4D_FP32toQ4>:
80004f34:	41dc                	lw	a5,4(a1)
80004f36:	4194                	lw	a3,0(a1)
80004f38:	4598                	lw	a4,8(a1)
80004f3a:	45d0                	lw	a2,12(a1)
80004f3c:	02d787b3          	mul	a5,a5,a3
80004f40:	1141                	addi	sp,sp,-16
80004f42:	c422                	sw	s0,8(sp)
80004f44:	498c                	lw	a1,16(a1)
80004f46:	842a                	mv	s0,a0
80004f48:	4908                	lw	a0,16(a0)
80004f4a:	c606                	sw	ra,12(sp)
80004f4c:	02e787b3          	mul	a5,a5,a4
80004f50:	02c78633          	mul	a2,a5,a2
80004f54:	f08ff0ef          	jal	ra,8000465c <__FP32toQ4>
80004f58:	40b2                	lw	ra,12(sp)
80004f5a:	e848                	fsw	fa0,20(s0)
80004f5c:	4422                	lw	s0,8(sp)
80004f5e:	0141                	addi	sp,sp,16
80004f60:	8082                	ret

80004f62 <MiCo_4D_FP32toQ2>:
80004f62:	41dc                	lw	a5,4(a1)
80004f64:	4194                	lw	a3,0(a1)
80004f66:	4598                	lw	a4,8(a1)
80004f68:	45d0                	lw	a2,12(a1)
80004f6a:	02d787b3          	mul	a5,a5,a3
80004f6e:	1141                	addi	sp,sp,-16
80004f70:	c422                	sw	s0,8(sp)
80004f72:	498c                	lw	a1,16(a1)
80004f74:	842a                	mv	s0,a0
80004f76:	4908                	lw	a0,16(a0)
80004f78:	c606                	sw	ra,12(sp)
80004f7a:	02e787b3          	mul	a5,a5,a4
80004f7e:	02c78633          	mul	a2,a5,a2
80004f82:	f60ff0ef          	jal	ra,800046e2 <__FP32toQ2>
80004f86:	40b2                	lw	ra,12(sp)
80004f88:	e848                	fsw	fa0,20(s0)
80004f8a:	4422                	lw	s0,8(sp)
80004f8c:	0141                	addi	sp,sp,16
80004f8e:	8082                	ret

80004f90 <MiCo_4D_FP32toQ1>:
80004f90:	41dc                	lw	a5,4(a1)
80004f92:	4194                	lw	a3,0(a1)
80004f94:	4598                	lw	a4,8(a1)
80004f96:	45d0                	lw	a2,12(a1)
80004f98:	02d787b3          	mul	a5,a5,a3
80004f9c:	1141                	addi	sp,sp,-16
80004f9e:	c422                	sw	s0,8(sp)
80004fa0:	498c                	lw	a1,16(a1)
80004fa2:	842a                	mv	s0,a0
80004fa4:	4908                	lw	a0,16(a0)
80004fa6:	c606                	sw	ra,12(sp)
80004fa8:	02e787b3          	mul	a5,a5,a4
80004fac:	02c78633          	mul	a2,a5,a2
80004fb0:	30b9                	jal	800047fe <__FP32toQ1>
80004fb2:	40b2                	lw	ra,12(sp)
80004fb4:	e848                	fsw	fa0,20(s0)
80004fb6:	4422                	lw	s0,8(sp)
80004fb8:	0141                	addi	sp,sp,16
80004fba:	8082                	ret

80004fbc <software_popcount>:
80004fbc:	55555737          	lui	a4,0x55555
80004fc0:	00155793          	srli	a5,a0,0x1
80004fc4:	55570713          	addi	a4,a4,1365 # 55555555 <__stack_size+0x55155555>
80004fc8:	8ff9                	and	a5,a5,a4
80004fca:	8d1d                	sub	a0,a0,a5
80004fcc:	333337b7          	lui	a5,0x33333
80004fd0:	00255713          	srli	a4,a0,0x2
80004fd4:	33378793          	addi	a5,a5,819 # 33333333 <__stack_size+0x32f33333>
80004fd8:	8d7d                	and	a0,a0,a5
80004fda:	8ff9                	and	a5,a5,a4
80004fdc:	97aa                	add	a5,a5,a0
80004fde:	0047d513          	srli	a0,a5,0x4
80004fe2:	97aa                	add	a5,a5,a0
80004fe4:	0f0f1537          	lui	a0,0xf0f1
80004fe8:	f0f50513          	addi	a0,a0,-241 # f0f0f0f <__stack_size+0xecf0f0f>
80004fec:	8fe9                	and	a5,a5,a0
80004fee:	0087d513          	srli	a0,a5,0x8
80004ff2:	97aa                	add	a5,a5,a0
80004ff4:	0107d513          	srli	a0,a5,0x10
80004ff8:	953e                	add	a0,a0,a5
80004ffa:	03f57513          	andi	a0,a0,63
80004ffe:	8082                	ret

80005000 <safe_load_qword>:
80005000:	00154703          	lbu	a4,1(a0)
80005004:	00054603          	lbu	a2,0(a0)
80005008:	00254783          	lbu	a5,2(a0)
8000500c:	00354683          	lbu	a3,3(a0)
80005010:	00871513          	slli	a0,a4,0x8
80005014:	8d51                	or	a0,a0,a2
80005016:	07c2                	slli	a5,a5,0x10
80005018:	8fc9                	or	a5,a5,a0
8000501a:	01869513          	slli	a0,a3,0x18
8000501e:	8d5d                	or	a0,a0,a5
80005020:	8082                	ret

80005022 <MiCo_Q8_MatMul>:
80005022:	7131                	addi	sp,sp,-192
80005024:	4198                	lw	a4,0(a1)
80005026:	df22                	sw	s0,188(sp)
80005028:	dd26                	sw	s1,184(sp)
8000502a:	41c0                	lw	s0,4(a1)
8000502c:	4204                	lw	s1,0(a2)
8000502e:	db4a                	sw	s2,180(sp)
80005030:	d94e                	sw	s3,176(sp)
80005032:	d752                	sw	s4,172(sp)
80005034:	d556                	sw	s5,168(sp)
80005036:	d35a                	sw	s6,164(sp)
80005038:	d15e                	sw	s7,160(sp)
8000503a:	cf62                	sw	s8,156(sp)
8000503c:	cd66                	sw	s9,152(sp)
8000503e:	cb6a                	sw	s10,148(sp)
80005040:	c96e                	sw	s11,144(sp)
80005042:	c8a2                	sw	s0,80(sp)
80005044:	deba                	sw	a4,124(sp)
80005046:	dab2                	sw	a2,116(sp)
80005048:	d0a6                	sw	s1,96(sp)
8000504a:	c52a                	sw	a0,136(sp)
8000504c:	34070163          	beqz	a4,8000538e <MiCo_Q8_MatMul+0x36c>
80005050:	4594                	lw	a3,8(a1)
80005052:	4595                	li	a1,5
80005054:	02b4d5b3          	divu	a1,s1,a1
80005058:	ffc47a93          	andi	s5,s0,-4
8000505c:	00249813          	slli	a6,s1,0x2
80005060:	88b6                	mv	a7,a3
80005062:	c2b6                	sw	a3,68(sp)
80005064:	40900733          	neg	a4,s1
80005068:	96d6                	add	a3,a3,s5
8000506a:	00241793          	slli	a5,s0,0x2
8000506e:	9542                	add	a0,a0,a6
80005070:	d4b6                	sw	a3,104(sp)
80005072:	070a                	slli	a4,a4,0x2
80005074:	008886b3          	add	a3,a7,s0
80005078:	97a2                	add	a5,a5,s0
8000507a:	c142                	sw	a6,128(sp)
8000507c:	4611                	li	a2,4
8000507e:	ceaa                	sw	a0,92(sp)
80005080:	d6b6                	sw	a3,108(sp)
80005082:	c73a                	sw	a4,140(sp)
80005084:	ccbe                	sw	a5,88(sp)
80005086:	dc82                	sw	zero,120(sp)
80005088:	caae                	sw	a1,84(sp)
8000508a:	32966863          	bltu	a2,s1,800053ba <MiCo_Q8_MatMul+0x398>
8000508e:	47c6                	lw	a5,80(sp)
80005090:	5766                	lw	a4,120(sp)
80005092:	d282                	sw	zero,100(sp)
80005094:	d882                	sw	zero,112(sp)
80005096:	02e787b3          	mul	a5,a5,a4
8000509a:	c33e                	sw	a5,132(sp)
8000509c:	5786                	lw	a5,96(sp)
8000509e:	4711                	li	a4,4
800050a0:	20f77c63          	bgeu	a4,a5,800052b8 <MiCo_Q8_MatMul+0x296>
800050a4:	57d6                	lw	a5,116(sp)
800050a6:	4776                	lw	a4,92(sp)
800050a8:	46ba                	lw	a3,140(sp)
800050aa:	479c                	lw	a5,8(a5)
800050ac:	c482                	sw	zero,72(sp)
800050ae:	9736                	add	a4,a4,a3
800050b0:	d83e                	sw	a5,48(sp)
800050b2:	c6ba                	sw	a4,76(sp)
800050b4:	873e                	mv	a4,a5
800050b6:	47c6                	lw	a5,80(sp)
800050b8:	d656                	sw	s5,44(sp)
800050ba:	973e                	add	a4,a4,a5
800050bc:	da3a                	sw	a4,52(sp)
800050be:	973e                	add	a4,a4,a5
800050c0:	dc3a                	sw	a4,56(sp)
800050c2:	973e                	add	a4,a4,a5
800050c4:	97ba                	add	a5,a5,a4
800050c6:	de3a                	sw	a4,60(sp)
800050c8:	c0be                	sw	a5,64(sp)
800050ca:	57b2                	lw	a5,44(sp)
800050cc:	2c078f63          	beqz	a5,800053aa <MiCo_Q8_MatMul+0x388>
800050d0:	4306                	lw	t1,64(sp)
800050d2:	58f2                	lw	a7,60(sp)
800050d4:	5862                	lw	a6,56(sp)
800050d6:	5652                	lw	a2,52(sp)
800050d8:	56c2                	lw	a3,48(sp)
800050da:	4796                	lw	a5,68(sp)
800050dc:	4401                	li	s0,0
800050de:	4b01                	li	s6,0
800050e0:	4481                	li	s1,0
800050e2:	4901                	li	s2,0
800050e4:	4a81                	li	s5,0
800050e6:	4d81                	li	s11,0
800050e8:	c24a                	sw	s2,4(sp)
800050ea:	8d26                	mv	s10,s1
800050ec:	c45a                	sw	s6,8(sp)
800050ee:	c622                	sw	s0,12(sp)
800050f0:	00078903          	lb	s2,0(a5)
800050f4:	00178583          	lb	a1,1(a5)
800050f8:	00080b83          	lb	s7,0(a6)
800050fc:	00180383          	lb	t2,1(a6)
80005100:	00088283          	lb	t0,0(a7)
80005104:	00188b03          	lb	s6,1(a7)
80005108:	032b8bb3          	mul	s7,s7,s2
8000510c:	00380e03          	lb	t3,3(a6)
80005110:	00130503          	lb	a0,1(t1)
80005114:	00030703          	lb	a4,0(t1)
80005118:	ca72                	sw	t3,20(sp)
8000511a:	00388e03          	lb	t3,3(a7)
8000511e:	00230f83          	lb	t6,2(t1)
80005122:	d02a                	sw	a0,32(sp)
80005124:	cc72                	sw	t3,24(sp)
80005126:	00280503          	lb	a0,2(a6)
8000512a:	02bb0b33          	mul	s6,s6,a1
8000512e:	00330e03          	lb	t3,3(t1)
80005132:	ce3a                	sw	a4,28(sp)
80005134:	00068c83          	lb	s9,0(a3)
80005138:	00278703          	lb	a4,2(a5)
8000513c:	00168483          	lb	s1,1(a3)
80005140:	00060c03          	lb	s8,0(a2)
80005144:	00160403          	lb	s0,1(a2)
80005148:	00268f03          	lb	t5,2(a3)
8000514c:	00260e83          	lb	t4,2(a2)
80005150:	02b383b3          	mul	t2,t2,a1
80005154:	00368a03          	lb	s4,3(a3)
80005158:	00360983          	lb	s3,3(a2)
8000515c:	c82a                	sw	a0,16(sp)
8000515e:	d27e                	sw	t6,36(sp)
80005160:	00288503          	lb	a0,2(a7)
80005164:	00378f83          	lb	t6,3(a5)
80005168:	d472                	sw	t3,40(sp)
8000516a:	0a91                	addi	s5,s5,4
8000516c:	0791                	addi	a5,a5,4
8000516e:	032282b3          	mul	t0,t0,s2
80005172:	93de                	add	t2,t2,s7
80005174:	4bf2                	lw	s7,28(sp)
80005176:	0691                	addi	a3,a3,4
80005178:	0611                	addi	a2,a2,4
8000517a:	0811                	addi	a6,a6,4
8000517c:	0891                	addi	a7,a7,4
8000517e:	0311                	addi	t1,t1,4
80005180:	92da                	add	t0,t0,s6
80005182:	5b02                	lw	s6,32(sp)
80005184:	032c8cb3          	mul	s9,s9,s2
80005188:	02b484b3          	mul	s1,s1,a1
8000518c:	032c0c33          	mul	s8,s8,s2
80005190:	94e6                	add	s1,s1,s9
80005192:	02b40433          	mul	s0,s0,a1
80005196:	032b8933          	mul	s2,s7,s2
8000519a:	9462                	add	s0,s0,s8
8000519c:	02bb05b3          	mul	a1,s6,a1
800051a0:	992e                	add	s2,s2,a1
800051a2:	45c2                	lw	a1,16(sp)
800051a4:	02ef0f33          	mul	t5,t5,a4
800051a8:	02e58e33          	mul	t3,a1,a4
800051ac:	5592                	lw	a1,36(sp)
800051ae:	94fa                	add	s1,s1,t5
800051b0:	02ee8eb3          	mul	t4,t4,a4
800051b4:	93f2                	add	t2,t2,t3
800051b6:	4e52                	lw	t3,20(sp)
800051b8:	02e50533          	mul	a0,a0,a4
800051bc:	9476                	add	s0,s0,t4
800051be:	02e58733          	mul	a4,a1,a4
800051c2:	92aa                	add	t0,t0,a0
800051c4:	4592                	lw	a1,4(sp)
800051c6:	03fe0e33          	mul	t3,t3,t6
800051ca:	993a                	add	s2,s2,a4
800051cc:	4762                	lw	a4,24(sp)
800051ce:	03f70b33          	mul	s6,a4,t6
800051d2:	93f2                	add	t2,t2,t3
800051d4:	5e22                	lw	t3,40(sp)
800051d6:	4722                	lw	a4,8(sp)
800051d8:	9d9e                	add	s11,s11,t2
800051da:	03fa0a33          	mul	s4,s4,t6
800051de:	9b16                	add	s6,s6,t0
800051e0:	975a                	add	a4,a4,s6
800051e2:	c43a                	sw	a4,8(sp)
800051e4:	4732                	lw	a4,12(sp)
800051e6:	03f989b3          	mul	s3,s3,t6
800051ea:	94d2                	add	s1,s1,s4
800051ec:	95a6                	add	a1,a1,s1
800051ee:	c22e                	sw	a1,4(sp)
800051f0:	03fe0fb3          	mul	t6,t3,t6
800051f4:	944e                	add	s0,s0,s3
800051f6:	9d22                	add	s10,s10,s0
800051f8:	997e                	add	s2,s2,t6
800051fa:	974a                	add	a4,a4,s2
800051fc:	c63a                	sw	a4,12(sp)
800051fe:	5732                	lw	a4,44(sp)
80005200:	eeeae8e3          	bltu	s5,a4,800050f0 <MiCo_Q8_MatMul+0xce>
80005204:	4b22                	lw	s6,8(sp)
80005206:	4432                	lw	s0,12(sp)
80005208:	892e                	mv	s2,a1
8000520a:	84ea                	mv	s1,s10
8000520c:	87ba                	mv	a5,a4
8000520e:	48c6                	lw	a7,80(sp)
80005210:	0717f263          	bgeu	a5,a7,80005274 <MiCo_Q8_MatMul+0x252>
80005214:	5342                	lw	t1,48(sp)
80005216:	5e52                	lw	t3,52(sp)
80005218:	5ee2                	lw	t4,56(sp)
8000521a:	5f72                	lw	t5,60(sp)
8000521c:	4f86                	lw	t6,64(sp)
8000521e:	4296                	lw	t0,68(sp)
80005220:	00f28733          	add	a4,t0,a5
80005224:	00f30833          	add	a6,t1,a5
80005228:	00fe0533          	add	a0,t3,a5
8000522c:	00fe85b3          	add	a1,t4,a5
80005230:	00ff0633          	add	a2,t5,a5
80005234:	00ff86b3          	add	a3,t6,a5
80005238:	00070703          	lb	a4,0(a4)
8000523c:	00080803          	lb	a6,0(a6)
80005240:	00050503          	lb	a0,0(a0)
80005244:	00058583          	lb	a1,0(a1)
80005248:	00060603          	lb	a2,0(a2)
8000524c:	00068683          	lb	a3,0(a3)
80005250:	02e80833          	mul	a6,a6,a4
80005254:	0785                	addi	a5,a5,1
80005256:	02e50533          	mul	a0,a0,a4
8000525a:	9942                	add	s2,s2,a6
8000525c:	02e585b3          	mul	a1,a1,a4
80005260:	94aa                	add	s1,s1,a0
80005262:	02e60633          	mul	a2,a2,a4
80005266:	9dae                	add	s11,s11,a1
80005268:	02e68733          	mul	a4,a3,a4
8000526c:	9b32                	add	s6,s6,a2
8000526e:	943a                	add	s0,s0,a4
80005270:	faf898e3          	bne	a7,a5,80005220 <MiCo_Q8_MatMul+0x1fe>
80005274:	47b6                	lw	a5,76(sp)
80005276:	56c2                	lw	a3,48(sp)
80005278:	4726                	lw	a4,72(sp)
8000527a:	0127a023          	sw	s2,0(a5)
8000527e:	c3c4                	sw	s1,4(a5)
80005280:	01b7a423          	sw	s11,8(a5)
80005284:	0167a623          	sw	s6,12(a5)
80005288:	cb80                	sw	s0,16(a5)
8000528a:	07d1                	addi	a5,a5,20
8000528c:	c6be                	sw	a5,76(sp)
8000528e:	47e6                	lw	a5,88(sp)
80005290:	0705                	addi	a4,a4,1
80005292:	c4ba                	sw	a4,72(sp)
80005294:	96be                	add	a3,a3,a5
80005296:	d836                	sw	a3,48(sp)
80005298:	56d2                	lw	a3,52(sp)
8000529a:	96be                	add	a3,a3,a5
8000529c:	da36                	sw	a3,52(sp)
8000529e:	56e2                	lw	a3,56(sp)
800052a0:	96be                	add	a3,a3,a5
800052a2:	dc36                	sw	a3,56(sp)
800052a4:	56f2                	lw	a3,60(sp)
800052a6:	96be                	add	a3,a3,a5
800052a8:	de36                	sw	a3,60(sp)
800052aa:	4686                	lw	a3,64(sp)
800052ac:	97b6                	add	a5,a5,a3
800052ae:	c0be                	sw	a5,64(sp)
800052b0:	47d6                	lw	a5,84(sp)
800052b2:	e0f76ce3          	bltu	a4,a5,800050ca <MiCo_Q8_MatMul+0xa8>
800052b6:	5ab2                	lw	s5,44(sp)
800052b8:	5706                	lw	a4,96(sp)
800052ba:	57e6                	lw	a5,120(sp)
800052bc:	0ae7f063          	bgeu	a5,a4,8000535c <MiCo_Q8_MatMul+0x33a>
800052c0:	5756                	lw	a4,116(sp)
800052c2:	4e46                	lw	t3,80(sp)
800052c4:	4ef6                	lw	t4,92(sp)
800052c6:	00872283          	lw	t0,8(a4)
800052ca:	5716                	lw	a4,100(sp)
800052cc:	5f26                	lw	t5,104(sp)
800052ce:	4396                	lw	t2,68(sp)
800052d0:	00e78fb3          	add	t6,a5,a4
800052d4:	47aa                	lw	a5,136(sp)
800052d6:	0f8a                	slli	t6,t6,0x2
800052d8:	5336                	lw	t1,108(sp)
800052da:	9fbe                	add	t6,t6,a5
800052dc:	479a                	lw	a5,132(sp)
800052de:	92be                	add	t0,t0,a5
800052e0:	0c0a8b63          	beqz	s5,800053b6 <MiCo_Q8_MatMul+0x394>
800052e4:	8616                	mv	a2,t0
800052e6:	869e                	mv	a3,t2
800052e8:	4881                	li	a7,0
800052ea:	4781                	li	a5,0
800052ec:	00068503          	lb	a0,0(a3)
800052f0:	00060983          	lb	s3,0(a2)
800052f4:	00168583          	lb	a1,1(a3)
800052f8:	00160903          	lb	s2,1(a2)
800052fc:	03350533          	mul	a0,a0,s3
80005300:	00268703          	lb	a4,2(a3)
80005304:	00260483          	lb	s1,2(a2)
80005308:	00368803          	lb	a6,3(a3)
8000530c:	00360403          	lb	s0,3(a2)
80005310:	0891                	addi	a7,a7,4
80005312:	0691                	addi	a3,a3,4
80005314:	0611                	addi	a2,a2,4
80005316:	032585b3          	mul	a1,a1,s2
8000531a:	953e                	add	a0,a0,a5
8000531c:	029707b3          	mul	a5,a4,s1
80005320:	00a58733          	add	a4,a1,a0
80005324:	02880533          	mul	a0,a6,s0
80005328:	97ba                	add	a5,a5,a4
8000532a:	97aa                	add	a5,a5,a0
8000532c:	fd58e0e3          	bltu	a7,s5,800052ec <MiCo_Q8_MatMul+0x2ca>
80005330:	03caf063          	bgeu	s5,t3,80005350 <MiCo_Q8_MatMul+0x32e>
80005334:	005a8633          	add	a2,s5,t0
80005338:	877a                	mv	a4,t5
8000533a:	00070683          	lb	a3,0(a4)
8000533e:	00060583          	lb	a1,0(a2)
80005342:	0705                	addi	a4,a4,1
80005344:	0605                	addi	a2,a2,1
80005346:	02b686b3          	mul	a3,a3,a1
8000534a:	97b6                	add	a5,a5,a3
8000534c:	fe6717e3          	bne	a4,t1,8000533a <MiCo_Q8_MatMul+0x318>
80005350:	00ffa023          	sw	a5,0(t6)
80005354:	0f91                	addi	t6,t6,4
80005356:	92f2                	add	t0,t0,t3
80005358:	f9df94e3          	bne	t6,t4,800052e0 <MiCo_Q8_MatMul+0x2be>
8000535c:	57c6                	lw	a5,112(sp)
8000535e:	5686                	lw	a3,96(sp)
80005360:	00178713          	addi	a4,a5,1
80005364:	5796                	lw	a5,100(sp)
80005366:	d8ba                	sw	a4,112(sp)
80005368:	97b6                	add	a5,a5,a3
8000536a:	d2be                	sw	a5,100(sp)
8000536c:	468a                	lw	a3,128(sp)
8000536e:	47f6                	lw	a5,92(sp)
80005370:	97b6                	add	a5,a5,a3
80005372:	cebe                	sw	a5,92(sp)
80005374:	56a6                	lw	a3,104(sp)
80005376:	47c6                	lw	a5,80(sp)
80005378:	96be                	add	a3,a3,a5
8000537a:	d4b6                	sw	a3,104(sp)
8000537c:	4696                	lw	a3,68(sp)
8000537e:	96be                	add	a3,a3,a5
80005380:	c2b6                	sw	a3,68(sp)
80005382:	56b6                	lw	a3,108(sp)
80005384:	97b6                	add	a5,a5,a3
80005386:	d6be                	sw	a5,108(sp)
80005388:	57f6                	lw	a5,124(sp)
8000538a:	d0e799e3          	bne	a5,a4,8000509c <MiCo_Q8_MatMul+0x7a>
8000538e:	547a                	lw	s0,188(sp)
80005390:	54ea                	lw	s1,184(sp)
80005392:	595a                	lw	s2,180(sp)
80005394:	59ca                	lw	s3,176(sp)
80005396:	5a3a                	lw	s4,172(sp)
80005398:	5aaa                	lw	s5,168(sp)
8000539a:	5b1a                	lw	s6,164(sp)
8000539c:	5b8a                	lw	s7,160(sp)
8000539e:	4c7a                	lw	s8,156(sp)
800053a0:	4cea                	lw	s9,152(sp)
800053a2:	4d5a                	lw	s10,148(sp)
800053a4:	4dca                	lw	s11,144(sp)
800053a6:	6129                	addi	sp,sp,192
800053a8:	8082                	ret
800053aa:	4401                	li	s0,0
800053ac:	4b01                	li	s6,0
800053ae:	4d81                	li	s11,0
800053b0:	4481                	li	s1,0
800053b2:	4901                	li	s2,0
800053b4:	bda9                	j	8000520e <MiCo_Q8_MatMul+0x1ec>
800053b6:	4781                	li	a5,0
800053b8:	bfa5                	j	80005330 <MiCo_Q8_MatMul+0x30e>
800053ba:	00259793          	slli	a5,a1,0x2
800053be:	97ae                	add	a5,a5,a1
800053c0:	dcbe                	sw	a5,120(sp)
800053c2:	b1f1                	j	8000508e <MiCo_Q8_MatMul+0x6c>

800053c4 <MiCo_Q8x4_MatMul>:
800053c4:	715d                	addi	sp,sp,-80
800053c6:	de52                	sw	s4,60(sp)
800053c8:	872e                	mv	a4,a1
800053ca:	0045aa03          	lw	s4,4(a1)
800053ce:	418c                	lw	a1,0(a1)
800053d0:	c6a2                	sw	s0,76(sp)
800053d2:	c4a6                	sw	s1,72(sp)
800053d4:	c2ca                	sw	s2,68(sp)
800053d6:	c0ce                	sw	s3,64(sp)
800053d8:	dc56                	sw	s5,56(sp)
800053da:	da5a                	sw	s6,52(sp)
800053dc:	d85e                	sw	s7,48(sp)
800053de:	d662                	sw	s8,44(sp)
800053e0:	d466                	sw	s9,40(sp)
800053e2:	d26a                	sw	s10,36(sp)
800053e4:	d06e                	sw	s11,32(sp)
800053e6:	ca2e                	sw	a1,20(sp)
800053e8:	421c                	lw	a5,0(a2)
800053ea:	14058063          	beqz	a1,8000552a <MiCo_Q8x4_MatMul+0x166>
800053ee:	12078e63          	beqz	a5,8000552a <MiCo_Q8x4_MatMul+0x166>
800053f2:	86b2                	mv	a3,a2
800053f4:	4718                	lw	a4,8(a4)
800053f6:	40f00633          	neg	a2,a5
800053fa:	078a                	slli	a5,a5,0x2
800053fc:	00f50c33          	add	s8,a0,a5
80005400:	0086ac83          	lw	s9,8(a3)
80005404:	00261793          	slli	a5,a2,0x2
80005408:	cc3e                	sw	a5,24(sp)
8000540a:	00361793          	slli	a5,a2,0x3
8000540e:	ff8a7993          	andi	s3,s4,-8
80005412:	c83a                	sw	a4,16(sp)
80005414:	4d01                	li	s10,0
80005416:	4d81                	li	s11,0
80005418:	ce3e                	sw	a5,28(sp)
8000541a:	47e2                	lw	a5,24(sp)
8000541c:	4b81                	li	s7,0
8000541e:	01878b33          	add	s6,a5,s8
80005422:	47c2                	lw	a5,16(sp)
80005424:	c65a                	sw	s6,12(sp)
80005426:	01a78ab3          	add	s5,a5,s10
8000542a:	001bd513          	srli	a0,s7,0x1
8000542e:	9566                	add	a0,a0,s9
80005430:	10098b63          	beqz	s3,80005546 <MiCo_Q8x4_MatMul+0x182>
80005434:	8756                	mv	a4,s5
80005436:	4301                	li	t1,0
80005438:	4781                	li	a5,0
8000543a:	00135693          	srli	a3,t1,0x1
8000543e:	96aa                	add	a3,a3,a0
80005440:	00068803          	lb	a6,0(a3)
80005444:	00070603          	lb	a2,0(a4)
80005448:	00170e83          	lb	t4,1(a4)
8000544c:	01c81293          	slli	t0,a6,0x1c
80005450:	41c2d293          	srai	t0,t0,0x1c
80005454:	02c282b3          	mul	t0,t0,a2
80005458:	40485813          	srai	a6,a6,0x4
8000545c:	00168583          	lb	a1,1(a3)
80005460:	00268883          	lb	a7,2(a3)
80005464:	00270903          	lb	s2,2(a4)
80005468:	00370483          	lb	s1,3(a4)
8000546c:	01c59f13          	slli	t5,a1,0x1c
80005470:	00368e03          	lb	t3,3(a3)
80005474:	00470403          	lb	s0,4(a4)
80005478:	41cf5f13          	srai	t5,t5,0x1c
8000547c:	03d80833          	mul	a6,a6,t4
80005480:	00570383          	lb	t2,5(a4)
80005484:	01c89613          	slli	a2,a7,0x1c
80005488:	8591                	srai	a1,a1,0x4
8000548a:	00670f83          	lb	t6,6(a4)
8000548e:	8671                	srai	a2,a2,0x1c
80005490:	00770e83          	lb	t4,7(a4)
80005494:	4048d693          	srai	a3,a7,0x4
80005498:	01ce1893          	slli	a7,t3,0x1c
8000549c:	9796                	add	a5,a5,t0
8000549e:	032f0f33          	mul	t5,t5,s2
800054a2:	41c8d893          	srai	a7,a7,0x1c
800054a6:	983e                	add	a6,a6,a5
800054a8:	404e5e13          	srai	t3,t3,0x4
800054ac:	0321                	addi	t1,t1,8
800054ae:	0721                	addi	a4,a4,8
800054b0:	029585b3          	mul	a1,a1,s1
800054b4:	987a                	add	a6,a6,t5
800054b6:	02860633          	mul	a2,a2,s0
800054ba:	95c2                	add	a1,a1,a6
800054bc:	027686b3          	mul	a3,a3,t2
800054c0:	962e                	add	a2,a2,a1
800054c2:	03f887b3          	mul	a5,a7,t6
800054c6:	96b2                	add	a3,a3,a2
800054c8:	03de0e33          	mul	t3,t3,t4
800054cc:	97b6                	add	a5,a5,a3
800054ce:	97f2                	add	a5,a5,t3
800054d0:	f73365e3          	bltu	t1,s3,8000543a <MiCo_Q8x4_MatMul+0x76>
800054d4:	0349fc63          	bgeu	s3,s4,8000550c <MiCo_Q8x4_MatMul+0x148>
800054d8:	86ce                	mv	a3,s3
800054da:	0016d713          	srli	a4,a3,0x1
800054de:	972a                	add	a4,a4,a0
800054e0:	00070603          	lb	a2,0(a4)
800054e4:	0016f813          	andi	a6,a3,1
800054e8:	00da85b3          	add	a1,s5,a3
800054ec:	00f67713          	andi	a4,a2,15
800054f0:	0685                	addi	a3,a3,1
800054f2:	00080463          	beqz	a6,800054fa <MiCo_Q8x4_MatMul+0x136>
800054f6:	40465713          	srai	a4,a2,0x4
800054fa:	00058603          	lb	a2,0(a1)
800054fe:	0772                	slli	a4,a4,0x1c
80005500:	8771                	srai	a4,a4,0x1c
80005502:	02c70733          	mul	a4,a4,a2
80005506:	97ba                	add	a5,a5,a4
80005508:	fcda19e3          	bne	s4,a3,800054da <MiCo_Q8x4_MatMul+0x116>
8000550c:	00fb2023          	sw	a5,0(s6)
80005510:	0b11                	addi	s6,s6,4
80005512:	9bd2                	add	s7,s7,s4
80005514:	f18b1be3          	bne	s6,s8,8000542a <MiCo_Q8x4_MatMul+0x66>
80005518:	47b2                	lw	a5,12(sp)
8000551a:	4772                	lw	a4,28(sp)
8000551c:	0d85                	addi	s11,s11,1
8000551e:	9d52                	add	s10,s10,s4
80005520:	40e78c33          	sub	s8,a5,a4
80005524:	47d2                	lw	a5,20(sp)
80005526:	efb79ae3          	bne	a5,s11,8000541a <MiCo_Q8x4_MatMul+0x56>
8000552a:	4436                	lw	s0,76(sp)
8000552c:	44a6                	lw	s1,72(sp)
8000552e:	4916                	lw	s2,68(sp)
80005530:	4986                	lw	s3,64(sp)
80005532:	5a72                	lw	s4,60(sp)
80005534:	5ae2                	lw	s5,56(sp)
80005536:	5b52                	lw	s6,52(sp)
80005538:	5bc2                	lw	s7,48(sp)
8000553a:	5c32                	lw	s8,44(sp)
8000553c:	5ca2                	lw	s9,40(sp)
8000553e:	5d12                	lw	s10,36(sp)
80005540:	5d82                	lw	s11,32(sp)
80005542:	6161                	addi	sp,sp,80
80005544:	8082                	ret
80005546:	4781                	li	a5,0
80005548:	b771                	j	800054d4 <MiCo_Q8x4_MatMul+0x110>

8000554a <MiCo_Q8x2_MatMul>:
8000554a:	7179                	addi	sp,sp,-48
8000554c:	d04e                	sw	s3,32(sp)
8000554e:	0005a983          	lw	s3,0(a1)
80005552:	d622                	sw	s0,44(sp)
80005554:	d426                	sw	s1,40(sp)
80005556:	d24a                	sw	s2,36(sp)
80005558:	ce52                	sw	s4,28(sp)
8000555a:	cc56                	sw	s5,24(sp)
8000555c:	ca5a                	sw	s6,20(sp)
8000555e:	c85e                	sw	s7,16(sp)
80005560:	c662                	sw	s8,12(sp)
80005562:	c466                	sw	s9,8(sp)
80005564:	c26a                	sw	s10,4(sp)
80005566:	c06e                	sw	s11,0(sp)
80005568:	0045a303          	lw	t1,4(a1)
8000556c:	421c                	lw	a5,0(a2)
8000556e:	32098863          	beqz	s3,8000589e <MiCo_Q8x2_MatMul+0x354>
80005572:	32078663          	beqz	a5,8000589e <MiCo_Q8x2_MatMul+0x354>
80005576:	00862283          	lw	t0,8(a2)
8000557a:	40f00933          	neg	s2,a5
8000557e:	078a                	slli	a5,a5,0x2
80005580:	0085aa83          	lw	s5,8(a1)
80005584:	00291a13          	slli	s4,s2,0x2
80005588:	ff037893          	andi	a7,t1,-16
8000558c:	00f50fb3          	add	t6,a0,a5
80005590:	4401                	li	s0,0
80005592:	4381                	li	t2,0
80005594:	4705                	li	a4,1
80005596:	4589                	li	a1,2
80005598:	090e                	slli	s2,s2,0x3
8000559a:	014f84b3          	add	s1,t6,s4
8000559e:	008a8e33          	add	t3,s5,s0
800055a2:	8ea6                	mv	t4,s1
800055a4:	4f01                	li	t5,0
800055a6:	002f5813          	srli	a6,t5,0x2
800055aa:	9816                	add	a6,a6,t0
800055ac:	36088b63          	beqz	a7,80005922 <MiCo_Q8x2_MatMul+0x3d8>
800055b0:	87f2                	mv	a5,t3
800055b2:	4501                	li	a0,0
800055b4:	4c81                	li	s9,0
800055b6:	a2dd                	j	8000579c <MiCo_Q8x2_MatMul+0x252>
800055b8:	1d75                	addi	s10,s10,-3
800055ba:	001d3d13          	seqz	s10,s10
800055be:	41a00d33          	neg	s10,s10
800055c2:	03ac8cb3          	mul	s9,s9,s10
800055c6:	0ffbfb93          	andi	s7,s7,255
800055ca:	006bdb93          	srli	s7,s7,0x6
800055ce:	00378d03          	lb	s10,3(a5)
800055d2:	9c66                	add	s8,s8,s9
800055d4:	00eb8b63          	beq	s7,a4,800055ea <MiCo_Q8x2_MatMul+0xa0>
800055d8:	22bb8d63          	beq	s7,a1,80005812 <MiCo_Q8x2_MatMul+0x2c8>
800055dc:	1bf5                	addi	s7,s7,-3
800055de:	001bbb93          	seqz	s7,s7
800055e2:	41700bb3          	neg	s7,s7
800055e6:	037d0d33          	mul	s10,s10,s7
800055ea:	003b7b93          	andi	s7,s6,3
800055ee:	00478d83          	lb	s11,4(a5)
800055f2:	9c6a                	add	s8,s8,s10
800055f4:	00eb8b63          	beq	s7,a4,8000560a <MiCo_Q8x2_MatMul+0xc0>
800055f8:	2cbb8163          	beq	s7,a1,800058ba <MiCo_Q8x2_MatMul+0x370>
800055fc:	1bf5                	addi	s7,s7,-3
800055fe:	001bbb93          	seqz	s7,s7
80005602:	41700bb3          	neg	s7,s7
80005606:	037d8db3          	mul	s11,s11,s7
8000560a:	402b5b93          	srai	s7,s6,0x2
8000560e:	003bfb93          	andi	s7,s7,3
80005612:	00578d03          	lb	s10,5(a5)
80005616:	018d8cb3          	add	s9,s11,s8
8000561a:	00eb8b63          	beq	s7,a4,80005630 <MiCo_Q8x2_MatMul+0xe6>
8000561e:	2abb8363          	beq	s7,a1,800058c4 <MiCo_Q8x2_MatMul+0x37a>
80005622:	1bf5                	addi	s7,s7,-3
80005624:	001bbb93          	seqz	s7,s7
80005628:	41700bb3          	neg	s7,s7
8000562c:	037d0d33          	mul	s10,s10,s7
80005630:	404b5b93          	srai	s7,s6,0x4
80005634:	003bfb93          	andi	s7,s7,3
80005638:	00678d83          	lb	s11,6(a5)
8000563c:	019d0c33          	add	s8,s10,s9
80005640:	00eb8b63          	beq	s7,a4,80005656 <MiCo_Q8x2_MatMul+0x10c>
80005644:	28bb8d63          	beq	s7,a1,800058de <MiCo_Q8x2_MatMul+0x394>
80005648:	1bf5                	addi	s7,s7,-3
8000564a:	001bbb93          	seqz	s7,s7
8000564e:	41700bb3          	neg	s7,s7
80005652:	037d8db3          	mul	s11,s11,s7
80005656:	0ffb7b13          	andi	s6,s6,255
8000565a:	006b5b13          	srli	s6,s6,0x6
8000565e:	00778b83          	lb	s7,7(a5)
80005662:	9de2                	add	s11,s11,s8
80005664:	00eb0b63          	beq	s6,a4,8000567a <MiCo_Q8x2_MatMul+0x130>
80005668:	26bb0f63          	beq	s6,a1,800058e6 <MiCo_Q8x2_MatMul+0x39c>
8000566c:	1b75                	addi	s6,s6,-3
8000566e:	001b3b13          	seqz	s6,s6
80005672:	41600b33          	neg	s6,s6
80005676:	036b8bb3          	mul	s7,s7,s6
8000567a:	00367c93          	andi	s9,a2,3
8000567e:	00878b03          	lb	s6,8(a5)
80005682:	01bb8c33          	add	s8,s7,s11
80005686:	00ec8b63          	beq	s9,a4,8000569c <MiCo_Q8x2_MatMul+0x152>
8000568a:	26bc8263          	beq	s9,a1,800058ee <MiCo_Q8x2_MatMul+0x3a4>
8000568e:	1cf5                	addi	s9,s9,-3
80005690:	001cbc93          	seqz	s9,s9
80005694:	41900cb3          	neg	s9,s9
80005698:	039b0b33          	mul	s6,s6,s9
8000569c:	40265b93          	srai	s7,a2,0x2
800056a0:	003bfb93          	andi	s7,s7,3
800056a4:	00978d03          	lb	s10,9(a5)
800056a8:	9c5a                	add	s8,s8,s6
800056aa:	00eb8b63          	beq	s7,a4,800056c0 <MiCo_Q8x2_MatMul+0x176>
800056ae:	24bb8463          	beq	s7,a1,800058f6 <MiCo_Q8x2_MatMul+0x3ac>
800056b2:	1bf5                	addi	s7,s7,-3
800056b4:	001bbb93          	seqz	s7,s7
800056b8:	41700bb3          	neg	s7,s7
800056bc:	037d0d33          	mul	s10,s10,s7
800056c0:	40465b93          	srai	s7,a2,0x4
800056c4:	003bfb93          	andi	s7,s7,3
800056c8:	00a78c83          	lb	s9,10(a5)
800056cc:	018d0b33          	add	s6,s10,s8
800056d0:	00eb8b63          	beq	s7,a4,800056e6 <MiCo_Q8x2_MatMul+0x19c>
800056d4:	22bb8663          	beq	s7,a1,80005900 <MiCo_Q8x2_MatMul+0x3b6>
800056d8:	1bf5                	addi	s7,s7,-3
800056da:	001bbb93          	seqz	s7,s7
800056de:	41700bb3          	neg	s7,s7
800056e2:	037c8cb3          	mul	s9,s9,s7
800056e6:	0ff67613          	andi	a2,a2,255
800056ea:	8219                	srli	a2,a2,0x6
800056ec:	00b78b83          	lb	s7,11(a5)
800056f0:	9cda                	add	s9,s9,s6
800056f2:	00e60b63          	beq	a2,a4,80005708 <MiCo_Q8x2_MatMul+0x1be>
800056f6:	20b60963          	beq	a2,a1,80005908 <MiCo_Q8x2_MatMul+0x3be>
800056fa:	1675                	addi	a2,a2,-3
800056fc:	00163613          	seqz	a2,a2
80005700:	40c00633          	neg	a2,a2
80005704:	02cb8bb3          	mul	s7,s7,a2
80005708:	0036f613          	andi	a2,a3,3
8000570c:	00c78c03          	lb	s8,12(a5)
80005710:	019b8b33          	add	s6,s7,s9
80005714:	00e60b63          	beq	a2,a4,8000572a <MiCo_Q8x2_MatMul+0x1e0>
80005718:	1eb60c63          	beq	a2,a1,80005910 <MiCo_Q8x2_MatMul+0x3c6>
8000571c:	1675                	addi	a2,a2,-3
8000571e:	00163613          	seqz	a2,a2
80005722:	40c00633          	neg	a2,a2
80005726:	02cc0c33          	mul	s8,s8,a2
8000572a:	4026d613          	srai	a2,a3,0x2
8000572e:	8a0d                	andi	a2,a2,3
80005730:	00d78c83          	lb	s9,13(a5)
80005734:	9c5a                	add	s8,s8,s6
80005736:	00e60b63          	beq	a2,a4,8000574c <MiCo_Q8x2_MatMul+0x202>
8000573a:	1cb60f63          	beq	a2,a1,80005918 <MiCo_Q8x2_MatMul+0x3ce>
8000573e:	1675                	addi	a2,a2,-3
80005740:	00163613          	seqz	a2,a2
80005744:	40c00633          	neg	a2,a2
80005748:	02cc8cb3          	mul	s9,s9,a2
8000574c:	4046d613          	srai	a2,a3,0x4
80005750:	8a0d                	andi	a2,a2,3
80005752:	00e78b83          	lb	s7,14(a5)
80005756:	018c8b33          	add	s6,s9,s8
8000575a:	00e60b63          	beq	a2,a4,80005770 <MiCo_Q8x2_MatMul+0x226>
8000575e:	0ab60e63          	beq	a2,a1,8000581a <MiCo_Q8x2_MatMul+0x2d0>
80005762:	1675                	addi	a2,a2,-3
80005764:	00163613          	seqz	a2,a2
80005768:	40c00633          	neg	a2,a2
8000576c:	02cb8bb3          	mul	s7,s7,a2
80005770:	0ff6f693          	andi	a3,a3,255
80005774:	8299                	srli	a3,a3,0x6
80005776:	00f78c83          	lb	s9,15(a5)
8000577a:	9b5e                	add	s6,s6,s7
8000577c:	00e68b63          	beq	a3,a4,80005792 <MiCo_Q8x2_MatMul+0x248>
80005780:	0ab68163          	beq	a3,a1,80005822 <MiCo_Q8x2_MatMul+0x2d8>
80005784:	16f5                	addi	a3,a3,-3
80005786:	0016b693          	seqz	a3,a3
8000578a:	40d006b3          	neg	a3,a3
8000578e:	02dc8cb3          	mul	s9,s9,a3
80005792:	0541                	addi	a0,a0,16
80005794:	9cda                	add	s9,s9,s6
80005796:	07c1                	addi	a5,a5,16
80005798:	09157d63          	bgeu	a0,a7,80005832 <MiCo_Q8x2_MatMul+0x2e8>
8000579c:	00255693          	srli	a3,a0,0x2
800057a0:	96c2                	add	a3,a3,a6
800057a2:	00068b83          	lb	s7,0(a3)
800057a6:	00168b03          	lb	s6,1(a3)
800057aa:	00268603          	lb	a2,2(a3)
800057ae:	003bfc13          	andi	s8,s7,3
800057b2:	00368683          	lb	a3,3(a3)
800057b6:	00078d83          	lb	s11,0(a5)
800057ba:	00ec0b63          	beq	s8,a4,800057d0 <MiCo_Q8x2_MatMul+0x286>
800057be:	10bc0863          	beq	s8,a1,800058ce <MiCo_Q8x2_MatMul+0x384>
800057c2:	1c75                	addi	s8,s8,-3
800057c4:	001c3c13          	seqz	s8,s8
800057c8:	41800c33          	neg	s8,s8
800057cc:	038d8db3          	mul	s11,s11,s8
800057d0:	402bdd13          	srai	s10,s7,0x2
800057d4:	003d7d13          	andi	s10,s10,3
800057d8:	00178c03          	lb	s8,1(a5)
800057dc:	9de6                	add	s11,s11,s9
800057de:	00ed0b63          	beq	s10,a4,800057f4 <MiCo_Q8x2_MatMul+0x2aa>
800057e2:	0ebd0a63          	beq	s10,a1,800058d6 <MiCo_Q8x2_MatMul+0x38c>
800057e6:	1d75                	addi	s10,s10,-3
800057e8:	001d3d13          	seqz	s10,s10
800057ec:	41a00d33          	neg	s10,s10
800057f0:	03ac0c33          	mul	s8,s8,s10
800057f4:	404bdd13          	srai	s10,s7,0x4
800057f8:	003d7d13          	andi	s10,s10,3
800057fc:	00278c83          	lb	s9,2(a5)
80005800:	9c6e                	add	s8,s8,s11
80005802:	dced02e3          	beq	s10,a4,800055c6 <MiCo_Q8x2_MatMul+0x7c>
80005806:	dabd19e3          	bne	s10,a1,800055b8 <MiCo_Q8x2_MatMul+0x6e>
8000580a:	41900cb3          	neg	s9,s9
8000580e:	0c86                	slli	s9,s9,0x1
80005810:	bb5d                	j	800055c6 <MiCo_Q8x2_MatMul+0x7c>
80005812:	41a00d33          	neg	s10,s10
80005816:	0d06                	slli	s10,s10,0x1
80005818:	bbc9                	j	800055ea <MiCo_Q8x2_MatMul+0xa0>
8000581a:	41700bb3          	neg	s7,s7
8000581e:	0b86                	slli	s7,s7,0x1
80005820:	bf81                	j	80005770 <MiCo_Q8x2_MatMul+0x226>
80005822:	41900cb3          	neg	s9,s9
80005826:	0c86                	slli	s9,s9,0x1
80005828:	0541                	addi	a0,a0,16
8000582a:	9cda                	add	s9,s9,s6
8000582c:	07c1                	addi	a5,a5,16
8000582e:	f71567e3          	bltu	a0,a7,8000579c <MiCo_Q8x2_MatMul+0x252>
80005832:	0468fa63          	bgeu	a7,t1,80005886 <MiCo_Q8x2_MatMul+0x33c>
80005836:	86c6                	mv	a3,a7
80005838:	a039                	j	80005846 <MiCo_Q8x2_MatMul+0x2fc>
8000583a:	02c50533          	mul	a0,a0,a2
8000583e:	0685                	addi	a3,a3,1
80005840:	9caa                	add	s9,s9,a0
80005842:	04d30263          	beq	t1,a3,80005886 <MiCo_Q8x2_MatMul+0x33c>
80005846:	0026d793          	srli	a5,a3,0x2
8000584a:	97c2                	add	a5,a5,a6
8000584c:	00078783          	lb	a5,0(a5)
80005850:	0036f613          	andi	a2,a3,3
80005854:	0606                	slli	a2,a2,0x1
80005856:	40c7d7b3          	sra	a5,a5,a2
8000585a:	8b8d                	andi	a5,a5,3
8000585c:	ffd78613          	addi	a2,a5,-3
80005860:	00163613          	seqz	a2,a2
80005864:	00de0533          	add	a0,t3,a3
80005868:	00050503          	lb	a0,0(a0)
8000586c:	40c00633          	neg	a2,a2
80005870:	fce787e3          	beq	a5,a4,8000583e <MiCo_Q8x2_MatMul+0x2f4>
80005874:	fcb793e3          	bne	a5,a1,8000583a <MiCo_Q8x2_MatMul+0x2f0>
80005878:	40a00533          	neg	a0,a0
8000587c:	0506                	slli	a0,a0,0x1
8000587e:	0685                	addi	a3,a3,1
80005880:	9caa                	add	s9,s9,a0
80005882:	fcd312e3          	bne	t1,a3,80005846 <MiCo_Q8x2_MatMul+0x2fc>
80005886:	019ea023          	sw	s9,0(t4)
8000588a:	0e91                	addi	t4,t4,4
8000588c:	9f1a                	add	t5,t5,t1
8000588e:	d1df9ce3          	bne	t6,t4,800055a6 <MiCo_Q8x2_MatMul+0x5c>
80005892:	0385                	addi	t2,t2,1
80005894:	941a                	add	s0,s0,t1
80005896:	41248fb3          	sub	t6,s1,s2
8000589a:	d07990e3          	bne	s3,t2,8000559a <MiCo_Q8x2_MatMul+0x50>
8000589e:	5432                	lw	s0,44(sp)
800058a0:	54a2                	lw	s1,40(sp)
800058a2:	5912                	lw	s2,36(sp)
800058a4:	5982                	lw	s3,32(sp)
800058a6:	4a72                	lw	s4,28(sp)
800058a8:	4ae2                	lw	s5,24(sp)
800058aa:	4b52                	lw	s6,20(sp)
800058ac:	4bc2                	lw	s7,16(sp)
800058ae:	4c32                	lw	s8,12(sp)
800058b0:	4ca2                	lw	s9,8(sp)
800058b2:	4d12                	lw	s10,4(sp)
800058b4:	4d82                	lw	s11,0(sp)
800058b6:	6145                	addi	sp,sp,48
800058b8:	8082                	ret
800058ba:	41b00cb3          	neg	s9,s11
800058be:	001c9d93          	slli	s11,s9,0x1
800058c2:	b3a1                	j	8000560a <MiCo_Q8x2_MatMul+0xc0>
800058c4:	41a00c33          	neg	s8,s10
800058c8:	001c1d13          	slli	s10,s8,0x1
800058cc:	b395                	j	80005630 <MiCo_Q8x2_MatMul+0xe6>
800058ce:	41b00db3          	neg	s11,s11
800058d2:	0d86                	slli	s11,s11,0x1
800058d4:	bdf5                	j	800057d0 <MiCo_Q8x2_MatMul+0x286>
800058d6:	41800c33          	neg	s8,s8
800058da:	0c06                	slli	s8,s8,0x1
800058dc:	bf21                	j	800057f4 <MiCo_Q8x2_MatMul+0x2aa>
800058de:	41b00db3          	neg	s11,s11
800058e2:	0d86                	slli	s11,s11,0x1
800058e4:	bb8d                	j	80005656 <MiCo_Q8x2_MatMul+0x10c>
800058e6:	41700bb3          	neg	s7,s7
800058ea:	0b86                	slli	s7,s7,0x1
800058ec:	b379                	j	8000567a <MiCo_Q8x2_MatMul+0x130>
800058ee:	41600b33          	neg	s6,s6
800058f2:	0b06                	slli	s6,s6,0x1
800058f4:	b365                	j	8000569c <MiCo_Q8x2_MatMul+0x152>
800058f6:	41a00b33          	neg	s6,s10
800058fa:	001b1d13          	slli	s10,s6,0x1
800058fe:	b3c9                	j	800056c0 <MiCo_Q8x2_MatMul+0x176>
80005900:	41900cb3          	neg	s9,s9
80005904:	0c86                	slli	s9,s9,0x1
80005906:	b3c5                	j	800056e6 <MiCo_Q8x2_MatMul+0x19c>
80005908:	41700bb3          	neg	s7,s7
8000590c:	0b86                	slli	s7,s7,0x1
8000590e:	bbed                	j	80005708 <MiCo_Q8x2_MatMul+0x1be>
80005910:	41800c33          	neg	s8,s8
80005914:	0c06                	slli	s8,s8,0x1
80005916:	bd11                	j	8000572a <MiCo_Q8x2_MatMul+0x1e0>
80005918:	41900b33          	neg	s6,s9
8000591c:	001b1c93          	slli	s9,s6,0x1
80005920:	b535                	j	8000574c <MiCo_Q8x2_MatMul+0x202>
80005922:	4c81                	li	s9,0
80005924:	b739                	j	80005832 <MiCo_Q8x2_MatMul+0x2e8>

80005926 <MiCo_Q8x1_MatMul>:
80005926:	7159                	addi	sp,sp,-112
80005928:	4214                	lw	a3,0(a2)
8000592a:	cad6                	sw	s5,84(sp)
8000592c:	0045aa83          	lw	s5,4(a1)
80005930:	4198                	lw	a4,0(a1)
80005932:	cc36                	sw	a3,24(sp)
80005934:	005ad693          	srli	a3,s5,0x5
80005938:	d686                	sw	ra,108(sp)
8000593a:	d4a2                	sw	s0,104(sp)
8000593c:	d2a6                	sw	s1,100(sp)
8000593e:	d0ca                	sw	s2,96(sp)
80005940:	cece                	sw	s3,92(sp)
80005942:	ccd2                	sw	s4,88(sp)
80005944:	c8da                	sw	s6,80(sp)
80005946:	c6de                	sw	s7,76(sp)
80005948:	c4e2                	sw	s8,72(sp)
8000594a:	c2e6                	sw	s9,68(sp)
8000594c:	c0ea                	sw	s10,64(sp)
8000594e:	de6e                	sw	s11,60(sp)
80005950:	d23a                	sw	a4,36(sp)
80005952:	d632                	sw	a2,44(sp)
80005954:	d42a                	sw	a0,40(sp)
80005956:	c636                	sw	a3,12(sp)
80005958:	18070a63          	beqz	a4,80005aec <MiCo_Q8x1_MatMul+0x1c6>
8000595c:	00269793          	slli	a5,a3,0x2
80005960:	0085a903          	lw	s2,8(a1)
80005964:	fe0afd13          	andi	s10,s5,-32
80005968:	ca3e                	sw	a5,20(sp)
8000596a:	4581                	li	a1,0
8000596c:	ce02                	sw	zero,28(sp)
8000596e:	479d                	li	a5,7
80005970:	1957ff63          	bgeu	a5,s5,80005b0e <MiCo_Q8x1_MatMul+0x1e8>
80005974:	87ca                	mv	a5,s2
80005976:	4621                	li	a2,8
80005978:	4c01                	li	s8,0
8000597a:	00078703          	lb	a4,0(a5)
8000597e:	00178e83          	lb	t4,1(a5)
80005982:	00278e03          	lb	t3,2(a5)
80005986:	00478683          	lb	a3,4(a5)
8000598a:	00578303          	lb	t1,5(a5)
8000598e:	00378883          	lb	a7,3(a5)
80005992:	00678803          	lb	a6,6(a5)
80005996:	00778503          	lb	a0,7(a5)
8000599a:	9776                	add	a4,a4,t4
8000599c:	9772                	add	a4,a4,t3
8000599e:	969a                	add	a3,a3,t1
800059a0:	9746                	add	a4,a4,a7
800059a2:	96c2                	add	a3,a3,a6
800059a4:	9c3a                	add	s8,s8,a4
800059a6:	00a68733          	add	a4,a3,a0
800059aa:	86b2                	mv	a3,a2
800059ac:	0621                	addi	a2,a2,8
800059ae:	9c3a                	add	s8,s8,a4
800059b0:	07a1                	addi	a5,a5,8
800059b2:	fccaf4e3          	bgeu	s5,a2,8000597a <MiCo_Q8x1_MatMul+0x54>
800059b6:	0756fe63          	bgeu	a3,s5,80005a32 <MiCo_Q8x1_MatMul+0x10c>
800059ba:	00d907b3          	add	a5,s2,a3
800059be:	00078703          	lb	a4,0(a5)
800059c2:	00168793          	addi	a5,a3,1
800059c6:	9c3a                	add	s8,s8,a4
800059c8:	0757f563          	bgeu	a5,s5,80005a32 <MiCo_Q8x1_MatMul+0x10c>
800059cc:	97ca                	add	a5,a5,s2
800059ce:	00078703          	lb	a4,0(a5)
800059d2:	00268793          	addi	a5,a3,2
800059d6:	9c3a                	add	s8,s8,a4
800059d8:	0557fd63          	bgeu	a5,s5,80005a32 <MiCo_Q8x1_MatMul+0x10c>
800059dc:	97ca                	add	a5,a5,s2
800059de:	00078703          	lb	a4,0(a5)
800059e2:	00368793          	addi	a5,a3,3
800059e6:	9c3a                	add	s8,s8,a4
800059e8:	0557f563          	bgeu	a5,s5,80005a32 <MiCo_Q8x1_MatMul+0x10c>
800059ec:	97ca                	add	a5,a5,s2
800059ee:	00078703          	lb	a4,0(a5)
800059f2:	00468793          	addi	a5,a3,4
800059f6:	9c3a                	add	s8,s8,a4
800059f8:	0357fd63          	bgeu	a5,s5,80005a32 <MiCo_Q8x1_MatMul+0x10c>
800059fc:	97ca                	add	a5,a5,s2
800059fe:	00078703          	lb	a4,0(a5)
80005a02:	00568793          	addi	a5,a3,5
80005a06:	9c3a                	add	s8,s8,a4
80005a08:	0357f563          	bgeu	a5,s5,80005a32 <MiCo_Q8x1_MatMul+0x10c>
80005a0c:	97ca                	add	a5,a5,s2
80005a0e:	00078703          	lb	a4,0(a5)
80005a12:	00668793          	addi	a5,a3,6
80005a16:	9c3a                	add	s8,s8,a4
80005a18:	0157fd63          	bgeu	a5,s5,80005a32 <MiCo_Q8x1_MatMul+0x10c>
80005a1c:	97ca                	add	a5,a5,s2
80005a1e:	00078783          	lb	a5,0(a5)
80005a22:	069d                	addi	a3,a3,7
80005a24:	9c3e                	add	s8,s8,a5
80005a26:	0156f663          	bgeu	a3,s5,80005a32 <MiCo_Q8x1_MatMul+0x10c>
80005a2a:	96ca                	add	a3,a3,s2
80005a2c:	00068783          	lb	a5,0(a3)
80005a30:	9c3e                	add	s8,s8,a5
80005a32:	47e2                	lw	a5,24(sp)
80005a34:	c3e5                	beqz	a5,80005b14 <MiCo_Q8x1_MatMul+0x1ee>
80005a36:	5732                	lw	a4,44(sp)
80005a38:	97ae                	add	a5,a5,a1
80005a3a:	d03e                	sw	a5,32(sp)
80005a3c:	4718                	lw	a4,8(a4)
80005a3e:	078a                	slli	a5,a5,0x2
80005a40:	058a                	slli	a1,a1,0x2
80005a42:	c43a                	sw	a4,8(sp)
80005a44:	5722                	lw	a4,40(sp)
80005a46:	4c81                	li	s9,0
80005a48:	97ba                	add	a5,a5,a4
80005a4a:	00e58bb3          	add	s7,a1,a4
80005a4e:	c83e                	sw	a5,16(sp)
80005a50:	47a2                	lw	a5,8(sp)
80005a52:	003cda13          	srli	s4,s9,0x3
80005a56:	9a3e                	add	s4,s4,a5
80005a58:	47b2                	lw	a5,12(sp)
80005a5a:	cbc5                	beqz	a5,80005b0a <MiCo_Q8x1_MatMul+0x1e4>
80005a5c:	47d2                	lw	a5,20(sp)
80005a5e:	89d2                	mv	s3,s4
80005a60:	4481                	li	s1,0
80005a62:	00fa0b33          	add	s6,s4,a5
80005a66:	4401                	li	s0,0
80005a68:	854e                	mv	a0,s3
80005a6a:	d96ff0ef          	jal	ra,80005000 <safe_load_qword>
80005a6e:	8daa                	mv	s11,a0
80005a70:	c105                	beqz	a0,80005a90 <MiCo_Q8x1_MatMul+0x16a>
80005a72:	856e                	mv	a0,s11
80005a74:	11d030ef          	jal	ra,80009390 <__ctzsi2>
80005a78:	00a907b3          	add	a5,s2,a0
80005a7c:	97a6                	add	a5,a5,s1
80005a7e:	00078783          	lb	a5,0(a5)
80005a82:	fffd8693          	addi	a3,s11,-1
80005a86:	00ddfdb3          	and	s11,s11,a3
80005a8a:	943e                	add	s0,s0,a5
80005a8c:	fe0d93e3          	bnez	s11,80005a72 <MiCo_Q8x1_MatMul+0x14c>
80005a90:	0991                	addi	s3,s3,4
80005a92:	02048493          	addi	s1,s1,32
80005a96:	fd6999e3          	bne	s3,s6,80005a68 <MiCo_Q8x1_MatMul+0x142>
80005a9a:	035d7663          	bgeu	s10,s5,80005ac6 <MiCo_Q8x1_MatMul+0x1a0>
80005a9e:	87ea                	mv	a5,s10
80005aa0:	0037d713          	srli	a4,a5,0x3
80005aa4:	9752                	add	a4,a4,s4
80005aa6:	00070703          	lb	a4,0(a4)
80005aaa:	0077f693          	andi	a3,a5,7
80005aae:	00f90633          	add	a2,s2,a5
80005ab2:	40d75733          	sra	a4,a4,a3
80005ab6:	8b05                	andi	a4,a4,1
80005ab8:	0785                	addi	a5,a5,1
80005aba:	c701                	beqz	a4,80005ac2 <MiCo_Q8x1_MatMul+0x19c>
80005abc:	00060703          	lb	a4,0(a2)
80005ac0:	943a                	add	s0,s0,a4
80005ac2:	fcfa9fe3          	bne	s5,a5,80005aa0 <MiCo_Q8x1_MatMul+0x17a>
80005ac6:	00141793          	slli	a5,s0,0x1
80005aca:	40fc07b3          	sub	a5,s8,a5
80005ace:	00fba023          	sw	a5,0(s7)
80005ad2:	47c2                	lw	a5,16(sp)
80005ad4:	0b91                	addi	s7,s7,4
80005ad6:	9cd6                	add	s9,s9,s5
80005ad8:	f7779ce3          	bne	a5,s7,80005a50 <MiCo_Q8x1_MatMul+0x12a>
80005adc:	47f2                	lw	a5,28(sp)
80005ade:	5712                	lw	a4,36(sp)
80005ae0:	5582                	lw	a1,32(sp)
80005ae2:	0785                	addi	a5,a5,1
80005ae4:	ce3e                	sw	a5,28(sp)
80005ae6:	9956                	add	s2,s2,s5
80005ae8:	e8f713e3          	bne	a4,a5,8000596e <MiCo_Q8x1_MatMul+0x48>
80005aec:	50b6                	lw	ra,108(sp)
80005aee:	5426                	lw	s0,104(sp)
80005af0:	5496                	lw	s1,100(sp)
80005af2:	5906                	lw	s2,96(sp)
80005af4:	49f6                	lw	s3,92(sp)
80005af6:	4a66                	lw	s4,88(sp)
80005af8:	4ad6                	lw	s5,84(sp)
80005afa:	4b46                	lw	s6,80(sp)
80005afc:	4bb6                	lw	s7,76(sp)
80005afe:	4c26                	lw	s8,72(sp)
80005b00:	4c96                	lw	s9,68(sp)
80005b02:	4d06                	lw	s10,64(sp)
80005b04:	5df2                	lw	s11,60(sp)
80005b06:	6165                	addi	sp,sp,112
80005b08:	8082                	ret
80005b0a:	4401                	li	s0,0
80005b0c:	b779                	j	80005a9a <MiCo_Q8x1_MatMul+0x174>
80005b0e:	4681                	li	a3,0
80005b10:	4c01                	li	s8,0
80005b12:	b555                	j	800059b6 <MiCo_Q8x1_MatMul+0x90>
80005b14:	47f2                	lw	a5,28(sp)
80005b16:	5712                	lw	a4,36(sp)
80005b18:	d02e                	sw	a1,32(sp)
80005b1a:	0785                	addi	a5,a5,1
80005b1c:	ce3e                	sw	a5,28(sp)
80005b1e:	5582                	lw	a1,32(sp)
80005b20:	9956                	add	s2,s2,s5
80005b22:	e4f716e3          	bne	a4,a5,8000596e <MiCo_Q8x1_MatMul+0x48>
80005b26:	b7d9                	j	80005aec <MiCo_Q8x1_MatMul+0x1c6>

80005b28 <MiCo_Q4_MatMul>:
80005b28:	7139                	addi	sp,sp,-64
80005b2a:	cc66                	sw	s9,24(sp)
80005b2c:	0005ac83          	lw	s9,0(a1)
80005b30:	d84e                	sw	s3,48(sp)
80005b32:	de22                	sw	s0,60(sp)
80005b34:	dc26                	sw	s1,56(sp)
80005b36:	da4a                	sw	s2,52(sp)
80005b38:	d652                	sw	s4,44(sp)
80005b3a:	d456                	sw	s5,40(sp)
80005b3c:	d25a                	sw	s6,36(sp)
80005b3e:	d05e                	sw	s7,32(sp)
80005b40:	ce62                	sw	s8,28(sp)
80005b42:	ca6a                	sw	s10,20(sp)
80005b44:	c86e                	sw	s11,16(sp)
80005b46:	0045a983          	lw	s3,4(a1)
80005b4a:	421c                	lw	a5,0(a2)
80005b4c:	160c8e63          	beqz	s9,80005cc8 <MiCo_Q4_MatMul+0x1a0>
80005b50:	16078c63          	beqz	a5,80005cc8 <MiCo_Q4_MatMul+0x1a0>
80005b54:	86b2                	mv	a3,a2
80005b56:	4598                	lw	a4,8(a1)
80005b58:	40f00633          	neg	a2,a5
80005b5c:	078a                	slli	a5,a5,0x2
80005b5e:	00f50b33          	add	s6,a0,a5
80005b62:	0086ab83          	lw	s7,8(a3)
80005b66:	00261793          	slli	a5,a2,0x2
80005b6a:	c43e                	sw	a5,8(sp)
80005b6c:	00361793          	slli	a5,a2,0x3
80005b70:	ff89f913          	andi	s2,s3,-8
80005b74:	c23a                	sw	a4,4(sp)
80005b76:	4d01                	li	s10,0
80005b78:	4c01                	li	s8,0
80005b7a:	c63e                	sw	a5,12(sp)
80005b7c:	47a2                	lw	a5,8(sp)
80005b7e:	001d5e93          	srli	t4,s10,0x1
80005b82:	4a81                	li	s5,0
80005b84:	01678db3          	add	s11,a5,s6
80005b88:	4792                	lw	a5,4(sp)
80005b8a:	8a6e                	mv	s4,s11
80005b8c:	9ebe                	add	t4,t4,a5
80005b8e:	001ad593          	srli	a1,s5,0x1
80005b92:	95de                	add	a1,a1,s7
80005b94:	14090863          	beqz	s2,80005ce4 <MiCo_Q4_MatMul+0x1bc>
80005b98:	4e01                	li	t3,0
80005b9a:	4781                	li	a5,0
80005b9c:	001e5713          	srli	a4,t3,0x1
80005ba0:	00e586b3          	add	a3,a1,a4
80005ba4:	00ee8633          	add	a2,t4,a4
80005ba8:	00068503          	lb	a0,0(a3)
80005bac:	00060603          	lb	a2,0(a2)
80005bb0:	00170693          	addi	a3,a4,1
80005bb4:	00de8833          	add	a6,t4,a3
80005bb8:	96ae                	add	a3,a3,a1
80005bba:	00080803          	lb	a6,0(a6)
80005bbe:	00068283          	lb	t0,0(a3)
80005bc2:	00270693          	addi	a3,a4,2
80005bc6:	00d588b3          	add	a7,a1,a3
80005bca:	01c51f13          	slli	t5,a0,0x1c
80005bce:	00de8fb3          	add	t6,t4,a3
80005bd2:	01c61313          	slli	t1,a2,0x1c
80005bd6:	000f8683          	lb	a3,0(t6)
80005bda:	070d                	addi	a4,a4,3
80005bdc:	00088f83          	lb	t6,0(a7)
80005be0:	41c35313          	srai	t1,t1,0x1c
80005be4:	41cf5893          	srai	a7,t5,0x1c
80005be8:	40455393          	srai	t2,a0,0x4
80005bec:	03130333          	mul	t1,t1,a7
80005bf0:	01c81413          	slli	s0,a6,0x1c
80005bf4:	00ee88b3          	add	a7,t4,a4
80005bf8:	01c29513          	slli	a0,t0,0x1c
80005bfc:	972e                	add	a4,a4,a1
80005bfe:	8611                	srai	a2,a2,0x4
80005c00:	00070f03          	lb	t5,0(a4)
80005c04:	00088883          	lb	a7,0(a7)
80005c08:	8571                	srai	a0,a0,0x1c
80005c0a:	8471                	srai	s0,s0,0x1c
80005c0c:	02760633          	mul	a2,a2,t2
80005c10:	40485713          	srai	a4,a6,0x4
80005c14:	01cf9393          	slli	t2,t6,0x1c
80005c18:	01c69813          	slli	a6,a3,0x1c
80005c1c:	4042d293          	srai	t0,t0,0x4
80005c20:	41c85813          	srai	a6,a6,0x1c
80005c24:	41c3d393          	srai	t2,t2,0x1c
80005c28:	404fdf93          	srai	t6,t6,0x4
80005c2c:	01cf1493          	slli	s1,t5,0x1c
80005c30:	8691                	srai	a3,a3,0x4
80005c32:	02a40433          	mul	s0,s0,a0
80005c36:	01c89513          	slli	a0,a7,0x1c
80005c3a:	8571                	srai	a0,a0,0x1c
80005c3c:	84f1                	srai	s1,s1,0x1c
80005c3e:	4048d893          	srai	a7,a7,0x4
80005c42:	404f5f13          	srai	t5,t5,0x4
80005c46:	979a                	add	a5,a5,t1
80005c48:	963e                	add	a2,a2,a5
80005c4a:	0e21                	addi	t3,t3,8
80005c4c:	02570733          	mul	a4,a4,t0
80005c50:	9432                	add	s0,s0,a2
80005c52:	02780833          	mul	a6,a6,t2
80005c56:	943a                	add	s0,s0,a4
80005c58:	03f686b3          	mul	a3,a3,t6
80005c5c:	00880fb3          	add	t6,a6,s0
80005c60:	02950533          	mul	a0,a0,s1
80005c64:	96fe                	add	a3,a3,t6
80005c66:	03e888b3          	mul	a7,a7,t5
80005c6a:	96aa                	add	a3,a3,a0
80005c6c:	00d887b3          	add	a5,a7,a3
80005c70:	f32e66e3          	bltu	t3,s2,80005b9c <MiCo_Q4_MatMul+0x74>
80005c74:	03397d63          	bgeu	s2,s3,80005cae <MiCo_Q4_MatMul+0x186>
80005c78:	864a                	mv	a2,s2
80005c7a:	00165713          	srli	a4,a2,0x1
80005c7e:	00e586b3          	add	a3,a1,a4
80005c82:	9776                	add	a4,a4,t4
80005c84:	00068683          	lb	a3,0(a3)
80005c88:	00070703          	lb	a4,0(a4)
80005c8c:	00167513          	andi	a0,a2,1
80005c90:	050a                	slli	a0,a0,0x2
80005c92:	40a6d6b3          	sra	a3,a3,a0
80005c96:	40a75733          	sra	a4,a4,a0
80005c9a:	06f2                	slli	a3,a3,0x1c
80005c9c:	0772                	slli	a4,a4,0x1c
80005c9e:	8771                	srai	a4,a4,0x1c
80005ca0:	86f1                	srai	a3,a3,0x1c
80005ca2:	02d70733          	mul	a4,a4,a3
80005ca6:	0605                	addi	a2,a2,1
80005ca8:	97ba                	add	a5,a5,a4
80005caa:	fcc998e3          	bne	s3,a2,80005c7a <MiCo_Q4_MatMul+0x152>
80005cae:	00fa2023          	sw	a5,0(s4)
80005cb2:	0a11                	addi	s4,s4,4
80005cb4:	9ace                	add	s5,s5,s3
80005cb6:	ed4b1ce3          	bne	s6,s4,80005b8e <MiCo_Q4_MatMul+0x66>
80005cba:	47b2                	lw	a5,12(sp)
80005cbc:	0c05                	addi	s8,s8,1
80005cbe:	9d4e                	add	s10,s10,s3
80005cc0:	40fd8b33          	sub	s6,s11,a5
80005cc4:	eb8c9ce3          	bne	s9,s8,80005b7c <MiCo_Q4_MatMul+0x54>
80005cc8:	5472                	lw	s0,60(sp)
80005cca:	54e2                	lw	s1,56(sp)
80005ccc:	5952                	lw	s2,52(sp)
80005cce:	59c2                	lw	s3,48(sp)
80005cd0:	5a32                	lw	s4,44(sp)
80005cd2:	5aa2                	lw	s5,40(sp)
80005cd4:	5b12                	lw	s6,36(sp)
80005cd6:	5b82                	lw	s7,32(sp)
80005cd8:	4c72                	lw	s8,28(sp)
80005cda:	4ce2                	lw	s9,24(sp)
80005cdc:	4d52                	lw	s10,20(sp)
80005cde:	4dc2                	lw	s11,16(sp)
80005ce0:	6121                	addi	sp,sp,64
80005ce2:	8082                	ret
80005ce4:	4781                	li	a5,0
80005ce6:	b779                	j	80005c74 <MiCo_Q4_MatMul+0x14c>

80005ce8 <MiCo_Q4x2_MatMul>:
80005ce8:	715d                	addi	sp,sp,-80
80005cea:	dc56                	sw	s5,56(sp)
80005cec:	872e                	mv	a4,a1
80005cee:	0045aa83          	lw	s5,4(a1)
80005cf2:	418c                	lw	a1,0(a1)
80005cf4:	c6a2                	sw	s0,76(sp)
80005cf6:	c4a6                	sw	s1,72(sp)
80005cf8:	c2ca                	sw	s2,68(sp)
80005cfa:	c0ce                	sw	s3,64(sp)
80005cfc:	de52                	sw	s4,60(sp)
80005cfe:	da5a                	sw	s6,52(sp)
80005d00:	d85e                	sw	s7,48(sp)
80005d02:	d662                	sw	s8,44(sp)
80005d04:	d466                	sw	s9,40(sp)
80005d06:	d26a                	sw	s10,36(sp)
80005d08:	d06e                	sw	s11,32(sp)
80005d0a:	ca2e                	sw	a1,20(sp)
80005d0c:	421c                	lw	a5,0(a2)
80005d0e:	36058763          	beqz	a1,8000607c <MiCo_Q4x2_MatMul+0x394>
80005d12:	36078563          	beqz	a5,8000607c <MiCo_Q4x2_MatMul+0x394>
80005d16:	4718                	lw	a4,8(a4)
80005d18:	86b2                	mv	a3,a2
80005d1a:	0086ac83          	lw	s9,8(a3)
80005d1e:	40f00633          	neg	a2,a5
80005d22:	078a                	slli	a5,a5,0x2
80005d24:	00f50c33          	add	s8,a0,a5
80005d28:	c83a                	sw	a4,16(sp)
80005d2a:	00261793          	slli	a5,a2,0x2
80005d2e:	00361713          	slli	a4,a2,0x3
80005d32:	cc3e                	sw	a5,24(sp)
80005d34:	ff0afa13          	andi	s4,s5,-16
80005d38:	c402                	sw	zero,8(sp)
80005d3a:	4d01                	li	s10,0
80005d3c:	4785                	li	a5,1
80005d3e:	4509                	li	a0,2
80005d40:	ce3a                	sw	a4,28(sp)
80005d42:	4722                	lw	a4,8(sp)
80005d44:	4b81                	li	s7,0
80005d46:	00175993          	srli	s3,a4,0x1
80005d4a:	4762                	lw	a4,24(sp)
80005d4c:	01870b33          	add	s6,a4,s8
80005d50:	4742                	lw	a4,16(sp)
80005d52:	c65a                	sw	s6,12(sp)
80005d54:	99ba                	add	s3,s3,a4
80005d56:	002bd413          	srli	s0,s7,0x2
80005d5a:	9466                	add	s0,s0,s9
80005d5c:	380a0e63          	beqz	s4,800060f8 <MiCo_Q4x2_MatMul+0x410>
80005d60:	4381                	li	t2,0
80005d62:	4581                	li	a1,0
80005d64:	aaf1                	j	80005f40 <MiCo_Q4x2_MatMul+0x258>
80005d66:	15f5                	addi	a1,a1,-3
80005d68:	0015b593          	seqz	a1,a1
80005d6c:	40b005b3          	neg	a1,a1
80005d70:	02b90933          	mul	s2,s2,a1
80005d74:	0ff67613          	andi	a2,a2,255
80005d78:	8219                	srli	a2,a2,0x6
80005d7a:	94ca                	add	s1,s1,s2
80005d7c:	404fdf93          	srai	t6,t6,0x4
80005d80:	00f60b63          	beq	a2,a5,80005d96 <MiCo_Q4x2_MatMul+0xae>
80005d84:	24a60e63          	beq	a2,a0,80005fe0 <MiCo_Q4x2_MatMul+0x2f8>
80005d88:	1675                	addi	a2,a2,-3
80005d8a:	00163613          	seqz	a2,a2
80005d8e:	40c00633          	neg	a2,a2
80005d92:	02cf8fb3          	mul	t6,t6,a2
80005d96:	01c81613          	slli	a2,a6,0x1c
80005d9a:	0036f593          	andi	a1,a3,3
80005d9e:	94fe                	add	s1,s1,t6
80005da0:	8671                	srai	a2,a2,0x1c
80005da2:	00f58b63          	beq	a1,a5,80005db8 <MiCo_Q4x2_MatMul+0xd0>
80005da6:	2ea58963          	beq	a1,a0,80006098 <MiCo_Q4x2_MatMul+0x3b0>
80005daa:	15f5                	addi	a1,a1,-3
80005dac:	0015b593          	seqz	a1,a1
80005db0:	40b005b3          	neg	a1,a1
80005db4:	02b60633          	mul	a2,a2,a1
80005db8:	4026d593          	srai	a1,a3,0x2
80005dbc:	898d                	andi	a1,a1,3
80005dbe:	94b2                	add	s1,s1,a2
80005dc0:	40485813          	srai	a6,a6,0x4
80005dc4:	00f58b63          	beq	a1,a5,80005dda <MiCo_Q4x2_MatMul+0xf2>
80005dc8:	2ca58c63          	beq	a1,a0,800060a0 <MiCo_Q4x2_MatMul+0x3b8>
80005dcc:	15f5                	addi	a1,a1,-3
80005dce:	0015b593          	seqz	a1,a1
80005dd2:	40b005b3          	neg	a1,a1
80005dd6:	02b80833          	mul	a6,a6,a1
80005dda:	4046d613          	srai	a2,a3,0x4
80005dde:	01cf1593          	slli	a1,t5,0x1c
80005de2:	8a0d                	andi	a2,a2,3
80005de4:	9826                	add	a6,a6,s1
80005de6:	85f1                	srai	a1,a1,0x1c
80005de8:	00f60b63          	beq	a2,a5,80005dfe <MiCo_Q4x2_MatMul+0x116>
80005dec:	2ca60663          	beq	a2,a0,800060b8 <MiCo_Q4x2_MatMul+0x3d0>
80005df0:	1675                	addi	a2,a2,-3
80005df2:	00163613          	seqz	a2,a2
80005df6:	40c00633          	neg	a2,a2
80005dfa:	02c585b3          	mul	a1,a1,a2
80005dfe:	0ff6f693          	andi	a3,a3,255
80005e02:	8299                	srli	a3,a3,0x6
80005e04:	982e                	add	a6,a6,a1
80005e06:	404f5f13          	srai	t5,t5,0x4
80005e0a:	00f68b63          	beq	a3,a5,80005e20 <MiCo_Q4x2_MatMul+0x138>
80005e0e:	2aa68963          	beq	a3,a0,800060c0 <MiCo_Q4x2_MatMul+0x3d8>
80005e12:	16f5                	addi	a3,a3,-3
80005e14:	0016b693          	seqz	a3,a3
80005e18:	40d006b3          	neg	a3,a3
80005e1c:	02df0f33          	mul	t5,t5,a3
80005e20:	01ce9693          	slli	a3,t4,0x1c
80005e24:	00377613          	andi	a2,a4,3
80005e28:	9f42                	add	t5,t5,a6
80005e2a:	86f1                	srai	a3,a3,0x1c
80005e2c:	00f60b63          	beq	a2,a5,80005e42 <MiCo_Q4x2_MatMul+0x15a>
80005e30:	28a60c63          	beq	a2,a0,800060c8 <MiCo_Q4x2_MatMul+0x3e0>
80005e34:	1675                	addi	a2,a2,-3
80005e36:	00163613          	seqz	a2,a2
80005e3a:	40c00633          	neg	a2,a2
80005e3e:	02c686b3          	mul	a3,a3,a2
80005e42:	40275613          	srai	a2,a4,0x2
80005e46:	8a0d                	andi	a2,a2,3
80005e48:	01e68833          	add	a6,a3,t5
80005e4c:	404ede93          	srai	t4,t4,0x4
80005e50:	00f60b63          	beq	a2,a5,80005e66 <MiCo_Q4x2_MatMul+0x17e>
80005e54:	26a60e63          	beq	a2,a0,800060d0 <MiCo_Q4x2_MatMul+0x3e8>
80005e58:	1675                	addi	a2,a2,-3
80005e5a:	00163613          	seqz	a2,a2
80005e5e:	40c00633          	neg	a2,a2
80005e62:	02ce8eb3          	mul	t4,t4,a2
80005e66:	40475693          	srai	a3,a4,0x4
80005e6a:	01ce1593          	slli	a1,t3,0x1c
80005e6e:	8a8d                	andi	a3,a3,3
80005e70:	9ec2                	add	t4,t4,a6
80005e72:	85f1                	srai	a1,a1,0x1c
80005e74:	00f68b63          	beq	a3,a5,80005e8a <MiCo_Q4x2_MatMul+0x1a2>
80005e78:	26a68063          	beq	a3,a0,800060d8 <MiCo_Q4x2_MatMul+0x3f0>
80005e7c:	16f5                	addi	a3,a3,-3
80005e7e:	0016b693          	seqz	a3,a3
80005e82:	40d006b3          	neg	a3,a3
80005e86:	02d585b3          	mul	a1,a1,a3
80005e8a:	0ff77713          	andi	a4,a4,255
80005e8e:	8319                	srli	a4,a4,0x6
80005e90:	9eae                	add	t4,t4,a1
80005e92:	404e5e13          	srai	t3,t3,0x4
80005e96:	00f70b63          	beq	a4,a5,80005eac <MiCo_Q4x2_MatMul+0x1c4>
80005e9a:	24a70363          	beq	a4,a0,800060e0 <MiCo_Q4x2_MatMul+0x3f8>
80005e9e:	1775                	addi	a4,a4,-3
80005ea0:	00173713          	seqz	a4,a4
80005ea4:	40e00733          	neg	a4,a4
80005ea8:	02ee0e33          	mul	t3,t3,a4
80005eac:	01c31593          	slli	a1,t1,0x1c
80005eb0:	0038f713          	andi	a4,a7,3
80005eb4:	9e76                	add	t3,t3,t4
80005eb6:	85f1                	srai	a1,a1,0x1c
80005eb8:	00f70b63          	beq	a4,a5,80005ece <MiCo_Q4x2_MatMul+0x1e6>
80005ebc:	22a70663          	beq	a4,a0,800060e8 <MiCo_Q4x2_MatMul+0x400>
80005ec0:	1775                	addi	a4,a4,-3
80005ec2:	00173713          	seqz	a4,a4
80005ec6:	40e00733          	neg	a4,a4
80005eca:	02e585b3          	mul	a1,a1,a4
80005ece:	4028d713          	srai	a4,a7,0x2
80005ed2:	8b0d                	andi	a4,a4,3
80005ed4:	9e2e                	add	t3,t3,a1
80005ed6:	40435313          	srai	t1,t1,0x4
80005eda:	00f70b63          	beq	a4,a5,80005ef0 <MiCo_Q4x2_MatMul+0x208>
80005ede:	20a70963          	beq	a4,a0,800060f0 <MiCo_Q4x2_MatMul+0x408>
80005ee2:	1775                	addi	a4,a4,-3
80005ee4:	00173713          	seqz	a4,a4
80005ee8:	40e00733          	neg	a4,a4
80005eec:	02e30333          	mul	t1,t1,a4
80005ef0:	4048d713          	srai	a4,a7,0x4
80005ef4:	01cd9593          	slli	a1,s11,0x1c
80005ef8:	8b0d                	andi	a4,a4,3
80005efa:	9372                	add	t1,t1,t3
80005efc:	85f1                	srai	a1,a1,0x1c
80005efe:	00f70b63          	beq	a4,a5,80005f14 <MiCo_Q4x2_MatMul+0x22c>
80005f02:	0ea70363          	beq	a4,a0,80005fe8 <MiCo_Q4x2_MatMul+0x300>
80005f06:	1775                	addi	a4,a4,-3
80005f08:	00173713          	seqz	a4,a4
80005f0c:	40e00733          	neg	a4,a4
80005f10:	02e585b3          	mul	a1,a1,a4
80005f14:	0ff8f893          	andi	a7,a7,255
80005f18:	0068d893          	srli	a7,a7,0x6
80005f1c:	959a                	add	a1,a1,t1
80005f1e:	404ddd93          	srai	s11,s11,0x4
80005f22:	00f88b63          	beq	a7,a5,80005f38 <MiCo_Q4x2_MatMul+0x250>
80005f26:	0ca88663          	beq	a7,a0,80005ff2 <MiCo_Q4x2_MatMul+0x30a>
80005f2a:	18f5                	addi	a7,a7,-3
80005f2c:	0018b893          	seqz	a7,a7
80005f30:	411008b3          	neg	a7,a7
80005f34:	031d8db3          	mul	s11,s11,a7
80005f38:	03c1                	addi	t2,t2,16
80005f3a:	95ee                	add	a1,a1,s11
80005f3c:	0d43f263          	bgeu	t2,s4,80006000 <MiCo_Q4x2_MatMul+0x318>
80005f40:	0013d713          	srli	a4,t2,0x1
80005f44:	0023d893          	srli	a7,t2,0x2
80005f48:	974e                	add	a4,a4,s3
80005f4a:	98a2                	add	a7,a7,s0
80005f4c:	00070283          	lb	t0,0(a4)
80005f50:	00088603          	lb	a2,0(a7)
80005f54:	00170f83          	lb	t6,1(a4)
80005f58:	01c29493          	slli	s1,t0,0x1c
80005f5c:	00367913          	andi	s2,a2,3
80005f60:	00270803          	lb	a6,2(a4)
80005f64:	00370f03          	lb	t5,3(a4)
80005f68:	00470e83          	lb	t4,4(a4)
80005f6c:	00570e03          	lb	t3,5(a4)
80005f70:	00670303          	lb	t1,6(a4)
80005f74:	00770d83          	lb	s11,7(a4)
80005f78:	00188683          	lb	a3,1(a7)
80005f7c:	00288703          	lb	a4,2(a7)
80005f80:	84f1                	srai	s1,s1,0x1c
80005f82:	00388883          	lb	a7,3(a7)
80005f86:	00f90b63          	beq	s2,a5,80005f9c <MiCo_Q4x2_MatMul+0x2b4>
80005f8a:	10a90f63          	beq	s2,a0,800060a8 <MiCo_Q4x2_MatMul+0x3c0>
80005f8e:	1975                	addi	s2,s2,-3
80005f90:	00193913          	seqz	s2,s2
80005f94:	41200933          	neg	s2,s2
80005f98:	032484b3          	mul	s1,s1,s2
80005f9c:	40265913          	srai	s2,a2,0x2
80005fa0:	00397913          	andi	s2,s2,3
80005fa4:	94ae                	add	s1,s1,a1
80005fa6:	4042d293          	srai	t0,t0,0x4
80005faa:	00f90b63          	beq	s2,a5,80005fc0 <MiCo_Q4x2_MatMul+0x2d8>
80005fae:	10a90163          	beq	s2,a0,800060b0 <MiCo_Q4x2_MatMul+0x3c8>
80005fb2:	1975                	addi	s2,s2,-3
80005fb4:	00193913          	seqz	s2,s2
80005fb8:	41200933          	neg	s2,s2
80005fbc:	032282b3          	mul	t0,t0,s2
80005fc0:	40465593          	srai	a1,a2,0x4
80005fc4:	01cf9913          	slli	s2,t6,0x1c
80005fc8:	898d                	andi	a1,a1,3
80005fca:	9496                	add	s1,s1,t0
80005fcc:	41c95913          	srai	s2,s2,0x1c
80005fd0:	daf582e3          	beq	a1,a5,80005d74 <MiCo_Q4x2_MatMul+0x8c>
80005fd4:	d8a599e3          	bne	a1,a0,80005d66 <MiCo_Q4x2_MatMul+0x7e>
80005fd8:	41200933          	neg	s2,s2
80005fdc:	0906                	slli	s2,s2,0x1
80005fde:	bb59                	j	80005d74 <MiCo_Q4x2_MatMul+0x8c>
80005fe0:	41f00fb3          	neg	t6,t6
80005fe4:	0f86                	slli	t6,t6,0x1
80005fe6:	bb45                	j	80005d96 <MiCo_Q4x2_MatMul+0xae>
80005fe8:	40b00733          	neg	a4,a1
80005fec:	00171593          	slli	a1,a4,0x1
80005ff0:	b715                	j	80005f14 <MiCo_Q4x2_MatMul+0x22c>
80005ff2:	41b00db3          	neg	s11,s11
80005ff6:	0d86                	slli	s11,s11,0x1
80005ff8:	03c1                	addi	t2,t2,16
80005ffa:	95ee                	add	a1,a1,s11
80005ffc:	f543e2e3          	bltu	t2,s4,80005f40 <MiCo_Q4x2_MatMul+0x258>
80006000:	055a7d63          	bgeu	s4,s5,8000605a <MiCo_Q4x2_MatMul+0x372>
80006004:	8652                	mv	a2,s4
80006006:	00167713          	andi	a4,a2,1
8000600a:	00271813          	slli	a6,a4,0x2
8000600e:	00265713          	srli	a4,a2,0x2
80006012:	9722                	add	a4,a4,s0
80006014:	00070683          	lb	a3,0(a4)
80006018:	00367713          	andi	a4,a2,3
8000601c:	0706                	slli	a4,a4,0x1
8000601e:	40e6d6b3          	sra	a3,a3,a4
80006022:	8a8d                	andi	a3,a3,3
80006024:	00165893          	srli	a7,a2,0x1
80006028:	ffd68713          	addi	a4,a3,-3
8000602c:	98ce                	add	a7,a7,s3
8000602e:	0605                	addi	a2,a2,1
80006030:	00173713          	seqz	a4,a4
80006034:	4305                	li	t1,1
80006036:	00f68763          	beq	a3,a5,80006044 <MiCo_Q4x2_MatMul+0x35c>
8000603a:	5379                	li	t1,-2
8000603c:	00a68463          	beq	a3,a0,80006044 <MiCo_Q4x2_MatMul+0x35c>
80006040:	40e00333          	neg	t1,a4
80006044:	00088703          	lb	a4,0(a7)
80006048:	41075733          	sra	a4,a4,a6
8000604c:	0772                	slli	a4,a4,0x1c
8000604e:	8771                	srai	a4,a4,0x1c
80006050:	02670733          	mul	a4,a4,t1
80006054:	95ba                	add	a1,a1,a4
80006056:	faca98e3          	bne	s5,a2,80006006 <MiCo_Q4x2_MatMul+0x31e>
8000605a:	00bb2023          	sw	a1,0(s6)
8000605e:	0b11                	addi	s6,s6,4
80006060:	9bd6                	add	s7,s7,s5
80006062:	cf8b1ae3          	bne	s6,s8,80005d56 <MiCo_Q4x2_MatMul+0x6e>
80006066:	4722                	lw	a4,8(sp)
80006068:	46f2                	lw	a3,28(sp)
8000606a:	0d05                	addi	s10,s10,1
8000606c:	9756                	add	a4,a4,s5
8000606e:	c43a                	sw	a4,8(sp)
80006070:	4732                	lw	a4,12(sp)
80006072:	40d70c33          	sub	s8,a4,a3
80006076:	4752                	lw	a4,20(sp)
80006078:	cda715e3          	bne	a4,s10,80005d42 <MiCo_Q4x2_MatMul+0x5a>
8000607c:	4436                	lw	s0,76(sp)
8000607e:	44a6                	lw	s1,72(sp)
80006080:	4916                	lw	s2,68(sp)
80006082:	4986                	lw	s3,64(sp)
80006084:	5a72                	lw	s4,60(sp)
80006086:	5ae2                	lw	s5,56(sp)
80006088:	5b52                	lw	s6,52(sp)
8000608a:	5bc2                	lw	s7,48(sp)
8000608c:	5c32                	lw	s8,44(sp)
8000608e:	5ca2                	lw	s9,40(sp)
80006090:	5d12                	lw	s10,36(sp)
80006092:	5d82                	lw	s11,32(sp)
80006094:	6161                	addi	sp,sp,80
80006096:	8082                	ret
80006098:	40c00633          	neg	a2,a2
8000609c:	0606                	slli	a2,a2,0x1
8000609e:	bb29                	j	80005db8 <MiCo_Q4x2_MatMul+0xd0>
800060a0:	41000833          	neg	a6,a6
800060a4:	0806                	slli	a6,a6,0x1
800060a6:	bb15                	j	80005dda <MiCo_Q4x2_MatMul+0xf2>
800060a8:	409004b3          	neg	s1,s1
800060ac:	0486                	slli	s1,s1,0x1
800060ae:	b5fd                	j	80005f9c <MiCo_Q4x2_MatMul+0x2b4>
800060b0:	405002b3          	neg	t0,t0
800060b4:	0286                	slli	t0,t0,0x1
800060b6:	b729                	j	80005fc0 <MiCo_Q4x2_MatMul+0x2d8>
800060b8:	40b005b3          	neg	a1,a1
800060bc:	0586                	slli	a1,a1,0x1
800060be:	b381                	j	80005dfe <MiCo_Q4x2_MatMul+0x116>
800060c0:	41e00f33          	neg	t5,t5
800060c4:	0f06                	slli	t5,t5,0x1
800060c6:	bba9                	j	80005e20 <MiCo_Q4x2_MatMul+0x138>
800060c8:	40d006b3          	neg	a3,a3
800060cc:	0686                	slli	a3,a3,0x1
800060ce:	bb95                	j	80005e42 <MiCo_Q4x2_MatMul+0x15a>
800060d0:	41d00eb3          	neg	t4,t4
800060d4:	0e86                	slli	t4,t4,0x1
800060d6:	bb41                	j	80005e66 <MiCo_Q4x2_MatMul+0x17e>
800060d8:	40b005b3          	neg	a1,a1
800060dc:	0586                	slli	a1,a1,0x1
800060de:	b375                	j	80005e8a <MiCo_Q4x2_MatMul+0x1a2>
800060e0:	41c00e33          	neg	t3,t3
800060e4:	0e06                	slli	t3,t3,0x1
800060e6:	b3d9                	j	80005eac <MiCo_Q4x2_MatMul+0x1c4>
800060e8:	40b005b3          	neg	a1,a1
800060ec:	0586                	slli	a1,a1,0x1
800060ee:	b3c5                	j	80005ece <MiCo_Q4x2_MatMul+0x1e6>
800060f0:	40600333          	neg	t1,t1
800060f4:	0306                	slli	t1,t1,0x1
800060f6:	bbed                	j	80005ef0 <MiCo_Q4x2_MatMul+0x208>
800060f8:	4581                	li	a1,0
800060fa:	b719                	j	80006000 <MiCo_Q4x2_MatMul+0x318>

800060fc <MiCo_Q4x1_MatMul>:
800060fc:	7119                	addi	sp,sp,-128
800060fe:	4214                	lw	a3,0(a2)
80006100:	d2d6                	sw	s5,100(sp)
80006102:	0045aa83          	lw	s5,4(a1)
80006106:	4198                	lw	a4,0(a1)
80006108:	ce36                	sw	a3,28(sp)
8000610a:	005ad693          	srli	a3,s5,0x5
8000610e:	de86                	sw	ra,124(sp)
80006110:	dca2                	sw	s0,120(sp)
80006112:	daa6                	sw	s1,116(sp)
80006114:	d8ca                	sw	s2,112(sp)
80006116:	d6ce                	sw	s3,108(sp)
80006118:	d4d2                	sw	s4,104(sp)
8000611a:	d0da                	sw	s6,96(sp)
8000611c:	cede                	sw	s7,92(sp)
8000611e:	cce2                	sw	s8,88(sp)
80006120:	cae6                	sw	s9,84(sp)
80006122:	c8ea                	sw	s10,80(sp)
80006124:	c6ee                	sw	s11,76(sp)
80006126:	da3a                	sw	a4,52(sp)
80006128:	de32                	sw	a2,60(sp)
8000612a:	dc2a                	sw	a0,56(sp)
8000612c:	c636                	sw	a3,12(sp)
8000612e:	12070c63          	beqz	a4,80006266 <MiCo_Q4x1_MatMul+0x16a>
80006132:	459c                	lw	a5,8(a1)
80006134:	fe0afd93          	andi	s11,s5,-32
80006138:	4581                	li	a1,0
8000613a:	d63e                	sw	a5,44(sp)
8000613c:	001ad793          	srli	a5,s5,0x1
80006140:	d23e                	sw	a5,36(sp)
80006142:	001af793          	andi	a5,s5,1
80006146:	d83e                	sw	a5,48(sp)
80006148:	00269793          	slli	a5,a3,0x2
8000614c:	ca3e                	sw	a5,20(sp)
8000614e:	cc02                	sw	zero,24(sp)
80006150:	d002                	sw	zero,32(sp)
80006152:	47e2                	lw	a5,24(sp)
80006154:	0017d913          	srli	s2,a5,0x1
80006158:	57b2                	lw	a5,44(sp)
8000615a:	993e                	add	s2,s2,a5
8000615c:	5792                	lw	a5,36(sp)
8000615e:	14078563          	beqz	a5,800062a8 <MiCo_Q4x1_MatMul+0x1ac>
80006162:	86ca                	mv	a3,s2
80006164:	00f90633          	add	a2,s2,a5
80006168:	4b81                	li	s7,0
8000616a:	00068783          	lb	a5,0(a3)
8000616e:	0685                	addi	a3,a3,1
80006170:	01c79713          	slli	a4,a5,0x1c
80006174:	8771                	srai	a4,a4,0x1c
80006176:	9bba                	add	s7,s7,a4
80006178:	8791                	srai	a5,a5,0x4
8000617a:	9bbe                	add	s7,s7,a5
8000617c:	fec697e3          	bne	a3,a2,8000616a <MiCo_Q4x1_MatMul+0x6e>
80006180:	57c2                	lw	a5,48(sp)
80006182:	cb81                	beqz	a5,80006192 <MiCo_Q4x1_MatMul+0x96>
80006184:	5792                	lw	a5,36(sp)
80006186:	97ca                	add	a5,a5,s2
80006188:	0007c783          	lbu	a5,0(a5)
8000618c:	07f2                	slli	a5,a5,0x1c
8000618e:	87f1                	srai	a5,a5,0x1c
80006190:	9bbe                	add	s7,s7,a5
80006192:	47f2                	lw	a5,28(sp)
80006194:	10078c63          	beqz	a5,800062ac <MiCo_Q4x1_MatMul+0x1b0>
80006198:	5772                	lw	a4,60(sp)
8000619a:	97ae                	add	a5,a5,a1
8000619c:	d43e                	sw	a5,40(sp)
8000619e:	4718                	lw	a4,8(a4)
800061a0:	078a                	slli	a5,a5,0x2
800061a2:	058a                	slli	a1,a1,0x2
800061a4:	c43a                	sw	a4,8(sp)
800061a6:	5762                	lw	a4,56(sp)
800061a8:	4c81                	li	s9,0
800061aa:	97ba                	add	a5,a5,a4
800061ac:	00e58c33          	add	s8,a1,a4
800061b0:	c83e                	sw	a5,16(sp)
800061b2:	47a2                	lw	a5,8(sp)
800061b4:	003cda13          	srli	s4,s9,0x3
800061b8:	9a3e                	add	s4,s4,a5
800061ba:	47b2                	lw	a5,12(sp)
800061bc:	c7e5                	beqz	a5,800062a4 <MiCo_Q4x1_MatMul+0x1a8>
800061be:	47d2                	lw	a5,20(sp)
800061c0:	89d2                	mv	s3,s4
800061c2:	4481                	li	s1,0
800061c4:	01478b33          	add	s6,a5,s4
800061c8:	4401                	li	s0,0
800061ca:	854e                	mv	a0,s3
800061cc:	e35fe0ef          	jal	ra,80005000 <safe_load_qword>
800061d0:	8d2a                	mv	s10,a0
800061d2:	c505                	beqz	a0,800061fa <MiCo_Q4x1_MatMul+0xfe>
800061d4:	856a                	mv	a0,s10
800061d6:	1ba030ef          	jal	ra,80009390 <__ctzsi2>
800061da:	9526                	add	a0,a0,s1
800061dc:	00155793          	srli	a5,a0,0x1
800061e0:	97ca                	add	a5,a5,s2
800061e2:	8905                	andi	a0,a0,1
800061e4:	00078783          	lb	a5,0(a5)
800061e8:	fffd0693          	addi	a3,s10,-1
800061ec:	cd41                	beqz	a0,80006284 <MiCo_Q4x1_MatMul+0x188>
800061ee:	8791                	srai	a5,a5,0x4
800061f0:	00dd7d33          	and	s10,s10,a3
800061f4:	943e                	add	s0,s0,a5
800061f6:	fc0d1fe3          	bnez	s10,800061d4 <MiCo_Q4x1_MatMul+0xd8>
800061fa:	0991                	addi	s3,s3,4
800061fc:	02048493          	addi	s1,s1,32
80006200:	fd3b15e3          	bne	s6,s3,800061ca <MiCo_Q4x1_MatMul+0xce>
80006204:	035dfc63          	bgeu	s11,s5,8000623c <MiCo_Q4x1_MatMul+0x140>
80006208:	87ee                	mv	a5,s11
8000620a:	0037d713          	srli	a4,a5,0x3
8000620e:	9752                	add	a4,a4,s4
80006210:	00070683          	lb	a3,0(a4)
80006214:	0077f713          	andi	a4,a5,7
80006218:	0017d613          	srli	a2,a5,0x1
8000621c:	40e6d733          	sra	a4,a3,a4
80006220:	8b05                	andi	a4,a4,1
80006222:	00c906b3          	add	a3,s2,a2
80006226:	0017f613          	andi	a2,a5,1
8000622a:	c711                	beqz	a4,80006236 <MiCo_Q4x1_MatMul+0x13a>
8000622c:	00068703          	lb	a4,0(a3)
80006230:	c63d                	beqz	a2,8000629e <MiCo_Q4x1_MatMul+0x1a2>
80006232:	8711                	srai	a4,a4,0x4
80006234:	943a                	add	s0,s0,a4
80006236:	0785                	addi	a5,a5,1
80006238:	fcfa99e3          	bne	s5,a5,8000620a <MiCo_Q4x1_MatMul+0x10e>
8000623c:	00141793          	slli	a5,s0,0x1
80006240:	40fb87b3          	sub	a5,s7,a5
80006244:	00fc2023          	sw	a5,0(s8)
80006248:	47c2                	lw	a5,16(sp)
8000624a:	0c11                	addi	s8,s8,4
8000624c:	9cd6                	add	s9,s9,s5
8000624e:	f6fc12e3          	bne	s8,a5,800061b2 <MiCo_Q4x1_MatMul+0xb6>
80006252:	4762                	lw	a4,24(sp)
80006254:	5782                	lw	a5,32(sp)
80006256:	55a2                	lw	a1,40(sp)
80006258:	9756                	add	a4,a4,s5
8000625a:	cc3a                	sw	a4,24(sp)
8000625c:	5752                	lw	a4,52(sp)
8000625e:	0785                	addi	a5,a5,1
80006260:	d03e                	sw	a5,32(sp)
80006262:	eef718e3          	bne	a4,a5,80006152 <MiCo_Q4x1_MatMul+0x56>
80006266:	50f6                	lw	ra,124(sp)
80006268:	5466                	lw	s0,120(sp)
8000626a:	54d6                	lw	s1,116(sp)
8000626c:	5946                	lw	s2,112(sp)
8000626e:	59b6                	lw	s3,108(sp)
80006270:	5a26                	lw	s4,104(sp)
80006272:	5a96                	lw	s5,100(sp)
80006274:	5b06                	lw	s6,96(sp)
80006276:	4bf6                	lw	s7,92(sp)
80006278:	4c66                	lw	s8,88(sp)
8000627a:	4cd6                	lw	s9,84(sp)
8000627c:	4d46                	lw	s10,80(sp)
8000627e:	4db6                	lw	s11,76(sp)
80006280:	6109                	addi	sp,sp,128
80006282:	8082                	ret
80006284:	07f2                	slli	a5,a5,0x1c
80006286:	87f1                	srai	a5,a5,0x1c
80006288:	00dd7d33          	and	s10,s10,a3
8000628c:	943e                	add	s0,s0,a5
8000628e:	f40d13e3          	bnez	s10,800061d4 <MiCo_Q4x1_MatMul+0xd8>
80006292:	0991                	addi	s3,s3,4
80006294:	02048493          	addi	s1,s1,32
80006298:	f33b19e3          	bne	s6,s3,800061ca <MiCo_Q4x1_MatMul+0xce>
8000629c:	b7a5                	j	80006204 <MiCo_Q4x1_MatMul+0x108>
8000629e:	0772                	slli	a4,a4,0x1c
800062a0:	8771                	srai	a4,a4,0x1c
800062a2:	bf49                	j	80006234 <MiCo_Q4x1_MatMul+0x138>
800062a4:	4401                	li	s0,0
800062a6:	bfb9                	j	80006204 <MiCo_Q4x1_MatMul+0x108>
800062a8:	4b81                	li	s7,0
800062aa:	bdd9                	j	80006180 <MiCo_Q4x1_MatMul+0x84>
800062ac:	d42e                	sw	a1,40(sp)
800062ae:	b755                	j	80006252 <MiCo_Q4x1_MatMul+0x156>

800062b0 <MiCo_Q2_MatMul>:
800062b0:	7139                	addi	sp,sp,-64
800062b2:	cc66                	sw	s9,24(sp)
800062b4:	0005ac83          	lw	s9,0(a1)
800062b8:	da4a                	sw	s2,52(sp)
800062ba:	de22                	sw	s0,60(sp)
800062bc:	dc26                	sw	s1,56(sp)
800062be:	d84e                	sw	s3,48(sp)
800062c0:	d652                	sw	s4,44(sp)
800062c2:	d456                	sw	s5,40(sp)
800062c4:	d25a                	sw	s6,36(sp)
800062c6:	d05e                	sw	s7,32(sp)
800062c8:	ce62                	sw	s8,28(sp)
800062ca:	ca6a                	sw	s10,20(sp)
800062cc:	c86e                	sw	s11,16(sp)
800062ce:	0045a903          	lw	s2,4(a1)
800062d2:	421c                	lw	a5,0(a2)
800062d4:	520c8263          	beqz	s9,800067f8 <MiCo_Q2_MatMul+0x548>
800062d8:	52078063          	beqz	a5,800067f8 <MiCo_Q2_MatMul+0x548>
800062dc:	86b2                	mv	a3,a2
800062de:	0085ad83          	lw	s11,8(a1)
800062e2:	40f00633          	neg	a2,a5
800062e6:	078a                	slli	a5,a5,0x2
800062e8:	0086ab03          	lw	s6,8(a3)
800062ec:	00f50ab3          	add	s5,a0,a5
800062f0:	00361693          	slli	a3,a2,0x3
800062f4:	00261793          	slli	a5,a2,0x2
800062f8:	c43e                	sw	a5,8(sp)
800062fa:	ff097493          	andi	s1,s2,-16
800062fe:	4c01                	li	s8,0
80006300:	4b81                	li	s7,0
80006302:	4785                	li	a5,1
80006304:	4709                	li	a4,2
80006306:	c636                	sw	a3,12(sp)
80006308:	46a2                	lw	a3,8(sp)
8000630a:	002c5393          	srli	t2,s8,0x2
8000630e:	93ee                	add	t2,t2,s11
80006310:	01568d33          	add	s10,a3,s5
80006314:	89ea                	mv	s3,s10
80006316:	4a01                	li	s4,0
80006318:	002a5513          	srli	a0,s4,0x2
8000631c:	955a                	add	a0,a0,s6
8000631e:	56048063          	beqz	s1,8000687e <MiCo_Q2_MatMul+0x5ce>
80006322:	4801                	li	a6,0
80006324:	4681                	li	a3,0
80006326:	ae8d                	j	80006698 <MiCo_Q2_MatMul+0x3e8>
80006328:	1ff5                	addi	t6,t6,-3
8000632a:	001fbf93          	seqz	t6,t6
8000632e:	41f00fb3          	neg	t6,t6
80006332:	03f40433          	mul	s0,s0,t6
80006336:	4042df93          	srai	t6,t0,0x4
8000633a:	003fff93          	andi	t6,t6,3
8000633e:	9436                	add	s0,s0,a3
80006340:	4685                	li	a3,1
80006342:	00ff8b63          	beq	t6,a5,80006358 <MiCo_Q2_MatMul+0xa8>
80006346:	56f9                	li	a3,-2
80006348:	00ef8863          	beq	t6,a4,80006358 <MiCo_Q2_MatMul+0xa8>
8000634c:	ffdf8693          	addi	a3,t6,-3
80006350:	0016b693          	seqz	a3,a3
80006354:	40d006b3          	neg	a3,a3
80006358:	404edf93          	srai	t6,t4,0x4
8000635c:	003fff93          	andi	t6,t6,3
80006360:	00ff8b63          	beq	t6,a5,80006376 <MiCo_Q2_MatMul+0xc6>
80006364:	4aef8c63          	beq	t6,a4,8000681c <MiCo_Q2_MatMul+0x56c>
80006368:	1ff5                	addi	t6,t6,-3
8000636a:	001fbf93          	seqz	t6,t6
8000636e:	41f00fb3          	neg	t6,t6
80006372:	03f686b3          	mul	a3,a3,t6
80006376:	0ff2f293          	andi	t0,t0,255
8000637a:	0062d293          	srli	t0,t0,0x6
8000637e:	96a2                	add	a3,a3,s0
80006380:	4f85                	li	t6,1
80006382:	00f28b63          	beq	t0,a5,80006398 <MiCo_Q2_MatMul+0xe8>
80006386:	5ff9                	li	t6,-2
80006388:	00e28863          	beq	t0,a4,80006398 <MiCo_Q2_MatMul+0xe8>
8000638c:	ffd28f93          	addi	t6,t0,-3
80006390:	001fbf93          	seqz	t6,t6
80006394:	41f00fb3          	neg	t6,t6
80006398:	0ffefe93          	andi	t4,t4,255
8000639c:	006ede93          	srli	t4,t4,0x6
800063a0:	00fe8b63          	beq	t4,a5,800063b6 <MiCo_Q2_MatMul+0x106>
800063a4:	48ee8063          	beq	t4,a4,80006824 <MiCo_Q2_MatMul+0x574>
800063a8:	1ef5                	addi	t4,t4,-3
800063aa:	001ebe93          	seqz	t4,t4
800063ae:	41d00eb3          	neg	t4,t4
800063b2:	03df8fb3          	mul	t6,t6,t4
800063b6:	003f7e93          	andi	t4,t5,3
800063ba:	96fe                	add	a3,a3,t6
800063bc:	4f85                	li	t6,1
800063be:	00fe8b63          	beq	t4,a5,800063d4 <MiCo_Q2_MatMul+0x124>
800063c2:	5ff9                	li	t6,-2
800063c4:	00ee8863          	beq	t4,a4,800063d4 <MiCo_Q2_MatMul+0x124>
800063c8:	ffde8f93          	addi	t6,t4,-3
800063cc:	001fbf93          	seqz	t6,t6
800063d0:	41f00fb3          	neg	t6,t6
800063d4:	0038fe93          	andi	t4,a7,3
800063d8:	00fe8b63          	beq	t4,a5,800063ee <MiCo_Q2_MatMul+0x13e>
800063dc:	44ee8863          	beq	t4,a4,8000682c <MiCo_Q2_MatMul+0x57c>
800063e0:	1ef5                	addi	t4,t4,-3
800063e2:	001ebe93          	seqz	t4,t4
800063e6:	41d00eb3          	neg	t4,t4
800063ea:	03df8fb3          	mul	t6,t6,t4
800063ee:	402f5e93          	srai	t4,t5,0x2
800063f2:	003efe93          	andi	t4,t4,3
800063f6:	96fe                	add	a3,a3,t6
800063f8:	4f85                	li	t6,1
800063fa:	00fe8b63          	beq	t4,a5,80006410 <MiCo_Q2_MatMul+0x160>
800063fe:	5ff9                	li	t6,-2
80006400:	00ee8863          	beq	t4,a4,80006410 <MiCo_Q2_MatMul+0x160>
80006404:	ffde8f93          	addi	t6,t4,-3
80006408:	001fbf93          	seqz	t6,t6
8000640c:	41f00fb3          	neg	t6,t6
80006410:	4028de93          	srai	t4,a7,0x2
80006414:	003efe93          	andi	t4,t4,3
80006418:	00fe8b63          	beq	t4,a5,8000642e <MiCo_Q2_MatMul+0x17e>
8000641c:	40ee8c63          	beq	t4,a4,80006834 <MiCo_Q2_MatMul+0x584>
80006420:	1ef5                	addi	t4,t4,-3
80006422:	001ebe93          	seqz	t4,t4
80006426:	41d00eb3          	neg	t4,t4
8000642a:	03df8fb3          	mul	t6,t6,t4
8000642e:	404f5e93          	srai	t4,t5,0x4
80006432:	003efe93          	andi	t4,t4,3
80006436:	9fb6                	add	t6,t6,a3
80006438:	4685                	li	a3,1
8000643a:	00fe8b63          	beq	t4,a5,80006450 <MiCo_Q2_MatMul+0x1a0>
8000643e:	56f9                	li	a3,-2
80006440:	00ee8863          	beq	t4,a4,80006450 <MiCo_Q2_MatMul+0x1a0>
80006444:	ffde8693          	addi	a3,t4,-3
80006448:	0016b693          	seqz	a3,a3
8000644c:	40d006b3          	neg	a3,a3
80006450:	4048de93          	srai	t4,a7,0x4
80006454:	003efe93          	andi	t4,t4,3
80006458:	00fe8b63          	beq	t4,a5,8000646e <MiCo_Q2_MatMul+0x1be>
8000645c:	3eee8063          	beq	t4,a4,8000683c <MiCo_Q2_MatMul+0x58c>
80006460:	1ef5                	addi	t4,t4,-3
80006462:	001ebe93          	seqz	t4,t4
80006466:	41d00eb3          	neg	t4,t4
8000646a:	03d686b3          	mul	a3,a3,t4
8000646e:	0fff7f13          	andi	t5,t5,255
80006472:	006f5f13          	srli	t5,t5,0x6
80006476:	96fe                	add	a3,a3,t6
80006478:	4e85                	li	t4,1
8000647a:	00ff0b63          	beq	t5,a5,80006490 <MiCo_Q2_MatMul+0x1e0>
8000647e:	5ef9                	li	t4,-2
80006480:	00ef0863          	beq	t5,a4,80006490 <MiCo_Q2_MatMul+0x1e0>
80006484:	ffdf0e93          	addi	t4,t5,-3
80006488:	001ebe93          	seqz	t4,t4
8000648c:	41d00eb3          	neg	t4,t4
80006490:	0ff8f893          	andi	a7,a7,255
80006494:	0068d893          	srli	a7,a7,0x6
80006498:	00f88b63          	beq	a7,a5,800064ae <MiCo_Q2_MatMul+0x1fe>
8000649c:	3ae88463          	beq	a7,a4,80006844 <MiCo_Q2_MatMul+0x594>
800064a0:	18f5                	addi	a7,a7,-3
800064a2:	0018b893          	seqz	a7,a7
800064a6:	411008b3          	neg	a7,a7
800064aa:	031e8eb3          	mul	t4,t4,a7
800064ae:	003e7893          	andi	a7,t3,3
800064b2:	9eb6                	add	t4,t4,a3
800064b4:	4685                	li	a3,1
800064b6:	00f88b63          	beq	a7,a5,800064cc <MiCo_Q2_MatMul+0x21c>
800064ba:	56f9                	li	a3,-2
800064bc:	00e88863          	beq	a7,a4,800064cc <MiCo_Q2_MatMul+0x21c>
800064c0:	ffd88693          	addi	a3,a7,-3
800064c4:	0016b693          	seqz	a3,a3
800064c8:	40d006b3          	neg	a3,a3
800064cc:	0035f893          	andi	a7,a1,3
800064d0:	00f88b63          	beq	a7,a5,800064e6 <MiCo_Q2_MatMul+0x236>
800064d4:	36e88c63          	beq	a7,a4,8000684c <MiCo_Q2_MatMul+0x59c>
800064d8:	18f5                	addi	a7,a7,-3
800064da:	0018b893          	seqz	a7,a7
800064de:	411008b3          	neg	a7,a7
800064e2:	031686b3          	mul	a3,a3,a7
800064e6:	402e5893          	srai	a7,t3,0x2
800064ea:	0038f893          	andi	a7,a7,3
800064ee:	96f6                	add	a3,a3,t4
800064f0:	4e85                	li	t4,1
800064f2:	00f88b63          	beq	a7,a5,80006508 <MiCo_Q2_MatMul+0x258>
800064f6:	5ef9                	li	t4,-2
800064f8:	00e88863          	beq	a7,a4,80006508 <MiCo_Q2_MatMul+0x258>
800064fc:	ffd88e93          	addi	t4,a7,-3
80006500:	001ebe93          	seqz	t4,t4
80006504:	41d00eb3          	neg	t4,t4
80006508:	4025d893          	srai	a7,a1,0x2
8000650c:	0038f893          	andi	a7,a7,3
80006510:	00f88b63          	beq	a7,a5,80006526 <MiCo_Q2_MatMul+0x276>
80006514:	34e88063          	beq	a7,a4,80006854 <MiCo_Q2_MatMul+0x5a4>
80006518:	18f5                	addi	a7,a7,-3
8000651a:	0018b893          	seqz	a7,a7
8000651e:	411008b3          	neg	a7,a7
80006522:	031e8eb3          	mul	t4,t4,a7
80006526:	404e5893          	srai	a7,t3,0x4
8000652a:	0038f893          	andi	a7,a7,3
8000652e:	96f6                	add	a3,a3,t4
80006530:	4e85                	li	t4,1
80006532:	00f88b63          	beq	a7,a5,80006548 <MiCo_Q2_MatMul+0x298>
80006536:	5ef9                	li	t4,-2
80006538:	00e88863          	beq	a7,a4,80006548 <MiCo_Q2_MatMul+0x298>
8000653c:	ffd88e93          	addi	t4,a7,-3
80006540:	001ebe93          	seqz	t4,t4
80006544:	41d00eb3          	neg	t4,t4
80006548:	4045d893          	srai	a7,a1,0x4
8000654c:	0038f893          	andi	a7,a7,3
80006550:	00f88b63          	beq	a7,a5,80006566 <MiCo_Q2_MatMul+0x2b6>
80006554:	30e88463          	beq	a7,a4,8000685c <MiCo_Q2_MatMul+0x5ac>
80006558:	18f5                	addi	a7,a7,-3
8000655a:	0018b893          	seqz	a7,a7
8000655e:	411008b3          	neg	a7,a7
80006562:	031e8eb3          	mul	t4,t4,a7
80006566:	0ffe7e13          	andi	t3,t3,255
8000656a:	006e5e13          	srli	t3,t3,0x6
8000656e:	9eb6                	add	t4,t4,a3
80006570:	4685                	li	a3,1
80006572:	00fe0a63          	beq	t3,a5,80006586 <MiCo_Q2_MatMul+0x2d6>
80006576:	56f9                	li	a3,-2
80006578:	00ee0763          	beq	t3,a4,80006586 <MiCo_Q2_MatMul+0x2d6>
8000657c:	1e75                	addi	t3,t3,-3
8000657e:	001e3e13          	seqz	t3,t3
80006582:	41c006b3          	neg	a3,t3
80006586:	0ff5f593          	andi	a1,a1,255
8000658a:	8199                	srli	a1,a1,0x6
8000658c:	00f58b63          	beq	a1,a5,800065a2 <MiCo_Q2_MatMul+0x2f2>
80006590:	2ce58a63          	beq	a1,a4,80006864 <MiCo_Q2_MatMul+0x5b4>
80006594:	15f5                	addi	a1,a1,-3
80006596:	0015b593          	seqz	a1,a1
8000659a:	40b005b3          	neg	a1,a1
8000659e:	02b686b3          	mul	a3,a3,a1
800065a2:	00337593          	andi	a1,t1,3
800065a6:	01d68e33          	add	t3,a3,t4
800065aa:	4685                	li	a3,1
800065ac:	00f58b63          	beq	a1,a5,800065c2 <MiCo_Q2_MatMul+0x312>
800065b0:	56f9                	li	a3,-2
800065b2:	00e58863          	beq	a1,a4,800065c2 <MiCo_Q2_MatMul+0x312>
800065b6:	ffd58693          	addi	a3,a1,-3
800065ba:	0016b693          	seqz	a3,a3
800065be:	40d006b3          	neg	a3,a3
800065c2:	00367593          	andi	a1,a2,3
800065c6:	00f58b63          	beq	a1,a5,800065dc <MiCo_Q2_MatMul+0x32c>
800065ca:	2ae58163          	beq	a1,a4,8000686c <MiCo_Q2_MatMul+0x5bc>
800065ce:	15f5                	addi	a1,a1,-3
800065d0:	0015b593          	seqz	a1,a1
800065d4:	40b005b3          	neg	a1,a1
800065d8:	02b686b3          	mul	a3,a3,a1
800065dc:	40235593          	srai	a1,t1,0x2
800065e0:	898d                	andi	a1,a1,3
800065e2:	96f2                	add	a3,a3,t3
800065e4:	4885                	li	a7,1
800065e6:	00f58b63          	beq	a1,a5,800065fc <MiCo_Q2_MatMul+0x34c>
800065ea:	58f9                	li	a7,-2
800065ec:	00e58863          	beq	a1,a4,800065fc <MiCo_Q2_MatMul+0x34c>
800065f0:	ffd58893          	addi	a7,a1,-3
800065f4:	0018b893          	seqz	a7,a7
800065f8:	411008b3          	neg	a7,a7
800065fc:	40265593          	srai	a1,a2,0x2
80006600:	898d                	andi	a1,a1,3
80006602:	00f58b63          	beq	a1,a5,80006618 <MiCo_Q2_MatMul+0x368>
80006606:	26e58863          	beq	a1,a4,80006876 <MiCo_Q2_MatMul+0x5c6>
8000660a:	15f5                	addi	a1,a1,-3
8000660c:	0015b593          	seqz	a1,a1
80006610:	40b005b3          	neg	a1,a1
80006614:	02b888b3          	mul	a7,a7,a1
80006618:	40435593          	srai	a1,t1,0x4
8000661c:	898d                	andi	a1,a1,3
8000661e:	96c6                	add	a3,a3,a7
80006620:	4405                	li	s0,1
80006622:	00f58b63          	beq	a1,a5,80006638 <MiCo_Q2_MatMul+0x388>
80006626:	5479                	li	s0,-2
80006628:	00e58863          	beq	a1,a4,80006638 <MiCo_Q2_MatMul+0x388>
8000662c:	ffd58413          	addi	s0,a1,-3
80006630:	00143413          	seqz	s0,s0
80006634:	40800433          	neg	s0,s0
80006638:	40465593          	srai	a1,a2,0x4
8000663c:	898d                	andi	a1,a1,3
8000663e:	00f58b63          	beq	a1,a5,80006654 <MiCo_Q2_MatMul+0x3a4>
80006642:	10e58763          	beq	a1,a4,80006750 <MiCo_Q2_MatMul+0x4a0>
80006646:	15f5                	addi	a1,a1,-3
80006648:	0015b593          	seqz	a1,a1
8000664c:	40b005b3          	neg	a1,a1
80006650:	02b40433          	mul	s0,s0,a1
80006654:	0ff37313          	andi	t1,t1,255
80006658:	00635313          	srli	t1,t1,0x6
8000665c:	96a2                	add	a3,a3,s0
8000665e:	4585                	li	a1,1
80006660:	00f30a63          	beq	t1,a5,80006674 <MiCo_Q2_MatMul+0x3c4>
80006664:	55f9                	li	a1,-2
80006666:	00e30763          	beq	t1,a4,80006674 <MiCo_Q2_MatMul+0x3c4>
8000666a:	1375                	addi	t1,t1,-3
8000666c:	00133313          	seqz	t1,t1
80006670:	406005b3          	neg	a1,t1
80006674:	0ff67613          	andi	a2,a2,255
80006678:	8219                	srli	a2,a2,0x6
8000667a:	00f60b63          	beq	a2,a5,80006690 <MiCo_Q2_MatMul+0x3e0>
8000667e:	0ce60d63          	beq	a2,a4,80006758 <MiCo_Q2_MatMul+0x4a8>
80006682:	1675                	addi	a2,a2,-3
80006684:	00163613          	seqz	a2,a2
80006688:	40c00633          	neg	a2,a2
8000668c:	02c585b3          	mul	a1,a1,a2
80006690:	0841                	addi	a6,a6,16
80006692:	96ae                	add	a3,a3,a1
80006694:	0c987a63          	bgeu	a6,s1,80006768 <MiCo_Q2_MatMul+0x4b8>
80006698:	00285613          	srli	a2,a6,0x2
8000669c:	00c385b3          	add	a1,t2,a2
800066a0:	00058283          	lb	t0,0(a1)
800066a4:	00160893          	addi	a7,a2,1
800066a8:	00260593          	addi	a1,a2,2
800066ac:	00360413          	addi	s0,a2,3
800066b0:	01138eb3          	add	t4,t2,a7
800066b4:	00b38e33          	add	t3,t2,a1
800066b8:	00838333          	add	t1,t2,s0
800066bc:	962a                	add	a2,a2,a0
800066be:	942a                	add	s0,s0,a0
800066c0:	98aa                	add	a7,a7,a0
800066c2:	95aa                	add	a1,a1,a0
800066c4:	0032ff93          	andi	t6,t0,3
800066c8:	000e8f03          	lb	t5,0(t4)
800066cc:	000e0e03          	lb	t3,0(t3)
800066d0:	00060e83          	lb	t4,0(a2)
800066d4:	00030303          	lb	t1,0(t1)
800066d8:	00040603          	lb	a2,0(s0)
800066dc:	00088883          	lb	a7,0(a7)
800066e0:	00058583          	lb	a1,0(a1)
800066e4:	4405                	li	s0,1
800066e6:	00ff8b63          	beq	t6,a5,800066fc <MiCo_Q2_MatMul+0x44c>
800066ea:	5479                	li	s0,-2
800066ec:	00ef8863          	beq	t6,a4,800066fc <MiCo_Q2_MatMul+0x44c>
800066f0:	ffdf8413          	addi	s0,t6,-3
800066f4:	00143413          	seqz	s0,s0
800066f8:	40800433          	neg	s0,s0
800066fc:	003eff93          	andi	t6,t4,3
80006700:	00ff8b63          	beq	t6,a5,80006716 <MiCo_Q2_MatMul+0x466>
80006704:	10ef8863          	beq	t6,a4,80006814 <MiCo_Q2_MatMul+0x564>
80006708:	1ff5                	addi	t6,t6,-3
8000670a:	001fbf93          	seqz	t6,t6
8000670e:	41f00fb3          	neg	t6,t6
80006712:	03f40433          	mul	s0,s0,t6
80006716:	4022df93          	srai	t6,t0,0x2
8000671a:	003fff93          	andi	t6,t6,3
8000671e:	96a2                	add	a3,a3,s0
80006720:	4405                	li	s0,1
80006722:	00ff8b63          	beq	t6,a5,80006738 <MiCo_Q2_MatMul+0x488>
80006726:	5479                	li	s0,-2
80006728:	00ef8863          	beq	t6,a4,80006738 <MiCo_Q2_MatMul+0x488>
8000672c:	ffdf8413          	addi	s0,t6,-3
80006730:	00143413          	seqz	s0,s0
80006734:	40800433          	neg	s0,s0
80006738:	402edf93          	srai	t6,t4,0x2
8000673c:	003fff93          	andi	t6,t6,3
80006740:	beff8be3          	beq	t6,a5,80006336 <MiCo_Q2_MatMul+0x86>
80006744:	beef92e3          	bne	t6,a4,80006328 <MiCo_Q2_MatMul+0x78>
80006748:	40800433          	neg	s0,s0
8000674c:	0406                	slli	s0,s0,0x1
8000674e:	b6e5                	j	80006336 <MiCo_Q2_MatMul+0x86>
80006750:	40800433          	neg	s0,s0
80006754:	0406                	slli	s0,s0,0x1
80006756:	bdfd                	j	80006654 <MiCo_Q2_MatMul+0x3a4>
80006758:	40b00333          	neg	t1,a1
8000675c:	00131593          	slli	a1,t1,0x1
80006760:	0841                	addi	a6,a6,16
80006762:	96ae                	add	a3,a3,a1
80006764:	f2986ae3          	bltu	a6,s1,80006698 <MiCo_Q2_MatMul+0x3e8>
80006768:	0724fb63          	bgeu	s1,s2,800067de <MiCo_Q2_MatMul+0x52e>
8000676c:	8826                	mv	a6,s1
8000676e:	a039                	j	8000677c <MiCo_Q2_MatMul+0x4cc>
80006770:	02be0e33          	mul	t3,t3,a1
80006774:	0805                	addi	a6,a6,1
80006776:	96f2                	add	a3,a3,t3
80006778:	07090363          	beq	s2,a6,800067de <MiCo_Q2_MatMul+0x52e>
8000677c:	00285613          	srli	a2,a6,0x2
80006780:	00c505b3          	add	a1,a0,a2
80006784:	00058583          	lb	a1,0(a1)
80006788:	00c38333          	add	t1,t2,a2
8000678c:	00387613          	andi	a2,a6,3
80006790:	00161893          	slli	a7,a2,0x1
80006794:	4115d5b3          	sra	a1,a1,a7
80006798:	898d                	andi	a1,a1,3
8000679a:	ffd58613          	addi	a2,a1,-3
8000679e:	00163613          	seqz	a2,a2
800067a2:	4e05                	li	t3,1
800067a4:	00f58763          	beq	a1,a5,800067b2 <MiCo_Q2_MatMul+0x502>
800067a8:	5e79                	li	t3,-2
800067aa:	00e58463          	beq	a1,a4,800067b2 <MiCo_Q2_MatMul+0x502>
800067ae:	40c00e33          	neg	t3,a2
800067b2:	00030603          	lb	a2,0(t1)
800067b6:	41165633          	sra	a2,a2,a7
800067ba:	8a0d                	andi	a2,a2,3
800067bc:	ffd60593          	addi	a1,a2,-3
800067c0:	0015b593          	seqz	a1,a1
800067c4:	40b005b3          	neg	a1,a1
800067c8:	faf606e3          	beq	a2,a5,80006774 <MiCo_Q2_MatMul+0x4c4>
800067cc:	fae612e3          	bne	a2,a4,80006770 <MiCo_Q2_MatMul+0x4c0>
800067d0:	41c00e33          	neg	t3,t3
800067d4:	0e06                	slli	t3,t3,0x1
800067d6:	0805                	addi	a6,a6,1
800067d8:	96f2                	add	a3,a3,t3
800067da:	fb0911e3          	bne	s2,a6,8000677c <MiCo_Q2_MatMul+0x4cc>
800067de:	00d9a023          	sw	a3,0(s3)
800067e2:	0991                	addi	s3,s3,4
800067e4:	9a4a                	add	s4,s4,s2
800067e6:	b35999e3          	bne	s3,s5,80006318 <MiCo_Q2_MatMul+0x68>
800067ea:	46b2                	lw	a3,12(sp)
800067ec:	0b85                	addi	s7,s7,1
800067ee:	9c4a                	add	s8,s8,s2
800067f0:	40dd0ab3          	sub	s5,s10,a3
800067f4:	b17c9ae3          	bne	s9,s7,80006308 <MiCo_Q2_MatMul+0x58>
800067f8:	5472                	lw	s0,60(sp)
800067fa:	54e2                	lw	s1,56(sp)
800067fc:	5952                	lw	s2,52(sp)
800067fe:	59c2                	lw	s3,48(sp)
80006800:	5a32                	lw	s4,44(sp)
80006802:	5aa2                	lw	s5,40(sp)
80006804:	5b12                	lw	s6,36(sp)
80006806:	5b82                	lw	s7,32(sp)
80006808:	4c72                	lw	s8,28(sp)
8000680a:	4ce2                	lw	s9,24(sp)
8000680c:	4d52                	lw	s10,20(sp)
8000680e:	4dc2                	lw	s11,16(sp)
80006810:	6121                	addi	sp,sp,64
80006812:	8082                	ret
80006814:	40800433          	neg	s0,s0
80006818:	0406                	slli	s0,s0,0x1
8000681a:	bdf5                	j	80006716 <MiCo_Q2_MatMul+0x466>
8000681c:	40d006b3          	neg	a3,a3
80006820:	0686                	slli	a3,a3,0x1
80006822:	be91                	j	80006376 <MiCo_Q2_MatMul+0xc6>
80006824:	41f00fb3          	neg	t6,t6
80006828:	0f86                	slli	t6,t6,0x1
8000682a:	b671                	j	800063b6 <MiCo_Q2_MatMul+0x106>
8000682c:	41f00fb3          	neg	t6,t6
80006830:	0f86                	slli	t6,t6,0x1
80006832:	be75                	j	800063ee <MiCo_Q2_MatMul+0x13e>
80006834:	41f00fb3          	neg	t6,t6
80006838:	0f86                	slli	t6,t6,0x1
8000683a:	bed5                	j	8000642e <MiCo_Q2_MatMul+0x17e>
8000683c:	40d006b3          	neg	a3,a3
80006840:	0686                	slli	a3,a3,0x1
80006842:	b135                	j	8000646e <MiCo_Q2_MatMul+0x1be>
80006844:	41d00eb3          	neg	t4,t4
80006848:	0e86                	slli	t4,t4,0x1
8000684a:	b195                	j	800064ae <MiCo_Q2_MatMul+0x1fe>
8000684c:	40d006b3          	neg	a3,a3
80006850:	0686                	slli	a3,a3,0x1
80006852:	b951                	j	800064e6 <MiCo_Q2_MatMul+0x236>
80006854:	41d00eb3          	neg	t4,t4
80006858:	0e86                	slli	t4,t4,0x1
8000685a:	b1f1                	j	80006526 <MiCo_Q2_MatMul+0x276>
8000685c:	41d00eb3          	neg	t4,t4
80006860:	0e86                	slli	t4,t4,0x1
80006862:	b311                	j	80006566 <MiCo_Q2_MatMul+0x2b6>
80006864:	40d006b3          	neg	a3,a3
80006868:	0686                	slli	a3,a3,0x1
8000686a:	bb25                	j	800065a2 <MiCo_Q2_MatMul+0x2f2>
8000686c:	40d005b3          	neg	a1,a3
80006870:	00159693          	slli	a3,a1,0x1
80006874:	b3a5                	j	800065dc <MiCo_Q2_MatMul+0x32c>
80006876:	411008b3          	neg	a7,a7
8000687a:	0886                	slli	a7,a7,0x1
8000687c:	bb71                	j	80006618 <MiCo_Q2_MatMul+0x368>
8000687e:	4681                	li	a3,0
80006880:	b5e5                	j	80006768 <MiCo_Q2_MatMul+0x4b8>

80006882 <MiCo_Q2x1_MatMul>:
80006882:	7119                	addi	sp,sp,-128
80006884:	4214                	lw	a3,0(a2)
80006886:	c8ea                	sw	s10,80(sp)
80006888:	0045ad03          	lw	s10,4(a1)
8000688c:	4198                	lw	a4,0(a1)
8000688e:	d036                	sw	a3,32(sp)
80006890:	005d5693          	srli	a3,s10,0x5
80006894:	de86                	sw	ra,124(sp)
80006896:	dca2                	sw	s0,120(sp)
80006898:	daa6                	sw	s1,116(sp)
8000689a:	d8ca                	sw	s2,112(sp)
8000689c:	d6ce                	sw	s3,108(sp)
8000689e:	d4d2                	sw	s4,104(sp)
800068a0:	d2d6                	sw	s5,100(sp)
800068a2:	d0da                	sw	s6,96(sp)
800068a4:	cede                	sw	s7,92(sp)
800068a6:	cce2                	sw	s8,88(sp)
800068a8:	cae6                	sw	s9,84(sp)
800068aa:	c6ee                	sw	s11,76(sp)
800068ac:	da3a                	sw	a4,52(sp)
800068ae:	de32                	sw	a2,60(sp)
800068b0:	dc2a                	sw	a0,56(sp)
800068b2:	c236                	sw	a3,4(sp)
800068b4:	1e070463          	beqz	a4,80006a9c <MiCo_Q2x1_MatMul+0x21a>
800068b8:	459c                	lw	a5,8(a1)
800068ba:	ce02                	sw	zero,28(sp)
800068bc:	4581                	li	a1,0
800068be:	d83e                	sw	a5,48(sp)
800068c0:	002d5793          	srli	a5,s10,0x2
800068c4:	d43e                	sw	a5,40(sp)
800068c6:	003d7793          	andi	a5,s10,3
800068ca:	cc3e                	sw	a5,24(sp)
800068cc:	fe0d7793          	andi	a5,s10,-32
800068d0:	c43e                	sw	a5,8(sp)
800068d2:	00269793          	slli	a5,a3,0x2
800068d6:	ca3e                	sw	a5,20(sp)
800068d8:	d202                	sw	zero,36(sp)
800068da:	4985                	li	s3,1
800068dc:	4d89                	li	s11,2
800068de:	47f2                	lw	a5,28(sp)
800068e0:	0027d913          	srli	s2,a5,0x2
800068e4:	57c2                	lw	a5,48(sp)
800068e6:	993e                	add	s2,s2,a5
800068e8:	57a2                	lw	a5,40(sp)
800068ea:	24078163          	beqz	a5,80006b2c <MiCo_Q2x1_MatMul+0x2aa>
800068ee:	86ca                	mv	a3,s2
800068f0:	01278633          	add	a2,a5,s2
800068f4:	4b01                	li	s6,0
800068f6:	00068783          	lb	a5,0(a3)
800068fa:	4505                	li	a0,1
800068fc:	0037f713          	andi	a4,a5,3
80006900:	01370b63          	beq	a4,s3,80006916 <MiCo_Q2x1_MatMul+0x94>
80006904:	5579                	li	a0,-2
80006906:	01b70863          	beq	a4,s11,80006916 <MiCo_Q2x1_MatMul+0x94>
8000690a:	ffd70513          	addi	a0,a4,-3
8000690e:	00153513          	seqz	a0,a0
80006912:	40a00533          	neg	a0,a0
80006916:	4027d713          	srai	a4,a5,0x2
8000691a:	8b0d                	andi	a4,a4,3
8000691c:	9b2a                	add	s6,s6,a0
8000691e:	4505                	li	a0,1
80006920:	01370a63          	beq	a4,s3,80006934 <MiCo_Q2x1_MatMul+0xb2>
80006924:	5579                	li	a0,-2
80006926:	01b70763          	beq	a4,s11,80006934 <MiCo_Q2x1_MatMul+0xb2>
8000692a:	1775                	addi	a4,a4,-3
8000692c:	00173713          	seqz	a4,a4
80006930:	40e00533          	neg	a0,a4
80006934:	4047d713          	srai	a4,a5,0x4
80006938:	8b0d                	andi	a4,a4,3
8000693a:	9b2a                	add	s6,s6,a0
8000693c:	4505                	li	a0,1
8000693e:	01370a63          	beq	a4,s3,80006952 <MiCo_Q2x1_MatMul+0xd0>
80006942:	5579                	li	a0,-2
80006944:	01b70763          	beq	a4,s11,80006952 <MiCo_Q2x1_MatMul+0xd0>
80006948:	1775                	addi	a4,a4,-3
8000694a:	00173713          	seqz	a4,a4
8000694e:	40e00533          	neg	a0,a4
80006952:	0ff7f793          	andi	a5,a5,255
80006956:	8399                	srli	a5,a5,0x6
80006958:	955a                	add	a0,a0,s6
8000695a:	4705                	li	a4,1
8000695c:	01378a63          	beq	a5,s3,80006970 <MiCo_Q2x1_MatMul+0xee>
80006960:	5779                	li	a4,-2
80006962:	01b78763          	beq	a5,s11,80006970 <MiCo_Q2x1_MatMul+0xee>
80006966:	17f5                	addi	a5,a5,-3
80006968:	0017b793          	seqz	a5,a5
8000696c:	40f00733          	neg	a4,a5
80006970:	0685                	addi	a3,a3,1
80006972:	00a70b33          	add	s6,a4,a0
80006976:	f8d610e3          	bne	a2,a3,800068f6 <MiCo_Q2x1_MatMul+0x74>
8000697a:	47e2                	lw	a5,24(sp)
8000697c:	14079363          	bnez	a5,80006ac2 <MiCo_Q2x1_MatMul+0x240>
80006980:	5782                	lw	a5,32(sp)
80006982:	1a078363          	beqz	a5,80006b28 <MiCo_Q2x1_MatMul+0x2a6>
80006986:	5772                	lw	a4,60(sp)
80006988:	97ae                	add	a5,a5,a1
8000698a:	d63e                	sw	a5,44(sp)
8000698c:	4718                	lw	a4,8(a4)
8000698e:	078a                	slli	a5,a5,0x2
80006990:	058a                	slli	a1,a1,0x2
80006992:	c03a                	sw	a4,0(sp)
80006994:	5762                	lw	a4,56(sp)
80006996:	4b81                	li	s7,0
80006998:	c85a                	sw	s6,16(sp)
8000699a:	97ba                	add	a5,a5,a4
8000699c:	00e58c33          	add	s8,a1,a4
800069a0:	c63e                	sw	a5,12(sp)
800069a2:	4782                	lw	a5,0(sp)
800069a4:	003bda93          	srli	s5,s7,0x3
800069a8:	9abe                	add	s5,s5,a5
800069aa:	4792                	lw	a5,4(sp)
800069ac:	10078963          	beqz	a5,80006abe <MiCo_Q2x1_MatMul+0x23c>
800069b0:	47d2                	lw	a5,20(sp)
800069b2:	8a56                	mv	s4,s5
800069b4:	4481                	li	s1,0
800069b6:	00fa8b33          	add	s6,s5,a5
800069ba:	4401                	li	s0,0
800069bc:	8552                	mv	a0,s4
800069be:	e42fe0ef          	jal	ra,80005000 <safe_load_qword>
800069c2:	8caa                	mv	s9,a0
800069c4:	e919                	bnez	a0,800069da <MiCo_Q2x1_MatMul+0x158>
800069c6:	a881                	j	80006a16 <MiCo_Q2x1_MatMul+0x194>
800069c8:	40e007b3          	neg	a5,a4
800069cc:	fffc8713          	addi	a4,s9,-1
800069d0:	00ecfcb3          	and	s9,s9,a4
800069d4:	943e                	add	s0,s0,a5
800069d6:	040c8063          	beqz	s9,80006a16 <MiCo_Q2x1_MatMul+0x194>
800069da:	8566                	mv	a0,s9
800069dc:	1b5020ef          	jal	ra,80009390 <__ctzsi2>
800069e0:	9526                	add	a0,a0,s1
800069e2:	00255793          	srli	a5,a0,0x2
800069e6:	97ca                	add	a5,a5,s2
800069e8:	00078783          	lb	a5,0(a5)
800069ec:	890d                	andi	a0,a0,3
800069ee:	0506                	slli	a0,a0,0x1
800069f0:	40a7d7b3          	sra	a5,a5,a0
800069f4:	8b8d                	andi	a5,a5,3
800069f6:	ffd78713          	addi	a4,a5,-3
800069fa:	00173713          	seqz	a4,a4
800069fe:	fd3787e3          	beq	a5,s3,800069cc <MiCo_Q2x1_MatMul+0x14a>
80006a02:	fdb793e3          	bne	a5,s11,800069c8 <MiCo_Q2x1_MatMul+0x146>
80006a06:	fffc8713          	addi	a4,s9,-1
80006a0a:	57f9                	li	a5,-2
80006a0c:	00ecfcb3          	and	s9,s9,a4
80006a10:	943e                	add	s0,s0,a5
80006a12:	fc0c94e3          	bnez	s9,800069da <MiCo_Q2x1_MatMul+0x158>
80006a16:	0a11                	addi	s4,s4,4
80006a18:	02048493          	addi	s1,s1,32
80006a1c:	fb6a10e3          	bne	s4,s6,800069bc <MiCo_Q2x1_MatMul+0x13a>
80006a20:	47a2                	lw	a5,8(sp)
80006a22:	05a7f763          	bgeu	a5,s10,80006a70 <MiCo_Q2x1_MatMul+0x1ee>
80006a26:	0037d713          	srli	a4,a5,0x3
80006a2a:	0027d693          	srli	a3,a5,0x2
80006a2e:	9756                	add	a4,a4,s5
80006a30:	00d905b3          	add	a1,s2,a3
80006a34:	00070683          	lb	a3,0(a4)
80006a38:	0077f713          	andi	a4,a5,7
80006a3c:	0037f613          	andi	a2,a5,3
80006a40:	40e6d733          	sra	a4,a3,a4
80006a44:	8b05                	andi	a4,a4,1
80006a46:	0606                	slli	a2,a2,0x1
80006a48:	c30d                	beqz	a4,80006a6a <MiCo_Q2x1_MatMul+0x1e8>
80006a4a:	00058703          	lb	a4,0(a1)
80006a4e:	40c75633          	sra	a2,a4,a2
80006a52:	8a0d                	andi	a2,a2,3
80006a54:	ffd60713          	addi	a4,a2,-3
80006a58:	00173713          	seqz	a4,a4
80006a5c:	01360663          	beq	a2,s3,80006a68 <MiCo_Q2x1_MatMul+0x1e6>
80006a60:	05b60d63          	beq	a2,s11,80006aba <MiCo_Q2x1_MatMul+0x238>
80006a64:	40e00633          	neg	a2,a4
80006a68:	9432                	add	s0,s0,a2
80006a6a:	0785                	addi	a5,a5,1
80006a6c:	fafd1de3          	bne	s10,a5,80006a26 <MiCo_Q2x1_MatMul+0x1a4>
80006a70:	4742                	lw	a4,16(sp)
80006a72:	00141793          	slli	a5,s0,0x1
80006a76:	0c11                	addi	s8,s8,4
80006a78:	40f707b3          	sub	a5,a4,a5
80006a7c:	fefc2e23          	sw	a5,-4(s8)
80006a80:	47b2                	lw	a5,12(sp)
80006a82:	9bea                	add	s7,s7,s10
80006a84:	f0fc1fe3          	bne	s8,a5,800069a2 <MiCo_Q2x1_MatMul+0x120>
80006a88:	4772                	lw	a4,28(sp)
80006a8a:	5792                	lw	a5,36(sp)
80006a8c:	55b2                	lw	a1,44(sp)
80006a8e:	976a                	add	a4,a4,s10
80006a90:	ce3a                	sw	a4,28(sp)
80006a92:	5752                	lw	a4,52(sp)
80006a94:	0785                	addi	a5,a5,1
80006a96:	d23e                	sw	a5,36(sp)
80006a98:	e4f713e3          	bne	a4,a5,800068de <MiCo_Q2x1_MatMul+0x5c>
80006a9c:	50f6                	lw	ra,124(sp)
80006a9e:	5466                	lw	s0,120(sp)
80006aa0:	54d6                	lw	s1,116(sp)
80006aa2:	5946                	lw	s2,112(sp)
80006aa4:	59b6                	lw	s3,108(sp)
80006aa6:	5a26                	lw	s4,104(sp)
80006aa8:	5a96                	lw	s5,100(sp)
80006aaa:	5b06                	lw	s6,96(sp)
80006aac:	4bf6                	lw	s7,92(sp)
80006aae:	4c66                	lw	s8,88(sp)
80006ab0:	4cd6                	lw	s9,84(sp)
80006ab2:	4d46                	lw	s10,80(sp)
80006ab4:	4db6                	lw	s11,76(sp)
80006ab6:	6109                	addi	sp,sp,128
80006ab8:	8082                	ret
80006aba:	5679                	li	a2,-2
80006abc:	b775                	j	80006a68 <MiCo_Q2x1_MatMul+0x1e6>
80006abe:	4401                	li	s0,0
80006ac0:	b785                	j	80006a20 <MiCo_Q2x1_MatMul+0x19e>
80006ac2:	57a2                	lw	a5,40(sp)
80006ac4:	97ca                	add	a5,a5,s2
80006ac6:	00078783          	lb	a5,0(a5)
80006aca:	0037f713          	andi	a4,a5,3
80006ace:	01370963          	beq	a4,s3,80006ae0 <MiCo_Q2x1_MatMul+0x25e>
80006ad2:	07b70163          	beq	a4,s11,80006b34 <MiCo_Q2x1_MatMul+0x2b2>
80006ad6:	1775                	addi	a4,a4,-3
80006ad8:	00173713          	seqz	a4,a4
80006adc:	40e00733          	neg	a4,a4
80006ae0:	9b3a                	add	s6,s6,a4
80006ae2:	4762                	lw	a4,24(sp)
80006ae4:	e9370ee3          	beq	a4,s3,80006980 <MiCo_Q2x1_MatMul+0xfe>
80006ae8:	4027d713          	srai	a4,a5,0x2
80006aec:	8b0d                	andi	a4,a4,3
80006aee:	01370963          	beq	a4,s3,80006b00 <MiCo_Q2x1_MatMul+0x27e>
80006af2:	03b70f63          	beq	a4,s11,80006b30 <MiCo_Q2x1_MatMul+0x2ae>
80006af6:	1775                	addi	a4,a4,-3
80006af8:	00173713          	seqz	a4,a4
80006afc:	40e00733          	neg	a4,a4
80006b00:	9b3a                	add	s6,s6,a4
80006b02:	4762                	lw	a4,24(sp)
80006b04:	468d                	li	a3,3
80006b06:	e6d71de3          	bne	a4,a3,80006980 <MiCo_Q2x1_MatMul+0xfe>
80006b0a:	8791                	srai	a5,a5,0x4
80006b0c:	8b8d                	andi	a5,a5,3
80006b0e:	01378963          	beq	a5,s3,80006b20 <MiCo_Q2x1_MatMul+0x29e>
80006b12:	03b78363          	beq	a5,s11,80006b38 <MiCo_Q2x1_MatMul+0x2b6>
80006b16:	17f5                	addi	a5,a5,-3
80006b18:	0017b793          	seqz	a5,a5
80006b1c:	40f007b3          	neg	a5,a5
80006b20:	9b3e                	add	s6,s6,a5
80006b22:	5782                	lw	a5,32(sp)
80006b24:	e60791e3          	bnez	a5,80006986 <MiCo_Q2x1_MatMul+0x104>
80006b28:	d62e                	sw	a1,44(sp)
80006b2a:	bfb9                	j	80006a88 <MiCo_Q2x1_MatMul+0x206>
80006b2c:	4b01                	li	s6,0
80006b2e:	b5b1                	j	8000697a <MiCo_Q2x1_MatMul+0xf8>
80006b30:	5779                	li	a4,-2
80006b32:	b7f9                	j	80006b00 <MiCo_Q2x1_MatMul+0x27e>
80006b34:	5779                	li	a4,-2
80006b36:	b76d                	j	80006ae0 <MiCo_Q2x1_MatMul+0x25e>
80006b38:	57f9                	li	a5,-2
80006b3a:	9b3e                	add	s6,s6,a5
80006b3c:	b7dd                	j	80006b22 <MiCo_Q2x1_MatMul+0x2a0>

80006b3e <MiCo_Q1_MatMul>:
80006b3e:	7159                	addi	sp,sp,-112
80006b40:	d0ca                	sw	s2,96(sp)
80006b42:	0045a903          	lw	s2,4(a1)
80006b46:	4214                	lw	a3,0(a2)
80006b48:	87ae                	mv	a5,a1
80006b4a:	418c                	lw	a1,0(a1)
80006b4c:	8732                	mv	a4,a2
80006b4e:	00595613          	srli	a2,s2,0x5
80006b52:	d686                	sw	ra,108(sp)
80006b54:	d4a2                	sw	s0,104(sp)
80006b56:	d2a6                	sw	s1,100(sp)
80006b58:	cece                	sw	s3,92(sp)
80006b5a:	ccd2                	sw	s4,88(sp)
80006b5c:	cad6                	sw	s5,84(sp)
80006b5e:	c8da                	sw	s6,80(sp)
80006b60:	c6de                	sw	s7,76(sp)
80006b62:	c4e2                	sw	s8,72(sp)
80006b64:	c2e6                	sw	s9,68(sp)
80006b66:	c0ea                	sw	s10,64(sp)
80006b68:	de6e                	sw	s11,60(sp)
80006b6a:	d02e                	sw	a1,32(sp)
80006b6c:	d236                	sw	a3,36(sp)
80006b6e:	d62a                	sw	a0,44(sp)
80006b70:	c432                	sw	a2,8(sp)
80006b72:	cdf1                	beqz	a1,80006c4e <MiCo_Q1_MatMul+0x110>
80006b74:	fe097b93          	andi	s7,s2,-32
80006b78:	caf9                	beqz	a3,80006c4e <MiCo_Q1_MatMul+0x110>
80006b7a:	479c                	lw	a5,8(a5)
80006b7c:	068a                	slli	a3,a3,0x2
80006b7e:	d436                	sw	a3,40(sp)
80006b80:	cc3e                	sw	a5,24(sp)
80006b82:	471c                	lw	a5,8(a4)
80006b84:	00d50c33          	add	s8,a0,a3
80006b88:	c802                	sw	zero,16(sp)
80006b8a:	c23e                	sw	a5,4(sp)
80006b8c:	00261793          	slli	a5,a2,0x2
80006b90:	ce3e                	sw	a5,28(sp)
80006b92:	c602                	sw	zero,12(sp)
80006b94:	ca02                	sw	zero,20(sp)
80006b96:	47b2                	lw	a5,12(sp)
80006b98:	4b01                	li	s6,0
80006b9a:	0037d993          	srli	s3,a5,0x3
80006b9e:	47e2                	lw	a5,24(sp)
80006ba0:	99be                	add	s3,s3,a5
80006ba2:	47c2                	lw	a5,16(sp)
80006ba4:	00279a93          	slli	s5,a5,0x2
80006ba8:	57b2                	lw	a5,44(sp)
80006baa:	9abe                	add	s5,s5,a5
80006bac:	47f2                	lw	a5,28(sp)
80006bae:	01378a33          	add	s4,a5,s3
80006bb2:	4792                	lw	a5,4(sp)
80006bb4:	003b5493          	srli	s1,s6,0x3
80006bb8:	94be                	add	s1,s1,a5
80006bba:	47a2                	lw	a5,8(sp)
80006bbc:	cbf9                	beqz	a5,80006c92 <MiCo_Q1_MatMul+0x154>
80006bbe:	8426                	mv	s0,s1
80006bc0:	8d4e                	mv	s10,s3
80006bc2:	4d81                	li	s11,0
80006bc4:	856a                	mv	a0,s10
80006bc6:	c3afe0ef          	jal	ra,80005000 <safe_load_qword>
80006bca:	8caa                	mv	s9,a0
80006bcc:	8522                	mv	a0,s0
80006bce:	c32fe0ef          	jal	ra,80005000 <safe_load_qword>
80006bd2:	00acc533          	xor	a0,s9,a0
80006bd6:	fff54513          	not	a0,a0
80006bda:	be2fe0ef          	jal	ra,80004fbc <software_popcount>
80006bde:	1541                	addi	a0,a0,-16
80006be0:	0506                	slli	a0,a0,0x1
80006be2:	0d11                	addi	s10,s10,4
80006be4:	9daa                	add	s11,s11,a0
80006be6:	0411                	addi	s0,s0,4
80006be8:	fdaa1ee3          	bne	s4,s10,80006bc4 <MiCo_Q1_MatMul+0x86>
80006bec:	032bfc63          	bgeu	s7,s2,80006c24 <MiCo_Q1_MatMul+0xe6>
80006bf0:	86de                	mv	a3,s7
80006bf2:	0036d593          	srli	a1,a3,0x3
80006bf6:	00b487b3          	add	a5,s1,a1
80006bfa:	00078703          	lb	a4,0(a5)
80006bfe:	0076f513          	andi	a0,a3,7
80006c02:	587d                	li	a6,-1
80006c04:	40a75733          	sra	a4,a4,a0
80006c08:	8b05                	andi	a4,a4,1
80006c0a:	e349                	bnez	a4,80006c8c <MiCo_Q1_MatMul+0x14e>
80006c0c:	4705                	li	a4,1
80006c0e:	95ce                	add	a1,a1,s3
80006c10:	00058783          	lb	a5,0(a1)
80006c14:	0685                	addi	a3,a3,1
80006c16:	40a7d7b3          	sra	a5,a5,a0
80006c1a:	8b85                	andi	a5,a5,1
80006c1c:	cba1                	beqz	a5,80006c6c <MiCo_Q1_MatMul+0x12e>
80006c1e:	9dc2                	add	s11,s11,a6
80006c20:	fcd919e3          	bne	s2,a3,80006bf2 <MiCo_Q1_MatMul+0xb4>
80006c24:	01baa023          	sw	s11,0(s5)
80006c28:	0a91                	addi	s5,s5,4
80006c2a:	9b4a                	add	s6,s6,s2
80006c2c:	f95c13e3          	bne	s8,s5,80006bb2 <MiCo_Q1_MatMul+0x74>
80006c30:	4732                	lw	a4,12(sp)
80006c32:	5692                	lw	a3,36(sp)
80006c34:	47d2                	lw	a5,20(sp)
80006c36:	974a                	add	a4,a4,s2
80006c38:	c63a                	sw	a4,12(sp)
80006c3a:	4742                	lw	a4,16(sp)
80006c3c:	0785                	addi	a5,a5,1
80006c3e:	ca3e                	sw	a5,20(sp)
80006c40:	9736                	add	a4,a4,a3
80006c42:	c83a                	sw	a4,16(sp)
80006c44:	5722                	lw	a4,40(sp)
80006c46:	9c3a                	add	s8,s8,a4
80006c48:	5702                	lw	a4,32(sp)
80006c4a:	f4f716e3          	bne	a4,a5,80006b96 <MiCo_Q1_MatMul+0x58>
80006c4e:	50b6                	lw	ra,108(sp)
80006c50:	5426                	lw	s0,104(sp)
80006c52:	5496                	lw	s1,100(sp)
80006c54:	5906                	lw	s2,96(sp)
80006c56:	49f6                	lw	s3,92(sp)
80006c58:	4a66                	lw	s4,88(sp)
80006c5a:	4ad6                	lw	s5,84(sp)
80006c5c:	4b46                	lw	s6,80(sp)
80006c5e:	4bb6                	lw	s7,76(sp)
80006c60:	4c26                	lw	s8,72(sp)
80006c62:	4c96                	lw	s9,68(sp)
80006c64:	4d06                	lw	s10,64(sp)
80006c66:	5df2                	lw	s11,60(sp)
80006c68:	6165                	addi	sp,sp,112
80006c6a:	8082                	ret
80006c6c:	9dba                	add	s11,s11,a4
80006c6e:	fad90be3          	beq	s2,a3,80006c24 <MiCo_Q1_MatMul+0xe6>
80006c72:	0036d593          	srli	a1,a3,0x3
80006c76:	00b487b3          	add	a5,s1,a1
80006c7a:	00078703          	lb	a4,0(a5)
80006c7e:	0076f513          	andi	a0,a3,7
80006c82:	587d                	li	a6,-1
80006c84:	40a75733          	sra	a4,a4,a0
80006c88:	8b05                	andi	a4,a4,1
80006c8a:	d349                	beqz	a4,80006c0c <MiCo_Q1_MatMul+0xce>
80006c8c:	4805                	li	a6,1
80006c8e:	577d                	li	a4,-1
80006c90:	bfbd                	j	80006c0e <MiCo_Q1_MatMul+0xd0>
80006c92:	4d81                	li	s11,0
80006c94:	bfa1                	j	80006bec <MiCo_Q1_MatMul+0xae>

80006c96 <MiCo_Q4x8_MatMul>:
80006c96:	7139                	addi	sp,sp,-64
80006c98:	cc66                	sw	s9,24(sp)
80006c9a:	0005ac83          	lw	s9,0(a1)
80006c9e:	d456                	sw	s5,40(sp)
80006ca0:	de22                	sw	s0,60(sp)
80006ca2:	dc26                	sw	s1,56(sp)
80006ca4:	da4a                	sw	s2,52(sp)
80006ca6:	d84e                	sw	s3,48(sp)
80006ca8:	d652                	sw	s4,44(sp)
80006caa:	d25a                	sw	s6,36(sp)
80006cac:	d05e                	sw	s7,32(sp)
80006cae:	ce62                	sw	s8,28(sp)
80006cb0:	ca6a                	sw	s10,20(sp)
80006cb2:	c86e                	sw	s11,16(sp)
80006cb4:	0045aa83          	lw	s5,4(a1)
80006cb8:	421c                	lw	a5,0(a2)
80006cba:	120c8863          	beqz	s9,80006dea <MiCo_Q4x8_MatMul+0x154>
80006cbe:	12078663          	beqz	a5,80006dea <MiCo_Q4x8_MatMul+0x154>
80006cc2:	4598                	lw	a4,8(a1)
80006cc4:	86b2                	mv	a3,a2
80006cc6:	40f00633          	neg	a2,a5
80006cca:	c03a                	sw	a4,0(sp)
80006ccc:	078a                	slli	a5,a5,0x2
80006cce:	4698                	lw	a4,8(a3)
80006cd0:	00f50bb3          	add	s7,a0,a5
80006cd4:	00261793          	slli	a5,a2,0x2
80006cd8:	c43e                	sw	a5,8(sp)
80006cda:	00361793          	slli	a5,a2,0x3
80006cde:	ff8afa13          	andi	s4,s5,-8
80006ce2:	c23a                	sw	a4,4(sp)
80006ce4:	4d01                	li	s10,0
80006ce6:	4c01                	li	s8,0
80006ce8:	c63e                	sw	a5,12(sp)
80006cea:	47a2                	lw	a5,8(sp)
80006cec:	4992                	lw	s3,4(sp)
80006cee:	001d5f13          	srli	t5,s10,0x1
80006cf2:	01778db3          	add	s11,a5,s7
80006cf6:	4782                	lw	a5,0(sp)
80006cf8:	8b6e                	mv	s6,s11
80006cfa:	9f3e                	add	t5,t5,a5
80006cfc:	100a0563          	beqz	s4,80006e06 <MiCo_Q4x8_MatMul+0x170>
80006d00:	874e                	mv	a4,s3
80006d02:	4881                	li	a7,0
80006d04:	4781                	li	a5,0
80006d06:	0018d693          	srli	a3,a7,0x1
80006d0a:	96fa                	add	a3,a3,t5
80006d0c:	00068503          	lb	a0,0(a3)
80006d10:	00070603          	lb	a2,0(a4)
80006d14:	00170e03          	lb	t3,1(a4)
80006d18:	01c51293          	slli	t0,a0,0x1c
80006d1c:	41c2d293          	srai	t0,t0,0x1c
80006d20:	02c282b3          	mul	t0,t0,a2
80006d24:	8511                	srai	a0,a0,0x4
80006d26:	00168583          	lb	a1,1(a3)
80006d2a:	00268803          	lb	a6,2(a3)
80006d2e:	00270903          	lb	s2,2(a4)
80006d32:	00370483          	lb	s1,3(a4)
80006d36:	01c59e93          	slli	t4,a1,0x1c
80006d3a:	00368303          	lb	t1,3(a3)
80006d3e:	00470403          	lb	s0,4(a4)
80006d42:	41cede93          	srai	t4,t4,0x1c
80006d46:	03c50533          	mul	a0,a0,t3
80006d4a:	00570383          	lb	t2,5(a4)
80006d4e:	01c81613          	slli	a2,a6,0x1c
80006d52:	8591                	srai	a1,a1,0x4
80006d54:	00670f83          	lb	t6,6(a4)
80006d58:	8671                	srai	a2,a2,0x1c
80006d5a:	00770e03          	lb	t3,7(a4)
80006d5e:	40485693          	srai	a3,a6,0x4
80006d62:	01c31813          	slli	a6,t1,0x1c
80006d66:	9796                	add	a5,a5,t0
80006d68:	032e8eb3          	mul	t4,t4,s2
80006d6c:	41c85813          	srai	a6,a6,0x1c
80006d70:	953e                	add	a0,a0,a5
80006d72:	40435313          	srai	t1,t1,0x4
80006d76:	08a1                	addi	a7,a7,8
80006d78:	0721                	addi	a4,a4,8
80006d7a:	029585b3          	mul	a1,a1,s1
80006d7e:	9576                	add	a0,a0,t4
80006d80:	02860633          	mul	a2,a2,s0
80006d84:	95aa                	add	a1,a1,a0
80006d86:	027686b3          	mul	a3,a3,t2
80006d8a:	962e                	add	a2,a2,a1
80006d8c:	03f807b3          	mul	a5,a6,t6
80006d90:	96b2                	add	a3,a3,a2
80006d92:	03c30333          	mul	t1,t1,t3
80006d96:	97b6                	add	a5,a5,a3
80006d98:	979a                	add	a5,a5,t1
80006d9a:	f748e6e3          	bltu	a7,s4,80006d06 <MiCo_Q4x8_MatMul+0x70>
80006d9e:	035a7963          	bgeu	s4,s5,80006dd0 <MiCo_Q4x8_MatMul+0x13a>
80006da2:	86d2                	mv	a3,s4
80006da4:	0016d713          	srli	a4,a3,0x1
80006da8:	977a                	add	a4,a4,t5
80006daa:	00070703          	lb	a4,0(a4)
80006dae:	0016f593          	andi	a1,a3,1
80006db2:	00d98633          	add	a2,s3,a3
80006db6:	058a                	slli	a1,a1,0x2
80006db8:	00060603          	lb	a2,0(a2)
80006dbc:	40b75733          	sra	a4,a4,a1
80006dc0:	0772                	slli	a4,a4,0x1c
80006dc2:	8771                	srai	a4,a4,0x1c
80006dc4:	02e60733          	mul	a4,a2,a4
80006dc8:	0685                	addi	a3,a3,1
80006dca:	97ba                	add	a5,a5,a4
80006dcc:	fcda9ce3          	bne	s5,a3,80006da4 <MiCo_Q4x8_MatMul+0x10e>
80006dd0:	00fb2023          	sw	a5,0(s6)
80006dd4:	0b11                	addi	s6,s6,4
80006dd6:	99d6                	add	s3,s3,s5
80006dd8:	f36b92e3          	bne	s7,s6,80006cfc <MiCo_Q4x8_MatMul+0x66>
80006ddc:	47b2                	lw	a5,12(sp)
80006dde:	0c05                	addi	s8,s8,1
80006de0:	9d56                	add	s10,s10,s5
80006de2:	40fd8bb3          	sub	s7,s11,a5
80006de6:	f18c92e3          	bne	s9,s8,80006cea <MiCo_Q4x8_MatMul+0x54>
80006dea:	5472                	lw	s0,60(sp)
80006dec:	54e2                	lw	s1,56(sp)
80006dee:	5952                	lw	s2,52(sp)
80006df0:	59c2                	lw	s3,48(sp)
80006df2:	5a32                	lw	s4,44(sp)
80006df4:	5aa2                	lw	s5,40(sp)
80006df6:	5b12                	lw	s6,36(sp)
80006df8:	5b82                	lw	s7,32(sp)
80006dfa:	4c72                	lw	s8,28(sp)
80006dfc:	4ce2                	lw	s9,24(sp)
80006dfe:	4d52                	lw	s10,20(sp)
80006e00:	4dc2                	lw	s11,16(sp)
80006e02:	6121                	addi	sp,sp,64
80006e04:	8082                	ret
80006e06:	4781                	li	a5,0
80006e08:	bf59                	j	80006d9e <MiCo_Q4x8_MatMul+0x108>

80006e0a <MiCo_Q2x8_MatMul>:
80006e0a:	7179                	addi	sp,sp,-48
80006e0c:	d426                	sw	s1,40(sp)
80006e0e:	4184                	lw	s1,0(a1)
80006e10:	d622                	sw	s0,44(sp)
80006e12:	d24a                	sw	s2,36(sp)
80006e14:	d04e                	sw	s3,32(sp)
80006e16:	ce52                	sw	s4,28(sp)
80006e18:	cc56                	sw	s5,24(sp)
80006e1a:	ca5a                	sw	s6,20(sp)
80006e1c:	c85e                	sw	s7,16(sp)
80006e1e:	c662                	sw	s8,12(sp)
80006e20:	c466                	sw	s9,8(sp)
80006e22:	c26a                	sw	s10,4(sp)
80006e24:	c06e                	sw	s11,0(sp)
80006e26:	0045ae03          	lw	t3,4(a1)
80006e2a:	421c                	lw	a5,0(a2)
80006e2c:	32048763          	beqz	s1,8000715a <MiCo_Q2x8_MatMul+0x350>
80006e30:	32078563          	beqz	a5,8000715a <MiCo_Q2x8_MatMul+0x350>
80006e34:	00862983          	lw	s3,8(a2)
80006e38:	40f00433          	neg	s0,a5
80006e3c:	078a                	slli	a5,a5,0x2
80006e3e:	0085aa03          	lw	s4,8(a1)
80006e42:	00241913          	slli	s2,s0,0x2
80006e46:	ff0e7313          	andi	t1,t3,-16
80006e4a:	00f50f33          	add	t5,a0,a5
80006e4e:	4281                	li	t0,0
80006e50:	4f81                	li	t6,0
80006e52:	4705                	li	a4,1
80006e54:	4589                	li	a1,2
80006e56:	040e                	slli	s0,s0,0x3
80006e58:	0022d813          	srli	a6,t0,0x2
80006e5c:	012f03b3          	add	t2,t5,s2
80006e60:	9852                	add	a6,a6,s4
80006e62:	88ce                	mv	a7,s3
80006e64:	8e9e                	mv	t4,t2
80006e66:	30030863          	beqz	t1,80007176 <MiCo_Q2x8_MatMul+0x36c>
80006e6a:	87c6                	mv	a5,a7
80006e6c:	4501                	li	a0,0
80006e6e:	4b81                	li	s7,0
80006e70:	00255693          	srli	a3,a0,0x2
80006e74:	96c2                	add	a3,a3,a6
80006e76:	00068b03          	lb	s6,0(a3)
80006e7a:	00168a83          	lb	s5,1(a3)
80006e7e:	00268603          	lb	a2,2(a3)
80006e82:	003b7c13          	andi	s8,s6,3
80006e86:	00368683          	lb	a3,3(a3)
80006e8a:	4c85                	li	s9,1
80006e8c:	00ec0a63          	beq	s8,a4,80006ea0 <MiCo_Q2x8_MatMul+0x96>
80006e90:	5cf9                	li	s9,-2
80006e92:	00bc0763          	beq	s8,a1,80006ea0 <MiCo_Q2x8_MatMul+0x96>
80006e96:	1c75                	addi	s8,s8,-3
80006e98:	001c3c13          	seqz	s8,s8
80006e9c:	41800cb3          	neg	s9,s8
80006ea0:	00078d03          	lb	s10,0(a5)
80006ea4:	402b5c13          	srai	s8,s6,0x2
80006ea8:	003c7c13          	andi	s8,s8,3
80006eac:	039d0d33          	mul	s10,s10,s9
80006eb0:	4c85                	li	s9,1
80006eb2:	9bea                	add	s7,s7,s10
80006eb4:	00ec0a63          	beq	s8,a4,80006ec8 <MiCo_Q2x8_MatMul+0xbe>
80006eb8:	5cf9                	li	s9,-2
80006eba:	00bc0763          	beq	s8,a1,80006ec8 <MiCo_Q2x8_MatMul+0xbe>
80006ebe:	1c75                	addi	s8,s8,-3
80006ec0:	001c3c13          	seqz	s8,s8
80006ec4:	41800cb3          	neg	s9,s8
80006ec8:	00178d03          	lb	s10,1(a5)
80006ecc:	404b5c13          	srai	s8,s6,0x4
80006ed0:	003c7c13          	andi	s8,s8,3
80006ed4:	039d0d33          	mul	s10,s10,s9
80006ed8:	4c85                	li	s9,1
80006eda:	9bea                	add	s7,s7,s10
80006edc:	00ec0a63          	beq	s8,a4,80006ef0 <MiCo_Q2x8_MatMul+0xe6>
80006ee0:	5cf9                	li	s9,-2
80006ee2:	00bc0763          	beq	s8,a1,80006ef0 <MiCo_Q2x8_MatMul+0xe6>
80006ee6:	1c75                	addi	s8,s8,-3
80006ee8:	001c3c13          	seqz	s8,s8
80006eec:	41800cb3          	neg	s9,s8
80006ef0:	00278c03          	lb	s8,2(a5)
80006ef4:	0ffb7b13          	andi	s6,s6,255
80006ef8:	006b5b13          	srli	s6,s6,0x6
80006efc:	039c0c33          	mul	s8,s8,s9
80006f00:	4d85                	li	s11,1
80006f02:	9be2                	add	s7,s7,s8
80006f04:	00eb0a63          	beq	s6,a4,80006f18 <MiCo_Q2x8_MatMul+0x10e>
80006f08:	5df9                	li	s11,-2
80006f0a:	00bb0763          	beq	s6,a1,80006f18 <MiCo_Q2x8_MatMul+0x10e>
80006f0e:	1b75                	addi	s6,s6,-3
80006f10:	001b3b13          	seqz	s6,s6
80006f14:	41600db3          	neg	s11,s6
80006f18:	00378c83          	lb	s9,3(a5)
80006f1c:	003afb13          	andi	s6,s5,3
80006f20:	4d05                	li	s10,1
80006f22:	03bc8cb3          	mul	s9,s9,s11
80006f26:	9be6                	add	s7,s7,s9
80006f28:	00eb0a63          	beq	s6,a4,80006f3c <MiCo_Q2x8_MatMul+0x132>
80006f2c:	5d79                	li	s10,-2
80006f2e:	00bb0763          	beq	s6,a1,80006f3c <MiCo_Q2x8_MatMul+0x132>
80006f32:	1b75                	addi	s6,s6,-3
80006f34:	001b3b13          	seqz	s6,s6
80006f38:	41600d33          	neg	s10,s6
80006f3c:	00478c83          	lb	s9,4(a5)
80006f40:	402adb13          	srai	s6,s5,0x2
80006f44:	003b7b13          	andi	s6,s6,3
80006f48:	03ac8cb3          	mul	s9,s9,s10
80006f4c:	4d05                	li	s10,1
80006f4e:	9be6                	add	s7,s7,s9
80006f50:	00eb0a63          	beq	s6,a4,80006f64 <MiCo_Q2x8_MatMul+0x15a>
80006f54:	5d79                	li	s10,-2
80006f56:	00bb0763          	beq	s6,a1,80006f64 <MiCo_Q2x8_MatMul+0x15a>
80006f5a:	1b75                	addi	s6,s6,-3
80006f5c:	001b3b13          	seqz	s6,s6
80006f60:	41600d33          	neg	s10,s6
80006f64:	00578c03          	lb	s8,5(a5)
80006f68:	404adb13          	srai	s6,s5,0x4
80006f6c:	003b7b13          	andi	s6,s6,3
80006f70:	03ac0c33          	mul	s8,s8,s10
80006f74:	4d05                	li	s10,1
80006f76:	017c0cb3          	add	s9,s8,s7
80006f7a:	00eb0a63          	beq	s6,a4,80006f8e <MiCo_Q2x8_MatMul+0x184>
80006f7e:	5d79                	li	s10,-2
80006f80:	00bb0763          	beq	s6,a1,80006f8e <MiCo_Q2x8_MatMul+0x184>
80006f84:	1b75                	addi	s6,s6,-3
80006f86:	001b3b13          	seqz	s6,s6
80006f8a:	41600d33          	neg	s10,s6
80006f8e:	00678c03          	lb	s8,6(a5)
80006f92:	0ffafa93          	andi	s5,s5,255
80006f96:	006ada93          	srli	s5,s5,0x6
80006f9a:	03ac0c33          	mul	s8,s8,s10
80006f9e:	4b85                	li	s7,1
80006fa0:	9c66                	add	s8,s8,s9
80006fa2:	00ea8a63          	beq	s5,a4,80006fb6 <MiCo_Q2x8_MatMul+0x1ac>
80006fa6:	5bf9                	li	s7,-2
80006fa8:	00ba8763          	beq	s5,a1,80006fb6 <MiCo_Q2x8_MatMul+0x1ac>
80006fac:	1af5                	addi	s5,s5,-3
80006fae:	001aba93          	seqz	s5,s5
80006fb2:	41500bb3          	neg	s7,s5
80006fb6:	00778a83          	lb	s5,7(a5)
80006fba:	00367b13          	andi	s6,a2,3
80006fbe:	4c85                	li	s9,1
80006fc0:	037a8ab3          	mul	s5,s5,s7
80006fc4:	9ae2                	add	s5,s5,s8
80006fc6:	00eb0a63          	beq	s6,a4,80006fda <MiCo_Q2x8_MatMul+0x1d0>
80006fca:	5cf9                	li	s9,-2
80006fcc:	00bb0763          	beq	s6,a1,80006fda <MiCo_Q2x8_MatMul+0x1d0>
80006fd0:	1b75                	addi	s6,s6,-3
80006fd2:	001b3b13          	seqz	s6,s6
80006fd6:	41600cb3          	neg	s9,s6
80006fda:	00878b83          	lb	s7,8(a5)
80006fde:	40265b13          	srai	s6,a2,0x2
80006fe2:	003b7b13          	andi	s6,s6,3
80006fe6:	039b8bb3          	mul	s7,s7,s9
80006fea:	4c05                	li	s8,1
80006fec:	9bd6                	add	s7,s7,s5
80006fee:	00eb0a63          	beq	s6,a4,80007002 <MiCo_Q2x8_MatMul+0x1f8>
80006ff2:	5c79                	li	s8,-2
80006ff4:	00bb0763          	beq	s6,a1,80007002 <MiCo_Q2x8_MatMul+0x1f8>
80006ff8:	1b75                	addi	s6,s6,-3
80006ffa:	001b3b13          	seqz	s6,s6
80006ffe:	41600c33          	neg	s8,s6
80007002:	00978b03          	lb	s6,9(a5)
80007006:	40465a93          	srai	s5,a2,0x4
8000700a:	003afa93          	andi	s5,s5,3
8000700e:	038b0b33          	mul	s6,s6,s8
80007012:	4c05                	li	s8,1
80007014:	9b5e                	add	s6,s6,s7
80007016:	00ea8a63          	beq	s5,a4,8000702a <MiCo_Q2x8_MatMul+0x220>
8000701a:	5c79                	li	s8,-2
8000701c:	00ba8763          	beq	s5,a1,8000702a <MiCo_Q2x8_MatMul+0x220>
80007020:	1af5                	addi	s5,s5,-3
80007022:	001aba93          	seqz	s5,s5
80007026:	41500c33          	neg	s8,s5
8000702a:	00a78a83          	lb	s5,10(a5)
8000702e:	0ff67613          	andi	a2,a2,255
80007032:	8219                	srli	a2,a2,0x6
80007034:	038a8ab3          	mul	s5,s5,s8
80007038:	4d05                	li	s10,1
8000703a:	9ada                	add	s5,s5,s6
8000703c:	00e60a63          	beq	a2,a4,80007050 <MiCo_Q2x8_MatMul+0x246>
80007040:	5d79                	li	s10,-2
80007042:	00b60763          	beq	a2,a1,80007050 <MiCo_Q2x8_MatMul+0x246>
80007046:	1675                	addi	a2,a2,-3
80007048:	00163613          	seqz	a2,a2
8000704c:	40c00d33          	neg	s10,a2
80007050:	00b78b83          	lb	s7,11(a5)
80007054:	0036fc13          	andi	s8,a3,3
80007058:	4c85                	li	s9,1
8000705a:	03ab8bb3          	mul	s7,s7,s10
8000705e:	9bd6                	add	s7,s7,s5
80007060:	00ec0a63          	beq	s8,a4,80007074 <MiCo_Q2x8_MatMul+0x26a>
80007064:	5cf9                	li	s9,-2
80007066:	00bc0763          	beq	s8,a1,80007074 <MiCo_Q2x8_MatMul+0x26a>
8000706a:	1c75                	addi	s8,s8,-3
8000706c:	001c3c13          	seqz	s8,s8
80007070:	41800cb3          	neg	s9,s8
80007074:	00c78b03          	lb	s6,12(a5)
80007078:	4026da93          	srai	s5,a3,0x2
8000707c:	003afa93          	andi	s5,s5,3
80007080:	039b0b33          	mul	s6,s6,s9
80007084:	4c05                	li	s8,1
80007086:	9b5e                	add	s6,s6,s7
80007088:	00ea8a63          	beq	s5,a4,8000709c <MiCo_Q2x8_MatMul+0x292>
8000708c:	5c79                	li	s8,-2
8000708e:	00ba8763          	beq	s5,a1,8000709c <MiCo_Q2x8_MatMul+0x292>
80007092:	1af5                	addi	s5,s5,-3
80007094:	001aba93          	seqz	s5,s5
80007098:	41500c33          	neg	s8,s5
8000709c:	00d78b83          	lb	s7,13(a5)
800070a0:	4046d613          	srai	a2,a3,0x4
800070a4:	8a0d                	andi	a2,a2,3
800070a6:	038b8bb3          	mul	s7,s7,s8
800070aa:	4a85                	li	s5,1
800070ac:	9bda                	add	s7,s7,s6
800070ae:	00e60a63          	beq	a2,a4,800070c2 <MiCo_Q2x8_MatMul+0x2b8>
800070b2:	5af9                	li	s5,-2
800070b4:	00b60763          	beq	a2,a1,800070c2 <MiCo_Q2x8_MatMul+0x2b8>
800070b8:	1675                	addi	a2,a2,-3
800070ba:	00163613          	seqz	a2,a2
800070be:	40c00ab3          	neg	s5,a2
800070c2:	00e78603          	lb	a2,14(a5)
800070c6:	0ff6f693          	andi	a3,a3,255
800070ca:	8299                	srli	a3,a3,0x6
800070cc:	03560633          	mul	a2,a2,s5
800070d0:	4a85                	li	s5,1
800070d2:	965e                	add	a2,a2,s7
800070d4:	00e68a63          	beq	a3,a4,800070e8 <MiCo_Q2x8_MatMul+0x2de>
800070d8:	5af9                	li	s5,-2
800070da:	00b68763          	beq	a3,a1,800070e8 <MiCo_Q2x8_MatMul+0x2de>
800070de:	16f5                	addi	a3,a3,-3
800070e0:	0016b693          	seqz	a3,a3
800070e4:	40d00ab3          	neg	s5,a3
800070e8:	00f78b83          	lb	s7,15(a5)
800070ec:	0541                	addi	a0,a0,16
800070ee:	07c1                	addi	a5,a5,16
800070f0:	035b8bb3          	mul	s7,s7,s5
800070f4:	9bb2                	add	s7,s7,a2
800070f6:	d6656de3          	bltu	a0,t1,80006e70 <MiCo_Q2x8_MatMul+0x66>
800070fa:	05c37463          	bgeu	t1,t3,80007142 <MiCo_Q2x8_MatMul+0x338>
800070fe:	869a                	mv	a3,t1
80007100:	0026d793          	srli	a5,a3,0x2
80007104:	97c2                	add	a5,a5,a6
80007106:	00078783          	lb	a5,0(a5)
8000710a:	0036f613          	andi	a2,a3,3
8000710e:	0606                	slli	a2,a2,0x1
80007110:	40c7d7b3          	sra	a5,a5,a2
80007114:	8b8d                	andi	a5,a5,3
80007116:	ffd78613          	addi	a2,a5,-3
8000711a:	00d88533          	add	a0,a7,a3
8000711e:	00163613          	seqz	a2,a2
80007122:	0685                	addi	a3,a3,1
80007124:	4a85                	li	s5,1
80007126:	00e78763          	beq	a5,a4,80007134 <MiCo_Q2x8_MatMul+0x32a>
8000712a:	5af9                	li	s5,-2
8000712c:	00b78463          	beq	a5,a1,80007134 <MiCo_Q2x8_MatMul+0x32a>
80007130:	40c00ab3          	neg	s5,a2
80007134:	00050783          	lb	a5,0(a0)
80007138:	035787b3          	mul	a5,a5,s5
8000713c:	9bbe                	add	s7,s7,a5
8000713e:	fcde11e3          	bne	t3,a3,80007100 <MiCo_Q2x8_MatMul+0x2f6>
80007142:	017ea023          	sw	s7,0(t4)
80007146:	0e91                	addi	t4,t4,4
80007148:	98f2                	add	a7,a7,t3
8000714a:	d1df1ee3          	bne	t5,t4,80006e66 <MiCo_Q2x8_MatMul+0x5c>
8000714e:	0f85                	addi	t6,t6,1
80007150:	92f2                	add	t0,t0,t3
80007152:	40838f33          	sub	t5,t2,s0
80007156:	d1f491e3          	bne	s1,t6,80006e58 <MiCo_Q2x8_MatMul+0x4e>
8000715a:	5432                	lw	s0,44(sp)
8000715c:	54a2                	lw	s1,40(sp)
8000715e:	5912                	lw	s2,36(sp)
80007160:	5982                	lw	s3,32(sp)
80007162:	4a72                	lw	s4,28(sp)
80007164:	4ae2                	lw	s5,24(sp)
80007166:	4b52                	lw	s6,20(sp)
80007168:	4bc2                	lw	s7,16(sp)
8000716a:	4c32                	lw	s8,12(sp)
8000716c:	4ca2                	lw	s9,8(sp)
8000716e:	4d12                	lw	s10,4(sp)
80007170:	4d82                	lw	s11,0(sp)
80007172:	6145                	addi	sp,sp,48
80007174:	8082                	ret
80007176:	4b81                	li	s7,0
80007178:	b749                	j	800070fa <MiCo_Q2x8_MatMul+0x2f0>

8000717a <MiCo_Q1x8_MatMul>:
8000717a:	7175                	addi	sp,sp,-144
8000717c:	d8da                	sw	s6,112(sp)
8000717e:	0045ab03          	lw	s6,4(a1)
80007182:	4194                	lw	a3,0(a1)
80007184:	8732                	mv	a4,a2
80007186:	4210                	lw	a2,0(a2)
80007188:	87ae                	mv	a5,a1
8000718a:	005b5593          	srli	a1,s6,0x5
8000718e:	c706                	sw	ra,140(sp)
80007190:	c522                	sw	s0,136(sp)
80007192:	c326                	sw	s1,132(sp)
80007194:	c14a                	sw	s2,128(sp)
80007196:	dece                	sw	s3,124(sp)
80007198:	dcd2                	sw	s4,120(sp)
8000719a:	dad6                	sw	s5,116(sp)
8000719c:	d6de                	sw	s7,108(sp)
8000719e:	d4e2                	sw	s8,104(sp)
800071a0:	d2e6                	sw	s9,100(sp)
800071a2:	d0ea                	sw	s10,96(sp)
800071a4:	ceee                	sw	s11,92(sp)
800071a6:	de36                	sw	a3,60(sp)
800071a8:	c0b2                	sw	a2,64(sp)
800071aa:	c6aa                	sw	a0,76(sp)
800071ac:	ce2e                	sw	a1,28(sp)
800071ae:	1a068b63          	beqz	a3,80007364 <MiCo_Q1x8_MatMul+0x1ea>
800071b2:	479c                	lw	a5,8(a5)
800071b4:	dc3e                	sw	a5,56(sp)
800071b6:	fe0b7793          	andi	a5,s6,-32
800071ba:	d03e                	sw	a5,32(sp)
800071bc:	1a060463          	beqz	a2,80007364 <MiCo_Q1x8_MatMul+0x1ea>
800071c0:	471c                	lw	a5,8(a4)
800071c2:	d802                	sw	zero,48(sp)
800071c4:	d402                	sw	zero,40(sp)
800071c6:	c2be                	sw	a5,68(sp)
800071c8:	00259793          	slli	a5,a1,0x2
800071cc:	c4be                	sw	a5,72(sp)
800071ce:	d602                	sw	zero,44(sp)
800071d0:	da02                	sw	zero,52(sp)
800071d2:	5742                	lw	a4,48(sp)
800071d4:	4686                	lw	a3,64(sp)
800071d6:	57a2                	lw	a5,40(sp)
800071d8:	5652                	lw	a2,52(sp)
800071da:	9736                	add	a4,a4,a3
800071dc:	56e2                	lw	a3,56(sp)
800071de:	838d                	srli	a5,a5,0x3
800071e0:	d83a                	sw	a4,48(sp)
800071e2:	97b6                	add	a5,a5,a3
800071e4:	46b6                	lw	a3,76(sp)
800071e6:	070a                	slli	a4,a4,0x2
800071e8:	c83e                	sw	a5,16(sp)
800071ea:	9636                	add	a2,a2,a3
800071ec:	c632                	sw	a2,12(sp)
800071ee:	4626                	lw	a2,72(sp)
800071f0:	4a96                	lw	s5,68(sp)
800071f2:	da3a                	sw	a4,52(sp)
800071f4:	97b2                	add	a5,a5,a2
800071f6:	d23e                	sw	a5,36(sp)
800071f8:	00e687b3          	add	a5,a3,a4
800071fc:	cc3e                	sw	a5,24(sp)
800071fe:	47f2                	lw	a5,28(sp)
80007200:	18078163          	beqz	a5,80007382 <MiCo_Q1x8_MatMul+0x208>
80007204:	ca5a                	sw	s6,20(sp)
80007206:	49c2                	lw	s3,16(sp)
80007208:	5b12                	lw	s6,36(sp)
8000720a:	8456                	mv	s0,s5
8000720c:	4a01                	li	s4,0
8000720e:	4481                	li	s1,0
80007210:	4901                	li	s2,0
80007212:	854e                	mv	a0,s3
80007214:	dedfd0ef          	jal	ra,80005000 <safe_load_qword>
80007218:	00140683          	lb	a3,1(s0)
8000721c:	00040d83          	lb	s11,0(s0)
80007220:	00240e83          	lb	t4,2(s0)
80007224:	00540703          	lb	a4,5(s0)
80007228:	00440803          	lb	a6,4(s0)
8000722c:	00340e03          	lb	t3,3(s0)
80007230:	00640303          	lb	t1,6(s0)
80007234:	00940783          	lb	a5,9(s0)
80007238:	00840583          	lb	a1,8(s0)
8000723c:	00740d03          	lb	s10,7(s0)
80007240:	00a40c83          	lb	s9,10(s0)
80007244:	00d40883          	lb	a7,13(s0)
80007248:	00c40603          	lb	a2,12(s0)
8000724c:	9db6                	add	s11,s11,a3
8000724e:	00e40b83          	lb	s7,14(s0)
80007252:	01040383          	lb	t2,16(s0)
80007256:	00b40c03          	lb	s8,11(s0)
8000725a:	01140683          	lb	a3,17(s0)
8000725e:	9df6                	add	s11,s11,t4
80007260:	983a                	add	a6,a6,a4
80007262:	9df2                	add	s11,s11,t3
80007264:	00f40283          	lb	t0,15(s0)
80007268:	01240f83          	lb	t6,18(s0)
8000726c:	01440703          	lb	a4,20(s0)
80007270:	01540f03          	lb	t5,21(s0)
80007274:	981a                	add	a6,a6,t1
80007276:	95be                	add	a1,a1,a5
80007278:	996e                	add	s2,s2,s11
8000727a:	01340e83          	lb	t4,19(s0)
8000727e:	01640e03          	lb	t3,22(s0)
80007282:	01840783          	lb	a5,24(s0)
80007286:	01940303          	lb	t1,25(s0)
8000728a:	986a                	add	a6,a6,s10
8000728c:	95e6                	add	a1,a1,s9
8000728e:	9646                	add	a2,a2,a7
80007290:	01740c83          	lb	s9,23(s0)
80007294:	01a40d03          	lb	s10,26(s0)
80007298:	01c40883          	lb	a7,28(s0)
8000729c:	01d40d83          	lb	s11,29(s0)
800072a0:	984a                	add	a6,a6,s2
800072a2:	965e                	add	a2,a2,s7
800072a4:	969e                	add	a3,a3,t2
800072a6:	95e2                	add	a1,a1,s8
800072a8:	01b40903          	lb	s2,27(s0)
800072ac:	01e40383          	lb	t2,30(s0)
800072b0:	977a                	add	a4,a4,t5
800072b2:	982e                	add	a6,a6,a1
800072b4:	9616                	add	a2,a2,t0
800072b6:	9fb6                	add	t6,t6,a3
800072b8:	01f40f03          	lb	t5,31(s0)
800072bc:	9832                	add	a6,a6,a2
800072be:	9efe                	add	t4,t4,t6
800072c0:	9e3a                	add	t3,t3,a4
800072c2:	979a                	add	a5,a5,t1
800072c4:	9ec2                	add	t4,t4,a6
800072c6:	9cf2                	add	s9,s9,t3
800072c8:	9d3e                	add	s10,s10,a5
800072ca:	98ee                	add	a7,a7,s11
800072cc:	996a                	add	s2,s2,s10
800072ce:	9cf6                	add	s9,s9,t4
800072d0:	93c6                	add	t2,t2,a7
800072d2:	9cca                	add	s9,s9,s2
800072d4:	01e38933          	add	s2,t2,t5
800072d8:	8baa                	mv	s7,a0
800072da:	9966                	add	s2,s2,s9
800072dc:	c105                	beqz	a0,800072fc <MiCo_Q1x8_MatMul+0x182>
800072de:	014a8c33          	add	s8,s5,s4
800072e2:	855e                	mv	a0,s7
800072e4:	0ac020ef          	jal	ra,80009390 <__ctzsi2>
800072e8:	9562                	add	a0,a0,s8
800072ea:	00050783          	lb	a5,0(a0)
800072ee:	fffb8713          	addi	a4,s7,-1
800072f2:	00ebfbb3          	and	s7,s7,a4
800072f6:	94be                	add	s1,s1,a5
800072f8:	fe0b95e3          	bnez	s7,800072e2 <MiCo_Q1x8_MatMul+0x168>
800072fc:	0991                	addi	s3,s3,4
800072fe:	02040413          	addi	s0,s0,32
80007302:	020a0a13          	addi	s4,s4,32
80007306:	f16996e3          	bne	s3,s6,80007212 <MiCo_Q1x8_MatMul+0x98>
8000730a:	4b52                	lw	s6,20(sp)
8000730c:	5782                	lw	a5,32(sp)
8000730e:	0367f763          	bgeu	a5,s6,8000733c <MiCo_Q1x8_MatMul+0x1c2>
80007312:	45c2                	lw	a1,16(sp)
80007314:	0037d713          	srli	a4,a5,0x3
80007318:	972e                	add	a4,a4,a1
8000731a:	00070703          	lb	a4,0(a4)
8000731e:	00fa86b3          	add	a3,s5,a5
80007322:	0077f613          	andi	a2,a5,7
80007326:	00068683          	lb	a3,0(a3)
8000732a:	40c75733          	sra	a4,a4,a2
8000732e:	8b05                	andi	a4,a4,1
80007330:	0785                	addi	a5,a5,1
80007332:	9936                	add	s2,s2,a3
80007334:	c311                	beqz	a4,80007338 <MiCo_Q1x8_MatMul+0x1be>
80007336:	94b6                	add	s1,s1,a3
80007338:	fcfb1ee3          	bne	s6,a5,80007314 <MiCo_Q1x8_MatMul+0x19a>
8000733c:	47b2                	lw	a5,12(sp)
8000733e:	0486                	slli	s1,s1,0x1
80007340:	409904b3          	sub	s1,s2,s1
80007344:	4762                	lw	a4,24(sp)
80007346:	c384                	sw	s1,0(a5)
80007348:	0791                	addi	a5,a5,4
8000734a:	c63e                	sw	a5,12(sp)
8000734c:	9ada                	add	s5,s5,s6
8000734e:	eaf718e3          	bne	a4,a5,800071fe <MiCo_Q1x8_MatMul+0x84>
80007352:	5722                	lw	a4,40(sp)
80007354:	57b2                	lw	a5,44(sp)
80007356:	975a                	add	a4,a4,s6
80007358:	d43a                	sw	a4,40(sp)
8000735a:	5772                	lw	a4,60(sp)
8000735c:	0785                	addi	a5,a5,1
8000735e:	d63e                	sw	a5,44(sp)
80007360:	e6f719e3          	bne	a4,a5,800071d2 <MiCo_Q1x8_MatMul+0x58>
80007364:	40ba                	lw	ra,140(sp)
80007366:	442a                	lw	s0,136(sp)
80007368:	449a                	lw	s1,132(sp)
8000736a:	490a                	lw	s2,128(sp)
8000736c:	59f6                	lw	s3,124(sp)
8000736e:	5a66                	lw	s4,120(sp)
80007370:	5ad6                	lw	s5,116(sp)
80007372:	5b46                	lw	s6,112(sp)
80007374:	5bb6                	lw	s7,108(sp)
80007376:	5c26                	lw	s8,104(sp)
80007378:	5c96                	lw	s9,100(sp)
8000737a:	5d06                	lw	s10,96(sp)
8000737c:	4df6                	lw	s11,92(sp)
8000737e:	6149                	addi	sp,sp,144
80007380:	8082                	ret
80007382:	4481                	li	s1,0
80007384:	4901                	li	s2,0
80007386:	b759                	j	8000730c <MiCo_Q1x8_MatMul+0x192>

80007388 <MiCo_Q2x4_MatMul>:
80007388:	715d                	addi	sp,sp,-80
8000738a:	d85e                	sw	s7,48(sp)
8000738c:	872e                	mv	a4,a1
8000738e:	0045ab83          	lw	s7,4(a1)
80007392:	418c                	lw	a1,0(a1)
80007394:	c6a2                	sw	s0,76(sp)
80007396:	c4a6                	sw	s1,72(sp)
80007398:	c2ca                	sw	s2,68(sp)
8000739a:	c0ce                	sw	s3,64(sp)
8000739c:	de52                	sw	s4,60(sp)
8000739e:	dc56                	sw	s5,56(sp)
800073a0:	da5a                	sw	s6,52(sp)
800073a2:	d662                	sw	s8,44(sp)
800073a4:	d466                	sw	s9,40(sp)
800073a6:	d26a                	sw	s10,36(sp)
800073a8:	d06e                	sw	s11,32(sp)
800073aa:	ca2e                	sw	a1,20(sp)
800073ac:	421c                	lw	a5,0(a2)
800073ae:	38058f63          	beqz	a1,8000774c <MiCo_Q2x4_MatMul+0x3c4>
800073b2:	38078d63          	beqz	a5,8000774c <MiCo_Q2x4_MatMul+0x3c4>
800073b6:	4718                	lw	a4,8(a4)
800073b8:	86b2                	mv	a3,a2
800073ba:	0086ad83          	lw	s11,8(a3)
800073be:	40f00633          	neg	a2,a5
800073c2:	078a                	slli	a5,a5,0x2
800073c4:	c83a                	sw	a4,16(sp)
800073c6:	00f50d33          	add	s10,a0,a5
800073ca:	00361713          	slli	a4,a2,0x3
800073ce:	00261793          	slli	a5,a2,0x2
800073d2:	cc3e                	sw	a5,24(sp)
800073d4:	ff0bfb13          	andi	s6,s7,-16
800073d8:	c202                	sw	zero,4(sp)
800073da:	c402                	sw	zero,8(sp)
800073dc:	4785                	li	a5,1
800073de:	4889                	li	a7,2
800073e0:	ce3a                	sw	a4,28(sp)
800073e2:	4712                	lw	a4,4(sp)
800073e4:	4c81                	li	s9,0
800073e6:	00275a93          	srli	s5,a4,0x2
800073ea:	4762                	lw	a4,24(sp)
800073ec:	01a70c33          	add	s8,a4,s10
800073f0:	4742                	lw	a4,16(sp)
800073f2:	c662                	sw	s8,12(sp)
800073f4:	9aba                	add	s5,s5,a4
800073f6:	001cd813          	srli	a6,s9,0x1
800073fa:	986e                	add	a6,a6,s11
800073fc:	360b0663          	beqz	s6,80007768 <MiCo_Q2x4_MatMul+0x3e0>
80007400:	4501                	li	a0,0
80007402:	4281                	li	t0,0
80007404:	00255713          	srli	a4,a0,0x2
80007408:	9756                	add	a4,a4,s5
8000740a:	00070303          	lb	t1,0(a4)
8000740e:	00155593          	srli	a1,a0,0x1
80007412:	95c2                	add	a1,a1,a6
80007414:	00337913          	andi	s2,t1,3
80007418:	00170603          	lb	a2,1(a4)
8000741c:	00270683          	lb	a3,2(a4)
80007420:	00058483          	lb	s1,0(a1)
80007424:	00158403          	lb	s0,1(a1)
80007428:	00258383          	lb	t2,2(a1)
8000742c:	00358f83          	lb	t6,3(a1)
80007430:	00458f03          	lb	t5,4(a1)
80007434:	00558e83          	lb	t4,5(a1)
80007438:	00658e03          	lb	t3,6(a1)
8000743c:	00370703          	lb	a4,3(a4)
80007440:	00758583          	lb	a1,7(a1)
80007444:	4985                	li	s3,1
80007446:	00f90a63          	beq	s2,a5,8000745a <MiCo_Q2x4_MatMul+0xd2>
8000744a:	59f9                	li	s3,-2
8000744c:	01190763          	beq	s2,a7,8000745a <MiCo_Q2x4_MatMul+0xd2>
80007450:	1975                	addi	s2,s2,-3
80007452:	00193913          	seqz	s2,s2
80007456:	412009b3          	neg	s3,s2
8000745a:	01c49913          	slli	s2,s1,0x1c
8000745e:	41c95913          	srai	s2,s2,0x1c
80007462:	03390933          	mul	s2,s2,s3
80007466:	40235a13          	srai	s4,t1,0x2
8000746a:	003a7a13          	andi	s4,s4,3
8000746e:	4985                	li	s3,1
80007470:	9916                	add	s2,s2,t0
80007472:	00fa0b63          	beq	s4,a5,80007488 <MiCo_Q2x4_MatMul+0x100>
80007476:	59f9                	li	s3,-2
80007478:	011a0863          	beq	s4,a7,80007488 <MiCo_Q2x4_MatMul+0x100>
8000747c:	ffda0293          	addi	t0,s4,-3
80007480:	0012b293          	seqz	t0,t0
80007484:	405009b3          	neg	s3,t0
80007488:	4044d293          	srai	t0,s1,0x4
8000748c:	033282b3          	mul	t0,t0,s3
80007490:	40435493          	srai	s1,t1,0x4
80007494:	888d                	andi	s1,s1,3
80007496:	4985                	li	s3,1
80007498:	92ca                	add	t0,t0,s2
8000749a:	00f48a63          	beq	s1,a5,800074ae <MiCo_Q2x4_MatMul+0x126>
8000749e:	59f9                	li	s3,-2
800074a0:	01148763          	beq	s1,a7,800074ae <MiCo_Q2x4_MatMul+0x126>
800074a4:	14f5                	addi	s1,s1,-3
800074a6:	0014b493          	seqz	s1,s1
800074aa:	409009b3          	neg	s3,s1
800074ae:	01c41493          	slli	s1,s0,0x1c
800074b2:	84f1                	srai	s1,s1,0x1c
800074b4:	033484b3          	mul	s1,s1,s3
800074b8:	0ff37313          	andi	t1,t1,255
800074bc:	00635313          	srli	t1,t1,0x6
800074c0:	4905                	li	s2,1
800074c2:	92a6                	add	t0,t0,s1
800074c4:	00f30a63          	beq	t1,a5,800074d8 <MiCo_Q2x4_MatMul+0x150>
800074c8:	5979                	li	s2,-2
800074ca:	01130763          	beq	t1,a7,800074d8 <MiCo_Q2x4_MatMul+0x150>
800074ce:	1375                	addi	t1,t1,-3
800074d0:	00133313          	seqz	t1,t1
800074d4:	40600933          	neg	s2,t1
800074d8:	8411                	srai	s0,s0,0x4
800074da:	03240433          	mul	s0,s0,s2
800074de:	00367493          	andi	s1,a2,3
800074e2:	4905                	li	s2,1
800074e4:	9416                	add	s0,s0,t0
800074e6:	00f48b63          	beq	s1,a5,800074fc <MiCo_Q2x4_MatMul+0x174>
800074ea:	5979                	li	s2,-2
800074ec:	01148863          	beq	s1,a7,800074fc <MiCo_Q2x4_MatMul+0x174>
800074f0:	ffd48313          	addi	t1,s1,-3
800074f4:	00133313          	seqz	t1,t1
800074f8:	40600933          	neg	s2,t1
800074fc:	01c39313          	slli	t1,t2,0x1c
80007500:	41c35313          	srai	t1,t1,0x1c
80007504:	03230333          	mul	t1,t1,s2
80007508:	40265293          	srai	t0,a2,0x2
8000750c:	0032f293          	andi	t0,t0,3
80007510:	4485                	li	s1,1
80007512:	941a                	add	s0,s0,t1
80007514:	00f28b63          	beq	t0,a5,8000752a <MiCo_Q2x4_MatMul+0x1a2>
80007518:	54f9                	li	s1,-2
8000751a:	01128863          	beq	t0,a7,8000752a <MiCo_Q2x4_MatMul+0x1a2>
8000751e:	ffd28313          	addi	t1,t0,-3
80007522:	00133313          	seqz	t1,t1
80007526:	406004b3          	neg	s1,t1
8000752a:	4043d313          	srai	t1,t2,0x4
8000752e:	02930333          	mul	t1,t1,s1
80007532:	40465293          	srai	t0,a2,0x4
80007536:	0032f293          	andi	t0,t0,3
8000753a:	4485                	li	s1,1
8000753c:	9322                	add	t1,t1,s0
8000753e:	00f28b63          	beq	t0,a5,80007554 <MiCo_Q2x4_MatMul+0x1cc>
80007542:	54f9                	li	s1,-2
80007544:	01128863          	beq	t0,a7,80007554 <MiCo_Q2x4_MatMul+0x1cc>
80007548:	ffd28393          	addi	t2,t0,-3
8000754c:	0013b393          	seqz	t2,t2
80007550:	407004b3          	neg	s1,t2
80007554:	01cf9393          	slli	t2,t6,0x1c
80007558:	41c3d393          	srai	t2,t2,0x1c
8000755c:	029383b3          	mul	t2,t2,s1
80007560:	0ff67613          	andi	a2,a2,255
80007564:	8219                	srli	a2,a2,0x6
80007566:	4285                	li	t0,1
80007568:	939a                	add	t2,t2,t1
8000756a:	00f60a63          	beq	a2,a5,8000757e <MiCo_Q2x4_MatMul+0x1f6>
8000756e:	52f9                	li	t0,-2
80007570:	01160763          	beq	a2,a7,8000757e <MiCo_Q2x4_MatMul+0x1f6>
80007574:	1675                	addi	a2,a2,-3
80007576:	00163613          	seqz	a2,a2
8000757a:	40c002b3          	neg	t0,a2
8000757e:	404fd613          	srai	a2,t6,0x4
80007582:	02560633          	mul	a2,a2,t0
80007586:	0036f313          	andi	t1,a3,3
8000758a:	4285                	li	t0,1
8000758c:	961e                	add	a2,a2,t2
8000758e:	00f30a63          	beq	t1,a5,800075a2 <MiCo_Q2x4_MatMul+0x21a>
80007592:	52f9                	li	t0,-2
80007594:	01130763          	beq	t1,a7,800075a2 <MiCo_Q2x4_MatMul+0x21a>
80007598:	1375                	addi	t1,t1,-3
8000759a:	00133313          	seqz	t1,t1
8000759e:	406002b3          	neg	t0,t1
800075a2:	01cf1f93          	slli	t6,t5,0x1c
800075a6:	41cfdf93          	srai	t6,t6,0x1c
800075aa:	025f8fb3          	mul	t6,t6,t0
800075ae:	4026d313          	srai	t1,a3,0x2
800075b2:	00337313          	andi	t1,t1,3
800075b6:	4285                	li	t0,1
800075b8:	967e                	add	a2,a2,t6
800075ba:	00f30a63          	beq	t1,a5,800075ce <MiCo_Q2x4_MatMul+0x246>
800075be:	52f9                	li	t0,-2
800075c0:	01130763          	beq	t1,a7,800075ce <MiCo_Q2x4_MatMul+0x246>
800075c4:	1375                	addi	t1,t1,-3
800075c6:	00133313          	seqz	t1,t1
800075ca:	406002b3          	neg	t0,t1
800075ce:	404f5f13          	srai	t5,t5,0x4
800075d2:	025f0f33          	mul	t5,t5,t0
800075d6:	4046d313          	srai	t1,a3,0x4
800075da:	00337313          	andi	t1,t1,3
800075de:	4f85                	li	t6,1
800075e0:	9f32                	add	t5,t5,a2
800075e2:	00f30a63          	beq	t1,a5,800075f6 <MiCo_Q2x4_MatMul+0x26e>
800075e6:	5ff9                	li	t6,-2
800075e8:	01130763          	beq	t1,a7,800075f6 <MiCo_Q2x4_MatMul+0x26e>
800075ec:	1375                	addi	t1,t1,-3
800075ee:	00133313          	seqz	t1,t1
800075f2:	40600fb3          	neg	t6,t1
800075f6:	01ce9613          	slli	a2,t4,0x1c
800075fa:	8671                	srai	a2,a2,0x1c
800075fc:	03f60633          	mul	a2,a2,t6
80007600:	0ff6f693          	andi	a3,a3,255
80007604:	8299                	srli	a3,a3,0x6
80007606:	4305                	li	t1,1
80007608:	9f32                	add	t5,t5,a2
8000760a:	00f68a63          	beq	a3,a5,8000761e <MiCo_Q2x4_MatMul+0x296>
8000760e:	5379                	li	t1,-2
80007610:	01168763          	beq	a3,a7,8000761e <MiCo_Q2x4_MatMul+0x296>
80007614:	16f5                	addi	a3,a3,-3
80007616:	0016b693          	seqz	a3,a3
8000761a:	40d00333          	neg	t1,a3
8000761e:	404ed693          	srai	a3,t4,0x4
80007622:	026686b3          	mul	a3,a3,t1
80007626:	00377613          	andi	a2,a4,3
8000762a:	4305                	li	t1,1
8000762c:	96fa                	add	a3,a3,t5
8000762e:	00f60a63          	beq	a2,a5,80007642 <MiCo_Q2x4_MatMul+0x2ba>
80007632:	5379                	li	t1,-2
80007634:	01160763          	beq	a2,a7,80007642 <MiCo_Q2x4_MatMul+0x2ba>
80007638:	1675                	addi	a2,a2,-3
8000763a:	00163613          	seqz	a2,a2
8000763e:	40c00333          	neg	t1,a2
80007642:	01ce1293          	slli	t0,t3,0x1c
80007646:	41c2d293          	srai	t0,t0,0x1c
8000764a:	026282b3          	mul	t0,t0,t1
8000764e:	40275613          	srai	a2,a4,0x2
80007652:	8a0d                	andi	a2,a2,3
80007654:	4305                	li	t1,1
80007656:	9696                	add	a3,a3,t0
80007658:	00f60a63          	beq	a2,a5,8000766c <MiCo_Q2x4_MatMul+0x2e4>
8000765c:	5379                	li	t1,-2
8000765e:	01160763          	beq	a2,a7,8000766c <MiCo_Q2x4_MatMul+0x2e4>
80007662:	1675                	addi	a2,a2,-3
80007664:	00163613          	seqz	a2,a2
80007668:	40c00333          	neg	t1,a2
8000766c:	404e5e13          	srai	t3,t3,0x4
80007670:	026e0e33          	mul	t3,t3,t1
80007674:	40475613          	srai	a2,a4,0x4
80007678:	8a0d                	andi	a2,a2,3
8000767a:	4305                	li	t1,1
8000767c:	9e36                	add	t3,t3,a3
8000767e:	00f60a63          	beq	a2,a5,80007692 <MiCo_Q2x4_MatMul+0x30a>
80007682:	5379                	li	t1,-2
80007684:	01160763          	beq	a2,a7,80007692 <MiCo_Q2x4_MatMul+0x30a>
80007688:	1675                	addi	a2,a2,-3
8000768a:	00163613          	seqz	a2,a2
8000768e:	40c00333          	neg	t1,a2
80007692:	01c59293          	slli	t0,a1,0x1c
80007696:	41c2d293          	srai	t0,t0,0x1c
8000769a:	026282b3          	mul	t0,t0,t1
8000769e:	0ff77713          	andi	a4,a4,255
800076a2:	8319                	srli	a4,a4,0x6
800076a4:	4685                	li	a3,1
800076a6:	9e16                	add	t3,t3,t0
800076a8:	00f70a63          	beq	a4,a5,800076bc <MiCo_Q2x4_MatMul+0x334>
800076ac:	56f9                	li	a3,-2
800076ae:	01170763          	beq	a4,a7,800076bc <MiCo_Q2x4_MatMul+0x334>
800076b2:	1775                	addi	a4,a4,-3
800076b4:	00173713          	seqz	a4,a4
800076b8:	40e006b3          	neg	a3,a4
800076bc:	4045d293          	srai	t0,a1,0x4
800076c0:	02d282b3          	mul	t0,t0,a3
800076c4:	0541                	addi	a0,a0,16
800076c6:	92f2                	add	t0,t0,t3
800076c8:	d3656ee3          	bltu	a0,s6,80007404 <MiCo_Q2x4_MatMul+0x7c>
800076cc:	057b7d63          	bgeu	s6,s7,80007726 <MiCo_Q2x4_MatMul+0x39e>
800076d0:	865a                	mv	a2,s6
800076d2:	00167713          	andi	a4,a2,1
800076d6:	00271593          	slli	a1,a4,0x2
800076da:	00265713          	srli	a4,a2,0x2
800076de:	9756                	add	a4,a4,s5
800076e0:	00070683          	lb	a3,0(a4)
800076e4:	00367713          	andi	a4,a2,3
800076e8:	0706                	slli	a4,a4,0x1
800076ea:	40e6d6b3          	sra	a3,a3,a4
800076ee:	8a8d                	andi	a3,a3,3
800076f0:	00165513          	srli	a0,a2,0x1
800076f4:	ffd68713          	addi	a4,a3,-3
800076f8:	9542                	add	a0,a0,a6
800076fa:	0605                	addi	a2,a2,1
800076fc:	00173713          	seqz	a4,a4
80007700:	4305                	li	t1,1
80007702:	00f68763          	beq	a3,a5,80007710 <MiCo_Q2x4_MatMul+0x388>
80007706:	5379                	li	t1,-2
80007708:	01168463          	beq	a3,a7,80007710 <MiCo_Q2x4_MatMul+0x388>
8000770c:	40e00333          	neg	t1,a4
80007710:	00050703          	lb	a4,0(a0)
80007714:	40b75733          	sra	a4,a4,a1
80007718:	0772                	slli	a4,a4,0x1c
8000771a:	8771                	srai	a4,a4,0x1c
8000771c:	02670733          	mul	a4,a4,t1
80007720:	92ba                	add	t0,t0,a4
80007722:	facb98e3          	bne	s7,a2,800076d2 <MiCo_Q2x4_MatMul+0x34a>
80007726:	005c2023          	sw	t0,0(s8)
8000772a:	0c11                	addi	s8,s8,4
8000772c:	9cde                	add	s9,s9,s7
8000772e:	cdac14e3          	bne	s8,s10,800073f6 <MiCo_Q2x4_MatMul+0x6e>
80007732:	4692                	lw	a3,4(sp)
80007734:	4672                	lw	a2,28(sp)
80007736:	4722                	lw	a4,8(sp)
80007738:	96de                	add	a3,a3,s7
8000773a:	c236                	sw	a3,4(sp)
8000773c:	46b2                	lw	a3,12(sp)
8000773e:	0705                	addi	a4,a4,1
80007740:	c43a                	sw	a4,8(sp)
80007742:	40c68d33          	sub	s10,a3,a2
80007746:	46d2                	lw	a3,20(sp)
80007748:	c8e69de3          	bne	a3,a4,800073e2 <MiCo_Q2x4_MatMul+0x5a>
8000774c:	4436                	lw	s0,76(sp)
8000774e:	44a6                	lw	s1,72(sp)
80007750:	4916                	lw	s2,68(sp)
80007752:	4986                	lw	s3,64(sp)
80007754:	5a72                	lw	s4,60(sp)
80007756:	5ae2                	lw	s5,56(sp)
80007758:	5b52                	lw	s6,52(sp)
8000775a:	5bc2                	lw	s7,48(sp)
8000775c:	5c32                	lw	s8,44(sp)
8000775e:	5ca2                	lw	s9,40(sp)
80007760:	5d12                	lw	s10,36(sp)
80007762:	5d82                	lw	s11,32(sp)
80007764:	6161                	addi	sp,sp,80
80007766:	8082                	ret
80007768:	4281                	li	t0,0
8000776a:	b78d                	j	800076cc <MiCo_Q2x4_MatMul+0x344>

8000776c <MiCo_Q1x4_MatMul>:
8000776c:	7119                	addi	sp,sp,-128
8000776e:	d2d6                	sw	s5,100(sp)
80007770:	0045aa83          	lw	s5,4(a1)
80007774:	4194                	lw	a3,0(a1)
80007776:	8732                	mv	a4,a2
80007778:	4210                	lw	a2,0(a2)
8000777a:	87ae                	mv	a5,a1
8000777c:	005ad593          	srli	a1,s5,0x5
80007780:	de86                	sw	ra,124(sp)
80007782:	dca2                	sw	s0,120(sp)
80007784:	daa6                	sw	s1,116(sp)
80007786:	d8ca                	sw	s2,112(sp)
80007788:	d6ce                	sw	s3,108(sp)
8000778a:	d4d2                	sw	s4,104(sp)
8000778c:	d0da                	sw	s6,96(sp)
8000778e:	cede                	sw	s7,92(sp)
80007790:	cce2                	sw	s8,88(sp)
80007792:	cae6                	sw	s9,84(sp)
80007794:	c8ea                	sw	s10,80(sp)
80007796:	c6ee                	sw	s11,76(sp)
80007798:	d836                	sw	a3,48(sp)
8000779a:	da32                	sw	a2,52(sp)
8000779c:	de2a                	sw	a0,60(sp)
8000779e:	c82e                	sw	a1,16(sp)
800077a0:	12068b63          	beqz	a3,800078d6 <MiCo_Q1x4_MatMul+0x16a>
800077a4:	479c                	lw	a5,8(a5)
800077a6:	001add13          	srli	s10,s5,0x1
800077aa:	d63e                	sw	a5,44(sp)
800077ac:	001af793          	andi	a5,s5,1
800077b0:	c63e                	sw	a5,12(sp)
800077b2:	fe0af793          	andi	a5,s5,-32
800077b6:	ca3e                	sw	a5,20(sp)
800077b8:	10060f63          	beqz	a2,800078d6 <MiCo_Q1x4_MatMul+0x16a>
800077bc:	471c                	lw	a5,8(a4)
800077be:	d202                	sw	zero,36(sp)
800077c0:	ce02                	sw	zero,28(sp)
800077c2:	c43e                	sw	a5,8(sp)
800077c4:	00259793          	slli	a5,a1,0x2
800077c8:	dc3e                	sw	a5,56(sp)
800077ca:	d002                	sw	zero,32(sp)
800077cc:	d402                	sw	zero,40(sp)
800077ce:	47f2                	lw	a5,28(sp)
800077d0:	5752                	lw	a4,52(sp)
800077d2:	56a2                	lw	a3,40(sp)
800077d4:	0037db13          	srli	s6,a5,0x3
800077d8:	5792                	lw	a5,36(sp)
800077da:	4c81                	li	s9,0
800077dc:	97ba                	add	a5,a5,a4
800077de:	5732                	lw	a4,44(sp)
800077e0:	d23e                	sw	a5,36(sp)
800077e2:	078a                	slli	a5,a5,0x2
800077e4:	9b3a                	add	s6,s6,a4
800077e6:	5772                	lw	a4,60(sp)
800077e8:	d43e                	sw	a5,40(sp)
800077ea:	00d70c33          	add	s8,a4,a3
800077ee:	56e2                	lw	a3,56(sp)
800077f0:	97ba                	add	a5,a5,a4
800077f2:	cc3e                	sw	a5,24(sp)
800077f4:	00db0bb3          	add	s7,s6,a3
800077f8:	47a2                	lw	a5,8(sp)
800077fa:	001cd913          	srli	s2,s9,0x1
800077fe:	993e                	add	s2,s2,a5
80007800:	100d0a63          	beqz	s10,80007914 <MiCo_Q1x4_MatMul+0x1a8>
80007804:	86ca                	mv	a3,s2
80007806:	01a90633          	add	a2,s2,s10
8000780a:	4981                	li	s3,0
8000780c:	00068783          	lb	a5,0(a3)
80007810:	0685                	addi	a3,a3,1
80007812:	01c79713          	slli	a4,a5,0x1c
80007816:	8771                	srai	a4,a4,0x1c
80007818:	99ba                	add	s3,s3,a4
8000781a:	8791                	srai	a5,a5,0x4
8000781c:	99be                	add	s3,s3,a5
8000781e:	fec697e3          	bne	a3,a2,8000780c <MiCo_Q1x4_MatMul+0xa0>
80007822:	47b2                	lw	a5,12(sp)
80007824:	cb81                	beqz	a5,80007834 <MiCo_Q1x4_MatMul+0xc8>
80007826:	01a907b3          	add	a5,s2,s10
8000782a:	0007c783          	lbu	a5,0(a5)
8000782e:	07f2                	slli	a5,a5,0x1c
80007830:	87f1                	srai	a5,a5,0x1c
80007832:	99be                	add	s3,s3,a5
80007834:	47c2                	lw	a5,16(sp)
80007836:	c3ed                	beqz	a5,80007918 <MiCo_Q1x4_MatMul+0x1ac>
80007838:	8a5a                	mv	s4,s6
8000783a:	4481                	li	s1,0
8000783c:	4401                	li	s0,0
8000783e:	8552                	mv	a0,s4
80007840:	fc0fd0ef          	jal	ra,80005000 <safe_load_qword>
80007844:	8daa                	mv	s11,a0
80007846:	c505                	beqz	a0,8000786e <MiCo_Q1x4_MatMul+0x102>
80007848:	856e                	mv	a0,s11
8000784a:	347010ef          	jal	ra,80009390 <__ctzsi2>
8000784e:	9526                	add	a0,a0,s1
80007850:	00155793          	srli	a5,a0,0x1
80007854:	97ca                	add	a5,a5,s2
80007856:	8905                	andi	a0,a0,1
80007858:	00078783          	lb	a5,0(a5)
8000785c:	fffd8693          	addi	a3,s11,-1
80007860:	c951                	beqz	a0,800078f4 <MiCo_Q1x4_MatMul+0x188>
80007862:	8791                	srai	a5,a5,0x4
80007864:	00ddfdb3          	and	s11,s11,a3
80007868:	943e                	add	s0,s0,a5
8000786a:	fc0d9fe3          	bnez	s11,80007848 <MiCo_Q1x4_MatMul+0xdc>
8000786e:	0a11                	addi	s4,s4,4
80007870:	02048493          	addi	s1,s1,32
80007874:	fd4b95e3          	bne	s7,s4,8000783e <MiCo_Q1x4_MatMul+0xd2>
80007878:	47d2                	lw	a5,20(sp)
8000787a:	0357fb63          	bgeu	a5,s5,800078b0 <MiCo_Q1x4_MatMul+0x144>
8000787e:	0037d713          	srli	a4,a5,0x3
80007882:	975a                	add	a4,a4,s6
80007884:	00070683          	lb	a3,0(a4)
80007888:	0077f713          	andi	a4,a5,7
8000788c:	0017d613          	srli	a2,a5,0x1
80007890:	40e6d733          	sra	a4,a3,a4
80007894:	8b05                	andi	a4,a4,1
80007896:	00c906b3          	add	a3,s2,a2
8000789a:	0017f613          	andi	a2,a5,1
8000789e:	c711                	beqz	a4,800078aa <MiCo_Q1x4_MatMul+0x13e>
800078a0:	00068703          	lb	a4,0(a3)
800078a4:	c62d                	beqz	a2,8000790e <MiCo_Q1x4_MatMul+0x1a2>
800078a6:	8711                	srai	a4,a4,0x4
800078a8:	943a                	add	s0,s0,a4
800078aa:	0785                	addi	a5,a5,1
800078ac:	fcfa99e3          	bne	s5,a5,8000787e <MiCo_Q1x4_MatMul+0x112>
800078b0:	0406                	slli	s0,s0,0x1
800078b2:	47e2                	lw	a5,24(sp)
800078b4:	40898433          	sub	s0,s3,s0
800078b8:	008c2023          	sw	s0,0(s8)
800078bc:	0c11                	addi	s8,s8,4
800078be:	9cd6                	add	s9,s9,s5
800078c0:	f2fc1ce3          	bne	s8,a5,800077f8 <MiCo_Q1x4_MatMul+0x8c>
800078c4:	4772                	lw	a4,28(sp)
800078c6:	5782                	lw	a5,32(sp)
800078c8:	9756                	add	a4,a4,s5
800078ca:	ce3a                	sw	a4,28(sp)
800078cc:	5742                	lw	a4,48(sp)
800078ce:	0785                	addi	a5,a5,1
800078d0:	d03e                	sw	a5,32(sp)
800078d2:	eef71ee3          	bne	a4,a5,800077ce <MiCo_Q1x4_MatMul+0x62>
800078d6:	50f6                	lw	ra,124(sp)
800078d8:	5466                	lw	s0,120(sp)
800078da:	54d6                	lw	s1,116(sp)
800078dc:	5946                	lw	s2,112(sp)
800078de:	59b6                	lw	s3,108(sp)
800078e0:	5a26                	lw	s4,104(sp)
800078e2:	5a96                	lw	s5,100(sp)
800078e4:	5b06                	lw	s6,96(sp)
800078e6:	4bf6                	lw	s7,92(sp)
800078e8:	4c66                	lw	s8,88(sp)
800078ea:	4cd6                	lw	s9,84(sp)
800078ec:	4d46                	lw	s10,80(sp)
800078ee:	4db6                	lw	s11,76(sp)
800078f0:	6109                	addi	sp,sp,128
800078f2:	8082                	ret
800078f4:	07f2                	slli	a5,a5,0x1c
800078f6:	87f1                	srai	a5,a5,0x1c
800078f8:	00ddfdb3          	and	s11,s11,a3
800078fc:	943e                	add	s0,s0,a5
800078fe:	f40d95e3          	bnez	s11,80007848 <MiCo_Q1x4_MatMul+0xdc>
80007902:	0a11                	addi	s4,s4,4
80007904:	02048493          	addi	s1,s1,32
80007908:	f34b9be3          	bne	s7,s4,8000783e <MiCo_Q1x4_MatMul+0xd2>
8000790c:	b7b5                	j	80007878 <MiCo_Q1x4_MatMul+0x10c>
8000790e:	0772                	slli	a4,a4,0x1c
80007910:	8771                	srai	a4,a4,0x1c
80007912:	bf59                	j	800078a8 <MiCo_Q1x4_MatMul+0x13c>
80007914:	4981                	li	s3,0
80007916:	b731                	j	80007822 <MiCo_Q1x4_MatMul+0xb6>
80007918:	4401                	li	s0,0
8000791a:	bfb9                	j	80007878 <MiCo_Q1x4_MatMul+0x10c>

8000791c <MiCo_Q1x2_MatMul>:
8000791c:	7119                	addi	sp,sp,-128
8000791e:	c6ee                	sw	s11,76(sp)
80007920:	0045ad83          	lw	s11,4(a1)
80007924:	4194                	lw	a3,0(a1)
80007926:	8732                	mv	a4,a2
80007928:	4210                	lw	a2,0(a2)
8000792a:	87ae                	mv	a5,a1
8000792c:	005dd593          	srli	a1,s11,0x5
80007930:	de86                	sw	ra,124(sp)
80007932:	dca2                	sw	s0,120(sp)
80007934:	daa6                	sw	s1,116(sp)
80007936:	d8ca                	sw	s2,112(sp)
80007938:	d6ce                	sw	s3,108(sp)
8000793a:	d4d2                	sw	s4,104(sp)
8000793c:	d2d6                	sw	s5,100(sp)
8000793e:	d0da                	sw	s6,96(sp)
80007940:	cede                	sw	s7,92(sp)
80007942:	cce2                	sw	s8,88(sp)
80007944:	cae6                	sw	s9,84(sp)
80007946:	c8ea                	sw	s10,80(sp)
80007948:	d836                	sw	a3,48(sp)
8000794a:	da32                	sw	a2,52(sp)
8000794c:	de2a                	sw	a0,60(sp)
8000794e:	c82e                	sw	a1,16(sp)
80007950:	1e068663          	beqz	a3,80007b3c <MiCo_Q1x2_MatMul+0x220>
80007954:	479c                	lw	a5,8(a5)
80007956:	d63e                	sw	a5,44(sp)
80007958:	002dd793          	srli	a5,s11,0x2
8000795c:	c43e                	sw	a5,8(sp)
8000795e:	003df793          	andi	a5,s11,3
80007962:	c23e                	sw	a5,4(sp)
80007964:	fe0df793          	andi	a5,s11,-32
80007968:	ca3e                	sw	a5,20(sp)
8000796a:	1c060963          	beqz	a2,80007b3c <MiCo_Q1x2_MatMul+0x220>
8000796e:	471c                	lw	a5,8(a4)
80007970:	d202                	sw	zero,36(sp)
80007972:	ce02                	sw	zero,28(sp)
80007974:	c63e                	sw	a5,12(sp)
80007976:	00259793          	slli	a5,a1,0x2
8000797a:	dc3e                	sw	a5,56(sp)
8000797c:	d002                	sw	zero,32(sp)
8000797e:	d402                	sw	zero,40(sp)
80007980:	4485                	li	s1,1
80007982:	4a89                	li	s5,2
80007984:	47f2                	lw	a5,28(sp)
80007986:	5752                	lw	a4,52(sp)
80007988:	56a2                	lw	a3,40(sp)
8000798a:	0037db93          	srli	s7,a5,0x3
8000798e:	5792                	lw	a5,36(sp)
80007990:	c002                	sw	zero,0(sp)
80007992:	97ba                	add	a5,a5,a4
80007994:	5732                	lw	a4,44(sp)
80007996:	d23e                	sw	a5,36(sp)
80007998:	078a                	slli	a5,a5,0x2
8000799a:	9bba                	add	s7,s7,a4
8000799c:	5772                	lw	a4,60(sp)
8000799e:	d43e                	sw	a5,40(sp)
800079a0:	00d70cb3          	add	s9,a4,a3
800079a4:	56e2                	lw	a3,56(sp)
800079a6:	97ba                	add	a5,a5,a4
800079a8:	cc3e                	sw	a5,24(sp)
800079aa:	01768c33          	add	s8,a3,s7
800079ae:	4782                	lw	a5,0(sp)
800079b0:	0027da13          	srli	s4,a5,0x2
800079b4:	47b2                	lw	a5,12(sp)
800079b6:	9a3e                	add	s4,s4,a5
800079b8:	47a2                	lw	a5,8(sp)
800079ba:	20078763          	beqz	a5,80007bc8 <MiCo_Q1x2_MatMul+0x2ac>
800079be:	86d2                	mv	a3,s4
800079c0:	01478633          	add	a2,a5,s4
800079c4:	4901                	li	s2,0
800079c6:	00068783          	lb	a5,0(a3)
800079ca:	4505                	li	a0,1
800079cc:	0037f713          	andi	a4,a5,3
800079d0:	00970b63          	beq	a4,s1,800079e6 <MiCo_Q1x2_MatMul+0xca>
800079d4:	5579                	li	a0,-2
800079d6:	01570863          	beq	a4,s5,800079e6 <MiCo_Q1x2_MatMul+0xca>
800079da:	ffd70513          	addi	a0,a4,-3
800079de:	00153513          	seqz	a0,a0
800079e2:	40a00533          	neg	a0,a0
800079e6:	4027d713          	srai	a4,a5,0x2
800079ea:	8b0d                	andi	a4,a4,3
800079ec:	992a                	add	s2,s2,a0
800079ee:	4505                	li	a0,1
800079f0:	00970a63          	beq	a4,s1,80007a04 <MiCo_Q1x2_MatMul+0xe8>
800079f4:	5579                	li	a0,-2
800079f6:	01570763          	beq	a4,s5,80007a04 <MiCo_Q1x2_MatMul+0xe8>
800079fa:	1775                	addi	a4,a4,-3
800079fc:	00173713          	seqz	a4,a4
80007a00:	40e00533          	neg	a0,a4
80007a04:	4047d713          	srai	a4,a5,0x4
80007a08:	8b0d                	andi	a4,a4,3
80007a0a:	992a                	add	s2,s2,a0
80007a0c:	4585                	li	a1,1
80007a0e:	00970a63          	beq	a4,s1,80007a22 <MiCo_Q1x2_MatMul+0x106>
80007a12:	55f9                	li	a1,-2
80007a14:	01570763          	beq	a4,s5,80007a22 <MiCo_Q1x2_MatMul+0x106>
80007a18:	1775                	addi	a4,a4,-3
80007a1a:	00173713          	seqz	a4,a4
80007a1e:	40e005b3          	neg	a1,a4
80007a22:	0ff7f793          	andi	a5,a5,255
80007a26:	8399                	srli	a5,a5,0x6
80007a28:	01258733          	add	a4,a1,s2
80007a2c:	4585                	li	a1,1
80007a2e:	00978a63          	beq	a5,s1,80007a42 <MiCo_Q1x2_MatMul+0x126>
80007a32:	55f9                	li	a1,-2
80007a34:	01578763          	beq	a5,s5,80007a42 <MiCo_Q1x2_MatMul+0x126>
80007a38:	17f5                	addi	a5,a5,-3
80007a3a:	0017b793          	seqz	a5,a5
80007a3e:	40f005b3          	neg	a1,a5
80007a42:	0685                	addi	a3,a3,1
80007a44:	00e58933          	add	s2,a1,a4
80007a48:	f6c69fe3          	bne	a3,a2,800079c6 <MiCo_Q1x2_MatMul+0xaa>
80007a4c:	4792                	lw	a5,4(sp)
80007a4e:	10079863          	bnez	a5,80007b5e <MiCo_Q1x2_MatMul+0x242>
80007a52:	47c2                	lw	a5,16(sp)
80007a54:	16078863          	beqz	a5,80007bc4 <MiCo_Q1x2_MatMul+0x2a8>
80007a58:	8b5e                	mv	s6,s7
80007a5a:	4981                	li	s3,0
80007a5c:	4401                	li	s0,0
80007a5e:	855a                	mv	a0,s6
80007a60:	da0fd0ef          	jal	ra,80005000 <safe_load_qword>
80007a64:	8d2a                	mv	s10,a0
80007a66:	e919                	bnez	a0,80007a7c <MiCo_Q1x2_MatMul+0x160>
80007a68:	a881                	j	80007ab8 <MiCo_Q1x2_MatMul+0x19c>
80007a6a:	40e007b3          	neg	a5,a4
80007a6e:	fffd0713          	addi	a4,s10,-1
80007a72:	00ed7d33          	and	s10,s10,a4
80007a76:	943e                	add	s0,s0,a5
80007a78:	040d0063          	beqz	s10,80007ab8 <MiCo_Q1x2_MatMul+0x19c>
80007a7c:	856a                	mv	a0,s10
80007a7e:	113010ef          	jal	ra,80009390 <__ctzsi2>
80007a82:	954e                	add	a0,a0,s3
80007a84:	00255793          	srli	a5,a0,0x2
80007a88:	97d2                	add	a5,a5,s4
80007a8a:	00078783          	lb	a5,0(a5)
80007a8e:	890d                	andi	a0,a0,3
80007a90:	0506                	slli	a0,a0,0x1
80007a92:	40a7d7b3          	sra	a5,a5,a0
80007a96:	8b8d                	andi	a5,a5,3
80007a98:	ffd78713          	addi	a4,a5,-3
80007a9c:	00173713          	seqz	a4,a4
80007aa0:	fc9787e3          	beq	a5,s1,80007a6e <MiCo_Q1x2_MatMul+0x152>
80007aa4:	fd5793e3          	bne	a5,s5,80007a6a <MiCo_Q1x2_MatMul+0x14e>
80007aa8:	fffd0713          	addi	a4,s10,-1
80007aac:	57f9                	li	a5,-2
80007aae:	00ed7d33          	and	s10,s10,a4
80007ab2:	943e                	add	s0,s0,a5
80007ab4:	fc0d14e3          	bnez	s10,80007a7c <MiCo_Q1x2_MatMul+0x160>
80007ab8:	0b11                	addi	s6,s6,4
80007aba:	02098993          	addi	s3,s3,32
80007abe:	fb8b10e3          	bne	s6,s8,80007a5e <MiCo_Q1x2_MatMul+0x142>
80007ac2:	47d2                	lw	a5,20(sp)
80007ac4:	05b7f763          	bgeu	a5,s11,80007b12 <MiCo_Q1x2_MatMul+0x1f6>
80007ac8:	0037d713          	srli	a4,a5,0x3
80007acc:	0027d693          	srli	a3,a5,0x2
80007ad0:	975e                	add	a4,a4,s7
80007ad2:	00da05b3          	add	a1,s4,a3
80007ad6:	00070683          	lb	a3,0(a4)
80007ada:	0077f713          	andi	a4,a5,7
80007ade:	0037f613          	andi	a2,a5,3
80007ae2:	40e6d733          	sra	a4,a3,a4
80007ae6:	8b05                	andi	a4,a4,1
80007ae8:	0606                	slli	a2,a2,0x1
80007aea:	c30d                	beqz	a4,80007b0c <MiCo_Q1x2_MatMul+0x1f0>
80007aec:	00058703          	lb	a4,0(a1)
80007af0:	40c75633          	sra	a2,a4,a2
80007af4:	8a0d                	andi	a2,a2,3
80007af6:	ffd60713          	addi	a4,a2,-3
80007afa:	00173713          	seqz	a4,a4
80007afe:	00960663          	beq	a2,s1,80007b0a <MiCo_Q1x2_MatMul+0x1ee>
80007b02:	05560c63          	beq	a2,s5,80007b5a <MiCo_Q1x2_MatMul+0x23e>
80007b06:	40e00633          	neg	a2,a4
80007b0a:	9432                	add	s0,s0,a2
80007b0c:	0785                	addi	a5,a5,1
80007b0e:	fafd9de3          	bne	s11,a5,80007ac8 <MiCo_Q1x2_MatMul+0x1ac>
80007b12:	4782                	lw	a5,0(sp)
80007b14:	0406                	slli	s0,s0,0x1
80007b16:	40890433          	sub	s0,s2,s0
80007b1a:	97ee                	add	a5,a5,s11
80007b1c:	c03e                	sw	a5,0(sp)
80007b1e:	47e2                	lw	a5,24(sp)
80007b20:	008ca023          	sw	s0,0(s9)
80007b24:	0c91                	addi	s9,s9,4
80007b26:	e8fc94e3          	bne	s9,a5,800079ae <MiCo_Q1x2_MatMul+0x92>
80007b2a:	4772                	lw	a4,28(sp)
80007b2c:	5782                	lw	a5,32(sp)
80007b2e:	976e                	add	a4,a4,s11
80007b30:	ce3a                	sw	a4,28(sp)
80007b32:	5742                	lw	a4,48(sp)
80007b34:	0785                	addi	a5,a5,1
80007b36:	d03e                	sw	a5,32(sp)
80007b38:	e4f716e3          	bne	a4,a5,80007984 <MiCo_Q1x2_MatMul+0x68>
80007b3c:	50f6                	lw	ra,124(sp)
80007b3e:	5466                	lw	s0,120(sp)
80007b40:	54d6                	lw	s1,116(sp)
80007b42:	5946                	lw	s2,112(sp)
80007b44:	59b6                	lw	s3,108(sp)
80007b46:	5a26                	lw	s4,104(sp)
80007b48:	5a96                	lw	s5,100(sp)
80007b4a:	5b06                	lw	s6,96(sp)
80007b4c:	4bf6                	lw	s7,92(sp)
80007b4e:	4c66                	lw	s8,88(sp)
80007b50:	4cd6                	lw	s9,84(sp)
80007b52:	4d46                	lw	s10,80(sp)
80007b54:	4db6                	lw	s11,76(sp)
80007b56:	6109                	addi	sp,sp,128
80007b58:	8082                	ret
80007b5a:	5679                	li	a2,-2
80007b5c:	b77d                	j	80007b0a <MiCo_Q1x2_MatMul+0x1ee>
80007b5e:	47a2                	lw	a5,8(sp)
80007b60:	97d2                	add	a5,a5,s4
80007b62:	00078783          	lb	a5,0(a5)
80007b66:	0037f713          	andi	a4,a5,3
80007b6a:	00970963          	beq	a4,s1,80007b7c <MiCo_Q1x2_MatMul+0x260>
80007b6e:	05570f63          	beq	a4,s5,80007bcc <MiCo_Q1x2_MatMul+0x2b0>
80007b72:	1775                	addi	a4,a4,-3
80007b74:	00173713          	seqz	a4,a4
80007b78:	40e00733          	neg	a4,a4
80007b7c:	993a                	add	s2,s2,a4
80007b7e:	4712                	lw	a4,4(sp)
80007b80:	ec9709e3          	beq	a4,s1,80007a52 <MiCo_Q1x2_MatMul+0x136>
80007b84:	4027d713          	srai	a4,a5,0x2
80007b88:	8b0d                	andi	a4,a4,3
80007b8a:	00970963          	beq	a4,s1,80007b9c <MiCo_Q1x2_MatMul+0x280>
80007b8e:	05570163          	beq	a4,s5,80007bd0 <MiCo_Q1x2_MatMul+0x2b4>
80007b92:	1775                	addi	a4,a4,-3
80007b94:	00173713          	seqz	a4,a4
80007b98:	40e00733          	neg	a4,a4
80007b9c:	993a                	add	s2,s2,a4
80007b9e:	4712                	lw	a4,4(sp)
80007ba0:	468d                	li	a3,3
80007ba2:	ead718e3          	bne	a4,a3,80007a52 <MiCo_Q1x2_MatMul+0x136>
80007ba6:	8791                	srai	a5,a5,0x4
80007ba8:	8b8d                	andi	a5,a5,3
80007baa:	00978963          	beq	a5,s1,80007bbc <MiCo_Q1x2_MatMul+0x2a0>
80007bae:	03578363          	beq	a5,s5,80007bd4 <MiCo_Q1x2_MatMul+0x2b8>
80007bb2:	17f5                	addi	a5,a5,-3
80007bb4:	0017b793          	seqz	a5,a5
80007bb8:	40f007b3          	neg	a5,a5
80007bbc:	993e                	add	s2,s2,a5
80007bbe:	47c2                	lw	a5,16(sp)
80007bc0:	e8079ce3          	bnez	a5,80007a58 <MiCo_Q1x2_MatMul+0x13c>
80007bc4:	4401                	li	s0,0
80007bc6:	bdf5                	j	80007ac2 <MiCo_Q1x2_MatMul+0x1a6>
80007bc8:	4901                	li	s2,0
80007bca:	b549                	j	80007a4c <MiCo_Q1x2_MatMul+0x130>
80007bcc:	5779                	li	a4,-2
80007bce:	b77d                	j	80007b7c <MiCo_Q1x2_MatMul+0x260>
80007bd0:	5779                	li	a4,-2
80007bd2:	b7e9                	j	80007b9c <MiCo_Q1x2_MatMul+0x280>
80007bd4:	57f9                	li	a5,-2
80007bd6:	993e                	add	s2,s2,a5
80007bd8:	b7dd                	j	80007bbe <MiCo_Q1x2_MatMul+0x2a2>

80007bda <MiCo_time>:
80007bda:	a091                	j	80007c1e <time>

80007bdc <approx_sinf.constprop.0>:
80007bdc:	f0000553          	fmv.w.x	fa0,zero
80007be0:	8082                	ret

80007be2 <write_u32.constprop.0>:
80007be2:	100007b7          	lui	a5,0x10000
80007be6:	c388                	sw	a0,0(a5)
80007be8:	8082                	ret

80007bea <sim_putchar>:
80007bea:	1141                	addi	sp,sp,-16
80007bec:	c422                	sw	s0,8(sp)
80007bee:	c606                	sw	ra,12(sp)
80007bf0:	842a                	mv	s0,a0
80007bf2:	3fc5                	jal	80007be2 <write_u32.constprop.0>
80007bf4:	40b2                	lw	ra,12(sp)
80007bf6:	8522                	mv	a0,s0
80007bf8:	4422                	lw	s0,8(sp)
80007bfa:	0141                	addi	sp,sp,16
80007bfc:	8082                	ret

80007bfe <read_u32.constprop.0>:
80007bfe:	1001c7b7          	lui	a5,0x1001c
80007c02:	ff87a503          	lw	a0,-8(a5) # 1001bff8 <__stack_size+0xfc1bff8>
80007c06:	8082                	ret

80007c08 <sim_time>:
80007c08:	bfdd                	j	80007bfe <read_u32.constprop.0>

80007c0a <setStats>:
80007c0a:	8082                	ret

80007c0c <exit>:
80007c0c:	1141                	addi	sp,sp,-16
80007c0e:	c606                	sw	ra,12(sp)
80007c10:	c501                	beqz	a0,80007c18 <exit+0xc>
80007c12:	c56f80ef          	jal	ra,80000068 <fail>
80007c16:	a001                	j	80007c16 <exit+0xa>
80007c18:	c4cf80ef          	jal	ra,80000064 <pass>
80007c1c:	bfed                	j	80007c16 <exit+0xa>

80007c1e <time>:
80007c1e:	b7ed                	j	80007c08 <sim_time>

80007c20 <putchar>:
80007c20:	b7e9                	j	80007bea <sim_putchar>

80007c22 <printf_s>:
80007c22:	1141                	addi	sp,sp,-16
80007c24:	c422                	sw	s0,8(sp)
80007c26:	c606                	sw	ra,12(sp)
80007c28:	842a                	mv	s0,a0
80007c2a:	00054503          	lbu	a0,0(a0)
80007c2e:	c511                	beqz	a0,80007c3a <printf_s+0x18>
80007c30:	0405                	addi	s0,s0,1
80007c32:	37fd                	jal	80007c20 <putchar>
80007c34:	00044503          	lbu	a0,0(s0)
80007c38:	fd65                	bnez	a0,80007c30 <printf_s+0xe>
80007c3a:	40b2                	lw	ra,12(sp)
80007c3c:	4422                	lw	s0,8(sp)
80007c3e:	0141                	addi	sp,sp,16
80007c40:	8082                	ret

80007c42 <printf_c>:
80007c42:	bff9                	j	80007c20 <putchar>

80007c44 <printf_x>:
80007c44:	7179                	addi	sp,sp,-48
80007c46:	d422                	sw	s0,40(sp)
80007c48:	842a                	mv	s0,a0
80007c4a:	03000513          	li	a0,48
80007c4e:	d606                	sw	ra,44(sp)
80007c50:	d226                	sw	s1,36(sp)
80007c52:	d04a                	sw	s2,32(sp)
80007c54:	37fd                	jal	80007c42 <printf_c>
80007c56:	07800513          	li	a0,120
80007c5a:	37e5                	jal	80007c42 <printf_c>
80007c5c:	890a                	mv	s2,sp
80007c5e:	87ca                	mv	a5,s2
80007c60:	00f47713          	andi	a4,s0,15
80007c64:	45a5                	li	a1,9
80007c66:	863a                	mv	a2,a4
80007c68:	84be                	mv	s1,a5
80007c6a:	ec19                	bnez	s0,80007c88 <printf_x+0x44>
80007c6c:	02f91363          	bne	s2,a5,80007c92 <printf_x+0x4e>
80007c70:	4701                	li	a4,0
80007c72:	03070693          	addi	a3,a4,48
80007c76:	8011                	srli	s0,s0,0x4
80007c78:	00d78023          	sb	a3,0(a5)
80007c7c:	00f47713          	andi	a4,s0,15
80007c80:	0785                	addi	a5,a5,1
80007c82:	863a                	mv	a2,a4
80007c84:	84be                	mv	s1,a5
80007c86:	d07d                	beqz	s0,80007c6c <printf_x+0x28>
80007c88:	03770693          	addi	a3,a4,55
80007c8c:	fec5c5e3          	blt	a1,a2,80007c76 <printf_x+0x32>
80007c90:	b7cd                	j	80007c72 <printf_x+0x2e>
80007c92:	fff4c503          	lbu	a0,-1(s1)
80007c96:	14fd                	addi	s1,s1,-1
80007c98:	376d                	jal	80007c42 <printf_c>
80007c9a:	ff249ce3          	bne	s1,s2,80007c92 <printf_x+0x4e>
80007c9e:	50b2                	lw	ra,44(sp)
80007ca0:	5422                	lw	s0,40(sp)
80007ca2:	5492                	lw	s1,36(sp)
80007ca4:	5902                	lw	s2,32(sp)
80007ca6:	6145                	addi	sp,sp,48
80007ca8:	8082                	ret

80007caa <printf_d>:
80007caa:	7179                	addi	sp,sp,-48
80007cac:	d226                	sw	s1,36(sp)
80007cae:	d606                	sw	ra,44(sp)
80007cb0:	d422                	sw	s0,40(sp)
80007cb2:	d04a                	sw	s2,32(sp)
80007cb4:	84aa                	mv	s1,a0
80007cb6:	02054e63          	bltz	a0,80007cf2 <printf_d+0x48>
80007cba:	890a                	mv	s2,sp
80007cbc:	844a                	mv	s0,s2
80007cbe:	4729                	li	a4,10
80007cc0:	e099                	bnez	s1,80007cc6 <printf_d+0x1c>
80007cc2:	01241c63          	bne	s0,s2,80007cda <printf_d+0x30>
80007cc6:	02e4e7b3          	rem	a5,s1,a4
80007cca:	0405                	addi	s0,s0,1
80007ccc:	03078793          	addi	a5,a5,48
80007cd0:	02e4c4b3          	div	s1,s1,a4
80007cd4:	fef40fa3          	sb	a5,-1(s0)
80007cd8:	b7e5                	j	80007cc0 <printf_d+0x16>
80007cda:	fff44503          	lbu	a0,-1(s0)
80007cde:	147d                	addi	s0,s0,-1
80007ce0:	378d                	jal	80007c42 <printf_c>
80007ce2:	ff241ce3          	bne	s0,s2,80007cda <printf_d+0x30>
80007ce6:	50b2                	lw	ra,44(sp)
80007ce8:	5422                	lw	s0,40(sp)
80007cea:	5492                	lw	s1,36(sp)
80007cec:	5902                	lw	s2,32(sp)
80007cee:	6145                	addi	sp,sp,48
80007cf0:	8082                	ret
80007cf2:	02d00513          	li	a0,45
80007cf6:	37b1                	jal	80007c42 <printf_c>
80007cf8:	409004b3          	neg	s1,s1
80007cfc:	bf7d                	j	80007cba <printf_d+0x10>

80007cfe <printf>:
80007cfe:	7175                	addi	sp,sp,-144
80007d00:	c6de                	sw	s7,76(sp)
80007d02:	d686                	sw	ra,108(sp)
80007d04:	d4a2                	sw	s0,104(sp)
80007d06:	d2a6                	sw	s1,100(sp)
80007d08:	d0ca                	sw	s2,96(sp)
80007d0a:	cece                	sw	s3,92(sp)
80007d0c:	ccd2                	sw	s4,88(sp)
80007d0e:	cad6                	sw	s5,84(sp)
80007d10:	c8da                	sw	s6,80(sp)
80007d12:	c4e2                	sw	s8,72(sp)
80007d14:	c2e6                	sw	s9,68(sp)
80007d16:	c0ea                	sw	s10,64(sp)
80007d18:	de6e                	sw	s11,60(sp)
80007d1a:	8baa                	mv	s7,a0
80007d1c:	00054503          	lbu	a0,0(a0)
80007d20:	c33e                	sw	a5,132(sp)
80007d22:	18dc                	addi	a5,sp,116
80007d24:	daae                	sw	a1,116(sp)
80007d26:	dcb2                	sw	a2,120(sp)
80007d28:	deb6                	sw	a3,124(sp)
80007d2a:	c13a                	sw	a4,128(sp)
80007d2c:	c542                	sw	a6,136(sp)
80007d2e:	c746                	sw	a7,140(sp)
80007d30:	d63e                	sw	a5,44(sp)
80007d32:	c931                	beqz	a0,80007d86 <printf+0x88>
80007d34:	4d01                	li	s10,0
80007d36:	4d81                	li	s11,0
80007d38:	02500413          	li	s0,37
80007d3c:	06300493          	li	s1,99
80007d40:	07300913          	li	s2,115
80007d44:	06400993          	li	s3,100
80007d48:	07500a13          	li	s4,117
80007d4c:	06c00a93          	li	s5,108
80007d50:	00004c17          	auipc	s8,0x4
80007d54:	a28c0c13          	addi	s8,s8,-1496 # 8000b778 <__malloc_trim_threshold+0x8>
80007d58:	a819                	j	80007d6e <printf+0x70>
80007d5a:	000b4603          	lbu	a2,0(s6)
80007d5e:	e621                	bnez	a2,80007da6 <printf+0xa8>
80007d60:	0d09                	addi	s10,s10,2
80007d62:	8dea                	mv	s11,s10
80007d64:	01ab8b33          	add	s6,s7,s10
80007d68:	000b4503          	lbu	a0,0(s6)
80007d6c:	cd09                	beqz	a0,80007d86 <printf+0x88>
80007d6e:	001d0693          	addi	a3,s10,1
80007d72:	00db8b33          	add	s6,s7,a3
80007d76:	fe8502e3          	beq	a0,s0,80007d5a <printf+0x5c>
80007d7a:	8d36                	mv	s10,a3
80007d7c:	35d9                	jal	80007c42 <printf_c>
80007d7e:	000b4503          	lbu	a0,0(s6)
80007d82:	8dea                	mv	s11,s10
80007d84:	f56d                	bnez	a0,80007d6e <printf+0x70>
80007d86:	50b6                	lw	ra,108(sp)
80007d88:	5426                	lw	s0,104(sp)
80007d8a:	5496                	lw	s1,100(sp)
80007d8c:	5906                	lw	s2,96(sp)
80007d8e:	49f6                	lw	s3,92(sp)
80007d90:	4a66                	lw	s4,88(sp)
80007d92:	4ad6                	lw	s5,84(sp)
80007d94:	4b46                	lw	s6,80(sp)
80007d96:	4bb6                	lw	s7,76(sp)
80007d98:	4c26                	lw	s8,72(sp)
80007d9a:	4c96                	lw	s9,68(sp)
80007d9c:	4d06                	lw	s10,64(sp)
80007d9e:	5df2                	lw	s11,60(sp)
80007da0:	4501                	li	a0,0
80007da2:	6149                	addi	sp,sp,144
80007da4:	8082                	ret
80007da6:	0a960d63          	beq	a2,s1,80007e60 <printf+0x162>
80007daa:	0d260563          	beq	a2,s2,80007e74 <printf+0x176>
80007dae:	09360e63          	beq	a2,s3,80007e4a <printf+0x14c>
80007db2:	09460c63          	beq	a2,s4,80007e4a <printf+0x14c>
80007db6:	09560463          	beq	a2,s5,80007e3e <printf+0x140>
80007dba:	0f767713          	andi	a4,a2,247
80007dbe:	07000693          	li	a3,112
80007dc2:	0cd70663          	beq	a4,a3,80007e8e <printf+0x190>
80007dc6:	02e00713          	li	a4,46
80007dca:	0ce60c63          	beq	a2,a4,80007ea2 <printf+0x1a4>
80007dce:	0d09                	addi	s10,s10,2
80007dd0:	06600693          	li	a3,102
80007dd4:	8dea                	mv	s11,s10
80007dd6:	01ab8b33          	add	s6,s7,s10
80007dda:	f8d617e3          	bne	a2,a3,80007d68 <printf+0x6a>
80007dde:	4795                	li	a5,5
80007de0:	c83e                	sw	a5,16(sp)
80007de2:	55b2                	lw	a1,44(sp)
80007de4:	4601                	li	a2,0
80007de6:	4681                	li	a3,0
80007de8:	059d                	addi	a1,a1,7
80007dea:	99e1                	andi	a1,a1,-8
80007dec:	0005ae83          	lw	t4,0(a1)
80007df0:	0045ae03          	lw	t3,4(a1)
80007df4:	00858893          	addi	a7,a1,8
80007df8:	8576                	mv	a0,t4
80007dfa:	85f2                	mv	a1,t3
80007dfc:	c676                	sw	t4,12(sp)
80007dfe:	8cf2                	mv	s9,t3
80007e00:	d646                	sw	a7,44(sp)
80007e02:	71c010ef          	jal	ra,8000951e <__ledf2>
80007e06:	16054663          	bltz	a0,80007f72 <printf+0x274>
80007e0a:	4eb2                	lw	t4,12(sp)
80007e0c:	86e6                	mv	a3,s9
80007e0e:	85e6                	mv	a1,s9
80007e10:	8676                	mv	a2,t4
80007e12:	8576                	mv	a0,t4
80007e14:	5b8010ef          	jal	ra,800093cc <__eqdf2>
80007e18:	14051763          	bnez	a0,80007f66 <printf+0x268>
80007e1c:	4e32                	lw	t3,12(sp)
80007e1e:	000c2603          	lw	a2,0(s8)
80007e22:	004c2683          	lw	a3,4(s8)
80007e26:	8572                	mv	a0,t3
80007e28:	85e6                	mv	a1,s9
80007e2a:	646010ef          	jal	ra,80009470 <__gedf2>
80007e2e:	0aa05763          	blez	a0,80007edc <printf+0x1de>
80007e32:	00003517          	auipc	a0,0x3
80007e36:	cc650513          	addi	a0,a0,-826 # 8000aaf8 <MiCo_QMatMul+0x6c>
80007e3a:	33e5                	jal	80007c22 <printf_s>
80007e3c:	b735                	j	80007d68 <printf+0x6a>
80007e3e:	01bb8833          	add	a6,s7,s11
80007e42:	00284703          	lbu	a4,2(a6)
80007e46:	05370163          	beq	a4,s3,80007e88 <printf+0x18a>
80007e4a:	5732                	lw	a4,44(sp)
80007e4c:	00168d13          	addi	s10,a3,1
80007e50:	8dea                	mv	s11,s10
80007e52:	4308                	lw	a0,0(a4)
80007e54:	0711                	addi	a4,a4,4
80007e56:	d63a                	sw	a4,44(sp)
80007e58:	01ab8b33          	add	s6,s7,s10
80007e5c:	35b9                	jal	80007caa <printf_d>
80007e5e:	b729                	j	80007d68 <printf+0x6a>
80007e60:	5732                	lw	a4,44(sp)
80007e62:	0d09                	addi	s10,s10,2
80007e64:	8dea                	mv	s11,s10
80007e66:	4308                	lw	a0,0(a4)
80007e68:	0711                	addi	a4,a4,4
80007e6a:	d63a                	sw	a4,44(sp)
80007e6c:	01ab8b33          	add	s6,s7,s10
80007e70:	3bc9                	jal	80007c42 <printf_c>
80007e72:	bddd                	j	80007d68 <printf+0x6a>
80007e74:	5732                	lw	a4,44(sp)
80007e76:	0d09                	addi	s10,s10,2
80007e78:	8dea                	mv	s11,s10
80007e7a:	4308                	lw	a0,0(a4)
80007e7c:	0711                	addi	a4,a4,4
80007e7e:	d63a                	sw	a4,44(sp)
80007e80:	01ab8b33          	add	s6,s7,s10
80007e84:	3b79                	jal	80007c22 <printf_s>
80007e86:	b5cd                	j	80007d68 <printf+0x6a>
80007e88:	002d0693          	addi	a3,s10,2
80007e8c:	bf7d                	j	80007e4a <printf+0x14c>
80007e8e:	5732                	lw	a4,44(sp)
80007e90:	0d09                	addi	s10,s10,2
80007e92:	8dea                	mv	s11,s10
80007e94:	4308                	lw	a0,0(a4)
80007e96:	0711                	addi	a4,a4,4
80007e98:	d63a                	sw	a4,44(sp)
80007e9a:	01ab8b33          	add	s6,s7,s10
80007e9e:	335d                	jal	80007c44 <printf_x>
80007ea0:	b5e1                	j	80007d68 <printf+0x6a>
80007ea2:	002d0d93          	addi	s11,s10,2
80007ea6:	01bb8b33          	add	s6,s7,s11
80007eaa:	000b4683          	lbu	a3,0(s6)
80007eae:	4625                	li	a2,9
80007eb0:	fd068793          	addi	a5,a3,-48
80007eb4:	0ff7f593          	andi	a1,a5,255
80007eb8:	0cb66663          	bltu	a2,a1,80007f84 <printf+0x286>
80007ebc:	0d0d                	addi	s10,s10,3
80007ebe:	01ab8b33          	add	s6,s7,s10
80007ec2:	000b4683          	lbu	a3,0(s6)
80007ec6:	c83e                	sw	a5,16(sp)
80007ec8:	8dea                	mv	s11,s10
80007eca:	06600613          	li	a2,102
80007ece:	f0c69ae3          	bne	a3,a2,80007de2 <printf+0xe4>
80007ed2:	0d05                	addi	s10,s10,1
80007ed4:	8dea                	mv	s11,s10
80007ed6:	01ab8b33          	add	s6,s7,s10
80007eda:	b721                	j	80007de2 <printf+0xe4>
80007edc:	4632                	lw	a2,12(sp)
80007ede:	85e6                	mv	a1,s9
80007ee0:	8532                	mv	a0,a2
80007ee2:	53a020ef          	jal	ra,8000a41c <__fixdfsi>
80007ee6:	ca2a                	sw	a0,20(sp)
80007ee8:	33c9                	jal	80007caa <printf_d>
80007eea:	47c2                	lw	a5,16(sp)
80007eec:	e6078ee3          	beqz	a5,80007d68 <printf+0x6a>
80007ef0:	4552                	lw	a0,20(sp)
80007ef2:	5ee020ef          	jal	ra,8000a4e0 <__floatsidf>
80007ef6:	4732                	lw	a4,12(sp)
80007ef8:	862a                	mv	a2,a0
80007efa:	86ae                	mv	a3,a1
80007efc:	853a                	mv	a0,a4
80007efe:	85e6                	mv	a1,s9
80007f00:	469010ef          	jal	ra,80009b68 <__subdf3>
80007f04:	86aa                	mv	a3,a0
80007f06:	02e00513          	li	a0,46
80007f0a:	ca36                	sw	a3,20(sp)
80007f0c:	c62e                	sw	a1,12(sp)
80007f0e:	3b15                	jal	80007c42 <printf_c>
80007f10:	46d2                	lw	a3,20(sp)
80007f12:	47b2                	lw	a5,12(sp)
80007f14:	4881                	li	a7,0
80007f16:	85be                	mv	a1,a5
80007f18:	00004797          	auipc	a5,0x4
80007f1c:	86878793          	addi	a5,a5,-1944 # 8000b780 <__malloc_trim_threshold+0x10>
80007f20:	4390                	lw	a2,0(a5)
80007f22:	8536                	mv	a0,a3
80007f24:	43d4                	lw	a3,4(a5)
80007f26:	ce46                	sw	a7,28(sp)
80007f28:	6a4010ef          	jal	ra,800095cc <__muldf3>
80007f2c:	ca2e                	sw	a1,20(sp)
80007f2e:	cc2a                	sw	a0,24(sp)
80007f30:	4ec020ef          	jal	ra,8000a41c <__fixdfsi>
80007f34:	87aa                	mv	a5,a0
80007f36:	03050513          	addi	a0,a0,48
80007f3a:	c63e                	sw	a5,12(sp)
80007f3c:	3319                	jal	80007c42 <printf_c>
80007f3e:	47b2                	lw	a5,12(sp)
80007f40:	853e                	mv	a0,a5
80007f42:	59e020ef          	jal	ra,8000a4e0 <__floatsidf>
80007f46:	4ee2                	lw	t4,24(sp)
80007f48:	4e52                	lw	t3,20(sp)
80007f4a:	86ae                	mv	a3,a1
80007f4c:	862a                	mv	a2,a0
80007f4e:	85f2                	mv	a1,t3
80007f50:	8576                	mv	a0,t4
80007f52:	417010ef          	jal	ra,80009b68 <__subdf3>
80007f56:	48f2                	lw	a7,28(sp)
80007f58:	4742                	lw	a4,16(sp)
80007f5a:	86aa                	mv	a3,a0
80007f5c:	0885                	addi	a7,a7,1
80007f5e:	87ae                	mv	a5,a1
80007f60:	fb171be3          	bne	a4,a7,80007f16 <printf+0x218>
80007f64:	b511                	j	80007d68 <printf+0x6a>
80007f66:	00003517          	auipc	a0,0x3
80007f6a:	b8e50513          	addi	a0,a0,-1138 # 8000aaf4 <MiCo_QMatMul+0x68>
80007f6e:	3955                	jal	80007c22 <printf_s>
80007f70:	bbe5                	j	80007d68 <printf+0x6a>
80007f72:	02d00513          	li	a0,45
80007f76:	31f1                	jal	80007c42 <printf_c>
80007f78:	800006b7          	lui	a3,0x80000
80007f7c:	0196c7b3          	xor	a5,a3,s9
80007f80:	8cbe                	mv	s9,a5
80007f82:	b561                	j	80007e0a <printf+0x10c>
80007f84:	4795                	li	a5,5
80007f86:	8d6e                	mv	s10,s11
80007f88:	c83e                	sw	a5,16(sp)
80007f8a:	b781                	j	80007eca <printf+0x1cc>

80007f8c <time_stamp>:
80007f8c:	1141                	addi	sp,sp,-16
80007f8e:	c606                	sw	ra,12(sp)
80007f90:	c422                	sw	s0,8(sp)
80007f92:	c226                	sw	s1,4(sp)
80007f94:	3169                	jal	80007c1e <time>
80007f96:	00004497          	auipc	s1,0x4
80007f9a:	87248493          	addi	s1,s1,-1934 # 8000b808 <last_time.1>
80007f9e:	408c                	lw	a1,0(s1)
80007fa0:	842a                	mv	s0,a0
80007fa2:	00003517          	auipc	a0,0x3
80007fa6:	b5a50513          	addi	a0,a0,-1190 # 8000aafc <MiCo_QMatMul+0x70>
80007faa:	40b405b3          	sub	a1,s0,a1
80007fae:	3b81                	jal	80007cfe <printf>
80007fb0:	40b2                	lw	ra,12(sp)
80007fb2:	c080                	sw	s0,0(s1)
80007fb4:	4422                	lw	s0,8(sp)
80007fb6:	4492                	lw	s1,4(sp)
80007fb8:	0141                	addi	sp,sp,16
80007fba:	8082                	ret

80007fbc <puts>:
80007fbc:	1141                	addi	sp,sp,-16
80007fbe:	c422                	sw	s0,8(sp)
80007fc0:	c606                	sw	ra,12(sp)
80007fc2:	842a                	mv	s0,a0
80007fc4:	00054503          	lbu	a0,0(a0)
80007fc8:	c511                	beqz	a0,80007fd4 <puts+0x18>
80007fca:	0405                	addi	s0,s0,1
80007fcc:	3991                	jal	80007c20 <putchar>
80007fce:	00044503          	lbu	a0,0(s0)
80007fd2:	fd65                	bnez	a0,80007fca <puts+0xe>
80007fd4:	4529                	li	a0,10
80007fd6:	31a9                	jal	80007c20 <putchar>
80007fd8:	40b2                	lw	ra,12(sp)
80007fda:	4422                	lw	s0,8(sp)
80007fdc:	4501                	li	a0,0
80007fde:	0141                	addi	sp,sp,16
80007fe0:	8082                	ret

80007fe2 <sprintf>:
80007fe2:	7179                	addi	sp,sp,-48
80007fe4:	0005c303          	lbu	t1,0(a1)
80007fe8:	01810e13          	addi	t3,sp,24
80007fec:	cc32                	sw	a2,24(sp)
80007fee:	ce36                	sw	a3,28(sp)
80007ff0:	d03a                	sw	a4,32(sp)
80007ff2:	d23e                	sw	a5,36(sp)
80007ff4:	d442                	sw	a6,40(sp)
80007ff6:	d646                	sw	a7,44(sp)
80007ff8:	c672                	sw	t3,12(sp)
80007ffa:	02030363          	beqz	t1,80008020 <sprintf+0x3e>
80007ffe:	4781                	li	a5,0
80008000:	02500813          	li	a6,37
80008004:	07300613          	li	a2,115
80008008:	03030163          	beq	t1,a6,8000802a <sprintf+0x48>
8000800c:	00650023          	sb	t1,0(a0)
80008010:	0505                	addi	a0,a0,1
80008012:	0785                	addi	a5,a5,1
80008014:	00f58733          	add	a4,a1,a5
80008018:	00074303          	lbu	t1,0(a4)
8000801c:	fe0316e3          	bnez	t1,80008008 <sprintf+0x26>
80008020:	00050023          	sb	zero,0(a0)
80008024:	4501                	li	a0,0
80008026:	6145                	addi	sp,sp,48
80008028:	8082                	ret
8000802a:	0785                	addi	a5,a5,1
8000802c:	00f58733          	add	a4,a1,a5
80008030:	00074703          	lbu	a4,0(a4)
80008034:	df79                	beqz	a4,80008012 <sprintf+0x30>
80008036:	fec71ae3          	bne	a4,a2,8000802a <sprintf+0x48>
8000803a:	000e2683          	lw	a3,0(t3)
8000803e:	0e11                	addi	t3,t3,4
80008040:	0006c703          	lbu	a4,0(a3) # 80000000 <__freertos_irq_stack_top+0xffbec7b0>
80008044:	d779                	beqz	a4,80008012 <sprintf+0x30>
80008046:	00e50023          	sb	a4,0(a0)
8000804a:	0016c703          	lbu	a4,1(a3)
8000804e:	0505                	addi	a0,a0,1
80008050:	0685                	addi	a3,a3,1
80008052:	fb75                	bnez	a4,80008046 <sprintf+0x64>
80008054:	bf7d                	j	80008012 <sprintf+0x30>

80008056 <__divdi3>:
80008056:	8e2a                	mv	t3,a0
80008058:	88ae                	mv	a7,a1
8000805a:	4781                	li	a5,0
8000805c:	4701                	li	a4,0
8000805e:	0206c163          	bltz	a3,80008080 <__divdi3+0x2a>
80008062:	00178313          	addi	t1,a5,1
80008066:	01f65813          	srli	a6,a2,0x1f
8000806a:	00f33533          	sltu	a0,t1,a5
8000806e:	00169593          	slli	a1,a3,0x1
80008072:	00b866b3          	or	a3,a6,a1
80008076:	0606                	slli	a2,a2,0x1
80008078:	879a                	mv	a5,t1
8000807a:	972a                	add	a4,a4,a0
8000807c:	fe05d3e3          	bgez	a1,80008062 <__divdi3+0xc>
80008080:	011e65b3          	or	a1,t3,a7
80008084:	cdc1                	beqz	a1,8000811c <__divdi3+0xc6>
80008086:	1101                	addi	sp,sp,-32
80008088:	c25a                	sw	s6,4(sp)
8000808a:	ce22                	sw	s0,28(sp)
8000808c:	cc26                	sw	s1,24(sp)
8000808e:	ca4a                	sw	s2,20(sp)
80008090:	c84e                	sw	s3,16(sp)
80008092:	c652                	sw	s4,12(sp)
80008094:	c456                	sw	s5,8(sp)
80008096:	4501                	li	a0,0
80008098:	4581                	li	a1,0
8000809a:	4b05                	li	s6,1
8000809c:	00e7e833          	or	a6,a5,a4
800080a0:	01f69f13          	slli	t5,a3,0x1f
800080a4:	0017b293          	seqz	t0,a5
800080a8:	00165f93          	srli	t6,a2,0x1
800080ac:	04d8ef63          	bltu	a7,a3,8000810a <__divdi3+0xb4>
800080b0:	40ce0eb3          	sub	t4,t3,a2
800080b4:	00fb1333          	sll	t1,s6,a5
800080b8:	01de34b3          	sltu	s1,t3,t4
800080bc:	40d88933          	sub	s2,a7,a3
800080c0:	83c2                	mv	t2,a6
800080c2:	41f35413          	srai	s0,t1,0x1f
800080c6:	8afa                	mv	s5,t5
800080c8:	8996                	mv	s3,t0
800080ca:	8a7e                	mv	s4,t6
800080cc:	01169463          	bne	a3,a7,800080d4 <__divdi3+0x7e>
800080d0:	02ce6d63          	bltu	t3,a2,8000810a <__divdi3+0xb4>
800080d4:	409908b3          	sub	a7,s2,s1
800080d8:	8e76                	mv	t3,t4
800080da:	011ee833          	or	a6,t4,a7
800080de:	00656533          	or	a0,a0,t1
800080e2:	8dc1                	or	a1,a1,s0
800080e4:	00038a63          	beqz	t2,800080f8 <__divdi3+0xa2>
800080e8:	014ae633          	or	a2,s5,s4
800080ec:	8285                	srli	a3,a3,0x1
800080ee:	17fd                	addi	a5,a5,-1
800080f0:	41370733          	sub	a4,a4,s3
800080f4:	fa0814e3          	bnez	a6,8000809c <__divdi3+0x46>
800080f8:	4472                	lw	s0,28(sp)
800080fa:	44e2                	lw	s1,24(sp)
800080fc:	4952                	lw	s2,20(sp)
800080fe:	49c2                	lw	s3,16(sp)
80008100:	4a32                	lw	s4,12(sp)
80008102:	4aa2                	lw	s5,8(sp)
80008104:	4b12                	lw	s6,4(sp)
80008106:	6105                	addi	sp,sp,32
80008108:	8082                	ret
8000810a:	fe0807e3          	beqz	a6,800080f8 <__divdi3+0xa2>
8000810e:	01ff6633          	or	a2,t5,t6
80008112:	8285                	srli	a3,a3,0x1
80008114:	17fd                	addi	a5,a5,-1
80008116:	40570733          	sub	a4,a4,t0
8000811a:	b749                	j	8000809c <__divdi3+0x46>
8000811c:	8572                	mv	a0,t3
8000811e:	85c6                	mv	a1,a7
80008120:	8082                	ret

80008122 <__unordsf2>:
80008122:	e00507d3          	fmv.x.w	a5,fa0
80008126:	1141                	addi	sp,sp,-16
80008128:	7f800737          	lui	a4,0x7f800
8000812c:	e42e                	fsw	fa1,8(sp)
8000812e:	00e7f6b3          	and	a3,a5,a4
80008132:	00e68f63          	beq	a3,a4,80008150 <__unordsf2+0x2e>
80008136:	47a2                	lw	a5,8(sp)
80008138:	7f800737          	lui	a4,0x7f800
8000813c:	4501                	li	a0,0
8000813e:	00e7f6b3          	and	a3,a5,a4
80008142:	00e69563          	bne	a3,a4,8000814c <__unordsf2+0x2a>
80008146:	07a6                	slli	a5,a5,0x9
80008148:	00f03533          	snez	a0,a5
8000814c:	0141                	addi	sp,sp,16
8000814e:	8082                	ret
80008150:	07a6                	slli	a5,a5,0x9
80008152:	4505                	li	a0,1
80008154:	d3ed                	beqz	a5,80008136 <__unordsf2+0x14>
80008156:	0141                	addi	sp,sp,16
80008158:	8082                	ret

8000815a <_sbrk>:
8000815a:	00003717          	auipc	a4,0x3
8000815e:	6aa70713          	addi	a4,a4,1706 # 8000b804 <heap_end.0>
80008162:	431c                	lw	a5,0(a4)
80008164:	c38d                	beqz	a5,80008186 <_sbrk+0x2c>
80008166:	0000b617          	auipc	a2,0xb
8000816a:	6e260613          	addi	a2,a2,1762 # 80013848 <_end>
8000816e:	40c78633          	sub	a2,a5,a2
80008172:	00c505b3          	add	a1,a0,a2
80008176:	004006b7          	lui	a3,0x400
8000817a:	02b6c163          	blt	a3,a1,8000819c <_sbrk+0x42>
8000817e:	953e                	add	a0,a0,a5
80008180:	c308                	sw	a0,0(a4)
80008182:	853e                	mv	a0,a5
80008184:	8082                	ret
80008186:	0000b797          	auipc	a5,0xb
8000818a:	6c278793          	addi	a5,a5,1730 # 80013848 <_end>
8000818e:	c31c                	sw	a5,0(a4)
80008190:	85aa                	mv	a1,a0
80008192:	004006b7          	lui	a3,0x400
80008196:	4601                	li	a2,0
80008198:	feb6d3e3          	bge	a3,a1,8000817e <_sbrk+0x24>
8000819c:	1141                	addi	sp,sp,-16
8000819e:	85aa                	mv	a1,a0
800081a0:	00003517          	auipc	a0,0x3
800081a4:	96850513          	addi	a0,a0,-1688 # 8000ab08 <MiCo_QMatMul+0x7c>
800081a8:	c606                	sw	ra,12(sp)
800081aa:	3e91                	jal	80007cfe <printf>
800081ac:	40b2                	lw	ra,12(sp)
800081ae:	57fd                	li	a5,-1
800081b0:	853e                	mv	a0,a5
800081b2:	0141                	addi	sp,sp,16
800081b4:	8082                	ret

800081b6 <bsearch>:
800081b6:	1101                	addi	sp,sp,-32
800081b8:	cc22                	sw	s0,24(sp)
800081ba:	c64e                	sw	s3,12(sp)
800081bc:	c452                	sw	s4,8(sp)
800081be:	c256                	sw	s5,4(sp)
800081c0:	c05a                	sw	s6,0(sp)
800081c2:	ce06                	sw	ra,28(sp)
800081c4:	ca26                	sw	s1,20(sp)
800081c6:	c84a                	sw	s2,16(sp)
800081c8:	8432                	mv	s0,a2
800081ca:	8b2a                	mv	s6,a0
800081cc:	8a2e                	mv	s4,a1
800081ce:	89b6                	mv	s3,a3
800081d0:	8aba                	mv	s5,a4
800081d2:	c20d                	beqz	a2,800081f4 <bsearch+0x3e>
800081d4:	00145913          	srli	s2,s0,0x1
800081d8:	033904b3          	mul	s1,s2,s3
800081dc:	855a                	mv	a0,s6
800081de:	147d                	addi	s0,s0,-1
800081e0:	8005                	srli	s0,s0,0x1
800081e2:	94d2                	add	s1,s1,s4
800081e4:	85a6                	mv	a1,s1
800081e6:	9a82                	jalr	s5
800081e8:	c519                	beqz	a0,800081f6 <bsearch+0x40>
800081ea:	02a05163          	blez	a0,8000820c <bsearch+0x56>
800081ee:	01348a33          	add	s4,s1,s3
800081f2:	f06d                	bnez	s0,800081d4 <bsearch+0x1e>
800081f4:	4481                	li	s1,0
800081f6:	40f2                	lw	ra,28(sp)
800081f8:	4462                	lw	s0,24(sp)
800081fa:	4942                	lw	s2,16(sp)
800081fc:	49b2                	lw	s3,12(sp)
800081fe:	4a22                	lw	s4,8(sp)
80008200:	4a92                	lw	s5,4(sp)
80008202:	4b02                	lw	s6,0(sp)
80008204:	8526                	mv	a0,s1
80008206:	44d2                	lw	s1,20(sp)
80008208:	6105                	addi	sp,sp,32
8000820a:	8082                	ret
8000820c:	fe0904e3          	beqz	s2,800081f4 <bsearch+0x3e>
80008210:	844a                	mv	s0,s2
80008212:	b7c9                	j	800081d4 <bsearch+0x1e>

80008214 <approx_sinf>:
80008214:	f0000553          	fmv.w.x	fa0,zero
80008218:	8082                	ret

8000821a <approx_cosf>:
8000821a:	b2c9                	j	80007bdc <approx_sinf.constprop.0>

8000821c <check>:
8000821c:	1101                	addi	sp,sp,-32
8000821e:	cc22                	sw	s0,24(sp)
80008220:	ca26                	sw	s1,20(sp)
80008222:	c84a                	sw	s2,16(sp)
80008224:	c64e                	sw	s3,12(sp)
80008226:	c452                	sw	s4,8(sp)
80008228:	ce06                	sw	ra,28(sp)
8000822a:	84aa                	mv	s1,a0
8000822c:	842e                	mv	s0,a1
8000822e:	4981                	li	s3,0
80008230:	4901                	li	s2,0
80008232:	00003a17          	auipc	s4,0x3
80008236:	a46a0a13          	addi	s4,s4,-1466 # 8000ac78 <MiCo_QMatMul+0x1ec>
8000823a:	4094                	lw	a3,0(s1)
8000823c:	4018                	lw	a4,0(s0)
8000823e:	00e68863          	beq	a3,a4,8000824e <check+0x32>
80008242:	4601                	li	a2,0
80008244:	85ce                	mv	a1,s3
80008246:	8552                	mv	a0,s4
80008248:	0905                	addi	s2,s2,1
8000824a:	ab5ff0ef          	jal	ra,80007cfe <printf>
8000824e:	40d4                	lw	a3,4(s1)
80008250:	4058                	lw	a4,4(s0)
80008252:	00e68863          	beq	a3,a4,80008262 <check+0x46>
80008256:	4605                	li	a2,1
80008258:	85ce                	mv	a1,s3
8000825a:	8552                	mv	a0,s4
8000825c:	0905                	addi	s2,s2,1
8000825e:	aa1ff0ef          	jal	ra,80007cfe <printf>
80008262:	4494                	lw	a3,8(s1)
80008264:	4418                	lw	a4,8(s0)
80008266:	00e68863          	beq	a3,a4,80008276 <check+0x5a>
8000826a:	4609                	li	a2,2
8000826c:	85ce                	mv	a1,s3
8000826e:	8552                	mv	a0,s4
80008270:	0905                	addi	s2,s2,1
80008272:	a8dff0ef          	jal	ra,80007cfe <printf>
80008276:	44d4                	lw	a3,12(s1)
80008278:	4458                	lw	a4,12(s0)
8000827a:	00e68863          	beq	a3,a4,8000828a <check+0x6e>
8000827e:	460d                	li	a2,3
80008280:	85ce                	mv	a1,s3
80008282:	8552                	mv	a0,s4
80008284:	0905                	addi	s2,s2,1
80008286:	a79ff0ef          	jal	ra,80007cfe <printf>
8000828a:	4894                	lw	a3,16(s1)
8000828c:	4818                	lw	a4,16(s0)
8000828e:	00e68863          	beq	a3,a4,8000829e <check+0x82>
80008292:	4611                	li	a2,4
80008294:	85ce                	mv	a1,s3
80008296:	8552                	mv	a0,s4
80008298:	0905                	addi	s2,s2,1
8000829a:	a65ff0ef          	jal	ra,80007cfe <printf>
8000829e:	48d4                	lw	a3,20(s1)
800082a0:	4858                	lw	a4,20(s0)
800082a2:	00e68863          	beq	a3,a4,800082b2 <check+0x96>
800082a6:	4615                	li	a2,5
800082a8:	85ce                	mv	a1,s3
800082aa:	8552                	mv	a0,s4
800082ac:	0905                	addi	s2,s2,1
800082ae:	a51ff0ef          	jal	ra,80007cfe <printf>
800082b2:	4c94                	lw	a3,24(s1)
800082b4:	4c18                	lw	a4,24(s0)
800082b6:	00e68863          	beq	a3,a4,800082c6 <check+0xaa>
800082ba:	4619                	li	a2,6
800082bc:	85ce                	mv	a1,s3
800082be:	8552                	mv	a0,s4
800082c0:	0905                	addi	s2,s2,1
800082c2:	a3dff0ef          	jal	ra,80007cfe <printf>
800082c6:	4cd4                	lw	a3,28(s1)
800082c8:	4c58                	lw	a4,28(s0)
800082ca:	00e68863          	beq	a3,a4,800082da <check+0xbe>
800082ce:	461d                	li	a2,7
800082d0:	85ce                	mv	a1,s3
800082d2:	8552                	mv	a0,s4
800082d4:	0905                	addi	s2,s2,1
800082d6:	a29ff0ef          	jal	ra,80007cfe <printf>
800082da:	5094                	lw	a3,32(s1)
800082dc:	5018                	lw	a4,32(s0)
800082de:	00e68863          	beq	a3,a4,800082ee <check+0xd2>
800082e2:	4621                	li	a2,8
800082e4:	85ce                	mv	a1,s3
800082e6:	8552                	mv	a0,s4
800082e8:	0905                	addi	s2,s2,1
800082ea:	a15ff0ef          	jal	ra,80007cfe <printf>
800082ee:	50d4                	lw	a3,36(s1)
800082f0:	5058                	lw	a4,36(s0)
800082f2:	00e68863          	beq	a3,a4,80008302 <check+0xe6>
800082f6:	4625                	li	a2,9
800082f8:	85ce                	mv	a1,s3
800082fa:	8552                	mv	a0,s4
800082fc:	0905                	addi	s2,s2,1
800082fe:	a01ff0ef          	jal	ra,80007cfe <printf>
80008302:	5494                	lw	a3,40(s1)
80008304:	5418                	lw	a4,40(s0)
80008306:	00e68863          	beq	a3,a4,80008316 <check+0xfa>
8000830a:	4629                	li	a2,10
8000830c:	85ce                	mv	a1,s3
8000830e:	8552                	mv	a0,s4
80008310:	0905                	addi	s2,s2,1
80008312:	9edff0ef          	jal	ra,80007cfe <printf>
80008316:	54d4                	lw	a3,44(s1)
80008318:	5458                	lw	a4,44(s0)
8000831a:	00e68863          	beq	a3,a4,8000832a <check+0x10e>
8000831e:	462d                	li	a2,11
80008320:	85ce                	mv	a1,s3
80008322:	8552                	mv	a0,s4
80008324:	0905                	addi	s2,s2,1
80008326:	9d9ff0ef          	jal	ra,80007cfe <printf>
8000832a:	5894                	lw	a3,48(s1)
8000832c:	5818                	lw	a4,48(s0)
8000832e:	00e68863          	beq	a3,a4,8000833e <check+0x122>
80008332:	4631                	li	a2,12
80008334:	85ce                	mv	a1,s3
80008336:	8552                	mv	a0,s4
80008338:	0905                	addi	s2,s2,1
8000833a:	9c5ff0ef          	jal	ra,80007cfe <printf>
8000833e:	58d4                	lw	a3,52(s1)
80008340:	5858                	lw	a4,52(s0)
80008342:	00e68863          	beq	a3,a4,80008352 <check+0x136>
80008346:	4635                	li	a2,13
80008348:	85ce                	mv	a1,s3
8000834a:	8552                	mv	a0,s4
8000834c:	0905                	addi	s2,s2,1
8000834e:	9b1ff0ef          	jal	ra,80007cfe <printf>
80008352:	5c94                	lw	a3,56(s1)
80008354:	5c18                	lw	a4,56(s0)
80008356:	00e68863          	beq	a3,a4,80008366 <check+0x14a>
8000835a:	4639                	li	a2,14
8000835c:	85ce                	mv	a1,s3
8000835e:	8552                	mv	a0,s4
80008360:	0905                	addi	s2,s2,1
80008362:	99dff0ef          	jal	ra,80007cfe <printf>
80008366:	5cd4                	lw	a3,60(s1)
80008368:	5c58                	lw	a4,60(s0)
8000836a:	00e68863          	beq	a3,a4,8000837a <check+0x15e>
8000836e:	463d                	li	a2,15
80008370:	85ce                	mv	a1,s3
80008372:	8552                	mv	a0,s4
80008374:	0905                	addi	s2,s2,1
80008376:	989ff0ef          	jal	ra,80007cfe <printf>
8000837a:	0985                	addi	s3,s3,1
8000837c:	4791                	li	a5,4
8000837e:	04048493          	addi	s1,s1,64
80008382:	04040413          	addi	s0,s0,64
80008386:	eaf99ae3          	bne	s3,a5,8000823a <check+0x1e>
8000838a:	40f2                	lw	ra,28(sp)
8000838c:	4462                	lw	s0,24(sp)
8000838e:	44d2                	lw	s1,20(sp)
80008390:	49b2                	lw	s3,12(sp)
80008392:	4a22                	lw	s4,8(sp)
80008394:	854a                	mv	a0,s2
80008396:	4942                	lw	s2,16(sp)
80008398:	6105                	addi	sp,sp,32
8000839a:	8082                	ret

8000839c <test_func>:
8000839c:	1101                	addi	sp,sp,-32
8000839e:	ce06                	sw	ra,28(sp)
800083a0:	cc22                	sw	s0,24(sp)
800083a2:	ca26                	sw	s1,20(sp)
800083a4:	842a                	mv	s0,a0
800083a6:	84ae                	mv	s1,a1
800083a8:	c84a                	sw	s2,16(sp)
800083aa:	c64e                	sw	s3,12(sp)
800083ac:	8932                	mv	s2,a2
800083ae:	89b6                	mv	s3,a3
800083b0:	c452                	sw	s4,8(sp)
800083b2:	c256                	sw	s5,4(sp)
800083b4:	c05a                	sw	s6,0(sp)
800083b6:	8abe                	mv	s5,a5
800083b8:	8b3a                	mv	s6,a4
800083ba:	821ff0ef          	jal	ra,80007bda <MiCo_time>
800083be:	864e                	mv	a2,s3
800083c0:	85ca                	mv	a1,s2
800083c2:	8a2a                	mv	s4,a0
800083c4:	8522                	mv	a0,s0
800083c6:	9b02                	jalr	s6
800083c8:	813ff0ef          	jal	ra,80007bda <MiCo_time>
800083cc:	41450a33          	sub	s4,a0,s4
800083d0:	85d2                	mv	a1,s4
800083d2:	00003517          	auipc	a0,0x3
800083d6:	8c650513          	addi	a0,a0,-1850 # 8000ac98 <MiCo_QMatMul+0x20c>
800083da:	925ff0ef          	jal	ra,80007cfe <printf>
800083de:	ffcff0ef          	jal	ra,80007bda <MiCo_time>
800083e2:	872a                	mv	a4,a0
800083e4:	864e                	mv	a2,s3
800083e6:	85ca                	mv	a1,s2
800083e8:	8526                	mv	a0,s1
800083ea:	893a                	mv	s2,a4
800083ec:	9a82                	jalr	s5
800083ee:	fecff0ef          	jal	ra,80007bda <MiCo_time>
800083f2:	41250933          	sub	s2,a0,s2
800083f6:	85ca                	mv	a1,s2
800083f8:	00003517          	auipc	a0,0x3
800083fc:	8bc50513          	addi	a0,a0,-1860 # 8000acb4 <MiCo_QMatMul+0x228>
80008400:	8ffff0ef          	jal	ra,80007cfe <printf>
80008404:	8522                	mv	a0,s0
80008406:	85a6                	mv	a1,s1
80008408:	3d11                	jal	8000821c <check>
8000840a:	842a                	mv	s0,a0
8000840c:	e131                	bnez	a0,80008450 <test_func+0xb4>
8000840e:	00003517          	auipc	a0,0x3
80008412:	8c650513          	addi	a0,a0,-1850 # 8000acd4 <MiCo_QMatMul+0x248>
80008416:	8e9ff0ef          	jal	ra,80007cfe <printf>
8000841a:	d00977d3          	fcvt.s.w	fa5,s2
8000841e:	d00a7553          	fcvt.s.w	fa0,s4
80008422:	18f57553          	fdiv.s	fa0,fa0,fa5
80008426:	120020ef          	jal	ra,8000a546 <__extendsfdf2>
8000842a:	862a                	mv	a2,a0
8000842c:	86ae                	mv	a3,a1
8000842e:	00003517          	auipc	a0,0x3
80008432:	8b650513          	addi	a0,a0,-1866 # 8000ace4 <MiCo_QMatMul+0x258>
80008436:	8c9ff0ef          	jal	ra,80007cfe <printf>
8000843a:	40f2                	lw	ra,28(sp)
8000843c:	8522                	mv	a0,s0
8000843e:	4462                	lw	s0,24(sp)
80008440:	44d2                	lw	s1,20(sp)
80008442:	4942                	lw	s2,16(sp)
80008444:	49b2                	lw	s3,12(sp)
80008446:	4a22                	lw	s4,8(sp)
80008448:	4a92                	lw	s5,4(sp)
8000844a:	4b02                	lw	s6,0(sp)
8000844c:	6105                	addi	sp,sp,32
8000844e:	8082                	ret
80008450:	85aa                	mv	a1,a0
80008452:	00003517          	auipc	a0,0x3
80008456:	8a250513          	addi	a0,a0,-1886 # 8000acf4 <MiCo_QMatMul+0x268>
8000845a:	8a5ff0ef          	jal	ra,80007cfe <printf>
8000845e:	547d                	li	s0,-1
80008460:	bfe9                	j	8000843a <test_func+0x9e>

80008462 <expf>:
80008462:	1101                	addi	sp,sp,-32
80008464:	e622                	fsw	fs0,12(sp)
80008466:	e426                	fsw	fs1,8(sp)
80008468:	20a50453          	fmv.s	fs0,fa0
8000846c:	ce06                	sw	ra,28(sp)
8000846e:	284d                	jal	80008520 <__ieee754_expf>
80008470:	00003717          	auipc	a4,0x3
80008474:	39c72703          	lw	a4,924(a4) # 8000b80c <__fdlib_version>
80008478:	57fd                	li	a5,-1
8000847a:	20a504d3          	fmv.s	fs1,fa0
8000847e:	02f70463          	beq	a4,a5,800084a6 <expf+0x44>
80008482:	20840553          	fmv.s	fa0,fs0
80008486:	2e4d                	jal	80008838 <finitef>
80008488:	cd19                	beqz	a0,800084a6 <expf+0x44>
8000848a:	00003797          	auipc	a5,0x3
8000848e:	3167a787          	flw	fa5,790(a5) # 8000b7a0 <__malloc_trim_threshold+0x30>
80008492:	a08797d3          	flt.s	a5,fa5,fs0
80008496:	e795                	bnez	a5,800084c2 <expf+0x60>
80008498:	00003797          	auipc	a5,0x3
8000849c:	30c7a787          	flw	fa5,780(a5) # 8000b7a4 <__malloc_trim_threshold+0x34>
800084a0:	a0f417d3          	flt.s	a5,fs0,fa5
800084a4:	eb81                	bnez	a5,800084b4 <expf+0x52>
800084a6:	40f2                	lw	ra,28(sp)
800084a8:	20948553          	fmv.s	fa0,fs1
800084ac:	6432                	flw	fs0,12(sp)
800084ae:	64a2                	flw	fs1,8(sp)
800084b0:	6105                	addi	sp,sp,32
800084b2:	8082                	ret
800084b4:	2e59                	jal	8000884a <__errno>
800084b6:	02200793          	li	a5,34
800084ba:	f00004d3          	fmv.w.x	fs1,zero
800084be:	c11c                	sw	a5,0(a0)
800084c0:	b7dd                	j	800084a6 <expf+0x44>
800084c2:	2661                	jal	8000884a <__errno>
800084c4:	02200793          	li	a5,34
800084c8:	c11c                	sw	a5,0(a0)
800084ca:	00003797          	auipc	a5,0x3
800084ce:	2d27a487          	flw	fs1,722(a5) # 8000b79c <__malloc_trim_threshold+0x2c>
800084d2:	bfd1                	j	800084a6 <expf+0x44>

800084d4 <sqrtf>:
800084d4:	1101                	addi	sp,sp,-32
800084d6:	e622                	fsw	fs0,12(sp)
800084d8:	ce06                	sw	ra,28(sp)
800084da:	20a50453          	fmv.s	fs0,fa0
800084de:	e426                	fsw	fs1,8(sp)
800084e0:	2c41                	jal	80008770 <__ieee754_sqrtf>
800084e2:	00003717          	auipc	a4,0x3
800084e6:	32a72703          	lw	a4,810(a4) # 8000b80c <__fdlib_version>
800084ea:	57fd                	li	a5,-1
800084ec:	00f70a63          	beq	a4,a5,80008500 <sqrtf+0x2c>
800084f0:	a08427d3          	feq.s	a5,fs0,fs0
800084f4:	c791                	beqz	a5,80008500 <sqrtf+0x2c>
800084f6:	f00004d3          	fmv.w.x	fs1,zero
800084fa:	a09417d3          	flt.s	a5,fs0,fs1
800084fe:	e791                	bnez	a5,8000850a <sqrtf+0x36>
80008500:	40f2                	lw	ra,28(sp)
80008502:	6432                	flw	fs0,12(sp)
80008504:	64a2                	flw	fs1,8(sp)
80008506:	6105                	addi	sp,sp,32
80008508:	8082                	ret
8000850a:	2681                	jal	8000884a <__errno>
8000850c:	40f2                	lw	ra,28(sp)
8000850e:	02100793          	li	a5,33
80008512:	c11c                	sw	a5,0(a0)
80008514:	1894f553          	fdiv.s	fa0,fs1,fs1
80008518:	6432                	flw	fs0,12(sp)
8000851a:	64a2                	flw	fs1,8(sp)
8000851c:	6105                	addi	sp,sp,32
8000851e:	8082                	ret

80008520 <__ieee754_expf>:
80008520:	e00507d3          	fmv.x.w	a5,fa0
80008524:	7f800637          	lui	a2,0x7f800
80008528:	00179713          	slli	a4,a5,0x1
8000852c:	8305                	srli	a4,a4,0x1
8000852e:	0ee66663          	bltu	a2,a4,8000861a <__ieee754_expf+0xfa>
80008532:	01f7d513          	srli	a0,a5,0x1f
80008536:	18c70c63          	beq	a4,a2,800086ce <__ieee754_expf+0x1ae>
8000853a:	42b17637          	lui	a2,0x42b17
8000853e:	21760613          	addi	a2,a2,535 # 42b17217 <__stack_size+0x42717217>
80008542:	0ef64363          	blt	a2,a5,80008628 <__ieee754_expf+0x108>
80008546:	1607cb63          	bltz	a5,800086bc <__ieee754_expf+0x19c>
8000854a:	3eb176b7          	lui	a3,0x3eb17
8000854e:	21868693          	addi	a3,a3,536 # 3eb17218 <__stack_size+0x3e717218>
80008552:	0ee6f663          	bgeu	a3,a4,8000863e <__ieee754_expf+0x11e>
80008556:	3f8516b7          	lui	a3,0x3f851
8000855a:	59168693          	addi	a3,a3,1425 # 3f851591 <__stack_size+0x3f451591>
8000855e:	1ce6e363          	bltu	a3,a4,80008724 <__ieee754_expf+0x204>
80008562:	00251613          	slli	a2,a0,0x2
80008566:	00003717          	auipc	a4,0x3
8000856a:	27670713          	addi	a4,a4,630 # 8000b7dc <ln2HI>
8000856e:	9732                	add	a4,a4,a2
80008570:	6310                	flw	fa2,0(a4)
80008572:	f00787d3          	fmv.w.x	fa5,a5
80008576:	00003697          	auipc	a3,0x3
8000857a:	25e68693          	addi	a3,a3,606 # 8000b7d4 <ln2LO>
8000857e:	96b2                	add	a3,a3,a2
80008580:	08c7f653          	fsub.s	fa2,fa5,fa2
80008584:	4705                	li	a4,1
80008586:	629c                	flw	fa5,0(a3)
80008588:	8f09                	sub	a4,a4,a0
8000858a:	8f09                	sub	a4,a4,a0
8000858c:	08f67753          	fsub.s	fa4,fa2,fa5
80008590:	00003697          	auipc	a3,0x3
80008594:	22c6a087          	flw	ft1,556(a3) # 8000b7bc <__malloc_trim_threshold+0x4c>
80008598:	00003697          	auipc	a3,0x3
8000859c:	2286a007          	flw	ft0,552(a3) # 8000b7c0 <__malloc_trim_threshold+0x50>
800085a0:	00003697          	auipc	a3,0x3
800085a4:	2246a507          	flw	fa0,548(a3) # 8000b7c4 <__malloc_trim_threshold+0x54>
800085a8:	00003697          	auipc	a3,0x3
800085ac:	2206a587          	flw	fa1,544(a3) # 8000b7c8 <__malloc_trim_threshold+0x58>
800085b0:	e00707d3          	fmv.x.w	a5,fa4
800085b4:	00003697          	auipc	a3,0x3
800085b8:	2046a707          	flw	fa4,516(a3) # 8000b7b8 <__malloc_trim_threshold+0x48>
800085bc:	f00786d3          	fmv.w.x	fa3,a5
800085c0:	10d6f6d3          	fmul.s	fa3,fa3,fa3
800085c4:	08e6f743          	fmadd.s	fa4,fa3,fa4,ft1
800085c8:	00d77743          	fmadd.s	fa4,fa4,fa3,ft0
800085cc:	50d77743          	fmadd.s	fa4,fa4,fa3,fa0
800085d0:	58d77743          	fmadd.s	fa4,fa4,fa3,fa1
800085d4:	f00785d3          	fmv.w.x	fa1,a5
800085d8:	58d7774b          	fnmsub.s	fa4,fa4,fa3,fa1
800085dc:	10e5f6d3          	fmul.s	fa3,fa1,fa4
800085e0:	18070363          	beqz	a4,80008766 <__ieee754_expf+0x246>
800085e4:	00003797          	auipc	a5,0x3
800085e8:	1e87a587          	flw	fa1,488(a5) # 8000b7cc <__malloc_trim_threshold+0x5c>
800085ec:	08e5f753          	fsub.s	fa4,fa1,fa4
800085f0:	00003797          	auipc	a5,0x3
800085f4:	19c7a587          	flw	fa1,412(a5) # 8000b78c <__malloc_trim_threshold+0x1c>
800085f8:	f8300793          	li	a5,-125
800085fc:	18e6f6d3          	fdiv.s	fa3,fa3,fa4
80008600:	08d7f7d3          	fsub.s	fa5,fa5,fa3
80008604:	08c7f7d3          	fsub.s	fa5,fa5,fa2
80008608:	08f5f7d3          	fsub.s	fa5,fa1,fa5
8000860c:	e00786d3          	fmv.x.w	a3,fa5
80008610:	0cf74563          	blt	a4,a5,800086da <__ieee754_expf+0x1ba>
80008614:	075e                	slli	a4,a4,0x17
80008616:	96ba                	add	a3,a3,a4
80008618:	a029                	j	80008622 <__ieee754_expf+0x102>
8000861a:	00a577d3          	fadd.s	fa5,fa0,fa0
8000861e:	e00786d3          	fmv.x.w	a3,fa5
80008622:	f0068553          	fmv.w.x	fa0,a3
80008626:	8082                	ret
80008628:	00003797          	auipc	a5,0x3
8000862c:	1807a787          	flw	fa5,384(a5) # 8000b7a8 <__malloc_trim_threshold+0x38>
80008630:	10f7f7d3          	fmul.s	fa5,fa5,fa5
80008634:	e00786d3          	fmv.x.w	a3,fa5
80008638:	f0068553          	fmv.w.x	fa0,a3
8000863c:	8082                	ret
8000863e:	318006b7          	lui	a3,0x31800
80008642:	0ad76b63          	bltu	a4,a3,800086f8 <__ieee754_expf+0x1d8>
80008646:	00003717          	auipc	a4,0x3
8000864a:	14672787          	flw	fa5,326(a4) # 8000b78c <__malloc_trim_threshold+0x1c>
8000864e:	f0078753          	fmv.w.x	fa4,a5
80008652:	00003717          	auipc	a4,0x3
80008656:	16a72607          	flw	fa2,362(a4) # 8000b7bc <__malloc_trim_threshold+0x4c>
8000865a:	00003717          	auipc	a4,0x3
8000865e:	15e72687          	flw	fa3,350(a4) # 8000b7b8 <__malloc_trim_threshold+0x48>
80008662:	10e77753          	fmul.s	fa4,fa4,fa4
80008666:	00003717          	auipc	a4,0x3
8000866a:	15a72507          	flw	fa0,346(a4) # 8000b7c0 <__malloc_trim_threshold+0x50>
8000866e:	00003717          	auipc	a4,0x3
80008672:	15672587          	flw	fa1,342(a4) # 8000b7c4 <__malloc_trim_threshold+0x54>
80008676:	60d776c3          	fmadd.s	fa3,fa4,fa3,fa2
8000867a:	00003717          	auipc	a4,0x3
8000867e:	14e72607          	flw	fa2,334(a4) # 8000b7c8 <__malloc_trim_threshold+0x58>
80008682:	50d776c3          	fmadd.s	fa3,fa4,fa3,fa0
80008686:	58d776c3          	fmadd.s	fa3,fa4,fa3,fa1
8000868a:	60d776c3          	fmadd.s	fa3,fa4,fa3,fa2
8000868e:	f0078653          	fmv.w.x	fa2,a5
80008692:	60d7774b          	fnmsub.s	fa4,fa4,fa3,fa2
80008696:	10e676d3          	fmul.s	fa3,fa2,fa4
8000869a:	00003717          	auipc	a4,0x3
8000869e:	13272607          	flw	fa2,306(a4) # 8000b7cc <__malloc_trim_threshold+0x5c>
800086a2:	08c77753          	fsub.s	fa4,fa4,fa2
800086a6:	18e6f753          	fdiv.s	fa4,fa3,fa4
800086aa:	f00786d3          	fmv.w.x	fa3,a5
800086ae:	08d77753          	fsub.s	fa4,fa4,fa3
800086b2:	08e7f7d3          	fsub.s	fa5,fa5,fa4
800086b6:	e00786d3          	fmv.x.w	a3,fa5
800086ba:	b7a5                	j	80008622 <__ieee754_expf+0x102>
800086bc:	42cff637          	lui	a2,0x42cff
800086c0:	1b560613          	addi	a2,a2,437 # 42cff1b5 <__stack_size+0x428ff1b5>
800086c4:	00000693          	li	a3,0
800086c8:	e8e671e3          	bgeu	a2,a4,8000854a <__ieee754_expf+0x2a>
800086cc:	bf99                	j	80008622 <__ieee754_expf+0x102>
800086ce:	00000693          	li	a3,0
800086d2:	f921                	bnez	a0,80008622 <__ieee754_expf+0x102>
800086d4:	e00506d3          	fmv.x.w	a3,fa0
800086d8:	b7a9                	j	80008622 <__ieee754_expf+0x102>
800086da:	06470713          	addi	a4,a4,100
800086de:	075e                	slli	a4,a4,0x17
800086e0:	9736                	add	a4,a4,a3
800086e2:	f0070753          	fmv.w.x	fa4,a4
800086e6:	00003797          	auipc	a5,0x3
800086ea:	0ea7a787          	flw	fa5,234(a5) # 8000b7d0 <__malloc_trim_threshold+0x60>
800086ee:	10f777d3          	fmul.s	fa5,fa4,fa5
800086f2:	e00786d3          	fmv.x.w	a3,fa5
800086f6:	b735                	j	80008622 <__ieee754_expf+0x102>
800086f8:	f00787d3          	fmv.w.x	fa5,a5
800086fc:	00003717          	auipc	a4,0x3
80008700:	0ac72707          	flw	fa4,172(a4) # 8000b7a8 <__malloc_trim_threshold+0x38>
80008704:	00e7f753          	fadd.s	fa4,fa5,fa4
80008708:	00003717          	auipc	a4,0x3
8000870c:	08472787          	flw	fa5,132(a4) # 8000b78c <__malloc_trim_threshold+0x1c>
80008710:	a0e79753          	flt.s	a4,fa5,fa4
80008714:	df0d                	beqz	a4,8000864e <__ieee754_expf+0x12e>
80008716:	f0078753          	fmv.w.x	fa4,a5
8000871a:	00f777d3          	fadd.s	fa5,fa4,fa5
8000871e:	e00786d3          	fmv.x.w	a3,fa5
80008722:	b701                	j	80008622 <__ieee754_expf+0x102>
80008724:	00251713          	slli	a4,a0,0x2
80008728:	00003517          	auipc	a0,0x3
8000872c:	0bc50513          	addi	a0,a0,188 # 8000b7e4 <halF>
80008730:	972a                	add	a4,a4,a0
80008732:	6314                	flw	fa3,0(a4)
80008734:	f00787d3          	fmv.w.x	fa5,a5
80008738:	00003717          	auipc	a4,0x3
8000873c:	07472707          	flw	fa4,116(a4) # 8000b7ac <__malloc_trim_threshold+0x3c>
80008740:	00003717          	auipc	a4,0x3
80008744:	07072607          	flw	fa2,112(a4) # 8000b7b0 <__malloc_trim_threshold+0x40>
80008748:	68e7f743          	fmadd.s	fa4,fa5,fa4,fa3
8000874c:	00003717          	auipc	a4,0x3
80008750:	06872587          	flw	fa1,104(a4) # 8000b7b4 <__malloc_trim_threshold+0x44>
80008754:	c0071753          	fcvt.w.s	a4,fa4,rtz
80008758:	d00776d3          	fcvt.s.w	fa3,a4
8000875c:	78c6f64b          	fnmsub.s	fa2,fa3,fa2,fa5
80008760:	10b6f7d3          	fmul.s	fa5,fa3,fa1
80008764:	b525                	j	8000858c <__ieee754_expf+0x6c>
80008766:	00003717          	auipc	a4,0x3
8000876a:	02672787          	flw	fa5,38(a4) # 8000b78c <__malloc_trim_threshold+0x1c>
8000876e:	b735                	j	8000869a <__ieee754_expf+0x17a>

80008770 <__ieee754_sqrtf>:
80008770:	e00506d3          	fmv.x.w	a3,fa0
80008774:	7f800737          	lui	a4,0x7f800
80008778:	00169793          	slli	a5,a3,0x1
8000877c:	8385                	srli	a5,a5,0x1
8000877e:	08e7f763          	bgeu	a5,a4,8000880c <__ieee754_sqrtf+0x9c>
80008782:	e0050553          	fmv.x.w	a0,fa0
80008786:	c3c1                	beqz	a5,80008806 <__ieee754_sqrtf+0x96>
80008788:	87b6                	mv	a5,a3
8000878a:	0806cb63          	bltz	a3,80008820 <__ieee754_sqrtf+0xb0>
8000878e:	00d77633          	and	a2,a4,a3
80008792:	4176d713          	srai	a4,a3,0x17
80008796:	ee11                	bnez	a2,800087b2 <__ieee754_sqrtf+0x42>
80008798:	00800637          	lui	a2,0x800
8000879c:	8ef1                	and	a3,a3,a2
8000879e:	ead1                	bnez	a3,80008832 <__ieee754_sqrtf+0xc2>
800087a0:	00800537          	lui	a0,0x800
800087a4:	0786                	slli	a5,a5,0x1
800087a6:	00a7f633          	and	a2,a5,a0
800087aa:	85b6                	mv	a1,a3
800087ac:	0685                	addi	a3,a3,1
800087ae:	da7d                	beqz	a2,800087a4 <__ieee754_sqrtf+0x34>
800087b0:	8f0d                	sub	a4,a4,a1
800087b2:	008006b7          	lui	a3,0x800
800087b6:	fff68613          	addi	a2,a3,-1 # 7fffff <__stack_size+0x3fffff>
800087ba:	8ff1                	and	a5,a5,a2
800087bc:	f8170713          	addi	a4,a4,-127 # 7f7fff81 <__stack_size+0x7f3fff81>
800087c0:	8edd                	or	a3,a3,a5
800087c2:	00177613          	andi	a2,a4,1
800087c6:	00169793          	slli	a5,a3,0x1
800087ca:	ea21                	bnez	a2,8000881a <__ieee754_sqrtf+0xaa>
800087cc:	40175813          	srai	a6,a4,0x1
800087d0:	46e5                	li	a3,25
800087d2:	4501                	li	a0,0
800087d4:	4581                	li	a1,0
800087d6:	01000737          	lui	a4,0x1000
800087da:	00e58633          	add	a2,a1,a4
800087de:	16fd                	addi	a3,a3,-1
800087e0:	00c7c663          	blt	a5,a2,800087ec <__ieee754_sqrtf+0x7c>
800087e4:	00e605b3          	add	a1,a2,a4
800087e8:	8f91                	sub	a5,a5,a2
800087ea:	953a                	add	a0,a0,a4
800087ec:	0786                	slli	a5,a5,0x1
800087ee:	8305                	srli	a4,a4,0x1
800087f0:	f6ed                	bnez	a3,800087da <__ieee754_sqrtf+0x6a>
800087f2:	c399                	beqz	a5,800087f8 <__ieee754_sqrtf+0x88>
800087f4:	0505                	addi	a0,a0,1
800087f6:	9979                	andi	a0,a0,-2
800087f8:	8505                	srai	a0,a0,0x1
800087fa:	3f0007b7          	lui	a5,0x3f000
800087fe:	953e                	add	a0,a0,a5
80008800:	01781713          	slli	a4,a6,0x17
80008804:	953a                	add	a0,a0,a4
80008806:	f0050553          	fmv.w.x	fa0,a0
8000880a:	8082                	ret
8000880c:	50a577c3          	fmadd.s	fa5,fa0,fa0,fa0
80008810:	e0078553          	fmv.x.w	a0,fa5
80008814:	f0050553          	fmv.w.x	fa0,a0
80008818:	8082                	ret
8000881a:	00269793          	slli	a5,a3,0x2
8000881e:	b77d                	j	800087cc <__ieee754_sqrtf+0x5c>
80008820:	08a577d3          	fsub.s	fa5,fa0,fa0
80008824:	18f7f7d3          	fdiv.s	fa5,fa5,fa5
80008828:	e0078553          	fmv.x.w	a0,fa5
8000882c:	f0050553          	fmv.w.x	fa0,a0
80008830:	8082                	ret
80008832:	55fd                	li	a1,-1
80008834:	8f0d                	sub	a4,a4,a1
80008836:	bfb5                	j	800087b2 <__ieee754_sqrtf+0x42>

80008838 <finitef>:
80008838:	e00507d3          	fmv.x.w	a5,fa0
8000883c:	7f800537          	lui	a0,0x7f800
80008840:	0786                	slli	a5,a5,0x1
80008842:	8385                	srli	a5,a5,0x1
80008844:	00a7a533          	slt	a0,a5,a0
80008848:	8082                	ret

8000884a <__errno>:
8000884a:	00003517          	auipc	a0,0x3
8000884e:	f1e52503          	lw	a0,-226(a0) # 8000b768 <_impure_ptr>
80008852:	8082                	ret

80008854 <__libc_init_array>:
80008854:	1141                	addi	sp,sp,-16
80008856:	c422                	sw	s0,8(sp)
80008858:	c04a                	sw	s2,0(sp)
8000885a:	00002417          	auipc	s0,0x2
8000885e:	de640413          	addi	s0,s0,-538 # 8000a640 <__init_array_end>
80008862:	00002917          	auipc	s2,0x2
80008866:	dde90913          	addi	s2,s2,-546 # 8000a640 <__init_array_end>
8000886a:	40890933          	sub	s2,s2,s0
8000886e:	c606                	sw	ra,12(sp)
80008870:	c226                	sw	s1,4(sp)
80008872:	40295913          	srai	s2,s2,0x2
80008876:	00090963          	beqz	s2,80008888 <__libc_init_array+0x34>
8000887a:	4481                	li	s1,0
8000887c:	401c                	lw	a5,0(s0)
8000887e:	0485                	addi	s1,s1,1
80008880:	0411                	addi	s0,s0,4
80008882:	9782                	jalr	a5
80008884:	fe991ce3          	bne	s2,s1,8000887c <__libc_init_array+0x28>
80008888:	00002417          	auipc	s0,0x2
8000888c:	db840413          	addi	s0,s0,-584 # 8000a640 <__init_array_end>
80008890:	00002917          	auipc	s2,0x2
80008894:	db090913          	addi	s2,s2,-592 # 8000a640 <__init_array_end>
80008898:	40890933          	sub	s2,s2,s0
8000889c:	40295913          	srai	s2,s2,0x2
800088a0:	00090963          	beqz	s2,800088b2 <__libc_init_array+0x5e>
800088a4:	4481                	li	s1,0
800088a6:	401c                	lw	a5,0(s0)
800088a8:	0485                	addi	s1,s1,1
800088aa:	0411                	addi	s0,s0,4
800088ac:	9782                	jalr	a5
800088ae:	fe991ce3          	bne	s2,s1,800088a6 <__libc_init_array+0x52>
800088b2:	40b2                	lw	ra,12(sp)
800088b4:	4422                	lw	s0,8(sp)
800088b6:	4492                	lw	s1,4(sp)
800088b8:	4902                	lw	s2,0(sp)
800088ba:	0141                	addi	sp,sp,16
800088bc:	8082                	ret

800088be <malloc>:
800088be:	85aa                	mv	a1,a0
800088c0:	00003517          	auipc	a0,0x3
800088c4:	ea852503          	lw	a0,-344(a0) # 8000b768 <_impure_ptr>
800088c8:	a801                	j	800088d8 <_malloc_r>

800088ca <free>:
800088ca:	85aa                	mv	a1,a0
800088cc:	00003517          	auipc	a0,0x3
800088d0:	e9c52503          	lw	a0,-356(a0) # 8000b768 <_impure_ptr>
800088d4:	77e0006f          	j	80009052 <_free_r>

800088d8 <_malloc_r>:
800088d8:	7179                	addi	sp,sp,-48
800088da:	d04a                	sw	s2,32(sp)
800088dc:	d606                	sw	ra,44(sp)
800088de:	d422                	sw	s0,40(sp)
800088e0:	d226                	sw	s1,36(sp)
800088e2:	ce4e                	sw	s3,28(sp)
800088e4:	cc52                	sw	s4,24(sp)
800088e6:	ca56                	sw	s5,20(sp)
800088e8:	c85a                	sw	s6,16(sp)
800088ea:	c65e                	sw	s7,12(sp)
800088ec:	c462                	sw	s8,8(sp)
800088ee:	c266                	sw	s9,4(sp)
800088f0:	00b58793          	addi	a5,a1,11
800088f4:	4759                	li	a4,22
800088f6:	892a                	mv	s2,a0
800088f8:	04f76363          	bltu	a4,a5,8000893e <_malloc_r+0x66>
800088fc:	47c1                	li	a5,16
800088fe:	16b7e363          	bltu	a5,a1,80008a64 <_malloc_r+0x18c>
80008902:	2599                	jal	80008f48 <__malloc_lock>
80008904:	44c1                	li	s1,16
80008906:	47e1                	li	a5,24
80008908:	4609                	li	a2,2
8000890a:	00003997          	auipc	s3,0x3
8000890e:	a5698993          	addi	s3,s3,-1450 # 8000b360 <__malloc_av_>
80008912:	97ce                	add	a5,a5,s3
80008914:	43c0                	lw	s0,4(a5)
80008916:	ff878713          	addi	a4,a5,-8 # 3efffff8 <__stack_size+0x3ebffff8>
8000891a:	16e40d63          	beq	s0,a4,80008a94 <_malloc_r+0x1bc>
8000891e:	405c                	lw	a5,4(s0)
80008920:	4454                	lw	a3,12(s0)
80008922:	4410                	lw	a2,8(s0)
80008924:	9bf1                	andi	a5,a5,-4
80008926:	97a2                	add	a5,a5,s0
80008928:	43d8                	lw	a4,4(a5)
8000892a:	c654                	sw	a3,12(a2)
8000892c:	c690                	sw	a2,8(a3)
8000892e:	00176713          	ori	a4,a4,1
80008932:	854a                	mv	a0,s2
80008934:	c3d8                	sw	a4,4(a5)
80008936:	2d11                	jal	80008f4a <__malloc_unlock>
80008938:	00840513          	addi	a0,s0,8
8000893c:	aa05                	j	80008a6c <_malloc_r+0x194>
8000893e:	ff87f493          	andi	s1,a5,-8
80008942:	1207c163          	bltz	a5,80008a64 <_malloc_r+0x18c>
80008946:	10b4ef63          	bltu	s1,a1,80008a64 <_malloc_r+0x18c>
8000894a:	2bfd                	jal	80008f48 <__malloc_lock>
8000894c:	1f700793          	li	a5,503
80008950:	3497f963          	bgeu	a5,s1,80008ca2 <_malloc_r+0x3ca>
80008954:	0094d793          	srli	a5,s1,0x9
80008958:	12078763          	beqz	a5,80008a86 <_malloc_r+0x1ae>
8000895c:	4711                	li	a4,4
8000895e:	2ef76263          	bltu	a4,a5,80008c42 <_malloc_r+0x36a>
80008962:	0064d793          	srli	a5,s1,0x6
80008966:	03978613          	addi	a2,a5,57
8000896a:	03878513          	addi	a0,a5,56
8000896e:	00361693          	slli	a3,a2,0x3
80008972:	00003997          	auipc	s3,0x3
80008976:	9ee98993          	addi	s3,s3,-1554 # 8000b360 <__malloc_av_>
8000897a:	96ce                	add	a3,a3,s3
8000897c:	42c0                	lw	s0,4(a3)
8000897e:	16e1                	addi	a3,a3,-8
80008980:	02868063          	beq	a3,s0,800089a0 <_malloc_r+0xc8>
80008984:	45bd                	li	a1,15
80008986:	a031                	j	80008992 <_malloc_r+0xba>
80008988:	26075963          	bgez	a4,80008bfa <_malloc_r+0x322>
8000898c:	4440                	lw	s0,12(s0)
8000898e:	00868963          	beq	a3,s0,800089a0 <_malloc_r+0xc8>
80008992:	405c                	lw	a5,4(s0)
80008994:	9bf1                	andi	a5,a5,-4
80008996:	40978733          	sub	a4,a5,s1
8000899a:	fee5d7e3          	bge	a1,a4,80008988 <_malloc_r+0xb0>
8000899e:	862a                	mv	a2,a0
800089a0:	0109a403          	lw	s0,16(s3)
800089a4:	00003897          	auipc	a7,0x3
800089a8:	9c488893          	addi	a7,a7,-1596 # 8000b368 <__malloc_av_+0x8>
800089ac:	11140063          	beq	s0,a7,80008aac <_malloc_r+0x1d4>
800089b0:	4048                	lw	a0,4(s0)
800089b2:	46bd                	li	a3,15
800089b4:	9971                	andi	a0,a0,-4
800089b6:	409507b3          	sub	a5,a0,s1
800089ba:	30f6c463          	blt	a3,a5,80008cc2 <_malloc_r+0x3ea>
800089be:	0119aa23          	sw	a7,20(s3)
800089c2:	0119a823          	sw	a7,16(s3)
800089c6:	2e07d363          	bgez	a5,80008cac <_malloc_r+0x3d4>
800089ca:	1ff00793          	li	a5,511
800089ce:	22a7e963          	bltu	a5,a0,80008c00 <_malloc_r+0x328>
800089d2:	ff857793          	andi	a5,a0,-8
800089d6:	07a1                	addi	a5,a5,8
800089d8:	0049a583          	lw	a1,4(s3)
800089dc:	97ce                	add	a5,a5,s3
800089de:	4394                	lw	a3,0(a5)
800089e0:	8115                	srli	a0,a0,0x5
800089e2:	4705                	li	a4,1
800089e4:	00a71733          	sll	a4,a4,a0
800089e8:	8f4d                	or	a4,a4,a1
800089ea:	ff878593          	addi	a1,a5,-8
800089ee:	c44c                	sw	a1,12(s0)
800089f0:	c414                	sw	a3,8(s0)
800089f2:	00e9a223          	sw	a4,4(s3)
800089f6:	c380                	sw	s0,0(a5)
800089f8:	c6c0                	sw	s0,12(a3)
800089fa:	40265793          	srai	a5,a2,0x2
800089fe:	4585                	li	a1,1
80008a00:	00f595b3          	sll	a1,a1,a5
80008a04:	0ab76d63          	bltu	a4,a1,80008abe <_malloc_r+0x1e6>
80008a08:	00e5f7b3          	and	a5,a1,a4
80008a0c:	ef81                	bnez	a5,80008a24 <_malloc_r+0x14c>
80008a0e:	0586                	slli	a1,a1,0x1
80008a10:	9a71                	andi	a2,a2,-4
80008a12:	00e5f7b3          	and	a5,a1,a4
80008a16:	0611                	addi	a2,a2,4
80008a18:	e791                	bnez	a5,80008a24 <_malloc_r+0x14c>
80008a1a:	0586                	slli	a1,a1,0x1
80008a1c:	00e5f7b3          	and	a5,a1,a4
80008a20:	0611                	addi	a2,a2,4
80008a22:	dfe5                	beqz	a5,80008a1a <_malloc_r+0x142>
80008a24:	483d                	li	a6,15
80008a26:	00361313          	slli	t1,a2,0x3
80008a2a:	934e                	add	t1,t1,s3
80008a2c:	851a                	mv	a0,t1
80008a2e:	455c                	lw	a5,12(a0)
80008a30:	8e32                	mv	t3,a2
80008a32:	22f50863          	beq	a0,a5,80008c62 <_malloc_r+0x38a>
80008a36:	43d8                	lw	a4,4(a5)
80008a38:	843e                	mv	s0,a5
80008a3a:	47dc                	lw	a5,12(a5)
80008a3c:	9b71                	andi	a4,a4,-4
80008a3e:	409706b3          	sub	a3,a4,s1
80008a42:	22d84763          	blt	a6,a3,80008c70 <_malloc_r+0x398>
80008a46:	fe06c6e3          	bltz	a3,80008a32 <_malloc_r+0x15a>
80008a4a:	9722                	add	a4,a4,s0
80008a4c:	4354                	lw	a3,4(a4)
80008a4e:	4410                	lw	a2,8(s0)
80008a50:	854a                	mv	a0,s2
80008a52:	0016e693          	ori	a3,a3,1
80008a56:	c354                	sw	a3,4(a4)
80008a58:	c65c                	sw	a5,12(a2)
80008a5a:	c790                	sw	a2,8(a5)
80008a5c:	21fd                	jal	80008f4a <__malloc_unlock>
80008a5e:	00840513          	addi	a0,s0,8
80008a62:	a029                	j	80008a6c <_malloc_r+0x194>
80008a64:	47b1                	li	a5,12
80008a66:	00f92023          	sw	a5,0(s2)
80008a6a:	4501                	li	a0,0
80008a6c:	50b2                	lw	ra,44(sp)
80008a6e:	5422                	lw	s0,40(sp)
80008a70:	5492                	lw	s1,36(sp)
80008a72:	5902                	lw	s2,32(sp)
80008a74:	49f2                	lw	s3,28(sp)
80008a76:	4a62                	lw	s4,24(sp)
80008a78:	4ad2                	lw	s5,20(sp)
80008a7a:	4b42                	lw	s6,16(sp)
80008a7c:	4bb2                	lw	s7,12(sp)
80008a7e:	4c22                	lw	s8,8(sp)
80008a80:	4c92                	lw	s9,4(sp)
80008a82:	6145                	addi	sp,sp,48
80008a84:	8082                	ret
80008a86:	20000693          	li	a3,512
80008a8a:	04000613          	li	a2,64
80008a8e:	03f00513          	li	a0,63
80008a92:	b5c5                	j	80008972 <_malloc_r+0x9a>
80008a94:	47c0                	lw	s0,12(a5)
80008a96:	0609                	addi	a2,a2,2
80008a98:	e88793e3          	bne	a5,s0,8000891e <_malloc_r+0x46>
80008a9c:	0109a403          	lw	s0,16(s3)
80008aa0:	00003897          	auipc	a7,0x3
80008aa4:	8c888893          	addi	a7,a7,-1848 # 8000b368 <__malloc_av_+0x8>
80008aa8:	f11414e3          	bne	s0,a7,800089b0 <_malloc_r+0xd8>
80008aac:	0049a703          	lw	a4,4(s3)
80008ab0:	40265793          	srai	a5,a2,0x2
80008ab4:	4585                	li	a1,1
80008ab6:	00f595b3          	sll	a1,a1,a5
80008aba:	f4b777e3          	bgeu	a4,a1,80008a08 <_malloc_r+0x130>
80008abe:	0089a403          	lw	s0,8(s3)
80008ac2:	00442a83          	lw	s5,4(s0)
80008ac6:	ffcafb13          	andi	s6,s5,-4
80008aca:	009b6763          	bltu	s6,s1,80008ad8 <_malloc_r+0x200>
80008ace:	409b07b3          	sub	a5,s6,s1
80008ad2:	473d                	li	a4,15
80008ad4:	10f74563          	blt	a4,a5,80008bde <_malloc_r+0x306>
80008ad8:	00003c97          	auipc	s9,0x3
80008adc:	c94c8c93          	addi	s9,s9,-876 # 8000b76c <__malloc_sbrk_base>
80008ae0:	000ca703          	lw	a4,0(s9)
80008ae4:	00003a97          	auipc	s5,0x3
80008ae8:	d34aaa83          	lw	s5,-716(s5) # 8000b818 <__malloc_top_pad>
80008aec:	57fd                	li	a5,-1
80008aee:	01640a33          	add	s4,s0,s6
80008af2:	9aa6                	add	s5,s5,s1
80008af4:	26f70e63          	beq	a4,a5,80008d70 <_malloc_r+0x498>
80008af8:	6785                	lui	a5,0x1
80008afa:	07bd                	addi	a5,a5,15
80008afc:	9abe                	add	s5,s5,a5
80008afe:	77fd                	lui	a5,0xfffff
80008b00:	00fafab3          	and	s5,s5,a5
80008b04:	85d6                	mv	a1,s5
80008b06:	854a                	mv	a0,s2
80008b08:	2191                	jal	80008f4c <_sbrk_r>
80008b0a:	57fd                	li	a5,-1
80008b0c:	8baa                	mv	s7,a0
80008b0e:	1ef50a63          	beq	a0,a5,80008d02 <_malloc_r+0x42a>
80008b12:	1f456663          	bltu	a0,s4,80008cfe <_malloc_r+0x426>
80008b16:	0000bc17          	auipc	s8,0xb
80008b1a:	d0ac0c13          	addi	s8,s8,-758 # 80013820 <__malloc_current_mallinfo>
80008b1e:	000c2583          	lw	a1,0(s8)
80008b22:	95d6                	add	a1,a1,s5
80008b24:	00bc2023          	sw	a1,0(s8)
80008b28:	87ae                	mv	a5,a1
80008b2a:	2caa0163          	beq	s4,a0,80008dec <_malloc_r+0x514>
80008b2e:	000ca683          	lw	a3,0(s9)
80008b32:	577d                	li	a4,-1
80008b34:	2ce68863          	beq	a3,a4,80008e04 <_malloc_r+0x52c>
80008b38:	414b8a33          	sub	s4,s7,s4
80008b3c:	97d2                	add	a5,a5,s4
80008b3e:	00fc2023          	sw	a5,0(s8)
80008b42:	007bfc93          	andi	s9,s7,7
80008b46:	240c8163          	beqz	s9,80008d88 <_malloc_r+0x4b0>
80008b4a:	6785                	lui	a5,0x1
80008b4c:	419b8bb3          	sub	s7,s7,s9
80008b50:	00878593          	addi	a1,a5,8 # 1008 <__stack_size-0x3feff8>
80008b54:	0ba1                	addi	s7,s7,8
80008b56:	419585b3          	sub	a1,a1,s9
80008b5a:	9ade                	add	s5,s5,s7
80008b5c:	17fd                	addi	a5,a5,-1
80008b5e:	415585b3          	sub	a1,a1,s5
80008b62:	00f5fa33          	and	s4,a1,a5
80008b66:	85d2                	mv	a1,s4
80008b68:	854a                	mv	a0,s2
80008b6a:	26cd                	jal	80008f4c <_sbrk_r>
80008b6c:	57fd                	li	a5,-1
80008b6e:	2cf50d63          	beq	a0,a5,80008e48 <_malloc_r+0x570>
80008b72:	41750533          	sub	a0,a0,s7
80008b76:	01450ab3          	add	s5,a0,s4
80008b7a:	000c2583          	lw	a1,0(s8)
80008b7e:	0179a423          	sw	s7,8(s3)
80008b82:	001aea93          	ori	s5,s5,1
80008b86:	95d2                	add	a1,a1,s4
80008b88:	00bc2023          	sw	a1,0(s8)
80008b8c:	015ba223          	sw	s5,4(s7)
80008b90:	27340d63          	beq	s0,s3,80008e0a <_malloc_r+0x532>
80008b94:	46bd                	li	a3,15
80008b96:	2766fc63          	bgeu	a3,s6,80008e0e <_malloc_r+0x536>
80008b9a:	4058                	lw	a4,4(s0)
80008b9c:	ff4b0793          	addi	a5,s6,-12
80008ba0:	9be1                	andi	a5,a5,-8
80008ba2:	8b05                	andi	a4,a4,1
80008ba4:	8f5d                	or	a4,a4,a5
80008ba6:	c058                	sw	a4,4(s0)
80008ba8:	4615                	li	a2,5
80008baa:	00f40733          	add	a4,s0,a5
80008bae:	c350                	sw	a2,4(a4)
80008bb0:	c710                	sw	a2,8(a4)
80008bb2:	2af6e163          	bltu	a3,a5,80008e54 <_malloc_r+0x57c>
80008bb6:	004baa83          	lw	s5,4(s7)
80008bba:	845e                	mv	s0,s7
80008bbc:	00003797          	auipc	a5,0x3
80008bc0:	c5878793          	addi	a5,a5,-936 # 8000b814 <__malloc_max_sbrked_mem>
80008bc4:	4398                	lw	a4,0(a5)
80008bc6:	00b77363          	bgeu	a4,a1,80008bcc <_malloc_r+0x2f4>
80008bca:	c38c                	sw	a1,0(a5)
80008bcc:	00003797          	auipc	a5,0x3
80008bd0:	c4478793          	addi	a5,a5,-956 # 8000b810 <__malloc_max_total_mem>
80008bd4:	4398                	lw	a4,0(a5)
80008bd6:	12b77a63          	bgeu	a4,a1,80008d0a <_malloc_r+0x432>
80008bda:	c38c                	sw	a1,0(a5)
80008bdc:	a23d                	j	80008d0a <_malloc_r+0x432>
80008bde:	0014e713          	ori	a4,s1,1
80008be2:	c058                	sw	a4,4(s0)
80008be4:	94a2                	add	s1,s1,s0
80008be6:	0099a423          	sw	s1,8(s3)
80008bea:	0017e793          	ori	a5,a5,1
80008bee:	854a                	mv	a0,s2
80008bf0:	c0dc                	sw	a5,4(s1)
80008bf2:	2ea1                	jal	80008f4a <__malloc_unlock>
80008bf4:	00840513          	addi	a0,s0,8
80008bf8:	bd95                	j	80008a6c <_malloc_r+0x194>
80008bfa:	4454                	lw	a3,12(s0)
80008bfc:	4410                	lw	a2,8(s0)
80008bfe:	b325                	j	80008926 <_malloc_r+0x4e>
80008c00:	00955793          	srli	a5,a0,0x9
80008c04:	4711                	li	a4,4
80008c06:	0ef77463          	bgeu	a4,a5,80008cee <_malloc_r+0x416>
80008c0a:	4751                	li	a4,20
80008c0c:	18f76d63          	bltu	a4,a5,80008da6 <_malloc_r+0x4ce>
80008c10:	05c78693          	addi	a3,a5,92
80008c14:	05b78593          	addi	a1,a5,91
80008c18:	068e                	slli	a3,a3,0x3
80008c1a:	96ce                	add	a3,a3,s3
80008c1c:	429c                	lw	a5,0(a3)
80008c1e:	16e1                	addi	a3,a3,-8
80008c20:	14f68a63          	beq	a3,a5,80008d74 <_malloc_r+0x49c>
80008c24:	43d8                	lw	a4,4(a5)
80008c26:	9b71                	andi	a4,a4,-4
80008c28:	00e57563          	bgeu	a0,a4,80008c32 <_malloc_r+0x35a>
80008c2c:	479c                	lw	a5,8(a5)
80008c2e:	fef69be3          	bne	a3,a5,80008c24 <_malloc_r+0x34c>
80008c32:	47d4                	lw	a3,12(a5)
80008c34:	0049a703          	lw	a4,4(s3)
80008c38:	c454                	sw	a3,12(s0)
80008c3a:	c41c                	sw	a5,8(s0)
80008c3c:	c680                	sw	s0,8(a3)
80008c3e:	c7c0                	sw	s0,12(a5)
80008c40:	bb6d                	j	800089fa <_malloc_r+0x122>
80008c42:	4751                	li	a4,20
80008c44:	0ef77063          	bgeu	a4,a5,80008d24 <_malloc_r+0x44c>
80008c48:	05400713          	li	a4,84
80008c4c:	16f76963          	bltu	a4,a5,80008dbe <_malloc_r+0x4e6>
80008c50:	00c4d793          	srli	a5,s1,0xc
80008c54:	06f78613          	addi	a2,a5,111
80008c58:	06e78513          	addi	a0,a5,110
80008c5c:	00361693          	slli	a3,a2,0x3
80008c60:	bb09                	j	80008972 <_malloc_r+0x9a>
80008c62:	0e05                	addi	t3,t3,1
80008c64:	003e7793          	andi	a5,t3,3
80008c68:	0521                	addi	a0,a0,8
80008c6a:	cbe9                	beqz	a5,80008d3c <_malloc_r+0x464>
80008c6c:	455c                	lw	a5,12(a0)
80008c6e:	b3d1                	j	80008a32 <_malloc_r+0x15a>
80008c70:	4410                	lw	a2,8(s0)
80008c72:	0014e593          	ori	a1,s1,1
80008c76:	c04c                	sw	a1,4(s0)
80008c78:	c65c                	sw	a5,12(a2)
80008c7a:	c790                	sw	a2,8(a5)
80008c7c:	94a2                	add	s1,s1,s0
80008c7e:	0099aa23          	sw	s1,20(s3)
80008c82:	0099a823          	sw	s1,16(s3)
80008c86:	0016e793          	ori	a5,a3,1
80008c8a:	0114a623          	sw	a7,12(s1)
80008c8e:	0114a423          	sw	a7,8(s1)
80008c92:	c0dc                	sw	a5,4(s1)
80008c94:	9722                	add	a4,a4,s0
80008c96:	854a                	mv	a0,s2
80008c98:	c314                	sw	a3,0(a4)
80008c9a:	2c45                	jal	80008f4a <__malloc_unlock>
80008c9c:	00840513          	addi	a0,s0,8
80008ca0:	b3f1                	j	80008a6c <_malloc_r+0x194>
80008ca2:	0034d613          	srli	a2,s1,0x3
80008ca6:	00848793          	addi	a5,s1,8
80008caa:	b185                	j	8000890a <_malloc_r+0x32>
80008cac:	00a40733          	add	a4,s0,a0
80008cb0:	435c                	lw	a5,4(a4)
80008cb2:	854a                	mv	a0,s2
80008cb4:	0017e793          	ori	a5,a5,1
80008cb8:	c35c                	sw	a5,4(a4)
80008cba:	2c41                	jal	80008f4a <__malloc_unlock>
80008cbc:	00840513          	addi	a0,s0,8
80008cc0:	b375                	j	80008a6c <_malloc_r+0x194>
80008cc2:	0014e713          	ori	a4,s1,1
80008cc6:	c058                	sw	a4,4(s0)
80008cc8:	94a2                	add	s1,s1,s0
80008cca:	0099aa23          	sw	s1,20(s3)
80008cce:	0099a823          	sw	s1,16(s3)
80008cd2:	0017e713          	ori	a4,a5,1
80008cd6:	0114a623          	sw	a7,12(s1)
80008cda:	0114a423          	sw	a7,8(s1)
80008cde:	c0d8                	sw	a4,4(s1)
80008ce0:	9522                	add	a0,a0,s0
80008ce2:	c11c                	sw	a5,0(a0)
80008ce4:	854a                	mv	a0,s2
80008ce6:	2495                	jal	80008f4a <__malloc_unlock>
80008ce8:	00840513          	addi	a0,s0,8
80008cec:	b341                	j	80008a6c <_malloc_r+0x194>
80008cee:	00655793          	srli	a5,a0,0x6
80008cf2:	03978693          	addi	a3,a5,57
80008cf6:	03878593          	addi	a1,a5,56
80008cfa:	068e                	slli	a3,a3,0x3
80008cfc:	bf39                	j	80008c1a <_malloc_r+0x342>
80008cfe:	0d340d63          	beq	s0,s3,80008dd8 <_malloc_r+0x500>
80008d02:	0089a403          	lw	s0,8(s3)
80008d06:	00442a83          	lw	s5,4(s0)
80008d0a:	ffcafa93          	andi	s5,s5,-4
80008d0e:	409a87b3          	sub	a5,s5,s1
80008d12:	009ae563          	bltu	s5,s1,80008d1c <_malloc_r+0x444>
80008d16:	473d                	li	a4,15
80008d18:	ecf743e3          	blt	a4,a5,80008bde <_malloc_r+0x306>
80008d1c:	854a                	mv	a0,s2
80008d1e:	2435                	jal	80008f4a <__malloc_unlock>
80008d20:	4501                	li	a0,0
80008d22:	b3a9                	j	80008a6c <_malloc_r+0x194>
80008d24:	05c78613          	addi	a2,a5,92
80008d28:	05b78513          	addi	a0,a5,91
80008d2c:	00361693          	slli	a3,a2,0x3
80008d30:	b189                	j	80008972 <_malloc_r+0x9a>
80008d32:	00832783          	lw	a5,8(t1)
80008d36:	167d                	addi	a2,a2,-1
80008d38:	16679163          	bne	a5,t1,80008e9a <_malloc_r+0x5c2>
80008d3c:	00367793          	andi	a5,a2,3
80008d40:	1361                	addi	t1,t1,-8
80008d42:	fbe5                	bnez	a5,80008d32 <_malloc_r+0x45a>
80008d44:	0049a703          	lw	a4,4(s3)
80008d48:	fff5c793          	not	a5,a1
80008d4c:	8ff9                	and	a5,a5,a4
80008d4e:	00f9a223          	sw	a5,4(s3)
80008d52:	0586                	slli	a1,a1,0x1
80008d54:	d6b7e5e3          	bltu	a5,a1,80008abe <_malloc_r+0x1e6>
80008d58:	d60583e3          	beqz	a1,80008abe <_malloc_r+0x1e6>
80008d5c:	00f5f733          	and	a4,a1,a5
80008d60:	e711                	bnez	a4,80008d6c <_malloc_r+0x494>
80008d62:	0586                	slli	a1,a1,0x1
80008d64:	00f5f733          	and	a4,a1,a5
80008d68:	0e11                	addi	t3,t3,4
80008d6a:	df65                	beqz	a4,80008d62 <_malloc_r+0x48a>
80008d6c:	8672                	mv	a2,t3
80008d6e:	b965                	j	80008a26 <_malloc_r+0x14e>
80008d70:	0ac1                	addi	s5,s5,16
80008d72:	bb49                	j	80008b04 <_malloc_r+0x22c>
80008d74:	0049a503          	lw	a0,4(s3)
80008d78:	8589                	srai	a1,a1,0x2
80008d7a:	4705                	li	a4,1
80008d7c:	00b71733          	sll	a4,a4,a1
80008d80:	8f49                	or	a4,a4,a0
80008d82:	00e9a223          	sw	a4,4(s3)
80008d86:	bd4d                	j	80008c38 <_malloc_r+0x360>
80008d88:	015b85b3          	add	a1,s7,s5
80008d8c:	40b005b3          	neg	a1,a1
80008d90:	05d2                	slli	a1,a1,0x14
80008d92:	0145da13          	srli	s4,a1,0x14
80008d96:	85d2                	mv	a1,s4
80008d98:	854a                	mv	a0,s2
80008d9a:	2a4d                	jal	80008f4c <_sbrk_r>
80008d9c:	57fd                	li	a5,-1
80008d9e:	dcf51ae3          	bne	a0,a5,80008b72 <_malloc_r+0x29a>
80008da2:	4a01                	li	s4,0
80008da4:	bbd9                	j	80008b7a <_malloc_r+0x2a2>
80008da6:	05400713          	li	a4,84
80008daa:	06f76663          	bltu	a4,a5,80008e16 <_malloc_r+0x53e>
80008dae:	00c55793          	srli	a5,a0,0xc
80008db2:	06f78693          	addi	a3,a5,111
80008db6:	06e78593          	addi	a1,a5,110
80008dba:	068e                	slli	a3,a3,0x3
80008dbc:	bdb9                	j	80008c1a <_malloc_r+0x342>
80008dbe:	15400713          	li	a4,340
80008dc2:	06f76663          	bltu	a4,a5,80008e2e <_malloc_r+0x556>
80008dc6:	00f4d793          	srli	a5,s1,0xf
80008dca:	07878613          	addi	a2,a5,120
80008dce:	07778513          	addi	a0,a5,119
80008dd2:	00361693          	slli	a3,a2,0x3
80008dd6:	be71                	j	80008972 <_malloc_r+0x9a>
80008dd8:	0000bc17          	auipc	s8,0xb
80008ddc:	a48c0c13          	addi	s8,s8,-1464 # 80013820 <__malloc_current_mallinfo>
80008de0:	000c2783          	lw	a5,0(s8)
80008de4:	97d6                	add	a5,a5,s5
80008de6:	00fc2023          	sw	a5,0(s8)
80008dea:	b391                	j	80008b2e <_malloc_r+0x256>
80008dec:	014a1713          	slli	a4,s4,0x14
80008df0:	d2071fe3          	bnez	a4,80008b2e <_malloc_r+0x256>
80008df4:	0089a403          	lw	s0,8(s3)
80008df8:	9ada                	add	s5,s5,s6
80008dfa:	001aea93          	ori	s5,s5,1
80008dfe:	01542223          	sw	s5,4(s0)
80008e02:	bb6d                	j	80008bbc <_malloc_r+0x2e4>
80008e04:	017ca023          	sw	s7,0(s9)
80008e08:	bb2d                	j	80008b42 <_malloc_r+0x26a>
80008e0a:	845e                	mv	s0,s7
80008e0c:	bb45                	j	80008bbc <_malloc_r+0x2e4>
80008e0e:	4785                	li	a5,1
80008e10:	00fba223          	sw	a5,4(s7)
80008e14:	b721                	j	80008d1c <_malloc_r+0x444>
80008e16:	15400713          	li	a4,340
80008e1a:	04f76863          	bltu	a4,a5,80008e6a <_malloc_r+0x592>
80008e1e:	00f55793          	srli	a5,a0,0xf
80008e22:	07878693          	addi	a3,a5,120
80008e26:	07778593          	addi	a1,a5,119
80008e2a:	068e                	slli	a3,a3,0x3
80008e2c:	b3fd                	j	80008c1a <_malloc_r+0x342>
80008e2e:	55400713          	li	a4,1364
80008e32:	04f76863          	bltu	a4,a5,80008e82 <_malloc_r+0x5aa>
80008e36:	0124d793          	srli	a5,s1,0x12
80008e3a:	07d78613          	addi	a2,a5,125
80008e3e:	07c78513          	addi	a0,a5,124
80008e42:	00361693          	slli	a3,a2,0x3
80008e46:	b635                	j	80008972 <_malloc_r+0x9a>
80008e48:	1ce1                	addi	s9,s9,-8
80008e4a:	9ae6                	add	s5,s5,s9
80008e4c:	417a8ab3          	sub	s5,s5,s7
80008e50:	4a01                	li	s4,0
80008e52:	b325                	j	80008b7a <_malloc_r+0x2a2>
80008e54:	00840593          	addi	a1,s0,8
80008e58:	854a                	mv	a0,s2
80008e5a:	2ae5                	jal	80009052 <_free_r>
80008e5c:	0089a403          	lw	s0,8(s3)
80008e60:	000c2583          	lw	a1,0(s8)
80008e64:	00442a83          	lw	s5,4(s0)
80008e68:	bb91                	j	80008bbc <_malloc_r+0x2e4>
80008e6a:	55400713          	li	a4,1364
80008e6e:	02f76163          	bltu	a4,a5,80008e90 <_malloc_r+0x5b8>
80008e72:	01255793          	srli	a5,a0,0x12
80008e76:	07d78693          	addi	a3,a5,125
80008e7a:	07c78593          	addi	a1,a5,124
80008e7e:	068e                	slli	a3,a3,0x3
80008e80:	bb69                	j	80008c1a <_malloc_r+0x342>
80008e82:	3f800693          	li	a3,1016
80008e86:	07f00613          	li	a2,127
80008e8a:	07e00513          	li	a0,126
80008e8e:	b4d5                	j	80008972 <_malloc_r+0x9a>
80008e90:	3f800693          	li	a3,1016
80008e94:	07e00593          	li	a1,126
80008e98:	b349                	j	80008c1a <_malloc_r+0x342>
80008e9a:	0049a783          	lw	a5,4(s3)
80008e9e:	bd55                	j	80008d52 <_malloc_r+0x47a>

80008ea0 <memset>:
80008ea0:	433d                	li	t1,15
80008ea2:	872a                	mv	a4,a0
80008ea4:	02c37363          	bgeu	t1,a2,80008eca <memset+0x2a>
80008ea8:	00f77793          	andi	a5,a4,15
80008eac:	efbd                	bnez	a5,80008f2a <memset+0x8a>
80008eae:	e5ad                	bnez	a1,80008f18 <memset+0x78>
80008eb0:	ff067693          	andi	a3,a2,-16
80008eb4:	8a3d                	andi	a2,a2,15
80008eb6:	96ba                	add	a3,a3,a4
80008eb8:	c30c                	sw	a1,0(a4)
80008eba:	c34c                	sw	a1,4(a4)
80008ebc:	c70c                	sw	a1,8(a4)
80008ebe:	c74c                	sw	a1,12(a4)
80008ec0:	0741                	addi	a4,a4,16
80008ec2:	fed76be3          	bltu	a4,a3,80008eb8 <memset+0x18>
80008ec6:	e211                	bnez	a2,80008eca <memset+0x2a>
80008ec8:	8082                	ret
80008eca:	40c306b3          	sub	a3,t1,a2
80008ece:	068a                	slli	a3,a3,0x2
80008ed0:	00000297          	auipc	t0,0x0
80008ed4:	9696                	add	a3,a3,t0
80008ed6:	00a68067          	jr	10(a3)
80008eda:	00b70723          	sb	a1,14(a4) # 100000e <__stack_size+0xc0000e>
80008ede:	00b706a3          	sb	a1,13(a4)
80008ee2:	00b70623          	sb	a1,12(a4)
80008ee6:	00b705a3          	sb	a1,11(a4)
80008eea:	00b70523          	sb	a1,10(a4)
80008eee:	00b704a3          	sb	a1,9(a4)
80008ef2:	00b70423          	sb	a1,8(a4)
80008ef6:	00b703a3          	sb	a1,7(a4)
80008efa:	00b70323          	sb	a1,6(a4)
80008efe:	00b702a3          	sb	a1,5(a4)
80008f02:	00b70223          	sb	a1,4(a4)
80008f06:	00b701a3          	sb	a1,3(a4)
80008f0a:	00b70123          	sb	a1,2(a4)
80008f0e:	00b700a3          	sb	a1,1(a4)
80008f12:	00b70023          	sb	a1,0(a4)
80008f16:	8082                	ret
80008f18:	0ff5f593          	andi	a1,a1,255
80008f1c:	00859693          	slli	a3,a1,0x8
80008f20:	8dd5                	or	a1,a1,a3
80008f22:	01059693          	slli	a3,a1,0x10
80008f26:	8dd5                	or	a1,a1,a3
80008f28:	b761                	j	80008eb0 <memset+0x10>
80008f2a:	00279693          	slli	a3,a5,0x2
80008f2e:	00000297          	auipc	t0,0x0
80008f32:	9696                	add	a3,a3,t0
80008f34:	8286                	mv	t0,ra
80008f36:	fa8680e7          	jalr	-88(a3)
80008f3a:	8096                	mv	ra,t0
80008f3c:	17c1                	addi	a5,a5,-16
80008f3e:	8f1d                	sub	a4,a4,a5
80008f40:	963e                	add	a2,a2,a5
80008f42:	f8c374e3          	bgeu	t1,a2,80008eca <memset+0x2a>
80008f46:	b7a5                	j	80008eae <memset+0xe>

80008f48 <__malloc_lock>:
80008f48:	8082                	ret

80008f4a <__malloc_unlock>:
80008f4a:	8082                	ret

80008f4c <_sbrk_r>:
80008f4c:	1141                	addi	sp,sp,-16
80008f4e:	c422                	sw	s0,8(sp)
80008f50:	842a                	mv	s0,a0
80008f52:	852e                	mv	a0,a1
80008f54:	00003797          	auipc	a5,0x3
80008f58:	8c07a423          	sw	zero,-1848(a5) # 8000b81c <errno>
80008f5c:	c606                	sw	ra,12(sp)
80008f5e:	9fcff0ef          	jal	ra,8000815a <_sbrk>
80008f62:	57fd                	li	a5,-1
80008f64:	00f50663          	beq	a0,a5,80008f70 <_sbrk_r+0x24>
80008f68:	40b2                	lw	ra,12(sp)
80008f6a:	4422                	lw	s0,8(sp)
80008f6c:	0141                	addi	sp,sp,16
80008f6e:	8082                	ret
80008f70:	00003797          	auipc	a5,0x3
80008f74:	8ac7a783          	lw	a5,-1876(a5) # 8000b81c <errno>
80008f78:	dbe5                	beqz	a5,80008f68 <_sbrk_r+0x1c>
80008f7a:	40b2                	lw	ra,12(sp)
80008f7c:	c01c                	sw	a5,0(s0)
80008f7e:	4422                	lw	s0,8(sp)
80008f80:	0141                	addi	sp,sp,16
80008f82:	8082                	ret

80008f84 <_malloc_trim_r>:
80008f84:	1101                	addi	sp,sp,-32
80008f86:	cc22                	sw	s0,24(sp)
80008f88:	ca26                	sw	s1,20(sp)
80008f8a:	c84a                	sw	s2,16(sp)
80008f8c:	c64e                	sw	s3,12(sp)
80008f8e:	c452                	sw	s4,8(sp)
80008f90:	89ae                	mv	s3,a1
80008f92:	ce06                	sw	ra,28(sp)
80008f94:	00002a17          	auipc	s4,0x2
80008f98:	3cca0a13          	addi	s4,s4,972 # 8000b360 <__malloc_av_>
80008f9c:	892a                	mv	s2,a0
80008f9e:	376d                	jal	80008f48 <__malloc_lock>
80008fa0:	008a2703          	lw	a4,8(s4)
80008fa4:	6785                	lui	a5,0x1
80008fa6:	fef78413          	addi	s0,a5,-17 # fef <__stack_size-0x3ff011>
80008faa:	4344                	lw	s1,4(a4)
80008fac:	41340433          	sub	s0,s0,s3
80008fb0:	98f1                	andi	s1,s1,-4
80008fb2:	9426                	add	s0,s0,s1
80008fb4:	8031                	srli	s0,s0,0xc
80008fb6:	147d                	addi	s0,s0,-1
80008fb8:	0432                	slli	s0,s0,0xc
80008fba:	00f44a63          	blt	s0,a5,80008fce <_malloc_trim_r+0x4a>
80008fbe:	4581                	li	a1,0
80008fc0:	854a                	mv	a0,s2
80008fc2:	3769                	jal	80008f4c <_sbrk_r>
80008fc4:	008a2783          	lw	a5,8(s4)
80008fc8:	97a6                	add	a5,a5,s1
80008fca:	00f50d63          	beq	a0,a5,80008fe4 <_malloc_trim_r+0x60>
80008fce:	854a                	mv	a0,s2
80008fd0:	3fad                	jal	80008f4a <__malloc_unlock>
80008fd2:	40f2                	lw	ra,28(sp)
80008fd4:	4462                	lw	s0,24(sp)
80008fd6:	44d2                	lw	s1,20(sp)
80008fd8:	4942                	lw	s2,16(sp)
80008fda:	49b2                	lw	s3,12(sp)
80008fdc:	4a22                	lw	s4,8(sp)
80008fde:	4501                	li	a0,0
80008fe0:	6105                	addi	sp,sp,32
80008fe2:	8082                	ret
80008fe4:	408005b3          	neg	a1,s0
80008fe8:	854a                	mv	a0,s2
80008fea:	378d                	jal	80008f4c <_sbrk_r>
80008fec:	57fd                	li	a5,-1
80008fee:	02f50b63          	beq	a0,a5,80009024 <_malloc_trim_r+0xa0>
80008ff2:	0000b717          	auipc	a4,0xb
80008ff6:	82e70713          	addi	a4,a4,-2002 # 80013820 <__malloc_current_mallinfo>
80008ffa:	431c                	lw	a5,0(a4)
80008ffc:	008a2683          	lw	a3,8(s4)
80009000:	8c81                	sub	s1,s1,s0
80009002:	0014e493          	ori	s1,s1,1
80009006:	40878433          	sub	s0,a5,s0
8000900a:	854a                	mv	a0,s2
8000900c:	c2c4                	sw	s1,4(a3)
8000900e:	c300                	sw	s0,0(a4)
80009010:	3f2d                	jal	80008f4a <__malloc_unlock>
80009012:	40f2                	lw	ra,28(sp)
80009014:	4462                	lw	s0,24(sp)
80009016:	44d2                	lw	s1,20(sp)
80009018:	4942                	lw	s2,16(sp)
8000901a:	49b2                	lw	s3,12(sp)
8000901c:	4a22                	lw	s4,8(sp)
8000901e:	4505                	li	a0,1
80009020:	6105                	addi	sp,sp,32
80009022:	8082                	ret
80009024:	4581                	li	a1,0
80009026:	854a                	mv	a0,s2
80009028:	3715                	jal	80008f4c <_sbrk_r>
8000902a:	008a2703          	lw	a4,8(s4)
8000902e:	46bd                	li	a3,15
80009030:	40e507b3          	sub	a5,a0,a4
80009034:	f8f6dde3          	bge	a3,a5,80008fce <_malloc_trim_r+0x4a>
80009038:	00002697          	auipc	a3,0x2
8000903c:	7346a683          	lw	a3,1844(a3) # 8000b76c <__malloc_sbrk_base>
80009040:	8d15                	sub	a0,a0,a3
80009042:	0017e793          	ori	a5,a5,1
80009046:	0000a697          	auipc	a3,0xa
8000904a:	7ca6ad23          	sw	a0,2010(a3) # 80013820 <__malloc_current_mallinfo>
8000904e:	c35c                	sw	a5,4(a4)
80009050:	bfbd                	j	80008fce <_malloc_trim_r+0x4a>

80009052 <_free_r>:
80009052:	cde9                	beqz	a1,8000912c <_free_r+0xda>
80009054:	1141                	addi	sp,sp,-16
80009056:	c422                	sw	s0,8(sp)
80009058:	c226                	sw	s1,4(sp)
8000905a:	842e                	mv	s0,a1
8000905c:	84aa                	mv	s1,a0
8000905e:	c606                	sw	ra,12(sp)
80009060:	35e5                	jal	80008f48 <__malloc_lock>
80009062:	ffc42583          	lw	a1,-4(s0)
80009066:	ff840713          	addi	a4,s0,-8
8000906a:	00002817          	auipc	a6,0x2
8000906e:	2f680813          	addi	a6,a6,758 # 8000b360 <__malloc_av_>
80009072:	ffe5f793          	andi	a5,a1,-2
80009076:	00f70633          	add	a2,a4,a5
8000907a:	4254                	lw	a3,4(a2)
8000907c:	00882503          	lw	a0,8(a6)
80009080:	9af1                	andi	a3,a3,-4
80009082:	12c50363          	beq	a0,a2,800091a8 <_free_r+0x156>
80009086:	c254                	sw	a3,4(a2)
80009088:	8985                	andi	a1,a1,1
8000908a:	00d60533          	add	a0,a2,a3
8000908e:	e9b5                	bnez	a1,80009102 <_free_r+0xb0>
80009090:	ff842303          	lw	t1,-8(s0)
80009094:	414c                	lw	a1,4(a0)
80009096:	00002897          	auipc	a7,0x2
8000909a:	2d288893          	addi	a7,a7,722 # 8000b368 <__malloc_av_+0x8>
8000909e:	40670733          	sub	a4,a4,t1
800090a2:	4708                	lw	a0,8(a4)
800090a4:	979a                	add	a5,a5,t1
800090a6:	8985                	andi	a1,a1,1
800090a8:	0d150f63          	beq	a0,a7,80009186 <_free_r+0x134>
800090ac:	00c72303          	lw	t1,12(a4)
800090b0:	00652623          	sw	t1,12(a0)
800090b4:	00a32423          	sw	a0,8(t1)
800090b8:	14058463          	beqz	a1,80009200 <_free_r+0x1ae>
800090bc:	0017e693          	ori	a3,a5,1
800090c0:	c354                	sw	a3,4(a4)
800090c2:	c21c                	sw	a5,0(a2)
800090c4:	1ff00693          	li	a3,511
800090c8:	06f6ec63          	bltu	a3,a5,80009140 <_free_r+0xee>
800090cc:	ff87f693          	andi	a3,a5,-8
800090d0:	06a1                	addi	a3,a3,8
800090d2:	00482583          	lw	a1,4(a6)
800090d6:	96c2                	add	a3,a3,a6
800090d8:	4290                	lw	a2,0(a3)
800090da:	0057d513          	srli	a0,a5,0x5
800090de:	4785                	li	a5,1
800090e0:	00a797b3          	sll	a5,a5,a0
800090e4:	8fcd                	or	a5,a5,a1
800090e6:	ff868593          	addi	a1,a3,-8
800090ea:	c74c                	sw	a1,12(a4)
800090ec:	c710                	sw	a2,8(a4)
800090ee:	00f82223          	sw	a5,4(a6)
800090f2:	c298                	sw	a4,0(a3)
800090f4:	c658                	sw	a4,12(a2)
800090f6:	4422                	lw	s0,8(sp)
800090f8:	40b2                	lw	ra,12(sp)
800090fa:	8526                	mv	a0,s1
800090fc:	4492                	lw	s1,4(sp)
800090fe:	0141                	addi	sp,sp,16
80009100:	b5a9                	j	80008f4a <__malloc_unlock>
80009102:	414c                	lw	a1,4(a0)
80009104:	8985                	andi	a1,a1,1
80009106:	e585                	bnez	a1,8000912e <_free_r+0xdc>
80009108:	97b6                	add	a5,a5,a3
8000910a:	00002897          	auipc	a7,0x2
8000910e:	25e88893          	addi	a7,a7,606 # 8000b368 <__malloc_av_+0x8>
80009112:	4614                	lw	a3,8(a2)
80009114:	0017e513          	ori	a0,a5,1
80009118:	00f705b3          	add	a1,a4,a5
8000911c:	0f168a63          	beq	a3,a7,80009210 <_free_r+0x1be>
80009120:	4650                	lw	a2,12(a2)
80009122:	c6d0                	sw	a2,12(a3)
80009124:	c614                	sw	a3,8(a2)
80009126:	c348                	sw	a0,4(a4)
80009128:	c19c                	sw	a5,0(a1)
8000912a:	bf69                	j	800090c4 <_free_r+0x72>
8000912c:	8082                	ret
8000912e:	0017e693          	ori	a3,a5,1
80009132:	fed42e23          	sw	a3,-4(s0)
80009136:	c21c                	sw	a5,0(a2)
80009138:	1ff00693          	li	a3,511
8000913c:	f8f6f8e3          	bgeu	a3,a5,800090cc <_free_r+0x7a>
80009140:	0097d693          	srli	a3,a5,0x9
80009144:	4611                	li	a2,4
80009146:	08d66e63          	bltu	a2,a3,800091e2 <_free_r+0x190>
8000914a:	0067d693          	srli	a3,a5,0x6
8000914e:	03968593          	addi	a1,a3,57
80009152:	03868613          	addi	a2,a3,56
80009156:	058e                	slli	a1,a1,0x3
80009158:	95c2                	add	a1,a1,a6
8000915a:	4194                	lw	a3,0(a1)
8000915c:	15e1                	addi	a1,a1,-8
8000915e:	0cd58463          	beq	a1,a3,80009226 <_free_r+0x1d4>
80009162:	42d0                	lw	a2,4(a3)
80009164:	9a71                	andi	a2,a2,-4
80009166:	00c7f563          	bgeu	a5,a2,80009170 <_free_r+0x11e>
8000916a:	4694                	lw	a3,8(a3)
8000916c:	fed59be3          	bne	a1,a3,80009162 <_free_r+0x110>
80009170:	46cc                	lw	a1,12(a3)
80009172:	c74c                	sw	a1,12(a4)
80009174:	c714                	sw	a3,8(a4)
80009176:	4422                	lw	s0,8(sp)
80009178:	40b2                	lw	ra,12(sp)
8000917a:	c598                	sw	a4,8(a1)
8000917c:	8526                	mv	a0,s1
8000917e:	4492                	lw	s1,4(sp)
80009180:	c6d8                	sw	a4,12(a3)
80009182:	0141                	addi	sp,sp,16
80009184:	b3d9                	j	80008f4a <__malloc_unlock>
80009186:	e5fd                	bnez	a1,80009274 <_free_r+0x222>
80009188:	464c                	lw	a1,12(a2)
8000918a:	4610                	lw	a2,8(a2)
8000918c:	97b6                	add	a5,a5,a3
8000918e:	4422                	lw	s0,8(sp)
80009190:	c64c                	sw	a1,12(a2)
80009192:	c590                	sw	a2,8(a1)
80009194:	0017e693          	ori	a3,a5,1
80009198:	40b2                	lw	ra,12(sp)
8000919a:	c354                	sw	a3,4(a4)
8000919c:	8526                	mv	a0,s1
8000919e:	973e                	add	a4,a4,a5
800091a0:	4492                	lw	s1,4(sp)
800091a2:	c31c                	sw	a5,0(a4)
800091a4:	0141                	addi	sp,sp,16
800091a6:	b355                	j	80008f4a <__malloc_unlock>
800091a8:	8985                	andi	a1,a1,1
800091aa:	97b6                	add	a5,a5,a3
800091ac:	e989                	bnez	a1,800091be <_free_r+0x16c>
800091ae:	ff842583          	lw	a1,-8(s0)
800091b2:	8f0d                	sub	a4,a4,a1
800091b4:	4754                	lw	a3,12(a4)
800091b6:	4710                	lw	a2,8(a4)
800091b8:	97ae                	add	a5,a5,a1
800091ba:	c654                	sw	a3,12(a2)
800091bc:	c690                	sw	a2,8(a3)
800091be:	0017e693          	ori	a3,a5,1
800091c2:	c354                	sw	a3,4(a4)
800091c4:	00e82423          	sw	a4,8(a6)
800091c8:	00002717          	auipc	a4,0x2
800091cc:	5a872703          	lw	a4,1448(a4) # 8000b770 <__malloc_trim_threshold>
800091d0:	f2e7e3e3          	bltu	a5,a4,800090f6 <_free_r+0xa4>
800091d4:	00002597          	auipc	a1,0x2
800091d8:	6445a583          	lw	a1,1604(a1) # 8000b818 <__malloc_top_pad>
800091dc:	8526                	mv	a0,s1
800091de:	335d                	jal	80008f84 <_malloc_trim_r>
800091e0:	bf19                	j	800090f6 <_free_r+0xa4>
800091e2:	4651                	li	a2,20
800091e4:	02d67063          	bgeu	a2,a3,80009204 <_free_r+0x1b2>
800091e8:	05400613          	li	a2,84
800091ec:	04d66763          	bltu	a2,a3,8000923a <_free_r+0x1e8>
800091f0:	00c7d693          	srli	a3,a5,0xc
800091f4:	06f68593          	addi	a1,a3,111
800091f8:	06e68613          	addi	a2,a3,110
800091fc:	058e                	slli	a1,a1,0x3
800091fe:	bfa9                	j	80009158 <_free_r+0x106>
80009200:	97b6                	add	a5,a5,a3
80009202:	bf01                	j	80009112 <_free_r+0xc0>
80009204:	05c68593          	addi	a1,a3,92
80009208:	05b68613          	addi	a2,a3,91
8000920c:	058e                	slli	a1,a1,0x3
8000920e:	b7a9                	j	80009158 <_free_r+0x106>
80009210:	00e82a23          	sw	a4,20(a6)
80009214:	00e82823          	sw	a4,16(a6)
80009218:	01172623          	sw	a7,12(a4)
8000921c:	01172423          	sw	a7,8(a4)
80009220:	c348                	sw	a0,4(a4)
80009222:	c19c                	sw	a5,0(a1)
80009224:	bdc9                	j	800090f6 <_free_r+0xa4>
80009226:	00482503          	lw	a0,4(a6)
8000922a:	8609                	srai	a2,a2,0x2
8000922c:	4785                	li	a5,1
8000922e:	00c79633          	sll	a2,a5,a2
80009232:	8e49                	or	a2,a2,a0
80009234:	00c82223          	sw	a2,4(a6)
80009238:	bf2d                	j	80009172 <_free_r+0x120>
8000923a:	15400613          	li	a2,340
8000923e:	00d66a63          	bltu	a2,a3,80009252 <_free_r+0x200>
80009242:	00f7d693          	srli	a3,a5,0xf
80009246:	07868593          	addi	a1,a3,120
8000924a:	07768613          	addi	a2,a3,119
8000924e:	058e                	slli	a1,a1,0x3
80009250:	b721                	j	80009158 <_free_r+0x106>
80009252:	55400613          	li	a2,1364
80009256:	00d66a63          	bltu	a2,a3,8000926a <_free_r+0x218>
8000925a:	0127d693          	srli	a3,a5,0x12
8000925e:	07d68593          	addi	a1,a3,125
80009262:	07c68613          	addi	a2,a3,124
80009266:	058e                	slli	a1,a1,0x3
80009268:	bdc5                	j	80009158 <_free_r+0x106>
8000926a:	3f800593          	li	a1,1016
8000926e:	07e00613          	li	a2,126
80009272:	b5dd                	j	80009158 <_free_r+0x106>
80009274:	0017e693          	ori	a3,a5,1
80009278:	c354                	sw	a3,4(a4)
8000927a:	c21c                	sw	a5,0(a2)
8000927c:	bdad                	j	800090f6 <_free_r+0xa4>

8000927e <cleanup_glue>:
8000927e:	1101                	addi	sp,sp,-32
80009280:	c84a                	sw	s2,16(sp)
80009282:	0005a903          	lw	s2,0(a1)
80009286:	cc22                	sw	s0,24(sp)
80009288:	ca26                	sw	s1,20(sp)
8000928a:	ce06                	sw	ra,28(sp)
8000928c:	c64e                	sw	s3,12(sp)
8000928e:	c452                	sw	s4,8(sp)
80009290:	842e                	mv	s0,a1
80009292:	84aa                	mv	s1,a0
80009294:	02090a63          	beqz	s2,800092c8 <cleanup_glue+0x4a>
80009298:	00092983          	lw	s3,0(s2)
8000929c:	02098263          	beqz	s3,800092c0 <cleanup_glue+0x42>
800092a0:	0009aa03          	lw	s4,0(s3)
800092a4:	000a0a63          	beqz	s4,800092b8 <cleanup_glue+0x3a>
800092a8:	000a2583          	lw	a1,0(s4)
800092ac:	c191                	beqz	a1,800092b0 <cleanup_glue+0x32>
800092ae:	3fc1                	jal	8000927e <cleanup_glue>
800092b0:	85d2                	mv	a1,s4
800092b2:	8526                	mv	a0,s1
800092b4:	d9fff0ef          	jal	ra,80009052 <_free_r>
800092b8:	85ce                	mv	a1,s3
800092ba:	8526                	mv	a0,s1
800092bc:	d97ff0ef          	jal	ra,80009052 <_free_r>
800092c0:	85ca                	mv	a1,s2
800092c2:	8526                	mv	a0,s1
800092c4:	d8fff0ef          	jal	ra,80009052 <_free_r>
800092c8:	85a2                	mv	a1,s0
800092ca:	4462                	lw	s0,24(sp)
800092cc:	40f2                	lw	ra,28(sp)
800092ce:	4942                	lw	s2,16(sp)
800092d0:	49b2                	lw	s3,12(sp)
800092d2:	4a22                	lw	s4,8(sp)
800092d4:	8526                	mv	a0,s1
800092d6:	44d2                	lw	s1,20(sp)
800092d8:	6105                	addi	sp,sp,32
800092da:	d79ff06f          	j	80009052 <_free_r>

800092de <_reclaim_reent>:
800092de:	00002797          	auipc	a5,0x2
800092e2:	48a7a783          	lw	a5,1162(a5) # 8000b768 <_impure_ptr>
800092e6:	0aa78463          	beq	a5,a0,8000938e <_reclaim_reent+0xb0>
800092ea:	456c                	lw	a1,76(a0)
800092ec:	1101                	addi	sp,sp,-32
800092ee:	ca26                	sw	s1,20(sp)
800092f0:	ce06                	sw	ra,28(sp)
800092f2:	cc22                	sw	s0,24(sp)
800092f4:	c84a                	sw	s2,16(sp)
800092f6:	c64e                	sw	s3,12(sp)
800092f8:	84aa                	mv	s1,a0
800092fa:	c58d                	beqz	a1,80009324 <_reclaim_reent+0x46>
800092fc:	4901                	li	s2,0
800092fe:	08000993          	li	s3,128
80009302:	012587b3          	add	a5,a1,s2
80009306:	4380                	lw	s0,0(a5)
80009308:	c801                	beqz	s0,80009318 <_reclaim_reent+0x3a>
8000930a:	85a2                	mv	a1,s0
8000930c:	4000                	lw	s0,0(s0)
8000930e:	8526                	mv	a0,s1
80009310:	d43ff0ef          	jal	ra,80009052 <_free_r>
80009314:	f87d                	bnez	s0,8000930a <_reclaim_reent+0x2c>
80009316:	44ec                	lw	a1,76(s1)
80009318:	0911                	addi	s2,s2,4
8000931a:	ff3914e3          	bne	s2,s3,80009302 <_reclaim_reent+0x24>
8000931e:	8526                	mv	a0,s1
80009320:	d33ff0ef          	jal	ra,80009052 <_free_r>
80009324:	40ac                	lw	a1,64(s1)
80009326:	c581                	beqz	a1,8000932e <_reclaim_reent+0x50>
80009328:	8526                	mv	a0,s1
8000932a:	d29ff0ef          	jal	ra,80009052 <_free_r>
8000932e:	1484a403          	lw	s0,328(s1)
80009332:	cc01                	beqz	s0,8000934a <_reclaim_reent+0x6c>
80009334:	14c48913          	addi	s2,s1,332
80009338:	01240963          	beq	s0,s2,8000934a <_reclaim_reent+0x6c>
8000933c:	85a2                	mv	a1,s0
8000933e:	4000                	lw	s0,0(s0)
80009340:	8526                	mv	a0,s1
80009342:	d11ff0ef          	jal	ra,80009052 <_free_r>
80009346:	fe891be3          	bne	s2,s0,8000933c <_reclaim_reent+0x5e>
8000934a:	48ec                	lw	a1,84(s1)
8000934c:	c581                	beqz	a1,80009354 <_reclaim_reent+0x76>
8000934e:	8526                	mv	a0,s1
80009350:	d03ff0ef          	jal	ra,80009052 <_free_r>
80009354:	5c9c                	lw	a5,56(s1)
80009356:	c78d                	beqz	a5,80009380 <_reclaim_reent+0xa2>
80009358:	5cdc                	lw	a5,60(s1)
8000935a:	8526                	mv	a0,s1
8000935c:	9782                	jalr	a5
8000935e:	2e04a403          	lw	s0,736(s1)
80009362:	cc19                	beqz	s0,80009380 <_reclaim_reent+0xa2>
80009364:	400c                	lw	a1,0(s0)
80009366:	c199                	beqz	a1,8000936c <_reclaim_reent+0x8e>
80009368:	8526                	mv	a0,s1
8000936a:	3f11                	jal	8000927e <cleanup_glue>
8000936c:	85a2                	mv	a1,s0
8000936e:	4462                	lw	s0,24(sp)
80009370:	40f2                	lw	ra,28(sp)
80009372:	4942                	lw	s2,16(sp)
80009374:	49b2                	lw	s3,12(sp)
80009376:	8526                	mv	a0,s1
80009378:	44d2                	lw	s1,20(sp)
8000937a:	6105                	addi	sp,sp,32
8000937c:	cd7ff06f          	j	80009052 <_free_r>
80009380:	40f2                	lw	ra,28(sp)
80009382:	4462                	lw	s0,24(sp)
80009384:	44d2                	lw	s1,20(sp)
80009386:	4942                	lw	s2,16(sp)
80009388:	49b2                	lw	s3,12(sp)
8000938a:	6105                	addi	sp,sp,32
8000938c:	8082                	ret
8000938e:	8082                	ret

80009390 <__ctzsi2>:
80009390:	40a007b3          	neg	a5,a0
80009394:	8d7d                	and	a0,a0,a5
80009396:	67c1                	lui	a5,0x10
80009398:	02f57363          	bgeu	a0,a5,800093be <__ctzsi2+0x2e>
8000939c:	0ff00793          	li	a5,255
800093a0:	00a7b7b3          	sltu	a5,a5,a0
800093a4:	078e                	slli	a5,a5,0x3
800093a6:	00f55533          	srl	a0,a0,a5
800093aa:	00002717          	auipc	a4,0x2
800093ae:	a8a70713          	addi	a4,a4,-1398 # 8000ae34 <__clz_tab>
800093b2:	953a                	add	a0,a0,a4
800093b4:	00054503          	lbu	a0,0(a0)
800093b8:	17fd                	addi	a5,a5,-1
800093ba:	953e                	add	a0,a0,a5
800093bc:	8082                	ret
800093be:	01000737          	lui	a4,0x1000
800093c2:	47c1                	li	a5,16
800093c4:	fee561e3          	bltu	a0,a4,800093a6 <__ctzsi2+0x16>
800093c8:	47e1                	li	a5,24
800093ca:	bff1                	j	800093a6 <__ctzsi2+0x16>

800093cc <__eqdf2>:
800093cc:	882a                	mv	a6,a0
800093ce:	002027f3          	frrm	a5
800093d2:	001007b7          	lui	a5,0x100
800093d6:	0145d893          	srli	a7,a1,0x14
800093da:	17fd                	addi	a5,a5,-1
800093dc:	0146d313          	srli	t1,a3,0x14
800093e0:	8e2a                	mv	t3,a0
800093e2:	7ff8f893          	andi	a7,a7,2047
800093e6:	7ff00513          	li	a0,2047
800093ea:	00b7f733          	and	a4,a5,a1
800093ee:	8eb2                	mv	t4,a2
800093f0:	8ff5                	and	a5,a5,a3
800093f2:	81fd                	srli	a1,a1,0x1f
800093f4:	7ff37313          	andi	t1,t1,2047
800093f8:	82fd                	srli	a3,a3,0x1f
800093fa:	00a89863          	bne	a7,a0,8000940a <__eqdf2+0x3e>
800093fe:	01076533          	or	a0,a4,a6
80009402:	e531                	bnez	a0,8000944e <__eqdf2+0x82>
80009404:	07131463          	bne	t1,a7,8000946c <__eqdf2+0xa0>
80009408:	a019                	j	8000940e <__eqdf2+0x42>
8000940a:	00a31563          	bne	t1,a0,80009414 <__eqdf2+0x48>
8000940e:	00c7e533          	or	a0,a5,a2
80009412:	e515                	bnez	a0,8000943e <__eqdf2+0x72>
80009414:	4505                	li	a0,1
80009416:	04689c63          	bne	a7,t1,8000946e <__eqdf2+0xa2>
8000941a:	04f71a63          	bne	a4,a5,8000946e <__eqdf2+0xa2>
8000941e:	05de1863          	bne	t3,t4,8000946e <__eqdf2+0xa2>
80009422:	00d58c63          	beq	a1,a3,8000943a <__eqdf2+0x6e>
80009426:	04089463          	bnez	a7,8000946e <__eqdf2+0xa2>
8000942a:	01076733          	or	a4,a4,a6
8000942e:	00e03533          	snez	a0,a4
80009432:	8082                	ret
80009434:	00186073          	csrsi	fflags,16
80009438:	a815                	j	8000946c <__eqdf2+0xa0>
8000943a:	4501                	li	a0,0
8000943c:	8082                	ret
8000943e:	7ff00693          	li	a3,2047
80009442:	02d89163          	bne	a7,a3,80009464 <__eqdf2+0x98>
80009446:	01076833          	or	a6,a4,a6
8000944a:	00080d63          	beqz	a6,80009464 <__eqdf2+0x98>
8000944e:	000806b7          	lui	a3,0x80
80009452:	8f75                	and	a4,a4,a3
80009454:	d365                	beqz	a4,80009434 <__eqdf2+0x68>
80009456:	7ff00713          	li	a4,2047
8000945a:	4505                	li	a0,1
8000945c:	00e31963          	bne	t1,a4,8000946e <__eqdf2+0xa2>
80009460:	8e5d                	or	a2,a2,a5
80009462:	c611                	beqz	a2,8000946e <__eqdf2+0xa2>
80009464:	00080737          	lui	a4,0x80
80009468:	8ff9                	and	a5,a5,a4
8000946a:	d7e9                	beqz	a5,80009434 <__eqdf2+0x68>
8000946c:	4505                	li	a0,1
8000946e:	8082                	ret

80009470 <__gedf2>:
80009470:	87aa                	mv	a5,a0
80009472:	00202773          	frrm	a4
80009476:	00100737          	lui	a4,0x100
8000947a:	177d                	addi	a4,a4,-1
8000947c:	0145d813          	srli	a6,a1,0x14
80009480:	00b778b3          	and	a7,a4,a1
80009484:	832a                	mv	t1,a0
80009486:	7ff87813          	andi	a6,a6,2047
8000948a:	01f5d513          	srli	a0,a1,0x1f
8000948e:	7ff00e93          	li	t4,2047
80009492:	0146d593          	srli	a1,a3,0x14
80009496:	8f75                	and	a4,a4,a3
80009498:	8e32                	mv	t3,a2
8000949a:	7ff5f593          	andi	a1,a1,2047
8000949e:	82fd                	srli	a3,a3,0x1f
800094a0:	01d81a63          	bne	a6,t4,800094b4 <__gedf2+0x44>
800094a4:	00f8eeb3          	or	t4,a7,a5
800094a8:	060e8663          	beqz	t4,80009514 <__gedf2+0xa4>
800094ac:	00186073          	csrsi	fflags,16
800094b0:	5579                	li	a0,-2
800094b2:	8082                	ret
800094b4:	01d59663          	bne	a1,t4,800094c0 <__gedf2+0x50>
800094b8:	00c76eb3          	or	t4,a4,a2
800094bc:	fe0e98e3          	bnez	t4,800094ac <__gedf2+0x3c>
800094c0:	04081c63          	bnez	a6,80009518 <__gedf2+0xa8>
800094c4:	00f8e7b3          	or	a5,a7,a5
800094c8:	0017b793          	seqz	a5,a5
800094cc:	e199                	bnez	a1,800094d2 <__gedf2+0x62>
800094ce:	8e59                	or	a2,a2,a4
800094d0:	ce0d                	beqz	a2,8000950a <__gedf2+0x9a>
800094d2:	eb81                	bnez	a5,800094e2 <__gedf2+0x72>
800094d4:	00d51463          	bne	a0,a3,800094dc <__gedf2+0x6c>
800094d8:	0105d963          	bge	a1,a6,800094ea <__gedf2+0x7a>
800094dc:	c50d                	beqz	a0,80009506 <__gedf2+0x96>
800094de:	557d                	li	a0,-1
800094e0:	8082                	ret
800094e2:	557d                	li	a0,-1
800094e4:	c691                	beqz	a3,800094f0 <__gedf2+0x80>
800094e6:	8536                	mv	a0,a3
800094e8:	8082                	ret
800094ea:	00b85463          	bge	a6,a1,800094f2 <__gedf2+0x82>
800094ee:	d965                	beqz	a0,800094de <__gedf2+0x6e>
800094f0:	8082                	ret
800094f2:	ff1765e3          	bltu	a4,a7,800094dc <__gedf2+0x6c>
800094f6:	00e89c63          	bne	a7,a4,8000950e <__gedf2+0x9e>
800094fa:	fe6e61e3          	bltu	t3,t1,800094dc <__gedf2+0x6c>
800094fe:	ffc368e3          	bltu	t1,t3,800094ee <__gedf2+0x7e>
80009502:	4501                	li	a0,0
80009504:	8082                	ret
80009506:	4505                	li	a0,1
80009508:	8082                	ret
8000950a:	ffe5                	bnez	a5,80009502 <__gedf2+0x92>
8000950c:	bfc1                	j	800094dc <__gedf2+0x6c>
8000950e:	fee8e0e3          	bltu	a7,a4,800094ee <__gedf2+0x7e>
80009512:	bfc5                	j	80009502 <__gedf2+0x92>
80009514:	fb0582e3          	beq	a1,a6,800094b8 <__gedf2+0x48>
80009518:	fdd5                	bnez	a1,800094d4 <__gedf2+0x64>
8000951a:	4781                	li	a5,0
8000951c:	bf4d                	j	800094ce <__gedf2+0x5e>

8000951e <__ledf2>:
8000951e:	87aa                	mv	a5,a0
80009520:	00202773          	frrm	a4
80009524:	00100737          	lui	a4,0x100
80009528:	177d                	addi	a4,a4,-1
8000952a:	0145d813          	srli	a6,a1,0x14
8000952e:	00b778b3          	and	a7,a4,a1
80009532:	832a                	mv	t1,a0
80009534:	7ff87813          	andi	a6,a6,2047
80009538:	01f5d513          	srli	a0,a1,0x1f
8000953c:	7ff00e93          	li	t4,2047
80009540:	0146d593          	srli	a1,a3,0x14
80009544:	8f75                	and	a4,a4,a3
80009546:	8e32                	mv	t3,a2
80009548:	7ff5f593          	andi	a1,a1,2047
8000954c:	82fd                	srli	a3,a3,0x1f
8000954e:	01d81a63          	bne	a6,t4,80009562 <__ledf2+0x44>
80009552:	00f8eeb3          	or	t4,a7,a5
80009556:	060e8663          	beqz	t4,800095c2 <__ledf2+0xa4>
8000955a:	00186073          	csrsi	fflags,16
8000955e:	4509                	li	a0,2
80009560:	8082                	ret
80009562:	01d59663          	bne	a1,t4,8000956e <__ledf2+0x50>
80009566:	00c76eb3          	or	t4,a4,a2
8000956a:	fe0e98e3          	bnez	t4,8000955a <__ledf2+0x3c>
8000956e:	04081c63          	bnez	a6,800095c6 <__ledf2+0xa8>
80009572:	00f8e7b3          	or	a5,a7,a5
80009576:	0017b793          	seqz	a5,a5
8000957a:	e199                	bnez	a1,80009580 <__ledf2+0x62>
8000957c:	8e59                	or	a2,a2,a4
8000957e:	ce0d                	beqz	a2,800095b8 <__ledf2+0x9a>
80009580:	eb81                	bnez	a5,80009590 <__ledf2+0x72>
80009582:	00d51463          	bne	a0,a3,8000958a <__ledf2+0x6c>
80009586:	0105d963          	bge	a1,a6,80009598 <__ledf2+0x7a>
8000958a:	c50d                	beqz	a0,800095b4 <__ledf2+0x96>
8000958c:	557d                	li	a0,-1
8000958e:	8082                	ret
80009590:	557d                	li	a0,-1
80009592:	c691                	beqz	a3,8000959e <__ledf2+0x80>
80009594:	8536                	mv	a0,a3
80009596:	8082                	ret
80009598:	00b85463          	bge	a6,a1,800095a0 <__ledf2+0x82>
8000959c:	d965                	beqz	a0,8000958c <__ledf2+0x6e>
8000959e:	8082                	ret
800095a0:	ff1765e3          	bltu	a4,a7,8000958a <__ledf2+0x6c>
800095a4:	00e89c63          	bne	a7,a4,800095bc <__ledf2+0x9e>
800095a8:	fe6e61e3          	bltu	t3,t1,8000958a <__ledf2+0x6c>
800095ac:	ffc368e3          	bltu	t1,t3,8000959c <__ledf2+0x7e>
800095b0:	4501                	li	a0,0
800095b2:	8082                	ret
800095b4:	4505                	li	a0,1
800095b6:	8082                	ret
800095b8:	ffe5                	bnez	a5,800095b0 <__ledf2+0x92>
800095ba:	bfc1                	j	8000958a <__ledf2+0x6c>
800095bc:	fee8e0e3          	bltu	a7,a4,8000959c <__ledf2+0x7e>
800095c0:	bfc5                	j	800095b0 <__ledf2+0x92>
800095c2:	fb0582e3          	beq	a1,a6,80009566 <__ledf2+0x48>
800095c6:	fdd5                	bnez	a1,80009582 <__ledf2+0x64>
800095c8:	4781                	li	a5,0
800095ca:	bf4d                	j	8000957c <__ledf2+0x5e>

800095cc <__muldf3>:
800095cc:	7179                	addi	sp,sp,-48
800095ce:	d422                	sw	s0,40(sp)
800095d0:	ca56                	sw	s5,20(sp)
800095d2:	c266                	sw	s9,4(sp)
800095d4:	d606                	sw	ra,44(sp)
800095d6:	d226                	sw	s1,36(sp)
800095d8:	d04a                	sw	s2,32(sp)
800095da:	ce4e                	sw	s3,28(sp)
800095dc:	cc52                	sw	s4,24(sp)
800095de:	c85a                	sw	s6,16(sp)
800095e0:	c65e                	sw	s7,12(sp)
800095e2:	c462                	sw	s8,8(sp)
800095e4:	842a                	mv	s0,a0
800095e6:	8cb2                	mv	s9,a2
800095e8:	8ab6                	mv	s5,a3
800095ea:	00202973          	frrm	s2
800095ee:	0145db93          	srli	s7,a1,0x14
800095f2:	00c59993          	slli	s3,a1,0xc
800095f6:	7ffbfb93          	andi	s7,s7,2047
800095fa:	00c9d993          	srli	s3,s3,0xc
800095fe:	01f5db13          	srli	s6,a1,0x1f
80009602:	020b8663          	beqz	s7,8000962e <__muldf3+0x62>
80009606:	7ff00793          	li	a5,2047
8000960a:	06fb8b63          	beq	s7,a5,80009680 <__muldf3+0xb4>
8000960e:	01d55793          	srli	a5,a0,0x1d
80009612:	098e                	slli	s3,s3,0x3
80009614:	0137e9b3          	or	s3,a5,s3
80009618:	008007b7          	lui	a5,0x800
8000961c:	00f9e9b3          	or	s3,s3,a5
80009620:	00351a13          	slli	s4,a0,0x3
80009624:	c01b8b93          	addi	s7,s7,-1023
80009628:	4c01                	li	s8,0
8000962a:	4481                	li	s1,0
8000962c:	a0bd                	j	8000969a <__muldf3+0xce>
8000962e:	00a9e7b3          	or	a5,s3,a0
80009632:	c7e1                	beqz	a5,800096fa <__muldf3+0x12e>
80009634:	02098b63          	beqz	s3,8000966a <__muldf3+0x9e>
80009638:	854e                	mv	a0,s3
8000963a:	7cb000ef          	jal	ra,8000a604 <__clzsi2>
8000963e:	ff550713          	addi	a4,a0,-11
80009642:	47f1                	li	a5,28
80009644:	02e7c863          	blt	a5,a4,80009674 <__muldf3+0xa8>
80009648:	47f5                	li	a5,29
8000964a:	ff850a13          	addi	s4,a0,-8
8000964e:	8f99                	sub	a5,a5,a4
80009650:	014999b3          	sll	s3,s3,s4
80009654:	00f457b3          	srl	a5,s0,a5
80009658:	0137e9b3          	or	s3,a5,s3
8000965c:	01441a33          	sll	s4,s0,s4
80009660:	c0d00b93          	li	s7,-1011
80009664:	40ab8bb3          	sub	s7,s7,a0
80009668:	b7c1                	j	80009628 <__muldf3+0x5c>
8000966a:	79b000ef          	jal	ra,8000a604 <__clzsi2>
8000966e:	02050513          	addi	a0,a0,32
80009672:	b7f1                	j	8000963e <__muldf3+0x72>
80009674:	fd850993          	addi	s3,a0,-40
80009678:	013419b3          	sll	s3,s0,s3
8000967c:	4a01                	li	s4,0
8000967e:	b7cd                	j	80009660 <__muldf3+0x94>
80009680:	00a9e433          	or	s0,s3,a0
80009684:	c041                	beqz	s0,80009704 <__muldf3+0x138>
80009686:	000807b7          	lui	a5,0x80
8000968a:	00f9f7b3          	and	a5,s3,a5
8000968e:	8a2a                	mv	s4,a0
80009690:	7ff00b93          	li	s7,2047
80009694:	4c0d                	li	s8,3
80009696:	44c1                	li	s1,16
80009698:	fbc9                	bnez	a5,8000962a <__muldf3+0x5e>
8000969a:	014ad513          	srli	a0,s5,0x14
8000969e:	00ca9413          	slli	s0,s5,0xc
800096a2:	7ff57513          	andi	a0,a0,2047
800096a6:	87e6                	mv	a5,s9
800096a8:	8031                	srli	s0,s0,0xc
800096aa:	01fada93          	srli	s5,s5,0x1f
800096ae:	c12d                	beqz	a0,80009710 <__muldf3+0x144>
800096b0:	7ff00713          	li	a4,2047
800096b4:	0ae50663          	beq	a0,a4,80009760 <__muldf3+0x194>
800096b8:	01dcd793          	srli	a5,s9,0x1d
800096bc:	040e                	slli	s0,s0,0x3
800096be:	8c5d                	or	s0,s0,a5
800096c0:	008007b7          	lui	a5,0x800
800096c4:	8c5d                	or	s0,s0,a5
800096c6:	c0150513          	addi	a0,a0,-1023
800096ca:	003c9793          	slli	a5,s9,0x3
800096ce:	4701                	li	a4,0
800096d0:	002c1693          	slli	a3,s8,0x2
800096d4:	8ed9                	or	a3,a3,a4
800096d6:	9baa                	add	s7,s7,a0
800096d8:	16fd                	addi	a3,a3,-1
800096da:	4639                	li	a2,14
800096dc:	015b45b3          	xor	a1,s6,s5
800096e0:	001b8513          	addi	a0,s7,1
800096e4:	0ed66a63          	bltu	a2,a3,800097d8 <__muldf3+0x20c>
800096e8:	00001617          	auipc	a2,0x1
800096ec:	71060613          	addi	a2,a2,1808 # 8000adf8 <MiCo_QMatMul+0x36c>
800096f0:	068a                	slli	a3,a3,0x2
800096f2:	96b2                	add	a3,a3,a2
800096f4:	4294                	lw	a3,0(a3)
800096f6:	96b2                	add	a3,a3,a2
800096f8:	8682                	jr	a3
800096fa:	4981                	li	s3,0
800096fc:	4a01                	li	s4,0
800096fe:	4b81                	li	s7,0
80009700:	4c05                	li	s8,1
80009702:	b725                	j	8000962a <__muldf3+0x5e>
80009704:	4981                	li	s3,0
80009706:	4a01                	li	s4,0
80009708:	7ff00b93          	li	s7,2047
8000970c:	4c09                	li	s8,2
8000970e:	bf31                	j	8000962a <__muldf3+0x5e>
80009710:	019467b3          	or	a5,s0,s9
80009714:	c3b5                	beqz	a5,80009778 <__muldf3+0x1ac>
80009716:	c80d                	beqz	s0,80009748 <__muldf3+0x17c>
80009718:	8522                	mv	a0,s0
8000971a:	6eb000ef          	jal	ra,8000a604 <__clzsi2>
8000971e:	ff550693          	addi	a3,a0,-11
80009722:	47f1                	li	a5,28
80009724:	02d7c863          	blt	a5,a3,80009754 <__muldf3+0x188>
80009728:	4775                	li	a4,29
8000972a:	ff850793          	addi	a5,a0,-8
8000972e:	8f15                	sub	a4,a4,a3
80009730:	00f41433          	sll	s0,s0,a5
80009734:	00ecd733          	srl	a4,s9,a4
80009738:	8c59                	or	s0,s0,a4
8000973a:	00fc97b3          	sll	a5,s9,a5
8000973e:	c0d00713          	li	a4,-1011
80009742:	40a70533          	sub	a0,a4,a0
80009746:	b761                	j	800096ce <__muldf3+0x102>
80009748:	8566                	mv	a0,s9
8000974a:	6bb000ef          	jal	ra,8000a604 <__clzsi2>
8000974e:	02050513          	addi	a0,a0,32
80009752:	b7f1                	j	8000971e <__muldf3+0x152>
80009754:	fd850413          	addi	s0,a0,-40
80009758:	008c9433          	sll	s0,s9,s0
8000975c:	4781                	li	a5,0
8000975e:	b7c5                	j	8000973e <__muldf3+0x172>
80009760:	01946633          	or	a2,s0,s9
80009764:	ce19                	beqz	a2,80009782 <__muldf3+0x1b6>
80009766:	00080737          	lui	a4,0x80
8000976a:	8f61                	and	a4,a4,s0
8000976c:	7ff00513          	li	a0,2047
80009770:	ef19                	bnez	a4,8000978e <__muldf3+0x1c2>
80009772:	470d                	li	a4,3
80009774:	44c1                	li	s1,16
80009776:	bfa9                	j	800096d0 <__muldf3+0x104>
80009778:	4401                	li	s0,0
8000977a:	4781                	li	a5,0
8000977c:	4501                	li	a0,0
8000977e:	4705                	li	a4,1
80009780:	bf81                	j	800096d0 <__muldf3+0x104>
80009782:	4401                	li	s0,0
80009784:	4781                	li	a5,0
80009786:	7ff00513          	li	a0,2047
8000978a:	4709                	li	a4,2
8000978c:	b791                	j	800096d0 <__muldf3+0x104>
8000978e:	470d                	li	a4,3
80009790:	b781                	j	800096d0 <__muldf3+0x104>
80009792:	00080437          	lui	s0,0x80
80009796:	4781                	li	a5,0
80009798:	7ff00713          	li	a4,2047
8000979c:	4581                	li	a1,0
8000979e:	44c1                	li	s1,16
800097a0:	0752                	slli	a4,a4,0x14
800097a2:	7ff006b7          	lui	a3,0x7ff00
800097a6:	0432                	slli	s0,s0,0xc
800097a8:	8f75                	and	a4,a4,a3
800097aa:	8031                	srli	s0,s0,0xc
800097ac:	05fe                	slli	a1,a1,0x1f
800097ae:	8c59                	or	s0,s0,a4
800097b0:	00b46733          	or	a4,s0,a1
800097b4:	853e                	mv	a0,a5
800097b6:	85ba                	mv	a1,a4
800097b8:	c099                	beqz	s1,800097be <__muldf3+0x1f2>
800097ba:	0014a073          	csrs	fflags,s1
800097be:	50b2                	lw	ra,44(sp)
800097c0:	5422                	lw	s0,40(sp)
800097c2:	5492                	lw	s1,36(sp)
800097c4:	5902                	lw	s2,32(sp)
800097c6:	49f2                	lw	s3,28(sp)
800097c8:	4a62                	lw	s4,24(sp)
800097ca:	4ad2                	lw	s5,20(sp)
800097cc:	4b42                	lw	s6,16(sp)
800097ce:	4bb2                	lw	s7,12(sp)
800097d0:	4c22                	lw	s8,8(sp)
800097d2:	4c92                	lw	s9,4(sp)
800097d4:	6145                	addi	sp,sp,48
800097d6:	8082                	ret
800097d8:	6ec1                	lui	t4,0x10
800097da:	fffe8e13          	addi	t3,t4,-1 # ffff <__stack_size-0x3f0001>
800097de:	010a5713          	srli	a4,s4,0x10
800097e2:	0107d893          	srli	a7,a5,0x10
800097e6:	01ca7a33          	and	s4,s4,t3
800097ea:	01c7f7b3          	and	a5,a5,t3
800097ee:	03488833          	mul	a6,a7,s4
800097f2:	034786b3          	mul	a3,a5,s4
800097f6:	02f70f33          	mul	t5,a4,a5
800097fa:	01e80333          	add	t1,a6,t5
800097fe:	0106d813          	srli	a6,a3,0x10
80009802:	981a                	add	a6,a6,t1
80009804:	03170633          	mul	a2,a4,a7
80009808:	01e87363          	bgeu	a6,t5,8000980e <__muldf3+0x242>
8000980c:	9676                	add	a2,a2,t4
8000980e:	01085f93          	srli	t6,a6,0x10
80009812:	01c87833          	and	a6,a6,t3
80009816:	01c6f6b3          	and	a3,a3,t3
8000981a:	01045e93          	srli	t4,s0,0x10
8000981e:	01c47e33          	and	t3,s0,t3
80009822:	0842                	slli	a6,a6,0x10
80009824:	9836                	add	a6,a6,a3
80009826:	03c70f33          	mul	t5,a4,t3
8000982a:	03ca06b3          	mul	a3,s4,t3
8000982e:	034e8a33          	mul	s4,t4,s4
80009832:	01ea0333          	add	t1,s4,t5
80009836:	0106da13          	srli	s4,a3,0x10
8000983a:	9a1a                	add	s4,s4,t1
8000983c:	03d70733          	mul	a4,a4,t4
80009840:	01ea7463          	bgeu	s4,t5,80009848 <__muldf3+0x27c>
80009844:	6341                	lui	t1,0x10
80009846:	971a                	add	a4,a4,t1
80009848:	010a5313          	srli	t1,s4,0x10
8000984c:	933a                	add	t1,t1,a4
8000984e:	6741                	lui	a4,0x10
80009850:	fff70f13          	addi	t5,a4,-1 # ffff <__stack_size-0x3f0001>
80009854:	01ea7a33          	and	s4,s4,t5
80009858:	01e6f6b3          	and	a3,a3,t5
8000985c:	0109d413          	srli	s0,s3,0x10
80009860:	0a42                	slli	s4,s4,0x10
80009862:	01e9f9b3          	and	s3,s3,t5
80009866:	03378f33          	mul	t5,a5,s3
8000986a:	9a36                	add	s4,s4,a3
8000986c:	9fd2                	add	t6,t6,s4
8000986e:	033886b3          	mul	a3,a7,s3
80009872:	02f407b3          	mul	a5,s0,a5
80009876:	028882b3          	mul	t0,a7,s0
8000987a:	00f688b3          	add	a7,a3,a5
8000987e:	010f5693          	srli	a3,t5,0x10
80009882:	96c6                	add	a3,a3,a7
80009884:	00f6f363          	bgeu	a3,a5,8000988a <__muldf3+0x2be>
80009888:	92ba                	add	t0,t0,a4
8000988a:	6741                	lui	a4,0x10
8000988c:	fff70793          	addi	a5,a4,-1 # ffff <__stack_size-0x3f0001>
80009890:	00ff7f33          	and	t5,t5,a5
80009894:	0106d893          	srli	a7,a3,0x10
80009898:	8efd                	and	a3,a3,a5
8000989a:	03c987b3          	mul	a5,s3,t3
8000989e:	06c2                	slli	a3,a3,0x10
800098a0:	96fa                	add	a3,a3,t5
800098a2:	9896                	add	a7,a7,t0
800098a4:	03c40e33          	mul	t3,s0,t3
800098a8:	033e89b3          	mul	s3,t4,s3
800098ac:	028e8f33          	mul	t5,t4,s0
800098b0:	99f2                	add	s3,s3,t3
800098b2:	0107d413          	srli	s0,a5,0x10
800098b6:	99a2                	add	s3,s3,s0
800098b8:	01c9f363          	bgeu	s3,t3,800098be <__muldf3+0x2f2>
800098bc:	9f3a                	add	t5,t5,a4
800098be:	6e41                	lui	t3,0x10
800098c0:	1e7d                	addi	t3,t3,-1
800098c2:	01c9f733          	and	a4,s3,t3
800098c6:	01c7f7b3          	and	a5,a5,t3
800098ca:	0742                	slli	a4,a4,0x10
800098cc:	967e                	add	a2,a2,t6
800098ce:	973e                	add	a4,a4,a5
800098d0:	01463a33          	sltu	s4,a2,s4
800098d4:	971a                	add	a4,a4,t1
800098d6:	01470433          	add	s0,a4,s4
800098da:	9636                	add	a2,a2,a3
800098dc:	00d636b3          	sltu	a3,a2,a3
800098e0:	01140e33          	add	t3,s0,a7
800098e4:	00de0eb3          	add	t4,t3,a3
800098e8:	00673733          	sltu	a4,a4,t1
800098ec:	01443433          	sltu	s0,s0,s4
800098f0:	8c59                	or	s0,s0,a4
800098f2:	00deb6b3          	sltu	a3,t4,a3
800098f6:	0109d993          	srli	s3,s3,0x10
800098fa:	011e38b3          	sltu	a7,t3,a7
800098fe:	944e                	add	s0,s0,s3
80009900:	00d8e6b3          	or	a3,a7,a3
80009904:	9436                	add	s0,s0,a3
80009906:	947a                	add	s0,s0,t5
80009908:	017ed793          	srli	a5,t4,0x17
8000990c:	0426                	slli	s0,s0,0x9
8000990e:	8c5d                	or	s0,s0,a5
80009910:	00961793          	slli	a5,a2,0x9
80009914:	0107e7b3          	or	a5,a5,a6
80009918:	00f037b3          	snez	a5,a5
8000991c:	825d                	srli	a2,a2,0x17
8000991e:	01000737          	lui	a4,0x1000
80009922:	8fd1                	or	a5,a5,a2
80009924:	0ea6                	slli	t4,t4,0x9
80009926:	8f61                	and	a4,a4,s0
80009928:	01d7e7b3          	or	a5,a5,t4
8000992c:	cb25                	beqz	a4,8000999c <__muldf3+0x3d0>
8000992e:	0017d713          	srli	a4,a5,0x1
80009932:	8b85                	andi	a5,a5,1
80009934:	8fd9                	or	a5,a5,a4
80009936:	01f41713          	slli	a4,s0,0x1f
8000993a:	8fd9                	or	a5,a5,a4
8000993c:	8005                	srli	s0,s0,0x1
8000993e:	3ff50813          	addi	a6,a0,1023
80009942:	0d005063          	blez	a6,80009a02 <__muldf3+0x436>
80009946:	0077f713          	andi	a4,a5,7
8000994a:	c325                	beqz	a4,800099aa <__muldf3+0x3de>
8000994c:	4709                	li	a4,2
8000994e:	0014e493          	ori	s1,s1,1
80009952:	04e90b63          	beq	s2,a4,800099a8 <__muldf3+0x3dc>
80009956:	470d                	li	a4,3
80009958:	04e90463          	beq	s2,a4,800099a0 <__muldf3+0x3d4>
8000995c:	04091763          	bnez	s2,800099aa <__muldf3+0x3de>
80009960:	00f7f713          	andi	a4,a5,15
80009964:	4691                	li	a3,4
80009966:	04d70263          	beq	a4,a3,800099aa <__muldf3+0x3de>
8000996a:	00478713          	addi	a4,a5,4 # 800004 <__stack_size+0x400004>
8000996e:	00f737b3          	sltu	a5,a4,a5
80009972:	943e                	add	s0,s0,a5
80009974:	87ba                	mv	a5,a4
80009976:	a815                	j	800099aa <__muldf3+0x3de>
80009978:	85da                	mv	a1,s6
8000997a:	844e                	mv	s0,s3
8000997c:	87d2                	mv	a5,s4
8000997e:	8762                	mv	a4,s8
80009980:	4689                	li	a3,2
80009982:	1cd70763          	beq	a4,a3,80009b50 <__muldf3+0x584>
80009986:	468d                	li	a3,3
80009988:	1cd70963          	beq	a4,a3,80009b5a <__muldf3+0x58e>
8000998c:	4685                	li	a3,1
8000998e:	fad718e3          	bne	a4,a3,8000993e <__muldf3+0x372>
80009992:	4401                	li	s0,0
80009994:	4781                	li	a5,0
80009996:	a265                	j	80009b3e <__muldf3+0x572>
80009998:	85d6                	mv	a1,s5
8000999a:	b7dd                	j	80009980 <__muldf3+0x3b4>
8000999c:	855e                	mv	a0,s7
8000999e:	b745                	j	8000993e <__muldf3+0x372>
800099a0:	e589                	bnez	a1,800099aa <__muldf3+0x3de>
800099a2:	00878713          	addi	a4,a5,8
800099a6:	b7e1                	j	8000996e <__muldf3+0x3a2>
800099a8:	fded                	bnez	a1,800099a2 <__muldf3+0x3d6>
800099aa:	01000737          	lui	a4,0x1000
800099ae:	8f61                	and	a4,a4,s0
800099b0:	c719                	beqz	a4,800099be <__muldf3+0x3f2>
800099b2:	ff000737          	lui	a4,0xff000
800099b6:	177d                	addi	a4,a4,-1
800099b8:	8c79                	and	s0,s0,a4
800099ba:	40050813          	addi	a6,a0,1024
800099be:	7fe00713          	li	a4,2046
800099c2:	01074a63          	blt	a4,a6,800099d6 <__muldf3+0x40a>
800099c6:	0037d713          	srli	a4,a5,0x3
800099ca:	01d41793          	slli	a5,s0,0x1d
800099ce:	8fd9                	or	a5,a5,a4
800099d0:	800d                	srli	s0,s0,0x3
800099d2:	8742                	mv	a4,a6
800099d4:	b3f1                	j	800097a0 <__muldf3+0x1d4>
800099d6:	4789                	li	a5,2
800099d8:	02f90363          	beq	s2,a5,800099fe <__muldf3+0x432>
800099dc:	478d                	li	a5,3
800099de:	00f90863          	beq	s2,a5,800099ee <__muldf3+0x422>
800099e2:	00091763          	bnez	s2,800099f0 <__muldf3+0x424>
800099e6:	4781                	li	a5,0
800099e8:	7ff00713          	li	a4,2047
800099ec:	a029                	j	800099f6 <__muldf3+0x42a>
800099ee:	dde5                	beqz	a1,800099e6 <__muldf3+0x41a>
800099f0:	57fd                	li	a5,-1
800099f2:	7fe00713          	li	a4,2046
800099f6:	0054e493          	ori	s1,s1,5
800099fa:	843e                	mv	s0,a5
800099fc:	b355                	j	800097a0 <__muldf3+0x1d4>
800099fe:	f5e5                	bnez	a1,800099e6 <__muldf3+0x41a>
80009a00:	bfc5                	j	800099f0 <__muldf3+0x424>
80009a02:	4705                	li	a4,1
80009a04:	04081463          	bnez	a6,80009a4c <__muldf3+0x480>
80009a08:	0077f693          	andi	a3,a5,7
80009a0c:	8722                	mv	a4,s0
80009a0e:	ca9d                	beqz	a3,80009a44 <__muldf3+0x478>
80009a10:	4689                	li	a3,2
80009a12:	0014e493          	ori	s1,s1,1
80009a16:	02d90663          	beq	s2,a3,80009a42 <__muldf3+0x476>
80009a1a:	468d                	li	a3,3
80009a1c:	00d90f63          	beq	s2,a3,80009a3a <__muldf3+0x46e>
80009a20:	02091263          	bnez	s2,80009a44 <__muldf3+0x478>
80009a24:	00f7f693          	andi	a3,a5,15
80009a28:	4611                	li	a2,4
80009a2a:	00c68d63          	beq	a3,a2,80009a44 <__muldf3+0x478>
80009a2e:	ffc7b713          	sltiu	a4,a5,-4
80009a32:	00174713          	xori	a4,a4,1
80009a36:	9722                	add	a4,a4,s0
80009a38:	a031                	j	80009a44 <__muldf3+0x478>
80009a3a:	e589                	bnez	a1,80009a44 <__muldf3+0x478>
80009a3c:	ff87b713          	sltiu	a4,a5,-8
80009a40:	bfcd                	j	80009a32 <__muldf3+0x466>
80009a42:	fded                	bnez	a1,80009a3c <__muldf3+0x470>
80009a44:	8361                	srli	a4,a4,0x18
80009a46:	00174713          	xori	a4,a4,1
80009a4a:	8b05                	andi	a4,a4,1
80009a4c:	4685                	li	a3,1
80009a4e:	410686b3          	sub	a3,a3,a6
80009a52:	03800613          	li	a2,56
80009a56:	0cd64263          	blt	a2,a3,80009b1a <__muldf3+0x54e>
80009a5a:	467d                	li	a2,31
80009a5c:	04d64a63          	blt	a2,a3,80009ab0 <__muldf3+0x4e4>
80009a60:	41e50513          	addi	a0,a0,1054
80009a64:	00a41633          	sll	a2,s0,a0
80009a68:	00d7d833          	srl	a6,a5,a3
80009a6c:	00a797b3          	sll	a5,a5,a0
80009a70:	01066633          	or	a2,a2,a6
80009a74:	00f037b3          	snez	a5,a5
80009a78:	8fd1                	or	a5,a5,a2
80009a7a:	00d45433          	srl	s0,s0,a3
80009a7e:	0077f693          	andi	a3,a5,7
80009a82:	c2ad                	beqz	a3,80009ae4 <__muldf3+0x518>
80009a84:	4689                	li	a3,2
80009a86:	0014e493          	ori	s1,s1,1
80009a8a:	04d90c63          	beq	s2,a3,80009ae2 <__muldf3+0x516>
80009a8e:	468d                	li	a3,3
80009a90:	04d90563          	beq	s2,a3,80009ada <__muldf3+0x50e>
80009a94:	04091863          	bnez	s2,80009ae4 <__muldf3+0x518>
80009a98:	00f7f693          	andi	a3,a5,15
80009a9c:	4611                	li	a2,4
80009a9e:	04c68363          	beq	a3,a2,80009ae4 <__muldf3+0x518>
80009aa2:	00478693          	addi	a3,a5,4
80009aa6:	00f6b7b3          	sltu	a5,a3,a5
80009aaa:	943e                	add	s0,s0,a5
80009aac:	87b6                	mv	a5,a3
80009aae:	a81d                	j	80009ae4 <__muldf3+0x518>
80009ab0:	5605                	li	a2,-31
80009ab2:	41060633          	sub	a2,a2,a6
80009ab6:	02000893          	li	a7,32
80009aba:	00c45633          	srl	a2,s0,a2
80009abe:	4801                	li	a6,0
80009ac0:	01168663          	beq	a3,a7,80009acc <__muldf3+0x500>
80009ac4:	43e50513          	addi	a0,a0,1086
80009ac8:	00a41833          	sll	a6,s0,a0
80009acc:	00f867b3          	or	a5,a6,a5
80009ad0:	00f037b3          	snez	a5,a5
80009ad4:	8fd1                	or	a5,a5,a2
80009ad6:	4401                	li	s0,0
80009ad8:	b75d                	j	80009a7e <__muldf3+0x4b2>
80009ada:	e589                	bnez	a1,80009ae4 <__muldf3+0x518>
80009adc:	00878693          	addi	a3,a5,8
80009ae0:	b7d9                	j	80009aa6 <__muldf3+0x4da>
80009ae2:	fded                	bnez	a1,80009adc <__muldf3+0x510>
80009ae4:	008006b7          	lui	a3,0x800
80009ae8:	8ee1                	and	a3,a3,s0
80009aea:	ca81                	beqz	a3,80009afa <__muldf3+0x52e>
80009aec:	0014e493          	ori	s1,s1,1
80009af0:	4401                	li	s0,0
80009af2:	4781                	li	a5,0
80009af4:	e305                	bnez	a4,80009b14 <__muldf3+0x548>
80009af6:	4705                	li	a4,1
80009af8:	b165                	j	800097a0 <__muldf3+0x1d4>
80009afa:	0037d693          	srli	a3,a5,0x3
80009afe:	01d41793          	slli	a5,s0,0x1d
80009b02:	8fd5                	or	a5,a5,a3
80009b04:	800d                	srli	s0,s0,0x3
80009b06:	c8070de3          	beqz	a4,800097a0 <__muldf3+0x1d4>
80009b0a:	0014f713          	andi	a4,s1,1
80009b0e:	c80709e3          	beqz	a4,800097a0 <__muldf3+0x1d4>
80009b12:	4701                	li	a4,0
80009b14:	0024e493          	ori	s1,s1,2
80009b18:	b161                	j	800097a0 <__muldf3+0x1d4>
80009b1a:	8fc1                	or	a5,a5,s0
80009b1c:	cf91                	beqz	a5,80009b38 <__muldf3+0x56c>
80009b1e:	4789                	li	a5,2
80009b20:	0014e493          	ori	s1,s1,1
80009b24:	02f90363          	beq	s2,a5,80009b4a <__muldf3+0x57e>
80009b28:	478d                	li	a5,3
80009b2a:	00f90c63          	beq	s2,a5,80009b42 <__muldf3+0x576>
80009b2e:	4785                	li	a5,1
80009b30:	00091363          	bnez	s2,80009b36 <__muldf3+0x56a>
80009b34:	4795                	li	a5,5
80009b36:	838d                	srli	a5,a5,0x3
80009b38:	0024e493          	ori	s1,s1,2
80009b3c:	4401                	li	s0,0
80009b3e:	4701                	li	a4,0
80009b40:	b185                	j	800097a0 <__muldf3+0x1d4>
80009b42:	47a5                	li	a5,9
80009b44:	d9ed                	beqz	a1,80009b36 <__muldf3+0x56a>
80009b46:	4785                	li	a5,1
80009b48:	b7fd                	j	80009b36 <__muldf3+0x56a>
80009b4a:	47a5                	li	a5,9
80009b4c:	f5ed                	bnez	a1,80009b36 <__muldf3+0x56a>
80009b4e:	bfe5                	j	80009b46 <__muldf3+0x57a>
80009b50:	4401                	li	s0,0
80009b52:	4781                	li	a5,0
80009b54:	7ff00713          	li	a4,2047
80009b58:	b1a1                	j	800097a0 <__muldf3+0x1d4>
80009b5a:	00080437          	lui	s0,0x80
80009b5e:	4781                	li	a5,0
80009b60:	7ff00713          	li	a4,2047
80009b64:	4581                	li	a1,0
80009b66:	b92d                	j	800097a0 <__muldf3+0x1d4>

80009b68 <__subdf3>:
80009b68:	1101                	addi	sp,sp,-32
80009b6a:	ce06                	sw	ra,28(sp)
80009b6c:	cc22                	sw	s0,24(sp)
80009b6e:	ca26                	sw	s1,20(sp)
80009b70:	c84a                	sw	s2,16(sp)
80009b72:	c64e                	sw	s3,12(sp)
80009b74:	c452                	sw	s4,8(sp)
80009b76:	002029f3          	frrm	s3
80009b7a:	001008b7          	lui	a7,0x100
80009b7e:	18fd                	addi	a7,a7,-1
80009b80:	00b8f733          	and	a4,a7,a1
80009b84:	0145d413          	srli	s0,a1,0x14
80009b88:	00d8f8b3          	and	a7,a7,a3
80009b8c:	01f5d493          	srli	s1,a1,0x1f
80009b90:	0146d593          	srli	a1,a3,0x14
80009b94:	00371793          	slli	a5,a4,0x3
80009b98:	01f6d313          	srli	t1,a3,0x1f
80009b9c:	01d55713          	srli	a4,a0,0x1d
80009ba0:	01d65693          	srli	a3,a2,0x1d
80009ba4:	088e                	slli	a7,a7,0x3
80009ba6:	00361813          	slli	a6,a2,0x3
80009baa:	7ff5f593          	andi	a1,a1,2047
80009bae:	7ff00613          	li	a2,2047
80009bb2:	8f5d                	or	a4,a4,a5
80009bb4:	7ff47413          	andi	s0,s0,2047
80009bb8:	00351793          	slli	a5,a0,0x3
80009bbc:	0116e6b3          	or	a3,a3,a7
80009bc0:	00c59563          	bne	a1,a2,80009bca <__subdf3+0x62>
80009bc4:	0106e633          	or	a2,a3,a6
80009bc8:	e219                	bnez	a2,80009bce <__subdf3+0x66>
80009bca:	00134313          	xori	t1,t1,1
80009bce:	40b40633          	sub	a2,s0,a1
80009bd2:	3c931663          	bne	t1,s1,80009f9e <__subdf3+0x436>
80009bd6:	12c05063          	blez	a2,80009cf6 <__subdf3+0x18e>
80009bda:	e9a9                	bnez	a1,80009c2c <__subdf3+0xc4>
80009bdc:	0106e533          	or	a0,a3,a6
80009be0:	e10d                	bnez	a0,80009c02 <__subdf3+0x9a>
80009be2:	7ff00693          	li	a3,2047
80009be6:	4401                	li	s0,0
80009be8:	24d61363          	bne	a2,a3,80009e2e <__subdf3+0x2c6>
80009bec:	00f766b3          	or	a3,a4,a5
80009bf0:	78068e63          	beqz	a3,8000a38c <__subdf3+0x824>
80009bf4:	00400437          	lui	s0,0x400
80009bf8:	8c79                	and	s0,s0,a4
80009bfa:	00143413          	seqz	s0,s0
80009bfe:	0412                	slli	s0,s0,0x4
80009c00:	a43d                	j	80009e2e <__subdf3+0x2c6>
80009c02:	fff60513          	addi	a0,a2,-1
80009c06:	e901                	bnez	a0,80009c16 <__subdf3+0xae>
80009c08:	983e                	add	a6,a6,a5
80009c0a:	96ba                	add	a3,a3,a4
80009c0c:	00f837b3          	sltu	a5,a6,a5
80009c10:	96be                	add	a3,a3,a5
80009c12:	4605                	li	a2,1
80009c14:	a041                	j	80009c94 <__subdf3+0x12c>
80009c16:	7ff00893          	li	a7,2047
80009c1a:	03161f63          	bne	a2,a7,80009c58 <__subdf3+0xf0>
80009c1e:	00f766b3          	or	a3,a4,a5
80009c22:	fae9                	bnez	a3,80009bf4 <__subdf3+0x8c>
80009c24:	4701                	li	a4,0
80009c26:	4781                	li	a5,0
80009c28:	4401                	li	s0,0
80009c2a:	ac8d                	j	80009e9c <__subdf3+0x334>
80009c2c:	7ff00593          	li	a1,2047
80009c30:	02b41063          	bne	s0,a1,80009c50 <__subdf3+0xe8>
80009c34:	00f766b3          	or	a3,a4,a5
80009c38:	74068d63          	beqz	a3,8000a392 <__subdf3+0x82a>
80009c3c:	004006b7          	lui	a3,0x400
80009c40:	8ef9                	and	a3,a3,a4
80009c42:	7ff00613          	li	a2,2047
80009c46:	4581                	li	a1,0
80009c48:	2e069063          	bnez	a3,80009f28 <__subdf3+0x3c0>
80009c4c:	4441                	li	s0,16
80009c4e:	a2c5                	j	80009e2e <__subdf3+0x2c6>
80009c50:	008005b7          	lui	a1,0x800
80009c54:	8ecd                	or	a3,a3,a1
80009c56:	8532                	mv	a0,a2
80009c58:	03800613          	li	a2,56
80009c5c:	08a64863          	blt	a2,a0,80009cec <__subdf3+0x184>
80009c60:	467d                	li	a2,31
80009c62:	04a64f63          	blt	a2,a0,80009cc0 <__subdf3+0x158>
80009c66:	02000613          	li	a2,32
80009c6a:	8e09                	sub	a2,a2,a0
80009c6c:	00c695b3          	sll	a1,a3,a2
80009c70:	00a858b3          	srl	a7,a6,a0
80009c74:	00c81833          	sll	a6,a6,a2
80009c78:	0115e5b3          	or	a1,a1,a7
80009c7c:	01003833          	snez	a6,a6
80009c80:	0105e833          	or	a6,a1,a6
80009c84:	00a6d6b3          	srl	a3,a3,a0
80009c88:	983e                	add	a6,a6,a5
80009c8a:	96ba                	add	a3,a3,a4
80009c8c:	00f837b3          	sltu	a5,a6,a5
80009c90:	96be                	add	a3,a3,a5
80009c92:	8622                	mv	a2,s0
80009c94:	008007b7          	lui	a5,0x800
80009c98:	8ff5                	and	a5,a5,a3
80009c9a:	cbad                	beqz	a5,80009d0c <__subdf3+0x1a4>
80009c9c:	0605                	addi	a2,a2,1
80009c9e:	7ff00793          	li	a5,2047
80009ca2:	2cf60e63          	beq	a2,a5,80009f7e <__subdf3+0x416>
80009ca6:	ff800737          	lui	a4,0xff800
80009caa:	177d                	addi	a4,a4,-1
80009cac:	00185793          	srli	a5,a6,0x1
80009cb0:	8f75                	and	a4,a4,a3
80009cb2:	00187813          	andi	a6,a6,1
80009cb6:	0107e833          	or	a6,a5,a6
80009cba:	01f71793          	slli	a5,a4,0x1f
80009cbe:	a48d                	j	80009f20 <__subdf3+0x3b8>
80009cc0:	fe050593          	addi	a1,a0,-32
80009cc4:	02000893          	li	a7,32
80009cc8:	00b6d5b3          	srl	a1,a3,a1
80009ccc:	4601                	li	a2,0
80009cce:	01150763          	beq	a0,a7,80009cdc <__subdf3+0x174>
80009cd2:	04000613          	li	a2,64
80009cd6:	8e09                	sub	a2,a2,a0
80009cd8:	00c69633          	sll	a2,a3,a2
80009cdc:	01066833          	or	a6,a2,a6
80009ce0:	01003833          	snez	a6,a6
80009ce4:	0105e833          	or	a6,a1,a6
80009ce8:	4681                	li	a3,0
80009cea:	bf79                	j	80009c88 <__subdf3+0x120>
80009cec:	0106e833          	or	a6,a3,a6
80009cf0:	01003833          	snez	a6,a6
80009cf4:	bfd5                	j	80009ce8 <__subdf3+0x180>
80009cf6:	ce65                	beqz	a2,80009dee <__subdf3+0x286>
80009cf8:	40858633          	sub	a2,a1,s0
80009cfc:	e829                	bnez	s0,80009d4e <__subdf3+0x1e6>
80009cfe:	00f76533          	or	a0,a4,a5
80009d02:	e911                	bnez	a0,80009d16 <__subdf3+0x1ae>
80009d04:	7ff00793          	li	a5,2047
80009d08:	02f60663          	beq	a2,a5,80009d34 <__subdf3+0x1cc>
80009d0c:	8736                	mv	a4,a3
80009d0e:	87c2                	mv	a5,a6
80009d10:	46060e63          	beqz	a2,8000a18c <__subdf3+0x624>
80009d14:	ac09                	j	80009f26 <__subdf3+0x3be>
80009d16:	fff60893          	addi	a7,a2,-1
80009d1a:	00089963          	bnez	a7,80009d2c <__subdf3+0x1c4>
80009d1e:	97c2                	add	a5,a5,a6
80009d20:	0107b833          	sltu	a6,a5,a6
80009d24:	96ba                	add	a3,a3,a4
80009d26:	96c2                	add	a3,a3,a6
80009d28:	883e                	mv	a6,a5
80009d2a:	b5e5                	j	80009c12 <__subdf3+0xaa>
80009d2c:	7ff00513          	li	a0,2047
80009d30:	04a61663          	bne	a2,a0,80009d7c <__subdf3+0x214>
80009d34:	0106e7b3          	or	a5,a3,a6
80009d38:	4701                	li	a4,0
80009d3a:	16078163          	beqz	a5,80009e9c <__subdf3+0x334>
80009d3e:	004007b7          	lui	a5,0x400
80009d42:	8ff5                	and	a5,a5,a3
80009d44:	8736                	mv	a4,a3
80009d46:	64079963          	bnez	a5,8000a398 <__subdf3+0x830>
80009d4a:	87c2                	mv	a5,a6
80009d4c:	a015                	j	80009d70 <__subdf3+0x208>
80009d4e:	7ff00513          	li	a0,2047
80009d52:	02a59163          	bne	a1,a0,80009d74 <__subdf3+0x20c>
80009d56:	0106e7b3          	or	a5,a3,a6
80009d5a:	60078b63          	beqz	a5,8000a370 <__subdf3+0x808>
80009d5e:	004007b7          	lui	a5,0x400
80009d62:	8ff5                	and	a5,a5,a3
80009d64:	8736                	mv	a4,a3
80009d66:	60079963          	bnez	a5,8000a378 <__subdf3+0x810>
80009d6a:	87c2                	mv	a5,a6
80009d6c:	7ff00613          	li	a2,2047
80009d70:	4581                	li	a1,0
80009d72:	bde9                	j	80009c4c <__subdf3+0xe4>
80009d74:	00800537          	lui	a0,0x800
80009d78:	8f49                	or	a4,a4,a0
80009d7a:	88b2                	mv	a7,a2
80009d7c:	03800613          	li	a2,56
80009d80:	07164363          	blt	a2,a7,80009de6 <__subdf3+0x27e>
80009d84:	467d                	li	a2,31
80009d86:	03164b63          	blt	a2,a7,80009dbc <__subdf3+0x254>
80009d8a:	02000513          	li	a0,32
80009d8e:	41150533          	sub	a0,a0,a7
80009d92:	00a71633          	sll	a2,a4,a0
80009d96:	0117d333          	srl	t1,a5,a7
80009d9a:	00a797b3          	sll	a5,a5,a0
80009d9e:	00666633          	or	a2,a2,t1
80009da2:	00f037b3          	snez	a5,a5
80009da6:	8fd1                	or	a5,a5,a2
80009da8:	01175733          	srl	a4,a4,a7
80009dac:	97c2                	add	a5,a5,a6
80009dae:	9736                	add	a4,a4,a3
80009db0:	0107b6b3          	sltu	a3,a5,a6
80009db4:	96ba                	add	a3,a3,a4
80009db6:	883e                	mv	a6,a5
80009db8:	862e                	mv	a2,a1
80009dba:	bde9                	j	80009c94 <__subdf3+0x12c>
80009dbc:	fe088613          	addi	a2,a7,-32 # fffe0 <__stack_size-0x300020>
80009dc0:	02000313          	li	t1,32
80009dc4:	00c75633          	srl	a2,a4,a2
80009dc8:	4501                	li	a0,0
80009dca:	00688863          	beq	a7,t1,80009dda <__subdf3+0x272>
80009dce:	04000513          	li	a0,64
80009dd2:	41150533          	sub	a0,a0,a7
80009dd6:	00a71533          	sll	a0,a4,a0
80009dda:	8fc9                	or	a5,a5,a0
80009ddc:	00f037b3          	snez	a5,a5
80009de0:	8fd1                	or	a5,a5,a2
80009de2:	4701                	li	a4,0
80009de4:	b7e1                	j	80009dac <__subdf3+0x244>
80009de6:	8fd9                	or	a5,a5,a4
80009de8:	00f037b3          	snez	a5,a5
80009dec:	bfdd                	j	80009de2 <__subdf3+0x27a>
80009dee:	00140613          	addi	a2,s0,1 # 400001 <__stack_size+0x1>
80009df2:	7fe67513          	andi	a0,a2,2046
80009df6:	10051863          	bnez	a0,80009f06 <__subdf3+0x39e>
80009dfa:	00f76633          	or	a2,a4,a5
80009dfe:	e039                	bnez	s0,80009e44 <__subdf3+0x2dc>
80009e00:	52060b63          	beqz	a2,8000a336 <__subdf3+0x7ce>
80009e04:	0106e633          	or	a2,a3,a6
80009e08:	38060263          	beqz	a2,8000a18c <__subdf3+0x624>
80009e0c:	983e                	add	a6,a6,a5
80009e0e:	00f837b3          	sltu	a5,a6,a5
80009e12:	9736                	add	a4,a4,a3
80009e14:	973e                	add	a4,a4,a5
80009e16:	008007b7          	lui	a5,0x800
80009e1a:	8ff9                	and	a5,a5,a4
80009e1c:	50078e63          	beqz	a5,8000a338 <__subdf3+0x7d0>
80009e20:	ff8007b7          	lui	a5,0xff800
80009e24:	17fd                	addi	a5,a5,-1
80009e26:	8f7d                	and	a4,a4,a5
80009e28:	4581                	li	a1,0
80009e2a:	87c2                	mv	a5,a6
80009e2c:	4605                	li	a2,1
80009e2e:	0077f693          	andi	a3,a5,7
80009e32:	12069063          	bnez	a3,80009f52 <__subdf3+0x3ea>
80009e36:	c1bd                	beqz	a1,80009e9c <__subdf3+0x334>
80009e38:	00147693          	andi	a3,s0,1
80009e3c:	c2a5                	beqz	a3,80009e9c <__subdf3+0x334>
80009e3e:	00246413          	ori	s0,s0,2
80009e42:	a8a9                	j	80009e9c <__subdf3+0x334>
80009e44:	7ff00513          	li	a0,2047
80009e48:	02a41563          	bne	s0,a0,80009e72 <__subdf3+0x30a>
80009e4c:	5c060463          	beqz	a2,8000a414 <__subdf3+0x8ac>
80009e50:	00400437          	lui	s0,0x400
80009e54:	8c79                	and	s0,s0,a4
80009e56:	00143413          	seqz	s0,s0
80009e5a:	0412                	slli	s0,s0,0x4
80009e5c:	02a59763          	bne	a1,a0,80009e8a <__subdf3+0x322>
80009e60:	0106e5b3          	or	a1,a3,a6
80009e64:	c991                	beqz	a1,80009e78 <__subdf3+0x310>
80009e66:	004005b7          	lui	a1,0x400
80009e6a:	8df5                	and	a1,a1,a3
80009e6c:	e591                	bnez	a1,80009e78 <__subdf3+0x310>
80009e6e:	4441                	li	s0,16
80009e70:	a021                	j	80009e78 <__subdf3+0x310>
80009e72:	4401                	li	s0,0
80009e74:	fea586e3          	beq	a1,a0,80009e60 <__subdf3+0x2f8>
80009e78:	ea09                	bnez	a2,80009e8a <__subdf3+0x322>
80009e7a:	8736                	mv	a4,a3
80009e7c:	87c2                	mv	a5,a6
80009e7e:	4581                	li	a1,0
80009e80:	7ff00613          	li	a2,2047
80009e84:	b76d                	j	80009e2e <__subdf3+0x2c6>
80009e86:	4401                	li	s0,0
80009e88:	bfe1                	j	80009e60 <__subdf3+0x2f8>
80009e8a:	0106e6b3          	or	a3,a3,a6
80009e8e:	dae5                	beqz	a3,80009e7e <__subdf3+0x316>
80009e90:	4481                	li	s1,0
80009e92:	00400737          	lui	a4,0x400
80009e96:	4781                	li	a5,0
80009e98:	7ff00613          	li	a2,2047
80009e9c:	008006b7          	lui	a3,0x800
80009ea0:	8ef9                	and	a3,a3,a4
80009ea2:	ca91                	beqz	a3,80009eb6 <__subdf3+0x34e>
80009ea4:	0605                	addi	a2,a2,1
80009ea6:	7ff00693          	li	a3,2047
80009eaa:	52d60e63          	beq	a2,a3,8000a3e6 <__subdf3+0x87e>
80009eae:	ff8006b7          	lui	a3,0xff800
80009eb2:	16fd                	addi	a3,a3,-1
80009eb4:	8f75                	and	a4,a4,a3
80009eb6:	0037d513          	srli	a0,a5,0x3
80009eba:	7ff00693          	li	a3,2047
80009ebe:	01d71793          	slli	a5,a4,0x1d
80009ec2:	8fc9                	or	a5,a5,a0
80009ec4:	830d                	srli	a4,a4,0x3
80009ec6:	00d61963          	bne	a2,a3,80009ed8 <__subdf3+0x370>
80009eca:	8fd9                	or	a5,a5,a4
80009ecc:	4701                	li	a4,0
80009ece:	c789                	beqz	a5,80009ed8 <__subdf3+0x370>
80009ed0:	00080737          	lui	a4,0x80
80009ed4:	4781                	li	a5,0
80009ed6:	4481                	li	s1,0
80009ed8:	7ff006b7          	lui	a3,0x7ff00
80009edc:	0652                	slli	a2,a2,0x14
80009ede:	0732                	slli	a4,a4,0xc
80009ee0:	8e75                	and	a2,a2,a3
80009ee2:	8331                	srli	a4,a4,0xc
80009ee4:	8f51                	or	a4,a4,a2
80009ee6:	04fe                	slli	s1,s1,0x1f
80009ee8:	009766b3          	or	a3,a4,s1
80009eec:	853e                	mv	a0,a5
80009eee:	85b6                	mv	a1,a3
80009ef0:	c019                	beqz	s0,80009ef6 <__subdf3+0x38e>
80009ef2:	00142073          	csrs	fflags,s0
80009ef6:	40f2                	lw	ra,28(sp)
80009ef8:	4462                	lw	s0,24(sp)
80009efa:	44d2                	lw	s1,20(sp)
80009efc:	4942                	lw	s2,16(sp)
80009efe:	49b2                	lw	s3,12(sp)
80009f00:	4a22                	lw	s4,8(sp)
80009f02:	6105                	addi	sp,sp,32
80009f04:	8082                	ret
80009f06:	7ff00593          	li	a1,2047
80009f0a:	02b60163          	beq	a2,a1,80009f2c <__subdf3+0x3c4>
80009f0e:	983e                	add	a6,a6,a5
80009f10:	00f837b3          	sltu	a5,a6,a5
80009f14:	9736                	add	a4,a4,a3
80009f16:	973e                	add	a4,a4,a5
80009f18:	01f71793          	slli	a5,a4,0x1f
80009f1c:	00185813          	srli	a6,a6,0x1
80009f20:	0107e7b3          	or	a5,a5,a6
80009f24:	8305                	srli	a4,a4,0x1
80009f26:	4581                	li	a1,0
80009f28:	4401                	li	s0,0
80009f2a:	b711                	j	80009e2e <__subdf3+0x2c6>
80009f2c:	00098663          	beqz	s3,80009f38 <__subdf3+0x3d0>
80009f30:	478d                	li	a5,3
80009f32:	00f99663          	bne	s3,a5,80009f3e <__subdf3+0x3d6>
80009f36:	e881                	bnez	s1,80009f46 <__subdf3+0x3de>
80009f38:	7ff00613          	li	a2,2047
80009f3c:	a881                	j	80009f8c <__subdf3+0x424>
80009f3e:	4789                	li	a5,2
80009f40:	00f99363          	bne	s3,a5,80009f46 <__subdf3+0x3de>
80009f44:	f8f5                	bnez	s1,80009f38 <__subdf3+0x3d0>
80009f46:	4581                	li	a1,0
80009f48:	577d                	li	a4,-1
80009f4a:	57fd                	li	a5,-1
80009f4c:	7fe00613          	li	a2,2046
80009f50:	4415                	li	s0,5
80009f52:	4689                	li	a3,2
80009f54:	00146413          	ori	s0,s0,1
80009f58:	48d98363          	beq	s3,a3,8000a3de <__subdf3+0x876>
80009f5c:	468d                	li	a3,3
80009f5e:	46d98c63          	beq	s3,a3,8000a3d6 <__subdf3+0x86e>
80009f62:	46099f63          	bnez	s3,8000a3e0 <__subdf3+0x878>
80009f66:	00f7f693          	andi	a3,a5,15
80009f6a:	4511                	li	a0,4
80009f6c:	46a68a63          	beq	a3,a0,8000a3e0 <__subdf3+0x878>
80009f70:	00478693          	addi	a3,a5,4 # ff800004 <__freertos_irq_stack_top+0x7f3ec7b4>
80009f74:	00f6b7b3          	sltu	a5,a3,a5
80009f78:	973e                	add	a4,a4,a5
80009f7a:	87b6                	mv	a5,a3
80009f7c:	a195                	j	8000a3e0 <__subdf3+0x878>
80009f7e:	00098763          	beqz	s3,80009f8c <__subdf3+0x424>
80009f82:	478d                	li	a5,3
80009f84:	00f99863          	bne	s3,a5,80009f94 <__subdf3+0x42c>
80009f88:	3e049c63          	bnez	s1,8000a380 <__subdf3+0x818>
80009f8c:	4701                	li	a4,0
80009f8e:	4781                	li	a5,0
80009f90:	4415                	li	s0,5
80009f92:	b729                	j	80009e9c <__subdf3+0x334>
80009f94:	4789                	li	a5,2
80009f96:	3ef99563          	bne	s3,a5,8000a380 <__subdf3+0x818>
80009f9a:	f8ed                	bnez	s1,80009f8c <__subdf3+0x424>
80009f9c:	b76d                	j	80009f46 <__subdf3+0x3de>
80009f9e:	0cc05763          	blez	a2,8000a06c <__subdf3+0x504>
80009fa2:	e1c9                	bnez	a1,8000a024 <__subdf3+0x4bc>
80009fa4:	0106e533          	or	a0,a3,a6
80009fa8:	c2050de3          	beqz	a0,80009be2 <__subdf3+0x7a>
80009fac:	fff60513          	addi	a0,a2,-1
80009fb0:	e911                	bnez	a0,80009fc4 <__subdf3+0x45c>
80009fb2:	41078833          	sub	a6,a5,a6
80009fb6:	40d706b3          	sub	a3,a4,a3
80009fba:	0107b7b3          	sltu	a5,a5,a6
80009fbe:	8e9d                	sub	a3,a3,a5
80009fc0:	4605                	li	a2,1
80009fc2:	a0a9                	j	8000a00c <__subdf3+0x4a4>
80009fc4:	7ff00893          	li	a7,2047
80009fc8:	c5160be3          	beq	a2,a7,80009c1e <__subdf3+0xb6>
80009fcc:	03800613          	li	a2,56
80009fd0:	08a64963          	blt	a2,a0,8000a062 <__subdf3+0x4fa>
80009fd4:	467d                	li	a2,31
80009fd6:	06a64063          	blt	a2,a0,8000a036 <__subdf3+0x4ce>
80009fda:	02000613          	li	a2,32
80009fde:	8e09                	sub	a2,a2,a0
80009fe0:	00c695b3          	sll	a1,a3,a2
80009fe4:	00a858b3          	srl	a7,a6,a0
80009fe8:	00c81833          	sll	a6,a6,a2
80009fec:	0115e5b3          	or	a1,a1,a7
80009ff0:	01003833          	snez	a6,a6
80009ff4:	0105e833          	or	a6,a1,a6
80009ff8:	00a6d6b3          	srl	a3,a3,a0
80009ffc:	41078833          	sub	a6,a5,a6
8000a000:	40d706b3          	sub	a3,a4,a3
8000a004:	0107b7b3          	sltu	a5,a5,a6
8000a008:	8e9d                	sub	a3,a3,a5
8000a00a:	8622                	mv	a2,s0
8000a00c:	00800937          	lui	s2,0x800
8000a010:	0126f7b3          	and	a5,a3,s2
8000a014:	ce078ce3          	beqz	a5,80009d0c <__subdf3+0x1a4>
8000a018:	197d                	addi	s2,s2,-1
8000a01a:	0126f933          	and	s2,a3,s2
8000a01e:	8a42                	mv	s4,a6
8000a020:	8432                	mv	s0,a2
8000a022:	a4b5                	j	8000a28e <__subdf3+0x726>
8000a024:	7ff00593          	li	a1,2047
8000a028:	c0b406e3          	beq	s0,a1,80009c34 <__subdf3+0xcc>
8000a02c:	008005b7          	lui	a1,0x800
8000a030:	8ecd                	or	a3,a3,a1
8000a032:	8532                	mv	a0,a2
8000a034:	bf61                	j	80009fcc <__subdf3+0x464>
8000a036:	fe050593          	addi	a1,a0,-32 # 7fffe0 <__stack_size+0x3fffe0>
8000a03a:	02000893          	li	a7,32
8000a03e:	00b6d5b3          	srl	a1,a3,a1
8000a042:	4601                	li	a2,0
8000a044:	01150763          	beq	a0,a7,8000a052 <__subdf3+0x4ea>
8000a048:	04000613          	li	a2,64
8000a04c:	8e09                	sub	a2,a2,a0
8000a04e:	00c69633          	sll	a2,a3,a2
8000a052:	01066833          	or	a6,a2,a6
8000a056:	01003833          	snez	a6,a6
8000a05a:	0105e833          	or	a6,a1,a6
8000a05e:	4681                	li	a3,0
8000a060:	bf71                	j	80009ffc <__subdf3+0x494>
8000a062:	0106e833          	or	a6,a3,a6
8000a066:	01003833          	snez	a6,a6
8000a06a:	bfd5                	j	8000a05e <__subdf3+0x4f6>
8000a06c:	ce6d                	beqz	a2,8000a166 <__subdf3+0x5fe>
8000a06e:	40858633          	sub	a2,a1,s0
8000a072:	e439                	bnez	s0,8000a0c0 <__subdf3+0x558>
8000a074:	00f76533          	or	a0,a4,a5
8000a078:	e509                	bnez	a0,8000a082 <__subdf3+0x51a>
8000a07a:	7ff00793          	li	a5,2047
8000a07e:	849a                	mv	s1,t1
8000a080:	b161                	j	80009d08 <__subdf3+0x1a0>
8000a082:	fff60893          	addi	a7,a2,-1
8000a086:	00089c63          	bnez	a7,8000a09e <__subdf3+0x536>
8000a08a:	40f807b3          	sub	a5,a6,a5
8000a08e:	00f83833          	sltu	a6,a6,a5
8000a092:	8e99                	sub	a3,a3,a4
8000a094:	410686b3          	sub	a3,a3,a6
8000a098:	849a                	mv	s1,t1
8000a09a:	883e                	mv	a6,a5
8000a09c:	b715                	j	80009fc0 <__subdf3+0x458>
8000a09e:	7ff00513          	li	a0,2047
8000a0a2:	04a61563          	bne	a2,a0,8000a0ec <__subdf3+0x584>
8000a0a6:	0106e7b3          	or	a5,a3,a6
8000a0aa:	2e078a63          	beqz	a5,8000a39e <__subdf3+0x836>
8000a0ae:	004007b7          	lui	a5,0x400
8000a0b2:	8ff5                	and	a5,a5,a3
8000a0b4:	8736                	mv	a4,a3
8000a0b6:	2e079763          	bnez	a5,8000a3a4 <__subdf3+0x83c>
8000a0ba:	87c2                	mv	a5,a6
8000a0bc:	849a                	mv	s1,t1
8000a0be:	b94d                	j	80009d70 <__subdf3+0x208>
8000a0c0:	7ff00513          	li	a0,2047
8000a0c4:	02a59063          	bne	a1,a0,8000a0e4 <__subdf3+0x57c>
8000a0c8:	0106e7b3          	or	a5,a3,a6
8000a0cc:	2c078f63          	beqz	a5,8000a3aa <__subdf3+0x842>
8000a0d0:	004007b7          	lui	a5,0x400
8000a0d4:	8ff5                	and	a5,a5,a3
8000a0d6:	8736                	mv	a4,a3
8000a0d8:	2c079e63          	bnez	a5,8000a3b4 <__subdf3+0x84c>
8000a0dc:	87c2                	mv	a5,a6
8000a0de:	7ff00613          	li	a2,2047
8000a0e2:	bfe9                	j	8000a0bc <__subdf3+0x554>
8000a0e4:	00800537          	lui	a0,0x800
8000a0e8:	8f49                	or	a4,a4,a0
8000a0ea:	88b2                	mv	a7,a2
8000a0ec:	03800613          	li	a2,56
8000a0f0:	07164763          	blt	a2,a7,8000a15e <__subdf3+0x5f6>
8000a0f4:	467d                	li	a2,31
8000a0f6:	03164f63          	blt	a2,a7,8000a134 <__subdf3+0x5cc>
8000a0fa:	02000513          	li	a0,32
8000a0fe:	41150533          	sub	a0,a0,a7
8000a102:	00a71633          	sll	a2,a4,a0
8000a106:	0117de33          	srl	t3,a5,a7
8000a10a:	00a797b3          	sll	a5,a5,a0
8000a10e:	01c66633          	or	a2,a2,t3
8000a112:	00f037b3          	snez	a5,a5
8000a116:	8fd1                	or	a5,a5,a2
8000a118:	01175733          	srl	a4,a4,a7
8000a11c:	40f807b3          	sub	a5,a6,a5
8000a120:	40e68733          	sub	a4,a3,a4
8000a124:	00f836b3          	sltu	a3,a6,a5
8000a128:	40d706b3          	sub	a3,a4,a3
8000a12c:	883e                	mv	a6,a5
8000a12e:	862e                	mv	a2,a1
8000a130:	849a                	mv	s1,t1
8000a132:	bde9                	j	8000a00c <__subdf3+0x4a4>
8000a134:	fe088613          	addi	a2,a7,-32
8000a138:	02000e13          	li	t3,32
8000a13c:	00c75633          	srl	a2,a4,a2
8000a140:	4501                	li	a0,0
8000a142:	01c88863          	beq	a7,t3,8000a152 <__subdf3+0x5ea>
8000a146:	04000513          	li	a0,64
8000a14a:	41150533          	sub	a0,a0,a7
8000a14e:	00a71533          	sll	a0,a4,a0
8000a152:	8fc9                	or	a5,a5,a0
8000a154:	00f037b3          	snez	a5,a5
8000a158:	8fd1                	or	a5,a5,a2
8000a15a:	4701                	li	a4,0
8000a15c:	b7c1                	j	8000a11c <__subdf3+0x5b4>
8000a15e:	8fd9                	or	a5,a5,a4
8000a160:	00f037b3          	snez	a5,a5
8000a164:	bfdd                	j	8000a15a <__subdf3+0x5f2>
8000a166:	00140613          	addi	a2,s0,1 # 400001 <__stack_size+0x1>
8000a16a:	7fe67613          	andi	a2,a2,2046
8000a16e:	ea7d                	bnez	a2,8000a264 <__subdf3+0x6fc>
8000a170:	00f76533          	or	a0,a4,a5
8000a174:	0106e633          	or	a2,a3,a6
8000a178:	e055                	bnez	s0,8000a21c <__subdf3+0x6b4>
8000a17a:	e12d                	bnez	a0,8000a1dc <__subdf3+0x674>
8000a17c:	1c061063          	bnez	a2,8000a33c <__subdf3+0x7d4>
8000a180:	ffe98493          	addi	s1,s3,-2
8000a184:	0014b493          	seqz	s1,s1
8000a188:	4701                	li	a4,0
8000a18a:	4781                	li	a5,0
8000a18c:	00e7e6b3          	or	a3,a5,a4
8000a190:	22068f63          	beqz	a3,8000a3ce <__subdf3+0x866>
8000a194:	01f7d693          	srli	a3,a5,0x1f
8000a198:	00171593          	slli	a1,a4,0x1
8000a19c:	95b6                	add	a1,a1,a3
8000a19e:	00179693          	slli	a3,a5,0x1
8000a1a2:	0076f613          	andi	a2,a3,7
8000a1a6:	4401                	li	s0,0
8000a1a8:	c605                	beqz	a2,8000a1d0 <__subdf3+0x668>
8000a1aa:	4609                	li	a2,2
8000a1ac:	1ac98863          	beq	s3,a2,8000a35c <__subdf3+0x7f4>
8000a1b0:	460d                	li	a2,3
8000a1b2:	18c98b63          	beq	s3,a2,8000a348 <__subdf3+0x7e0>
8000a1b6:	4405                	li	s0,1
8000a1b8:	00099c63          	bnez	s3,8000a1d0 <__subdf3+0x668>
8000a1bc:	00f6f613          	andi	a2,a3,15
8000a1c0:	4511                	li	a0,4
8000a1c2:	00a60763          	beq	a2,a0,8000a1d0 <__subdf3+0x668>
8000a1c6:	ffc6b693          	sltiu	a3,a3,-4
8000a1ca:	0016c693          	xori	a3,a3,1
8000a1ce:	95b6                	add	a1,a1,a3
8000a1d0:	81e1                	srli	a1,a1,0x18
8000a1d2:	0015c593          	xori	a1,a1,1
8000a1d6:	8985                	andi	a1,a1,1
8000a1d8:	4601                	li	a2,0
8000a1da:	b991                	j	80009e2e <__subdf3+0x2c6>
8000a1dc:	da45                	beqz	a2,8000a18c <__subdf3+0x624>
8000a1de:	410785b3          	sub	a1,a5,a6
8000a1e2:	00b7b533          	sltu	a0,a5,a1
8000a1e6:	40d70633          	sub	a2,a4,a3
8000a1ea:	8e09                	sub	a2,a2,a0
8000a1ec:	00800537          	lui	a0,0x800
8000a1f0:	8d71                	and	a0,a0,a2
8000a1f2:	c919                	beqz	a0,8000a208 <__subdf3+0x6a0>
8000a1f4:	40f807b3          	sub	a5,a6,a5
8000a1f8:	40e68733          	sub	a4,a3,a4
8000a1fc:	00f83833          	sltu	a6,a6,a5
8000a200:	41070733          	sub	a4,a4,a6
8000a204:	849a                	mv	s1,t1
8000a206:	b759                	j	8000a18c <__subdf3+0x624>
8000a208:	00c5e7b3          	or	a5,a1,a2
8000a20c:	12079b63          	bnez	a5,8000a342 <__subdf3+0x7da>
8000a210:	ffe98493          	addi	s1,s3,-2
8000a214:	0014b493          	seqz	s1,s1
8000a218:	4701                	li	a4,0
8000a21a:	bf8d                	j	8000a18c <__subdf3+0x624>
8000a21c:	7ff00893          	li	a7,2047
8000a220:	03141363          	bne	s0,a7,8000a246 <__subdf3+0x6de>
8000a224:	1e050463          	beqz	a0,8000a40c <__subdf3+0x8a4>
8000a228:	00400437          	lui	s0,0x400
8000a22c:	8c79                	and	s0,s0,a4
8000a22e:	00143413          	seqz	s0,s0
8000a232:	0412                	slli	s0,s0,0x4
8000a234:	03159563          	bne	a1,a7,8000a25e <__subdf3+0x6f6>
8000a238:	ca11                	beqz	a2,8000a24c <__subdf3+0x6e4>
8000a23a:	004005b7          	lui	a1,0x400
8000a23e:	8df5                	and	a1,a1,a3
8000a240:	e591                	bnez	a1,8000a24c <__subdf3+0x6e4>
8000a242:	4441                	li	s0,16
8000a244:	a021                	j	8000a24c <__subdf3+0x6e4>
8000a246:	4401                	li	s0,0
8000a248:	ff1588e3          	beq	a1,a7,8000a238 <__subdf3+0x6d0>
8000a24c:	e909                	bnez	a0,8000a25e <__subdf3+0x6f6>
8000a24e:	16060863          	beqz	a2,8000a3be <__subdf3+0x856>
8000a252:	8736                	mv	a4,a3
8000a254:	87c2                	mv	a5,a6
8000a256:	849a                	mv	s1,t1
8000a258:	b11d                	j	80009e7e <__subdf3+0x316>
8000a25a:	4401                	li	s0,0
8000a25c:	bff1                	j	8000a238 <__subdf3+0x6d0>
8000a25e:	c20600e3          	beqz	a2,80009e7e <__subdf3+0x316>
8000a262:	b13d                	j	80009e90 <__subdf3+0x328>
8000a264:	41078a33          	sub	s4,a5,a6
8000a268:	0147b633          	sltu	a2,a5,s4
8000a26c:	40d70933          	sub	s2,a4,a3
8000a270:	40c90933          	sub	s2,s2,a2
8000a274:	00800637          	lui	a2,0x800
8000a278:	00c97633          	and	a2,s2,a2
8000a27c:	c625                	beqz	a2,8000a2e4 <__subdf3+0x77c>
8000a27e:	40f80a33          	sub	s4,a6,a5
8000a282:	8e99                	sub	a3,a3,a4
8000a284:	01483833          	sltu	a6,a6,s4
8000a288:	41068933          	sub	s2,a3,a6
8000a28c:	849a                	mv	s1,t1
8000a28e:	04090f63          	beqz	s2,8000a2ec <__subdf3+0x784>
8000a292:	854a                	mv	a0,s2
8000a294:	2e85                	jal	8000a604 <__clzsi2>
8000a296:	ff850613          	addi	a2,a0,-8 # 7ffff8 <__stack_size+0x3ffff8>
8000a29a:	47fd                	li	a5,31
8000a29c:	04c7cd63          	blt	a5,a2,8000a2f6 <__subdf3+0x78e>
8000a2a0:	02000693          	li	a3,32
8000a2a4:	8e91                	sub	a3,a3,a2
8000a2a6:	00c91733          	sll	a4,s2,a2
8000a2aa:	00da56b3          	srl	a3,s4,a3
8000a2ae:	8ed9                	or	a3,a3,a4
8000a2b0:	00ca1833          	sll	a6,s4,a2
8000a2b4:	06864a63          	blt	a2,s0,8000a328 <__subdf3+0x7c0>
8000a2b8:	8e01                	sub	a2,a2,s0
8000a2ba:	00160713          	addi	a4,a2,1 # 800001 <__stack_size+0x400001>
8000a2be:	47fd                	li	a5,31
8000a2c0:	04e7c163          	blt	a5,a4,8000a302 <__subdf3+0x79a>
8000a2c4:	02000613          	li	a2,32
8000a2c8:	8e19                	sub	a2,a2,a4
8000a2ca:	00c697b3          	sll	a5,a3,a2
8000a2ce:	00e85533          	srl	a0,a6,a4
8000a2d2:	00c81633          	sll	a2,a6,a2
8000a2d6:	8fc9                	or	a5,a5,a0
8000a2d8:	00c03633          	snez	a2,a2
8000a2dc:	8fd1                	or	a5,a5,a2
8000a2de:	00e6d733          	srl	a4,a3,a4
8000a2e2:	b56d                	j	8000a18c <__subdf3+0x624>
8000a2e4:	012a67b3          	or	a5,s4,s2
8000a2e8:	f3dd                	bnez	a5,8000a28e <__subdf3+0x726>
8000a2ea:	b71d                	j	8000a210 <__subdf3+0x6a8>
8000a2ec:	8552                	mv	a0,s4
8000a2ee:	2e19                	jal	8000a604 <__clzsi2>
8000a2f0:	02050513          	addi	a0,a0,32
8000a2f4:	b74d                	j	8000a296 <__subdf3+0x72e>
8000a2f6:	fd850693          	addi	a3,a0,-40
8000a2fa:	00da16b3          	sll	a3,s4,a3
8000a2fe:	4801                	li	a6,0
8000a300:	bf55                	j	8000a2b4 <__subdf3+0x74c>
8000a302:	1605                	addi	a2,a2,-31
8000a304:	02000593          	li	a1,32
8000a308:	00c6d633          	srl	a2,a3,a2
8000a30c:	4781                	li	a5,0
8000a30e:	00b70763          	beq	a4,a1,8000a31c <__subdf3+0x7b4>
8000a312:	04000793          	li	a5,64
8000a316:	8f99                	sub	a5,a5,a4
8000a318:	00f697b3          	sll	a5,a3,a5
8000a31c:	00f867b3          	or	a5,a6,a5
8000a320:	00f037b3          	snez	a5,a5
8000a324:	8fd1                	or	a5,a5,a2
8000a326:	bdcd                	j	8000a218 <__subdf3+0x6b0>
8000a328:	ff8007b7          	lui	a5,0xff800
8000a32c:	17fd                	addi	a5,a5,-1
8000a32e:	40c40633          	sub	a2,s0,a2
8000a332:	8efd                	and	a3,a3,a5
8000a334:	bae1                	j	80009d0c <__subdf3+0x1a4>
8000a336:	8736                	mv	a4,a3
8000a338:	87c2                	mv	a5,a6
8000a33a:	bd89                	j	8000a18c <__subdf3+0x624>
8000a33c:	8736                	mv	a4,a3
8000a33e:	87c2                	mv	a5,a6
8000a340:	b5d1                	j	8000a204 <__subdf3+0x69c>
8000a342:	8732                	mv	a4,a2
8000a344:	87ae                	mv	a5,a1
8000a346:	b599                	j	8000a18c <__subdf3+0x624>
8000a348:	8426                	mv	s0,s1
8000a34a:	e80493e3          	bnez	s1,8000a1d0 <__subdf3+0x668>
8000a34e:	ff86b693          	sltiu	a3,a3,-8
8000a352:	0016c693          	xori	a3,a3,1
8000a356:	95b6                	add	a1,a1,a3
8000a358:	4405                	li	s0,1
8000a35a:	bd9d                	j	8000a1d0 <__subdf3+0x668>
8000a35c:	4405                	li	s0,1
8000a35e:	e60489e3          	beqz	s1,8000a1d0 <__subdf3+0x668>
8000a362:	ff86b693          	sltiu	a3,a3,-8
8000a366:	0016c693          	xori	a3,a3,1
8000a36a:	95b6                	add	a1,a1,a3
8000a36c:	8426                	mv	s0,s1
8000a36e:	b58d                	j	8000a1d0 <__subdf3+0x668>
8000a370:	4701                	li	a4,0
8000a372:	7ff00613          	li	a2,2047
8000a376:	b84d                	j	80009c28 <__subdf3+0xc0>
8000a378:	87c2                	mv	a5,a6
8000a37a:	7ff00613          	li	a2,2047
8000a37e:	b665                	j	80009f26 <__subdf3+0x3be>
8000a380:	577d                	li	a4,-1
8000a382:	57fd                	li	a5,-1
8000a384:	7fe00613          	li	a2,2046
8000a388:	4581                	li	a1,0
8000a38a:	b6d9                	j	80009f50 <__subdf3+0x3e8>
8000a38c:	4701                	li	a4,0
8000a38e:	4781                	li	a5,0
8000a390:	b631                	j	80009e9c <__subdf3+0x334>
8000a392:	4701                	li	a4,0
8000a394:	4781                	li	a5,0
8000a396:	bff1                	j	8000a372 <__subdf3+0x80a>
8000a398:	87c2                	mv	a5,a6
8000a39a:	4581                	li	a1,0
8000a39c:	bc49                	j	80009e2e <__subdf3+0x2c6>
8000a39e:	4701                	li	a4,0
8000a3a0:	849a                	mv	s1,t1
8000a3a2:	bced                	j	80009e9c <__subdf3+0x334>
8000a3a4:	87c2                	mv	a5,a6
8000a3a6:	849a                	mv	s1,t1
8000a3a8:	bfcd                	j	8000a39a <__subdf3+0x832>
8000a3aa:	4701                	li	a4,0
8000a3ac:	7ff00613          	li	a2,2047
8000a3b0:	849a                	mv	s1,t1
8000a3b2:	b89d                	j	80009c28 <__subdf3+0xc0>
8000a3b4:	87c2                	mv	a5,a6
8000a3b6:	7ff00613          	li	a2,2047
8000a3ba:	849a                	mv	s1,t1
8000a3bc:	b6ad                	j	80009f26 <__subdf3+0x3be>
8000a3be:	4781                	li	a5,0
8000a3c0:	4481                	li	s1,0
8000a3c2:	00400737          	lui	a4,0x400
8000a3c6:	7ff00613          	li	a2,2047
8000a3ca:	4441                	li	s0,16
8000a3cc:	bcc1                	j	80009e9c <__subdf3+0x334>
8000a3ce:	4701                	li	a4,0
8000a3d0:	4781                	li	a5,0
8000a3d2:	4601                	li	a2,0
8000a3d4:	b891                	j	80009c28 <__subdf3+0xc0>
8000a3d6:	e489                	bnez	s1,8000a3e0 <__subdf3+0x878>
8000a3d8:	00878693          	addi	a3,a5,8 # ff800008 <__freertos_irq_stack_top+0x7f3ec7b8>
8000a3dc:	be61                	j	80009f74 <__subdf3+0x40c>
8000a3de:	fced                	bnez	s1,8000a3d8 <__subdf3+0x870>
8000a3e0:	a4059fe3          	bnez	a1,80009e3e <__subdf3+0x2d6>
8000a3e4:	bc65                	j	80009e9c <__subdf3+0x334>
8000a3e6:	4781                	li	a5,0
8000a3e8:	00098e63          	beqz	s3,8000a404 <__subdf3+0x89c>
8000a3ec:	470d                	li	a4,3
8000a3ee:	00e99763          	bne	s3,a4,8000a3fc <__subdf3+0x894>
8000a3f2:	c889                	beqz	s1,8000a404 <__subdf3+0x89c>
8000a3f4:	57fd                	li	a5,-1
8000a3f6:	7fe00613          	li	a2,2046
8000a3fa:	a029                	j	8000a404 <__subdf3+0x89c>
8000a3fc:	4709                	li	a4,2
8000a3fe:	fee99be3          	bne	s3,a4,8000a3f4 <__subdf3+0x88c>
8000a402:	d8ed                	beqz	s1,8000a3f4 <__subdf3+0x88c>
8000a404:	00546413          	ori	s0,s0,5
8000a408:	873e                	mv	a4,a5
8000a40a:	b475                	j	80009eb6 <__subdf3+0x34e>
8000a40c:	e48587e3          	beq	a1,s0,8000a25a <__subdf3+0x6f2>
8000a410:	4401                	li	s0,0
8000a412:	bd35                	j	8000a24e <__subdf3+0x6e6>
8000a414:	a68589e3          	beq	a1,s0,80009e86 <__subdf3+0x31e>
8000a418:	4401                	li	s0,0
8000a41a:	b485                	j	80009e7a <__subdf3+0x312>

8000a41c <__fixdfsi>:
8000a41c:	882a                	mv	a6,a0
8000a41e:	002027f3          	frrm	a5
8000a422:	001007b7          	lui	a5,0x100
8000a426:	0145d693          	srli	a3,a1,0x14
8000a42a:	fff78613          	addi	a2,a5,-1 # fffff <__stack_size-0x300001>
8000a42e:	7ff6f693          	andi	a3,a3,2047
8000a432:	3fe00713          	li	a4,1022
8000a436:	8e6d                	and	a2,a2,a1
8000a438:	81fd                	srli	a1,a1,0x1f
8000a43a:	00d74663          	blt	a4,a3,8000a446 <__fixdfsi+0x2a>
8000a43e:	ead1                	bnez	a3,8000a4d2 <__fixdfsi+0xb6>
8000a440:	8d51                	or	a0,a0,a2
8000a442:	e941                	bnez	a0,8000a4d2 <__fixdfsi+0xb6>
8000a444:	8082                	ret
8000a446:	41d00713          	li	a4,1053
8000a44a:	02d75863          	bge	a4,a3,8000a47a <__fixdfsi+0x5e>
8000a44e:	80000737          	lui	a4,0x80000
8000a452:	fff74713          	not	a4,a4
8000a456:	00e58533          	add	a0,a1,a4
8000a45a:	cdbd                	beqz	a1,8000a4d8 <__fixdfsi+0xbc>
8000a45c:	41e00793          	li	a5,1054
8000a460:	4741                	li	a4,16
8000a462:	04f69263          	bne	a3,a5,8000a4a6 <__fixdfsi+0x8a>
8000a466:	00b61793          	slli	a5,a2,0xb
8000a46a:	01585613          	srli	a2,a6,0x15
8000a46e:	8fd1                	or	a5,a5,a2
8000a470:	eb9d                	bnez	a5,8000a4a6 <__fixdfsi+0x8a>
8000a472:	00b81713          	slli	a4,a6,0xb
8000a476:	e33d                	bnez	a4,8000a4dc <__fixdfsi+0xc0>
8000a478:	8082                	ret
8000a47a:	43300513          	li	a0,1075
8000a47e:	8d15                	sub	a0,a0,a3
8000a480:	477d                	li	a4,31
8000a482:	8fd1                	or	a5,a5,a2
8000a484:	02a74463          	blt	a4,a0,8000a4ac <__fixdfsi+0x90>
8000a488:	bed68613          	addi	a2,a3,-1043 # 7feffbed <__stack_size+0x7faffbed>
8000a48c:	00c816b3          	sll	a3,a6,a2
8000a490:	00c797b3          	sll	a5,a5,a2
8000a494:	00a85533          	srl	a0,a6,a0
8000a498:	00d03733          	snez	a4,a3
8000a49c:	8d5d                	or	a0,a0,a5
8000a49e:	c199                	beqz	a1,8000a4a4 <__fixdfsi+0x88>
8000a4a0:	40a00533          	neg	a0,a0
8000a4a4:	c319                	beqz	a4,8000a4aa <__fixdfsi+0x8e>
8000a4a6:	00172073          	csrs	fflags,a4
8000a4aa:	8082                	ret
8000a4ac:	02000613          	li	a2,32
8000a4b0:	4701                	li	a4,0
8000a4b2:	00c50663          	beq	a0,a2,8000a4be <__fixdfsi+0xa2>
8000a4b6:	c0d68713          	addi	a4,a3,-1011
8000a4ba:	00e79733          	sll	a4,a5,a4
8000a4be:	41300513          	li	a0,1043
8000a4c2:	01076733          	or	a4,a4,a6
8000a4c6:	8d15                	sub	a0,a0,a3
8000a4c8:	00e03733          	snez	a4,a4
8000a4cc:	00a7d533          	srl	a0,a5,a0
8000a4d0:	b7f9                	j	8000a49e <__fixdfsi+0x82>
8000a4d2:	4501                	li	a0,0
8000a4d4:	4705                	li	a4,1
8000a4d6:	bfc1                	j	8000a4a6 <__fixdfsi+0x8a>
8000a4d8:	4741                	li	a4,16
8000a4da:	b7f1                	j	8000a4a6 <__fixdfsi+0x8a>
8000a4dc:	872e                	mv	a4,a1
8000a4de:	b7e1                	j	8000a4a6 <__fixdfsi+0x8a>

8000a4e0 <__floatsidf>:
8000a4e0:	1141                	addi	sp,sp,-16
8000a4e2:	c606                	sw	ra,12(sp)
8000a4e4:	c422                	sw	s0,8(sp)
8000a4e6:	c226                	sw	s1,4(sp)
8000a4e8:	cd21                	beqz	a0,8000a540 <__floatsidf+0x60>
8000a4ea:	41f55793          	srai	a5,a0,0x1f
8000a4ee:	00a7c433          	xor	s0,a5,a0
8000a4f2:	8c1d                	sub	s0,s0,a5
8000a4f4:	01f55493          	srli	s1,a0,0x1f
8000a4f8:	8522                	mv	a0,s0
8000a4fa:	2229                	jal	8000a604 <__clzsi2>
8000a4fc:	41e00713          	li	a4,1054
8000a500:	47a9                	li	a5,10
8000a502:	8f09                	sub	a4,a4,a0
8000a504:	02a7c863          	blt	a5,a0,8000a534 <__floatsidf+0x54>
8000a508:	47ad                	li	a5,11
8000a50a:	8f89                	sub	a5,a5,a0
8000a50c:	0555                	addi	a0,a0,21
8000a50e:	00f457b3          	srl	a5,s0,a5
8000a512:	00a41433          	sll	s0,s0,a0
8000a516:	8526                	mv	a0,s1
8000a518:	07b2                	slli	a5,a5,0xc
8000a51a:	0752                	slli	a4,a4,0x14
8000a51c:	83b1                	srli	a5,a5,0xc
8000a51e:	057e                	slli	a0,a0,0x1f
8000a520:	8fd9                	or	a5,a5,a4
8000a522:	40b2                	lw	ra,12(sp)
8000a524:	00a7e733          	or	a4,a5,a0
8000a528:	8522                	mv	a0,s0
8000a52a:	4422                	lw	s0,8(sp)
8000a52c:	4492                	lw	s1,4(sp)
8000a52e:	85ba                	mv	a1,a4
8000a530:	0141                	addi	sp,sp,16
8000a532:	8082                	ret
8000a534:	1555                	addi	a0,a0,-11
8000a536:	00a417b3          	sll	a5,s0,a0
8000a53a:	8526                	mv	a0,s1
8000a53c:	4401                	li	s0,0
8000a53e:	bfe9                	j	8000a518 <__floatsidf+0x38>
8000a540:	4701                	li	a4,0
8000a542:	4781                	li	a5,0
8000a544:	bfe5                	j	8000a53c <__floatsidf+0x5c>

8000a546 <__extendsfdf2>:
8000a546:	1141                	addi	sp,sp,-16
8000a548:	e00507d3          	fmv.x.w	a5,fa0
8000a54c:	c606                	sw	ra,12(sp)
8000a54e:	c422                	sw	s0,8(sp)
8000a550:	c226                	sw	s1,4(sp)
8000a552:	c04a                	sw	s2,0(sp)
8000a554:	00202773          	frrm	a4
8000a558:	0177d493          	srli	s1,a5,0x17
8000a55c:	0ff4f493          	andi	s1,s1,255
8000a560:	00148713          	addi	a4,s1,1
8000a564:	00979413          	slli	s0,a5,0x9
8000a568:	0fe77713          	andi	a4,a4,254
8000a56c:	8025                	srli	s0,s0,0x9
8000a56e:	01f7d913          	srli	s2,a5,0x1f
8000a572:	cb0d                	beqz	a4,8000a5a4 <__extendsfdf2+0x5e>
8000a574:	38048513          	addi	a0,s1,896
8000a578:	00345793          	srli	a5,s0,0x3
8000a57c:	4481                	li	s1,0
8000a57e:	0476                	slli	s0,s0,0x1d
8000a580:	07b2                	slli	a5,a5,0xc
8000a582:	0552                	slli	a0,a0,0x14
8000a584:	83b1                	srli	a5,a5,0xc
8000a586:	8fc9                	or	a5,a5,a0
8000a588:	097e                	slli	s2,s2,0x1f
8000a58a:	0127e733          	or	a4,a5,s2
8000a58e:	8522                	mv	a0,s0
8000a590:	85ba                	mv	a1,a4
8000a592:	c099                	beqz	s1,8000a598 <__extendsfdf2+0x52>
8000a594:	0014a073          	csrs	fflags,s1
8000a598:	40b2                	lw	ra,12(sp)
8000a59a:	4422                	lw	s0,8(sp)
8000a59c:	4492                	lw	s1,4(sp)
8000a59e:	4902                	lw	s2,0(sp)
8000a5a0:	0141                	addi	sp,sp,16
8000a5a2:	8082                	ret
8000a5a4:	e895                	bnez	s1,8000a5d8 <__extendsfdf2+0x92>
8000a5a6:	c829                	beqz	s0,8000a5f8 <__extendsfdf2+0xb2>
8000a5a8:	8522                	mv	a0,s0
8000a5aa:	28a9                	jal	8000a604 <__clzsi2>
8000a5ac:	47a9                	li	a5,10
8000a5ae:	00a7cf63          	blt	a5,a0,8000a5cc <__extendsfdf2+0x86>
8000a5b2:	47ad                	li	a5,11
8000a5b4:	8f89                	sub	a5,a5,a0
8000a5b6:	01550713          	addi	a4,a0,21
8000a5ba:	00f457b3          	srl	a5,s0,a5
8000a5be:	00e41433          	sll	s0,s0,a4
8000a5c2:	38900713          	li	a4,905
8000a5c6:	40a70533          	sub	a0,a4,a0
8000a5ca:	bf5d                	j	8000a580 <__extendsfdf2+0x3a>
8000a5cc:	ff550793          	addi	a5,a0,-11
8000a5d0:	00f417b3          	sll	a5,s0,a5
8000a5d4:	4401                	li	s0,0
8000a5d6:	b7f5                	j	8000a5c2 <__extendsfdf2+0x7c>
8000a5d8:	c01d                	beqz	s0,8000a5fe <__extendsfdf2+0xb8>
8000a5da:	004007b7          	lui	a5,0x400
8000a5de:	8fe1                	and	a5,a5,s0
8000a5e0:	e391                	bnez	a5,8000a5e4 <__extendsfdf2+0x9e>
8000a5e2:	4741                	li	a4,16
8000a5e4:	00345793          	srli	a5,s0,0x3
8000a5e8:	000806b7          	lui	a3,0x80
8000a5ec:	0476                	slli	s0,s0,0x1d
8000a5ee:	8fd5                	or	a5,a5,a3
8000a5f0:	84ba                	mv	s1,a4
8000a5f2:	7ff00513          	li	a0,2047
8000a5f6:	b769                	j	8000a580 <__extendsfdf2+0x3a>
8000a5f8:	4781                	li	a5,0
8000a5fa:	4501                	li	a0,0
8000a5fc:	b751                	j	8000a580 <__extendsfdf2+0x3a>
8000a5fe:	4781                	li	a5,0
8000a600:	4481                	li	s1,0
8000a602:	bfc5                	j	8000a5f2 <__extendsfdf2+0xac>

8000a604 <__clzsi2>:
8000a604:	67c1                	lui	a5,0x10
8000a606:	02f57663          	bgeu	a0,a5,8000a632 <__clzsi2+0x2e>
8000a60a:	0ff00793          	li	a5,255
8000a60e:	00a7b7b3          	sltu	a5,a5,a0
8000a612:	078e                	slli	a5,a5,0x3
8000a614:	02000713          	li	a4,32
8000a618:	8f1d                	sub	a4,a4,a5
8000a61a:	00f55533          	srl	a0,a0,a5
8000a61e:	00001797          	auipc	a5,0x1
8000a622:	81678793          	addi	a5,a5,-2026 # 8000ae34 <__clz_tab>
8000a626:	953e                	add	a0,a0,a5
8000a628:	00054503          	lbu	a0,0(a0)
8000a62c:	40a70533          	sub	a0,a4,a0
8000a630:	8082                	ret
8000a632:	01000737          	lui	a4,0x1000
8000a636:	47c1                	li	a5,16
8000a638:	fce56ee3          	bltu	a0,a4,8000a614 <__clzsi2+0x10>
8000a63c:	47e1                	li	a5,24
8000a63e:	bfd9                	j	8000a614 <__clzsi2+0x10>
