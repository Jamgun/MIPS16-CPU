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
static const char *ng0 = "C:/Users/zsh/Desktop/CPUsim/CPU2/wd_forward.vhd";



static void work_a_3854929772_3212880686_p_0(char *t0)
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

LAB0:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 1352U);
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

LAB4:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 5122);
    t4 = (t0 + 3232);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 2U);
    xsi_driver_first_trans_fast_port(t4);

LAB3:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t5 = 1;
    if (4U == 4U)
        goto LAB26;

LAB27:    t5 = 0;

LAB28:    if (t5 == 1)
        goto LAB23;

LAB24:    t1 = (unsigned char)0;

LAB25:    if (t1 != 0)
        goto LAB20;

LAB22:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 5130);
    t4 = (t0 + 3296);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 2U);
    xsi_driver_first_trans_fast_port(t4);

LAB21:    t2 = (t0 + 3152);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(46, ng0);
    t15 = (t0 + 5120);
    t17 = (t0 + 3232);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t15, 2U);
    xsi_driver_first_trans_fast_port(t17);
    goto LAB3;

LAB5:    t8 = (t0 + 1352U);
    t9 = *((char **)t8);
    t8 = (t0 + 5116);
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

LAB20:    xsi_set_current_line(52, ng0);
    t15 = (t0 + 5128);
    t17 = (t0 + 3296);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t15, 2U);
    xsi_driver_first_trans_fast_port(t17);
    goto LAB21;

LAB23:    t8 = (t0 + 1352U);
    t9 = *((char **)t8);
    t8 = (t0 + 5124);
    t11 = 1;
    if (4U == 4U)
        goto LAB32;

LAB33:    t11 = 0;

LAB34:    t1 = (!(t11));
    goto LAB25;

LAB26:    t6 = 0;

LAB29:    if (t6 < 4U)
        goto LAB30;
    else
        goto LAB28;

LAB30:    t2 = (t3 + t6);
    t7 = (t4 + t6);
    if (*((unsigned char *)t2) != *((unsigned char *)t7))
        goto LAB27;

LAB31:    t6 = (t6 + 1);
    goto LAB29;

LAB32:    t12 = 0;

LAB35:    if (t12 < 4U)
        goto LAB36;
    else
        goto LAB34;

LAB36:    t13 = (t9 + t12);
    t14 = (t8 + t12);
    if (*((unsigned char *)t13) != *((unsigned char *)t14))
        goto LAB33;

LAB37:    t12 = (t12 + 1);
    goto LAB35;

}


extern void work_a_3854929772_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3854929772_3212880686_p_0};
	xsi_register_didat("work_a_3854929772_3212880686", "isim/cpu1_test_isim_beh.exe.sim/work/a_3854929772_3212880686.didat");
	xsi_register_executes(pe);
}
