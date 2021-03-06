/*
 * Copyright (c) 2018 William Pitcock <nenolod@dereferenced.org>
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * This software is provided 'as is' and without any warranty, express or
 * implied.  In no event shall the authors be liable for any damages arising
 * from the use of this software.
 */

#include "defs.h"


.globl __getcontext;
__getcontext:
	lgr	%r1, %r2			/* use %r1 as our working register */
	la	%r2, 0				/* we will return 0 */

	stam	%a0, %a15, OFFSET_AREGS(%r1)	/* store access registers */
	stmg	%r0, %r15, OFFSET_GREGS(%r1)	/* store general-purpose registers */

	br	%r14				/* return to where we came from */


.weak getcontext;
getcontext = __getcontext;
