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
static const char *ng0 = "C:/Users/aula/Downloads/CompDig/CPU/CPURight/Exemplo.vhd";
extern char *WORK_P_1845655050;

char *work_p_1845655050_sub_1566118142_2716601171(char *, char *, int );
char *work_p_1845655050_sub_2254029111_2716601171(char *, char *, int );
char *work_p_1845655050_sub_2268750232_2716601171(char *, char *, char *);
char *work_p_1845655050_sub_3368421625_2716601171(char *, char *, int );
char *work_p_1845655050_sub_3944976969_2716601171(char *, char *, unsigned char );
char *work_p_1845655050_sub_3993076050_2716601171(char *, char *, char *);
char *work_p_1845655050_sub_519255793_2716601171(char *, char *, int , int );


static void work_a_0489772958_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(80, ng0);

LAB3:    t1 = (t0 + 3272U);
    t2 = *((char **)t1);
    t1 = (t0 + 2472U);
    t3 = *((char **)t1);
    t4 = *((int *)t3);
    t5 = (t4 - 0);
    t6 = (t5 * 1);
    xsi_vhdl_check_range_of_index(0, 60, 1, t4);
    t7 = (12U * t6);
    t8 = (0 + t7);
    t1 = (t2 + t8);
    t9 = (t0 + 8392);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 12U);
    xsi_driver_first_trans_fast(t9);

LAB2:    t14 = (t0 + 8264);
    *((int *)t14) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0489772958_3212880686_p_1(char *t0)
{
    char t1[16];
    char *t2;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    xsi_set_current_line(83, ng0);

LAB3:    t2 = (t0 + 14973);
    t4 = work_p_1845655050_sub_2268750232_2716601171(WORK_P_1845655050, t1, t2);
    t5 = (12U != 12U);
    if (t5 == 1)
        goto LAB5;

LAB6:    t6 = (t0 + 8456);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t4, 12U);
    xsi_driver_first_trans_delta(t6, 0U, 12U, 0LL);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(12U, 12U, 0);
    goto LAB6;

}

static void work_a_0489772958_3212880686_p_2(char *t0)
{
    char t1[16];
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(84, ng0);

LAB3:    t2 = work_p_1845655050_sub_519255793_2716601171(WORK_P_1845655050, t1, 1, 1);
    t3 = (12U != 12U);
    if (t3 == 1)
        goto LAB5;

LAB6:    t4 = (t0 + 8520);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 12U);
    xsi_driver_first_trans_delta(t4, 12U, 12U, 0LL);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(12U, 12U, 0);
    goto LAB6;

}

static void work_a_0489772958_3212880686_p_3(char *t0)
{
    char t1[16];
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(85, ng0);

LAB3:    t2 = work_p_1845655050_sub_3944976969_2716601171(WORK_P_1845655050, t1, (unsigned char)3);
    t3 = (12U != 12U);
    if (t3 == 1)
        goto LAB5;

LAB6:    t4 = (t0 + 8584);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 12U);
    xsi_driver_first_trans_delta(t4, 24U, 12U, 0LL);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(12U, 12U, 0);
    goto LAB6;

}

static void work_a_0489772958_3212880686_p_4(char *t0)
{
    char t1[16];
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(87, ng0);

LAB3:    t2 = work_p_1845655050_sub_2254029111_2716601171(WORK_P_1845655050, t1, 1);
    t3 = (12U != 12U);
    if (t3 == 1)
        goto LAB5;

LAB6:    t4 = (t0 + 8648);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 12U);
    xsi_driver_first_trans_delta(t4, 36U, 12U, 0LL);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(12U, 12U, 0);
    goto LAB6;

}

static void work_a_0489772958_3212880686_p_5(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    int t4;
    char *t5;
    int t6;
    char *t7;
    unsigned int t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(88, ng0);

LAB3:    t2 = (t0 + 2792U);
    t3 = *((char **)t2);
    t4 = *((int *)t3);
    t2 = (t0 + 2952U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = work_p_1845655050_sub_519255793_2716601171(WORK_P_1845655050, t1, t4, t6);
    t7 = (t1 + 12U);
    t8 = *((unsigned int *)t7);
    t8 = (t8 * 1U);
    t9 = (12U != t8);
    if (t9 == 1)
        goto LAB5;

LAB6:    t10 = (t0 + 8712);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t2, 12U);
    xsi_driver_first_trans_delta(t10, 48U, 12U, 0LL);

LAB2:    t15 = (t0 + 8280);
    *((int *)t15) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(12U, t8, 0);
    goto LAB6;

}

