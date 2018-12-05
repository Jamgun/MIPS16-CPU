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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_3620187407;
char *IEEE_P_3499444699;
char *STD_STANDARD;
char *IEEE_P_2592010699;
char *STD_TEXTIO;
char *IEEE_P_3564397177;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_a_1373634442_3212880686_init();
    std_textio_init();
    ieee_p_3564397177_init();
    xilinxcorelib_a_0501124386_2959432447_init();
    xilinxcorelib_a_4259388143_1709443946_init();
    xilinxcorelib_a_2856577958_0543512595_init();
    xilinxcorelib_a_0873031369_3212880686_init();
    work_a_2328576589_3721666399_init();
    work_a_3721965517_3212880686_init();
    work_a_3135922175_3212880686_init();
    work_a_1504015052_3212880686_init();
    work_a_3281815615_3212880686_init();
    work_a_2242833251_3212880686_init();
    work_a_1703316882_3212880686_init();
    work_a_3609077599_3212880686_init();
    work_a_2396143424_3212880686_init();
    work_a_2414696051_3212880686_init();
    work_a_2913982024_3212880686_init();
    work_a_0238996884_3212880686_init();
    work_a_3019153754_3212880686_init();
    work_a_1699980967_3212880686_init();
    work_a_2024695647_3212880686_init();
    work_a_1821621980_3212880686_init();
    work_a_3854929772_3212880686_init();
    work_a_3117446978_3212880686_init();
    xilinxcorelib_a_2420455362_0543512595_init();
    xilinxcorelib_a_4132464164_3212880686_init();
    work_a_3007741576_3750928646_init();
    work_a_1804183904_3212880686_init();
    work_a_2745653625_3212880686_init();
    work_a_1384598965_3212880686_init();
    work_a_3102717990_3212880686_init();
    work_a_1495005103_3212880686_init();
    work_a_1994573946_3212880686_init();
    work_a_1460881444_2372691052_init();


    xsi_register_tops("work_a_1460881444_2372691052");

    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");

    return xsi_run_simulation(argc, argv);

}
