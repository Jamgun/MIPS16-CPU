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
static const char *ng0 = "C:/Users/zsh/Desktop/CPUsim/CPU2/alu_component.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

char *ieee_p_2592010699_sub_1735675855_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_3293060193_503743352(char *, char *, char *, char *, unsigned char );
char *ieee_p_2592010699_sub_393209765_503743352(char *, char *, char *, char *);
char *ieee_p_2592010699_sub_795620321_503743352(char *, char *, char *, char *, char *, char *);
int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767740470_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_2024695647_3212880686_p_0(char *t0)
{
    char t26[16];
    char t41[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned int t5;
    int t6;
    unsigned int t7;
    unsigned int t8;
    int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    int t14;
    int t15;
    char *t16;
    int t17;
    char *t18;
    int t19;
    char *t20;
    int t21;
    char *t22;
    int t23;
    char *t24;
    int t25;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    unsigned char t35;
    unsigned char t36;
    unsigned char t37;
    unsigned int t38;
    unsigned char t39;
    unsigned char t40;

LAB0:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 1968U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    memcpy(t1, t2, 16U);
    t4 = (t0 + 1912U);
    xsi_variable_act(t4);
    xsi_set_current_line(68, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 2088U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    memcpy(t1, t2, 16U);
    t4 = (t0 + 2032U);
    xsi_variable_act(t4);
    xsi_set_current_line(69, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t2 = t1;
    if (-1 == -1)
        goto LAB2;

LAB3:    t5 = 0;

LAB4:    t6 = (t5 - 15);
    t7 = (t6 * -1);
    t8 = (1U * t7);
    t3 = (t2 + t8);
    t9 = (0 - 15);
    t10 = (t9 * -1);
    t10 = (t10 + 1);
    t11 = (1U * t10);
    memset(t3, (unsigned char)2, t11);
    t4 = (t0 + 2448U);
    t12 = *((char **)t4);
    t4 = (t12 + 0);
    memcpy(t4, t1, 16U);
    t13 = (t0 + 2392U);
    xsi_variable_act(t13);
    xsi_set_current_line(70, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 3048U);
    t3 = *((char **)t1);
    t6 = xsi_mem_cmp(t3, t2, 4U);
    if (t6 == 1)
        goto LAB6;

LAB16:    t1 = (t0 + 3168U);
    t4 = *((char **)t1);
    t9 = xsi_mem_cmp(t4, t2, 4U);
    if (t9 == 1)
        goto LAB7;

LAB17:    t1 = (t0 + 3288U);
    t12 = *((char **)t1);
    t14 = xsi_mem_cmp(t12, t2, 4U);
    if (t14 == 1)
        goto LAB8;

LAB18:    t1 = (t0 + 3408U);
    t13 = *((char **)t1);
    t15 = xsi_mem_cmp(t13, t2, 4U);
    if (t15 == 1)
        goto LAB9;

LAB19:    t1 = (t0 + 3528U);
    t16 = *((char **)t1);
    t17 = xsi_mem_cmp(t16, t2, 4U);
    if (t17 == 1)
        goto LAB10;

LAB20:    t1 = (t0 + 3648U);
    t18 = *((char **)t1);
    t19 = xsi_mem_cmp(t18, t2, 4U);
    if (t19 == 1)
        goto LAB11;

LAB21:    t1 = (t0 + 3768U);
    t20 = *((char **)t1);
    t21 = xsi_mem_cmp(t20, t2, 4U);
    if (t21 == 1)
        goto LAB12;

LAB22:    t1 = (t0 + 3888U);
    t22 = *((char **)t1);
    t23 = xsi_mem_cmp(t22, t2, 4U);
    if (t23 == 1)
        goto LAB13;

LAB23:    t1 = (t0 + 4008U);
    t24 = *((char **)t1);
    t25 = xsi_mem_cmp(t24, t2, 4U);
    if (t25 == 1)
        goto LAB14;

LAB24:
LAB15:    xsi_set_current_line(135, ng0);

LAB5:    xsi_set_current_line(138, ng0);
    t1 = (t0 + 2568U);
    t2 = *((char **)t1);
    t1 = (t0 + 5392);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t12 = (t4 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(139, ng0);
    t1 = (t0 + 2568U);
    t2 = *((char **)t1);
    t1 = (t0 + 8508U);
    t3 = (t0 + 2448U);
    t4 = *((char **)t3);
    t3 = (t0 + 8492U);
    t35 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t4, t3);
    if (t35 != 0)
        goto LAB47;

LAB49:    xsi_set_current_line(142, ng0);
    t1 = (t0 + 2928U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)3;
    t3 = (t0 + 2872U);
    xsi_variable_act(t3);

LAB48:    xsi_set_current_line(144, ng0);
    t1 = (t0 + 2928U);
    t2 = *((char **)t1);
    t35 = *((unsigned char *)t2);
    t1 = (t0 + 5456);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t12 = (t4 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = t35;
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 5312);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    t5 = 15;
    goto LAB4;

LAB6:    xsi_set_current_line(72, ng0);
    t1 = (t0 + 1968U);
    t27 = *((char **)t1);
    t1 = (t0 + 8428U);
    t28 = (t0 + 2088U);
    t29 = *((char **)t28);
    t28 = (t0 + 8444U);
    t30 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t26, t27, t1, t29, t28);
    t31 = (t0 + 2568U);
    t32 = *((char **)t31);
    t31 = (t32 + 0);
    t33 = (t26 + 12U);
    t5 = *((unsigned int *)t33);
    t7 = (1U * t5);
    memcpy(t31, t30, t7);
    t34 = (t0 + 2512U);
    xsi_variable_act(t34);
    goto LAB5;

LAB7:    xsi_set_current_line(75, ng0);
    t1 = (t0 + 1968U);
    t2 = *((char **)t1);
    t1 = (t0 + 8428U);
    t3 = (t0 + 2088U);
    t4 = *((char **)t3);
    t3 = (t0 + 8444U);
    t12 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t26, t2, t1, t4, t3);
    t13 = (t0 + 2568U);
    t16 = *((char **)t13);
    t13 = (t16 + 0);
    t18 = (t26 + 12U);
    t5 = *((unsigned int *)t18);
    t7 = (1U * t5);
    memcpy(t13, t12, t7);
    t20 = (t0 + 2512U);
    xsi_variable_act(t20);
    goto LAB5;

LAB8:    xsi_set_current_line(78, ng0);
    t1 = (t0 + 1968U);
    t2 = *((char **)t1);
    t1 = (t0 + 8428U);
    t3 = (t0 + 2088U);
    t4 = *((char **)t3);
    t3 = (t0 + 8444U);
    t12 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t26, t2, t1, t4, t3);
    t13 = (t0 + 2568U);
    t16 = *((char **)t13);
    t13 = (t16 + 0);
    t18 = (t26 + 12U);
    t5 = *((unsigned int *)t18);
    t7 = (1U * t5);
    memcpy(t13, t12, t7);
    t20 = (t0 + 2512U);
    xsi_variable_act(t20);
    goto LAB5;

LAB9:    xsi_set_current_line(81, ng0);
    t1 = (t0 + 1968U);
    t2 = *((char **)t1);
    t1 = (t0 + 8428U);
    t3 = (t0 + 2088U);
    t4 = *((char **)t3);
    t3 = (t0 + 8444U);
    t12 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t26, t2, t1, t4, t3);
    t13 = (t0 + 2568U);
    t16 = *((char **)t13);
    t13 = (t16 + 0);
    t18 = (t26 + 12U);
    t5 = *((unsigned int *)t18);
    t7 = (1U * t5);
    memcpy(t13, t12, t7);
    t20 = (t0 + 2512U);
    xsi_variable_act(t20);
    goto LAB5;

