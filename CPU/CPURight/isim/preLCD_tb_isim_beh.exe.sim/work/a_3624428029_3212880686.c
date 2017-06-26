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
static const char *ng0 = "C:/Users/aula/Downloads/CompDig/CPU/CPURight/preLCD.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );


static void work_a_3624428029_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(58, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 5320);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 1032U);
    t5 = *((char **)t1);
    t6 = *((unsigned char *)t5);
    t7 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t6);
    t1 = (t0 + 5416);
    t8 = (t1 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t7;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

}

static void work_a_3624428029_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    int t17;
    unsigned char t18;
    char *t19;
    char *t20;
    int t21;
    int t22;
    int t23;
    unsigned int t24;
    char *t25;
    int t26;
    int t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t32;
    int t33;
    int t34;
    int t35;
    char *t36;
    int t37;
    int t38;
    int t39;
    int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned char t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;

LAB0:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 2272U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 5336);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(68, ng0);
    t1 = (t0 + 5480);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(69, ng0);
    t1 = (t0 + 5544);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(71, ng0);
    t2 = (t0 + 1352U);
    t6 = *((char **)t2);
    t2 = (t0 + 8909);
    t12 = 1;
    if (3U == 3U)
        goto LAB16;

LAB17:    t12 = 0;

LAB18:    if (t12 == 1)
        goto LAB13;

LAB14:    t11 = (unsigned char)0;

LAB15:    if (t11 != 0)
        goto LAB10;

LAB12:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 8912);
    t4 = 1;
    if (3U == 3U)
        goto LAB32;

LAB33:    t4 = 0;

LAB34:    if (t4 == 1)
        goto LAB29;

LAB30:    t3 = (unsigned char)0;

LAB31:    if (t3 != 0)
        goto LAB27;

LAB28:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 8915);
    t4 = 1;
    if (3U == 3U)
        goto LAB48;

LAB49:    t4 = 0;

LAB50:    if (t4 == 1)
        goto LAB45;

LAB46:    t3 = (unsigned char)0;

LAB47:    if (t3 != 0)
        goto LAB43;

LAB44:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 8918);
    t4 = 1;
    if (3U == 3U)
        goto LAB64;

LAB65:    t4 = 0;

LAB66:    if (t4 == 1)
        goto LAB61;

LAB62:    t3 = (unsigned char)0;

LAB63:    if (t3 != 0)
        goto LAB59;

LAB60:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 8921);
    t4 = 1;
    if (3U == 3U)
        goto LAB80;

LAB81:    t4 = 0;

LAB82:    if (t4 == 1)
        goto LAB77;

LAB78:    t3 = (unsigned char)0;

LAB79:    if (t3 != 0)
        goto LAB75;

