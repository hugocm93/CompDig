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

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_1242562249;
char *IEEE_P_3620187407;
char *IEEE_P_3499444699;
char *WORK_P_1845655050;
char *UNISIM_P_0947159679;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_p_1845655050_init();
    unisim_p_0947159679_init();
    unisim_a_3828308815_1222000726_init();
    unisim_a_0350208134_1521797606_init();
    unisim_a_3519694068_2693788048_init();
    unisim_a_3055263662_1392679692_init();
    unisim_a_2211589156_2274105955_init();
    work_a_1435791192_3212880686_init();
    unisim_a_2312877582_0635394241_init();
    unisim_a_2661327437_0605893366_init();
    unisim_a_2562466605_1496654361_init();
    unisim_a_3988446151_0546328132_init();
    unisim_a_4207005572_0559031411_init();
    work_a_1580911632_3212880686_init();
    work_a_2225980674_3212880686_init();
    work_a_4255144607_3212880686_init();
    work_a_0489772958_3212880686_init();
    work_a_3624428029_3212880686_init();
    work_a_4044683202_2372691052_init();


    xsi_register_tops("work_a_4044683202_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    WORK_P_1845655050 = xsi_get_engine_memory("work_p_1845655050");
    UNISIM_P_0947159679 = xsi_get_engine_memory("unisim_p_0947159679");

    return xsi_run_simulation(argc, argv);

}