LAB10:    xsi_set_current_line(84, ng0);
    t1 = (t0 + 1968U);
    t2 = *((char **)t1);
    t1 = (t0 + 8428U);
    t3 = (t0 + 2088U);
    t4 = *((char **)t3);
    t3 = (t0 + 8444U);
    t12 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t26, t2, t1, t4, t3);
    t13 = (t0 + 2688U);
    t16 = *((char **)t13);
    t13 = (t16 + 0);
    t18 = (t26 + 12U);
    t5 = *((unsigned int *)t18);
    t7 = (1U * t5);
    memcpy(t13, t12, t7);
    t20 = (t0 + 2632U);
    xsi_variable_act(t20);
    xsi_set_current_line(85, ng0);
    t1 = (t0 + 2688U);
    t2 = *((char **)t1);
    t1 = (t0 + 8524U);
    t3 = (t0 + 2448U);
    t4 = *((char **)t3);
    t3 = (t0 + 8492U);
    t35 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t4, t3);
    if (t35 != 0)
        goto LAB26;

LAB28:    xsi_set_current_line(88, ng0);
    t1 = (t0 + 8928);
    t3 = (t0 + 2568U);
    t4 = *((char **)t3);
    t3 = (t4 + 0);
    memcpy(t3, t1, 16U);
    t12 = (t0 + 2512U);
    xsi_variable_act(t12);

