/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/zsh/Desktop/CPUsim/CPU2/forward_component.vhd";



static void work_a_1821621980_3212880686_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned int t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;

LAB0:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 1512U);
    t4 = *((char **)t2);
    t5 = 1;
    if (4U == 4U)
        goto LAB8;

LAB9:    t5 = 0;

LAB10:    if (t5 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t5 = 1;
    if (4U == 4U)
        goto LAB25;

LAB26:    t5 = 0;

LAB27:    if (t5 == 1)
        goto LAB22;

LAB23:    t1 = (unsigned char)0;

LAB24:    if (t1 != 0)
        goto LAB20;

LAB21:    xsi_set_current_line(53, ng0);
    t2 = (t0 + 5682);
    t4 = (t0 + 3552);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 2U);
    xsi_driver_first_trans_fast_port(t4);

LAB3:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 1512U);
    t4 = *((char **)t2);
    t5 = 1;
    if (4U == 4U)
        goto LAB43;

LAB44:    t5 = 0;

LAB45:    if (t5 == 1)
        goto LAB40;

LAB41:    t1 = (unsigned char)0;

LAB42:    if (t1 != 0)
        goto LAB37;

LAB39:    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t5 = 1;
    if (4U == 4U)
        goto LAB60;

LAB61:    t5 = 0;

LAB62:    if (t5 == 1)
        goto LAB57;

LAB58:    t1 = (unsigned char)0;

LAB59:    if (t1 != 0)
        goto LAB55;

LAB56:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 5696);
    t4 = (t0 + 3616);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 2U);
    xsi_driver_first_trans_fast_port(t4);

LAB38:    t2 = (t0 + 3472);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(49, ng0);
    t15 = (t0 + 5674);
    t17 = (t0 + 3552);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t15, 2U);
    xsi_driver_first_trans_fast_port(t17);
    goto LAB3;

LAB5:    t8 = (t0 + 1032U);
    t9 = *((char **)t8);
    t8 = (t0 + 5670);
    t11 = 1;
    if (4U == 4U)
        goto LAB14;

LAB15:    t11 = 0;

LAB16:    t1 = (!(t11));
    goto LAB7;

LAB8:    t6 = 0;

LAB11:    if (t6 < 4U)
        goto LAB12;
    else
        goto LAB10;

LAB12:    t2 = (t3 + t6);
    t7 = (t4 + t6);
    if (*((unsigned char *)t2) != *((unsigned char *)t7))
        goto LAB9;

LAB13:    t6 = (t6 + 1);
    goto LAB11;

LAB14:    t12 = 0;

LAB17:    if (t12 < 4U)
        goto LAB18;
    else
        goto LAB16;

LAB18:    t13 = (t9 + t12);
    t14 = (t8 + t12);
    if (*((unsigned char *)t13) != *((unsigned char *)t14))
        goto LAB15;

LAB19:    t12 = (t12 + 1);
    goto LAB17;

LAB20:    xsi_set_current_line(51, ng0);
    t15 = (t0 + 5680);
    t17 = (t0 + 3552);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t15, 2U);
    xsi_driver_first_trans_fast_port(t17);
    goto LAB3;

LAB22:    t8 = (t0 + 1032U);
    t9 = *((char **)t8);
    t8 = (t0 + 5676);
    t11 = 1;
    if (4U == 4U)
        goto LAB31;

LAB32:    t11 = 0;

LAB33:    t1 = (!(t11));
    goto LAB24;

LAB25:    t6 = 0;

LAB28:    if (t6 < 4U)
        goto LAB29;
    else
        goto LAB27;

LAB29:    t2 = (t3 + t6);
    t7 = (t4 + t6);
    if (*((unsigned char *)t2) != *((unsigned char *)t7))
        goto LAB26;

LAB30:    t6 = (t6 + 1);
    goto LAB28;

LAB31:    t12 = 0;

LAB34:    if (t12 < 4U)
        goto LAB35;
    else
        goto LAB33;

LAB35:    t13 = (t9 + t12);
    t14 = (t8 + t12);
    if (*((unsigned char *)t13) != *((unsigned char *)t14))
        goto LAB32;

LAB36:    t12 = (t12 + 1);
    goto LAB34;

LAB37:    xsi_set_current_line(57, ng0);
    t15 = (t0 + 5688);
    t17 = (t0 + 3616);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t15, 2U);
    xsi_driver_first_trans_fast_port(t17);
    goto LAB38;

LAB40:    t8 = (t0 + 1192U);
    t9 = *((char **)t8);
    t8 = (t0 + 5684);
    t11 = 1;
    if (4U == 4U)
        goto LAB49;

LAB50:    t11 = 0;

LAB51:    t1 = (!(t11));
    goto LAB42;

LAB43:    t6 = 0;

LAB46:    if (t6 < 4U)
        goto LAB47;
    else
        goto LAB45;

LAB47:    t2 = (t3 + t6);
    t7 = (t4 + t6);
    if (*((unsigned char *)t2) != *((unsigned char *)t7))
        goto LAB44;

LAB48:    t6 = (t6 + 1);
    goto LAB46;

LAB49:    t12 = 0;

LAB52:    if (t12 < 4U)
        goto LAB53;
    else
        goto LAB51;

LAB53:    t13 = (t9 + t12);
    t14 = (t8 + t12);
    if (*((unsigned char *)t13) != *((unsigned char *)t14))
        goto LAB50;

LAB54:    t12 = (t12 + 1);
    goto LAB52;

LAB55:    xsi_set_current_line(59, ng0);
    t15 = (t0 + 5694);
    t17 = (t0 + 3616);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t15, 2U);
    xsi_driver_first_trans_fast_port(t17);
    goto LAB38;

LAB57:    t8 = (t0 + 1192U);
    t9 = *((char **)t8);
    t8 = (t0 + 5690);
    t11 = 1;
    if (4U == 4U)
        goto LAB66;

LAB67:    t11 = 0;

LAB68:    t1 = (!(t11));
    goto LAB59;

LAB60:    t6 = 0;

LAB63:    if (t6 < 4U)
        goto LAB64;
    else
        goto LAB62;

LAB64:    t2 = (t3 + t6);
    t7 = (t4 + t6);
    if (*((unsigned char *)t2) != *((unsigned char *)t7))
        goto LAB61;

LAB65:    t6 = (t6 + 1);
    goto LAB63;

LAB66:    t12 = 0;

LAB69:    if (t12 < 4U)
        goto LAB70;
    else
        goto LAB68;

LAB70:    t13 = (t9 + t12);
    t14 = (t8 + t12);
    if (*((unsigned char *)t13) != *((unsigned char *)t14))
        goto LAB67;

LAB71:    t12 = (t12 + 1);
    goto LAB69;

}


extern void work_a_1821621980_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1821621980_3212880686_p_0};
	xsi_register_didat("work_a_1821621980_3212880686", "isim/cpu1_test_isim_beh.exe.sim/work/a_1821621980_3212880686.didat");
	xsi_register_executes(pe);
}