LAB76:
LAB11:    xsi_set_current_line(103, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t17 = *((int *)t2);
    t21 = (t17 + 1);
    t1 = (t0 + 5480);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t21;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB7:    t2 = (t0 + 2312U);
    t5 = *((char **)t2);
    t9 = *((unsigned char *)t5);
    t10 = (t9 == (unsigned char)2);
    t3 = t10;
    goto LAB9;

LAB10:    xsi_set_current_line(72, ng0);
    t15 = (t0 + 2952U);
    t19 = *((char **)t15);
    t15 = (t0 + 2472U);
    t20 = *((char **)t15);
    t21 = *((int *)t20);
    t22 = (8 * t21);
    t23 = (47 - t22);
    t24 = (47 - t23);
    t15 = (t0 + 2472U);
    t25 = *((char **)t15);
    t26 = *((int *)t25);
    t27 = (8 * t26);
    t28 = (40 - t27);
    xsi_vhdl_check_range_of_slice(47, 0, -1, t23, t28, -1);
    t29 = (t24 * 1U);
    t30 = (0 + t29);
    t15 = (t19 + t30);
    t31 = (t0 + 2472U);
    t32 = *((char **)t31);
    t33 = *((int *)t32);
    t34 = (8 * t33);
    t35 = (47 - t34);
    t31 = (t0 + 2472U);
    t36 = *((char **)t31);
    t37 = *((int *)t36);
    t38 = (8 * t37);
    t39 = (40 - t38);
    t40 = (t39 - t35);
    t41 = (t40 * -1);
    t41 = (t41 + 1);
    t42 = (1U * t41);
    t43 = (8U != t42);
    if (t43 == 1)
        goto LAB22;

LAB23:    t31 = (t0 + 5608);
    t44 = (t31 + 56U);
    t45 = *((char **)t44);
    t46 = (t45 + 56U);
    t47 = *((char **)t46);
    memcpy(t47, t15, 8U);
    xsi_driver_first_trans_fast(t31);
    xsi_set_current_line(73, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t17 = *((int *)t2);
    t3 = (t17 == 5);
    if (t3 != 0)
        goto LAB24;

LAB26:
LAB25:    goto LAB11;

LAB13:    t15 = (t0 + 2472U);
    t16 = *((char **)t15);
    t17 = *((int *)t16);
    t18 = (t17 < 6);
    t11 = t18;
    goto LAB15;

LAB16:    t13 = 0;

LAB19:    if (t13 < 3U)
        goto LAB20;
    else
        goto LAB18;

LAB20:    t8 = (t6 + t13);
    t14 = (t2 + t13);
    if (*((unsigned char *)t8) != *((unsigned char *)t14))
        goto LAB17;

LAB21:    t13 = (t13 + 1);
    goto LAB19;

LAB22:    xsi_size_not_matching(8U, t42, 0);
    goto LAB23;

LAB24:    xsi_set_current_line(74, ng0);
    t1 = (t0 + 5544);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB25;

LAB27:    xsi_set_current_line(78, ng0);
    t8 = (t0 + 3112U);
    t15 = *((char **)t8);
    t8 = (t0 + 2472U);
    t16 = *((char **)t8);
    t21 = *((int *)t16);
    t22 = (8 * t21);
    t23 = (39 - t22);
    t24 = (39 - t23);
    t8 = (t0 + 2472U);
    t19 = *((char **)t8);
    t26 = *((int *)t19);
    t27 = (8 * t26);
    t28 = (32 - t27);
    xsi_vhdl_check_range_of_slice(39, 0, -1, t23, t28, -1);
    t29 = (t24 * 1U);
    t30 = (0 + t29);
    t8 = (t15 + t30);
    t20 = (t0 + 2472U);
    t25 = *((char **)t20);
    t33 = *((int *)t25);
    t34 = (8 * t33);
    t35 = (39 - t34);
    t20 = (t0 + 2472U);
    t31 = *((char **)t20);
    t37 = *((int *)t31);
    t38 = (8 * t37);
    t39 = (32 - t38);
    t40 = (t39 - t35);
    t41 = (t40 * -1);
    t41 = (t41 + 1);
    t42 = (1U * t41);
    t10 = (8U != t42);
    if (t10 == 1)
        goto LAB38;

LAB39:    t20 = (t0 + 5608);
    t32 = (t20 + 56U);
    t36 = *((char **)t32);
    t44 = (t36 + 56U);
    t45 = *((char **)t44);
    memcpy(t45, t8, 8U);
    xsi_driver_first_trans_fast(t20);
    xsi_set_current_line(79, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t17 = *((int *)t2);
    t3 = (t17 == 4);
    if (t3 != 0)
        goto LAB40;

LAB42:
LAB41:    goto LAB11;

LAB29:    t8 = (t0 + 2472U);
    t14 = *((char **)t8);
    t17 = *((int *)t14);
    t9 = (t17 < 5);
    t3 = t9;
    goto LAB31;

LAB32:    t13 = 0;

LAB35:    if (t13 < 3U)
        goto LAB36;
    else
        goto LAB34;

LAB36:    t6 = (t2 + t13);
    t7 = (t1 + t13);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB33;

LAB37:    t13 = (t13 + 1);
    goto LAB35;

LAB38:    xsi_size_not_matching(8U, t42, 0);
    goto LAB39;

LAB40:    xsi_set_current_line(80, ng0);
    t1 = (t0 + 5544);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB41;

LAB43:    xsi_set_current_line(84, ng0);
    t8 = (t0 + 3272U);
    t15 = *((char **)t8);
    t8 = (t0 + 2472U);
    t16 = *((char **)t8);
    t21 = *((int *)t16);
    t22 = (8 * t21);
    t23 = (15 - t22);
    t24 = (15 - t23);
    t8 = (t0 + 2472U);
    t19 = *((char **)t8);
    t26 = *((int *)t19);
    t27 = (8 * t26);
    t28 = (8 - t27);
    xsi_vhdl_check_range_of_slice(15, 0, -1, t23, t28, -1);
    t29 = (t24 * 1U);
    t30 = (0 + t29);
    t8 = (t15 + t30);
    t20 = (t0 + 2472U);
    t25 = *((char **)t20);
    t33 = *((int *)t25);
    t34 = (8 * t33);
    t35 = (15 - t34);
    t20 = (t0 + 2472U);
    t31 = *((char **)t20);
    t37 = *((int *)t31);
    t38 = (8 * t37);
    t39 = (8 - t38);
    t40 = (t39 - t35);
    t41 = (t40 * -1);
    t41 = (t41 + 1);
    t42 = (1U * t41);
    t10 = (8U != t42);
    if (t10 == 1)
        goto LAB54;

LAB55:    t20 = (t0 + 5608);
    t32 = (t20 + 56U);
    t36 = *((char **)t32);
    t44 = (t36 + 56U);
    t45 = *((char **)t44);
    memcpy(t45, t8, 8U);
    xsi_driver_first_trans_fast(t20);
    xsi_set_current_line(85, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t17 = *((int *)t2);
    t3 = (t17 == 1);
    if (t3 != 0)
        goto LAB56;

LAB58:
LAB57:    goto LAB11;

LAB45:    t8 = (t0 + 2472U);
    t14 = *((char **)t8);
    t17 = *((int *)t14);
    t9 = (t17 < 2);
    t3 = t9;
    goto LAB47;

LAB48:    t13 = 0;

LAB51:    if (t13 < 3U)
        goto LAB52;
    else
        goto LAB50;

LAB52:    t6 = (t2 + t13);
    t7 = (t1 + t13);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB49;

LAB53:    t13 = (t13 + 1);
    goto LAB51;

LAB54:    xsi_size_not_matching(8U, t42, 0);
    goto LAB55;

LAB56:    xsi_set_current_line(86, ng0);
    t1 = (t0 + 5544);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB57;

LAB59:    xsi_set_current_line(90, ng0);
    t8 = (t0 + 3432U);
    t15 = *((char **)t8);
    t8 = (t0 + 2472U);
    t16 = *((char **)t8);
    t21 = *((int *)t16);
    t22 = (8 * t21);
    t23 = (23 - t22);
    t24 = (23 - t23);
    t8 = (t0 + 2472U);
    t19 = *((char **)t8);
    t26 = *((int *)t19);
    t27 = (8 * t26);
    t28 = (16 - t27);
    xsi_vhdl_check_range_of_slice(23, 0, -1, t23, t28, -1);
    t29 = (t24 * 1U);
    t30 = (0 + t29);
    t8 = (t15 + t30);
    t20 = (t0 + 2472U);
    t25 = *((char **)t20);
    t33 = *((int *)t25);
    t34 = (8 * t33);
    t35 = (23 - t34);
    t20 = (t0 + 2472U);
    t31 = *((char **)t20);
    t37 = *((int *)t31);
    t38 = (8 * t37);
    t39 = (16 - t38);
    t40 = (t39 - t35);
    t41 = (t40 * -1);
    t41 = (t41 + 1);
    t42 = (1U * t41);
    t10 = (8U != t42);
    if (t10 == 1)
        goto LAB70;

LAB71:    t20 = (t0 + 5608);
    t32 = (t20 + 56U);
    t36 = *((char **)t32);
    t44 = (t36 + 56U);
    t45 = *((char **)t44);
    memcpy(t45, t8, 8U);
    xsi_driver_first_trans_fast(t20);
    xsi_set_current_line(91, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t17 = *((int *)t2);
    t3 = (t17 == 2);
    if (t3 != 0)
        goto LAB72;

LAB74:
LAB73:    goto LAB11;

LAB61:    t8 = (t0 + 2472U);
    t14 = *((char **)t8);
    t17 = *((int *)t14);
    t9 = (t17 < 3);
    t3 = t9;
    goto LAB63;

LAB64:    t13 = 0;

LAB67:    if (t13 < 3U)
        goto LAB68;
    else
        goto LAB66;

LAB68:    t6 = (t2 + t13);
    t7 = (t1 + t13);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB65;

LAB69:    t13 = (t13 + 1);
    goto LAB67;

LAB70:    xsi_size_not_matching(8U, t42, 0);
    goto LAB71;

LAB72:    xsi_set_current_line(92, ng0);
    t1 = (t0 + 5544);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB73;

LAB75:    xsi_set_current_line(96, ng0);
    t8 = (t0 + 3592U);
    t15 = *((char **)t8);
    t8 = (t0 + 2472U);
    t16 = *((char **)t8);
    t21 = *((int *)t16);
    t22 = (8 * t21);
    t23 = (31 - t22);
    t24 = (31 - t23);
    t8 = (t0 + 2472U);
    t19 = *((char **)t8);
    t26 = *((int *)t19);
    t27 = (8 * t26);
    t28 = (24 - t27);
    xsi_vhdl_check_range_of_slice(31, 0, -1, t23, t28, -1);
    t29 = (t24 * 1U);
    t30 = (0 + t29);
    t8 = (t15 + t30);
    t20 = (t0 + 2472U);
    t25 = *((char **)t20);
    t33 = *((int *)t25);
    t34 = (8 * t33);
    t35 = (31 - t34);
    t20 = (t0 + 2472U);
    t31 = *((char **)t20);
    t37 = *((int *)t31);
    t38 = (8 * t37);
    t39 = (24 - t38);
    t40 = (t39 - t35);
    t41 = (t40 * -1);
    t41 = (t41 + 1);
    t42 = (1U * t41);
    t10 = (8U != t42);
    if (t10 == 1)
        goto LAB86;

LAB87:    t20 = (t0 + 5608);
    t32 = (t20 + 56U);
    t36 = *((char **)t32);
    t44 = (t36 + 56U);
    t45 = *((char **)t44);
    memcpy(t45, t8, 8U);
    xsi_driver_first_trans_fast(t20);
    xsi_set_current_line(97, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t17 = *((int *)t2);
    t3 = (t17 == 3);
    if (t3 != 0)
        goto LAB88;

LAB90:
LAB89:    goto LAB11;

LAB77:    t8 = (t0 + 2472U);
    t14 = *((char **)t8);
    t17 = *((int *)t14);
    t9 = (t17 < 4);
    t3 = t9;
    goto LAB79;

LAB80:    t13 = 0;

LAB83:    if (t13 < 3U)
        goto LAB84;
    else
        goto LAB82;

LAB84:    t6 = (t2 + t13);
    t7 = (t1 + t13);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB81;

LAB85:    t13 = (t13 + 1);
    goto LAB83;

LAB86:    xsi_size_not_matching(8U, t42, 0);
    goto LAB87;

LAB88:    xsi_set_current_line(98, ng0);
    t1 = (t0 + 5544);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB89;

}


extern void work_a_3624428029_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3624428029_3212880686_p_0,(void *)work_a_3624428029_3212880686_p_1};
	xsi_register_didat("work_a_3624428029_3212880686", "isim/preLCD_tb_isim_beh.exe.sim/work/a_3624428029_3212880686.didat");
	xsi_register_executes(pe);
}