LAB27:    goto LAB5;

LAB11:    xsi_set_current_line(92, ng0);
    t1 = (t0 + 1968U);
    t2 = *((char **)t1);
    t1 = (t0 + 8428U);
    t3 = (t0 + 2088U);
    t4 = *((char **)t3);
    t3 = (t0 + 8444U);
    t12 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t26, t2, t1, t4, t3);
    t13 = (t0 + 2688U);
    t16 = *((char **)t13);
    t13 = (t16 + 0);
    t18 = (t26 + 12U);
    t5 = *((unsigned int *)t18);
    t7 = (1U * t5);
    memcpy(t13, t12, t7);
    t20 = (t0 + 2632U);
    xsi_variable_act(t20);
    xsi_set_current_line(93, ng0);
    t1 = (t0 + 2688U);
    t2 = *((char **)t1);
    t1 = (t0 + 8524U);
    t3 = (t0 + 2448U);
    t4 = *((char **)t3);
    t3 = (t0 + 8492U);
    t35 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t4, t3);
    if (t35 != 0)
        goto LAB29;

LAB31:    t1 = (t0 + 1968U);
    t2 = *((char **)t1);
    t6 = (15 - 15);
    t5 = (t6 * -1);
    t7 = (1U * t5);
    t8 = (0 + t7);
    t1 = (t2 + t8);
    t36 = *((unsigned char *)t1);
    t37 = (t36 == (unsigned char)2);
    if (t37 == 1)
        goto LAB34;

LAB35:    t35 = (unsigned char)0;

LAB36:    if (t35 != 0)
        goto LAB32;

LAB33:    t1 = (t0 + 1968U);
    t2 = *((char **)t1);
    t6 = (15 - 15);
    t5 = (t6 * -1);
    t7 = (1U * t5);
    t8 = (0 + t7);
    t1 = (t2 + t8);
    t36 = *((unsigned char *)t1);
    t37 = (t36 == (unsigned char)3);
    if (t37 == 1)
        goto LAB39;

LAB40:    t35 = (unsigned char)0;

LAB41:    if (t35 != 0)
        goto LAB37;

LAB38:    t1 = (t0 + 2688U);
    t2 = *((char **)t1);
    t6 = (15 - 15);
    t5 = (t6 * -1);
    t7 = (1U * t5);
    t8 = (0 + t7);
    t1 = (t2 + t8);
    t35 = *((unsigned char *)t1);
    t36 = (t35 == (unsigned char)2);
    if (t36 != 0)
        goto LAB42;

LAB43:    xsi_set_current_line(102, ng0);
    t1 = (t0 + 9008);
    t3 = (t0 + 2568U);
    t4 = *((char **)t3);
    t3 = (t4 + 0);
    memcpy(t3, t1, 16U);
    t12 = (t0 + 2512U);
    xsi_variable_act(t12);

LAB30:    goto LAB5;