static void work_a_0489772958_3212880686_p_6(char *t0)
{
    char t5[16];
    char t14[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;

LAB0:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB7:    t15 = (t0 + 2632U);
    t16 = *((char **)t15);
    t15 = work_p_1845655050_sub_3993076050_2716601171(WORK_P_1845655050, t14, t16);
    t17 = (t14 + 12U);
    t18 = *((unsigned int *)t17);
    t18 = (t18 * 1U);
    t19 = (12U != t18);
    if (t19 == 1)
        goto LAB9;

LAB10:    t20 = (t0 + 8776);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t15, 12U);
    xsi_driver_first_trans_delta(t20, 60U, 12U, 0LL);

LAB2:    t25 = (t0 + 8296);
    *((int *)t25) = 1;

LAB1:    return;
LAB3:    t1 = work_p_1845655050_sub_3944976969_2716601171(WORK_P_1845655050, t5, (unsigned char)3);
    t6 = (t5 + 12U);
    t7 = *((unsigned int *)t6);
    t7 = (t7 * 1U);
    t8 = (12U != t7);
    if (t8 == 1)
        goto LAB5;

LAB6:    t9 = (t0 + 8776);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 12U);
    xsi_driver_first_trans_delta(t9, 60U, 12U, 0LL);
    goto LAB2;

LAB5:    xsi_size_not_matching(12U, t7, 0);
    goto LAB6;

LAB8:    goto LAB2;

LAB9:    xsi_size_not_matching(12U, t18, 0);
    goto LAB10;

}

static void work_a_0489772958_3212880686_p_7(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    unsigned int t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    xsi_set_current_line(90, ng0);

LAB3:    t2 = work_p_1845655050_sub_1566118142_2716601171(WORK_P_1845655050, t1, 1);
    t3 = (t1 + 12U);
    t4 = *((unsigned int *)t3);
    t4 = (t4 * 1U);
    t5 = (12U != t4);
    if (t5 == 1)
        goto LAB5;

LAB6:    t6 = (t0 + 8840);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 12U);
    xsi_driver_first_trans_delta(t6, 72U, 12U, 0LL);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(12U, t4, 0);
    goto LAB6;

}

static void work_a_0489772958_3212880686_p_8(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    unsigned int t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    xsi_set_current_line(92, ng0);

LAB3:    t2 = work_p_1845655050_sub_3368421625_2716601171(WORK_P_1845655050, t1, 1);
    t3 = (t1 + 12U);
    t4 = *((unsigned int *)t3);
    t4 = (t4 * 1U);
    t5 = (12U != t4);
    if (t5 == 1)
        goto LAB5;

LAB6:    t6 = (t0 + 8904);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 12U);
    xsi_driver_first_trans_delta(t6, 84U, 12U, 0LL);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(12U, t4, 0);
    goto LAB6;

}

static void work_a_0489772958_3212880686_p_9(char *t0)
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
    int t11;
    int t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(97, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1152U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    xsi_set_current_line(110, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t11 = *((int *)t2);
    t4 = (t11 == 6);
    if (t4 == 1)
        goto LAB16;

LAB17:    t3 = (unsigned char)0;

LAB18:    if (t3 != 0)
        goto LAB13;

LAB15:
LAB14:    t1 = (t0 + 8312);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(98, ng0);
    t1 = (t0 + 8968);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(99, ng0);
    t1 = (t0 + 9032);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = 1;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(101, ng0);
    t2 = (t0 + 2952U);
    t6 = *((char **)t2);
    t11 = *((int *)t6);
    t12 = (t11 + 1);
    t2 = (t0 + 8968);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t13 = (t8 + 56U);
    t14 = *((char **)t13);
    *((int *)t14) = t12;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(102, ng0);
    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t11 = *((int *)t2);
    t3 = (t11 == 16);
    if (t3 != 0)
        goto LAB10;

LAB12:
LAB11:    xsi_set_current_line(107, ng0);
    t1 = (t0 + 9096);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB7:    t2 = (t0 + 1192U);
    t5 = *((char **)t2);
    t9 = *((unsigned char *)t5);
    t10 = (t9 == (unsigned char)3);
    t3 = t10;
    goto LAB9;

LAB10:    xsi_set_current_line(103, ng0);
    t1 = (t0 + 9032);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = 2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(104, ng0);
    t1 = (t0 + 8968);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = 1;
    xsi_driver_first_trans_fast(t1);
    goto LAB11;

LAB13:    xsi_set_current_line(111, ng0);
    t1 = (t0 + 2152U);
    t6 = *((char **)t1);
    t1 = (t0 + 9160);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t13 = (t8 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t6, 8U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(112, ng0);
    t1 = (t0 + 9096);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB14;

LAB16:    t1 = (t0 + 3112U);
    t5 = *((char **)t1);
    t9 = *((unsigned char *)t5);
    t10 = (t9 == (unsigned char)3);
    t3 = t10;
    goto LAB18;

}


extern void work_a_0489772958_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0489772958_3212880686_p_0,(void *)work_a_0489772958_3212880686_p_1,(void *)work_a_0489772958_3212880686_p_2,(void *)work_a_0489772958_3212880686_p_3,(void *)work_a_0489772958_3212880686_p_4,(void *)work_a_0489772958_3212880686_p_5,(void *)work_a_0489772958_3212880686_p_6,(void *)work_a_0489772958_3212880686_p_7,(void *)work_a_0489772958_3212880686_p_8,(void *)work_a_0489772958_3212880686_p_9};
	xsi_register_didat("work_a_0489772958_3212880686", "isim/preLCD_tb_isim_beh.exe.sim/work/a_0489772958_3212880686.didat");
	xsi_register_executes(pe);
}
