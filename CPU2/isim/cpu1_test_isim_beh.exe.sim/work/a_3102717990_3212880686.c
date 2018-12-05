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
static const char *ng0 = "C:/Users/zsh/Desktop/CPUsim/CPU2/branch_component.vhd";



static void work_a_3102717990_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    int t16;
    char *t17;
    int t19;
    char *t20;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned char t27;
    static char *nl0[] = {&&LAB19, &&LAB19, &&LAB18, &&LAB19, &&LAB19, &&LAB19, &&LAB19, &&LAB19, &&LAB19};
    static char *nl1[] = {&&LAB22, &&LAB22, &&LAB21, &&LAB22, &&LAB22, &&LAB22, &&LAB22, &&LAB22, &&LAB22};

LAB0:    xsi_set_current_line(44, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 4636);
    t4 = xsi_mem_cmp(t1, t2, 3U);
    if (t4 == 1)
        goto LAB3;

LAB10:    t5 = (t0 + 4639);
    t7 = xsi_mem_cmp(t5, t2, 3U);
    if (t7 == 1)
        goto LAB4;

LAB11:    t8 = (t0 + 4642);
    t10 = xsi_mem_cmp(t8, t2, 3U);
    if (t10 == 1)
        goto LAB5;

LAB12:    t11 = (t0 + 4645);
    t13 = xsi_mem_cmp(t11, t2, 3U);
    if (t13 == 1)
        goto LAB6;

LAB13:    t14 = (t0 + 4648);
    t16 = xsi_mem_cmp(t14, t2, 3U);
    if (t16 == 1)
        goto LAB7;

LAB14:    t17 = (t0 + 4651);
    t19 = xsi_mem_cmp(t17, t2, 3U);
    if (t19 == 1)
        goto LAB8;

LAB15:
LAB9:    xsi_set_current_line(68, ng0);
    t1 = (t0 + 4670);
    t3 = (t0 + 2912);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 2U);
    xsi_driver_first_trans_fast_port(t3);

LAB2:    t1 = (t0 + 2832);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(46, ng0);
    t20 = (t0 + 4654);
    t22 = (t0 + 2912);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t20, 2U);
    xsi_driver_first_trans_fast_port(t22);
    goto LAB2;

LAB4:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 4656);
    t3 = (t0 + 2912);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 2U);
    xsi_driver_first_trans_fast_port(t3);
    goto LAB2;

LAB5:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t27 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t27);
    goto **((char **)t1);

LAB6:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t27 = *((unsigned char *)t2);
    t1 = (char *)((nl1) + t27);
    goto **((char **)t1);

LAB7:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 4666);
    t3 = (t0 + 2912);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 2U);
    xsi_driver_first_trans_fast_port(t3);
    goto LAB2;

LAB8:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 4668);
    t3 = (t0 + 2912);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 2U);
    xsi_driver_first_trans_fast_port(t3);
    goto LAB2;

LAB16:;
LAB17:    goto LAB2;

LAB18:    xsi_set_current_line(52, ng0);
    t3 = (t0 + 4658);
    t6 = (t0 + 2912);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 2U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB17;

LAB19:    xsi_set_current_line(54, ng0);
    t1 = (t0 + 4660);
    t3 = (t0 + 2912);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 2U);
    xsi_driver_first_trans_fast_port(t3);
    goto LAB17;

LAB20:    goto LAB2;

LAB21:    xsi_set_current_line(59, ng0);
    t3 = (t0 + 4662);
    t6 = (t0 + 2912);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 2U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB20;

LAB22:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 4664);
    t3 = (t0 + 2912);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 2U);
    xsi_driver_first_trans_fast_port(t3);
    goto LAB20;

}


extern void work_a_3102717990_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3102717990_3212880686_p_0};
	xsi_register_didat("work_a_3102717990_3212880686", "isim/cpu1_test_isim_beh.exe.sim/work/a_3102717990_3212880686.didat");
	xsi_register_executes(pe);
}