LAB12:    xsi_set_current_line(106, ng0);
    t1 = (t0 + 1968U);
    t2 = *((char **)t1);
    t3 = ((IEEE_P_2592010699) + 4024);
    t4 = (t0 + 8428U);
    t1 = xsi_base_array_concat(t1, t26, t3, (char)99, (unsigned char)2, (char)97, t2, t4, (char)101);
    t12 = (t0 + 2208U);
    t13 = *((char **)t12);
    t12 = (t13 + 0);
    t5 = (1U + 16U);
    memcpy(t12, t1, t5);
    t16 = (t0 + 2152U);
    xsi_variable_act(t16);
    xsi_set_current_line(107, ng0);
    t1 = (t0 + 2088U);
    t2 = *((char **)t1);
    t3 = ((IEEE_P_2592010699) + 4024);
    t4 = (t0 + 8444U);
    t1 = xsi_base_array_concat(t1, t26, t3, (char)99, (unsigned char)2, (char)97, t2, t4, (char)101);
    t12 = (t0 + 2328U);
    t13 = *((char **)t12);
    t12 = (t13 + 0);
    t5 = (1U + 16U);
    memcpy(t12, t1, t5);
    t16 = (t0 + 2272U);
    xsi_variable_act(t16);
    xsi_set_current_line(108, ng0);
    t1 = (t0 + 2208U);
    t2 = *((char **)t1);
    t1 = (t0 + 8460U);
    t3 = (t0 + 2328U);
    t4 = *((char **)t3);
    t3 = (t0 + 8476U);
    t12 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t26, t2, t1, t4, t3);
    t13 = (t0 + 2808U);
    t16 = *((char **)t13);
    t13 = (t16 + 0);
    t18 = (t26 + 12U);
    t5 = *((unsigned int *)t18);
    t7 = (1U * t5);
    memcpy(t13, t12, t7);
    t20 = (t0 + 2752U);
    xsi_variable_act(t20);
    xsi_set_current_line(109, ng0);
    t1 = (t0 + 2808U);
    t2 = *((char **)t1);
    t6 = (16 - 16);
    t5 = (t6 * -1);
    t7 = (1U * t5);
    t8 = (0 + t7);
    t1 = (t2 + t8);
    t35 = *((unsigned char *)t1);
    t36 = (t35 == (unsigned char)2);
    if (t36 != 0)
        goto LAB44;

LAB46:    xsi_set_current_line(112, ng0);
    t1 = (t0 + 9040);
    t3 = (t0 + 2568U);
    t4 = *((char **)t3);
    t3 = (t4 + 0);
    memcpy(t3, t1, 16U);
    t12 = (t0 + 2512U);
    xsi_variable_act(t12);

LAB45:    goto LAB5;

LAB13:    xsi_set_current_line(129, ng0);
    t1 = (t0 + 1968U);
    t2 = *((char **)t1);
    t1 = (t0 + 8428U);
    t3 = ieee_p_2592010699_sub_3293060193_503743352(IEEE_P_2592010699, t41, t2, t1, (unsigned char)0);
    t4 = (t41 + 12U);
    t5 = *((unsigned int *)t4);
    t5 = (t5 * 1U);
    t12 = (t0 + 2088U);
    t13 = *((char **)t12);
    t12 = (t0 + 8444U);
    t6 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t13, t12);
    t16 = xsi_vhdl_bitvec_sll(t16, t3, t5, t6);
    t18 = ieee_p_2592010699_sub_393209765_503743352(IEEE_P_2592010699, t26, t16, t41);
    t20 = (t0 + 2568U);
    t22 = *((char **)t20);
    t20 = (t22 + 0);
    t24 = (t26 + 12U);
    t7 = *((unsigned int *)t24);
    t7 = (t7 * 1U);
    memcpy(t20, t18, t7);
    t27 = (t0 + 2512U);
    xsi_variable_act(t27);
    goto LAB5;

LAB14:    xsi_set_current_line(132, ng0);
    t1 = (t0 + 1968U);
    t2 = *((char **)t1);
    t1 = (t0 + 8428U);
    t3 = ieee_p_2592010699_sub_3293060193_503743352(IEEE_P_2592010699, t41, t2, t1, (unsigned char)0);
    t4 = (t41 + 12U);
    t5 = *((unsigned int *)t4);
    t5 = (t5 * 1U);
    t12 = (t0 + 2088U);
    t13 = *((char **)t12);
    t12 = (t0 + 8444U);
    t6 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t13, t12);
    t16 = xsi_vhdl_bitvec_sra(t16, t3, t5, t6);
    t18 = ieee_p_2592010699_sub_393209765_503743352(IEEE_P_2592010699, t26, t16, t41);
    t20 = (t0 + 2568U);
    t22 = *((char **)t20);
    t20 = (t22 + 0);
    t24 = (t26 + 12U);
    t7 = *((unsigned int *)t24);
    t7 = (t7 * 1U);
    memcpy(t20, t18, t7);
    t27 = (t0 + 2512U);
    xsi_variable_act(t27);
    goto LAB5;

LAB25:;
LAB26:    xsi_set_current_line(86, ng0);
    t12 = (t0 + 8912);
    t16 = (t0 + 2568U);
    t18 = *((char **)t16);
    t16 = (t18 + 0);
    memcpy(t16, t12, 16U);
    t20 = (t0 + 2512U);
    xsi_variable_act(t20);
    goto LAB27;

LAB29:    xsi_set_current_line(94, ng0);
    t12 = (t0 + 8944);
    t16 = (t0 + 2568U);
    t18 = *((char **)t16);
    t16 = (t18 + 0);
    memcpy(t16, t12, 16U);
    t20 = (t0 + 2512U);
    xsi_variable_act(t20);
    goto LAB30;

LAB32:    xsi_set_current_line(96, ng0);
    t12 = (t0 + 8960);
    t16 = (t0 + 2568U);
    t18 = *((char **)t16);
    t16 = (t18 + 0);
    memcpy(t16, t12, 16U);
    t20 = (t0 + 2512U);
    xsi_variable_act(t20);
    goto LAB30;

LAB34:    t3 = (t0 + 2088U);
    t4 = *((char **)t3);
    t9 = (15 - 15);
    t10 = (t9 * -1);
    t11 = (1U * t10);
    t38 = (0 + t11);
    t3 = (t4 + t38);
    t39 = *((unsigned char *)t3);
    t40 = (t39 == (unsigned char)3);
    t35 = t40;
    goto LAB36;

LAB37:    xsi_set_current_line(98, ng0);
    t12 = (t0 + 8976);
    t16 = (t0 + 2568U);
    t18 = *((char **)t16);
    t16 = (t18 + 0);
    memcpy(t16, t12, 16U);
    t20 = (t0 + 2512U);
    xsi_variable_act(t20);
    goto LAB30;

LAB39:    t3 = (t0 + 2088U);
    t4 = *((char **)t3);
    t9 = (15 - 15);
    t10 = (t9 * -1);
    t11 = (1U * t10);
    t38 = (0 + t11);
    t3 = (t4 + t38);
    t39 = *((unsigned char *)t3);
    t40 = (t39 == (unsigned char)2);
    t35 = t40;
    goto LAB41;

LAB42:    xsi_set_current_line(100, ng0);
    t3 = (t0 + 8992);
    t12 = (t0 + 2568U);
    t13 = *((char **)t12);
    t12 = (t13 + 0);
    memcpy(t12, t3, 16U);
    t16 = (t0 + 2512U);
    xsi_variable_act(t16);
    goto LAB30;

LAB44:    xsi_set_current_line(110, ng0);
    t3 = (t0 + 9024);
    t12 = (t0 + 2568U);
    t13 = *((char **)t12);
    t12 = (t13 + 0);
    memcpy(t12, t3, 16U);
    t16 = (t0 + 2512U);
    xsi_variable_act(t16);
    goto LAB45;

LAB47:    xsi_set_current_line(140, ng0);
    t12 = (t0 + 2928U);
    t13 = *((char **)t12);
    t12 = (t13 + 0);
    *((unsigned char *)t12) = (unsigned char)2;
    t16 = (t0 + 2872U);
    xsi_variable_act(t16);
    goto LAB48;

}


extern void work_a_2024695647_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2024695647_3212880686_p_0};
	xsi_register_didat("work_a_2024695647_3212880686", "isim/cpu1_test_isim_beh.exe.sim/work/a_2024695647_3212880686.didat");
	xsi_register_executes(pe);
}
