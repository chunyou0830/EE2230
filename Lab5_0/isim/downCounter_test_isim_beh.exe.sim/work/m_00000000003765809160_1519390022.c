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
static const char *ng0 = "D:/Programming/EE2230/Lab5_0/display_decoder.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {14U, 0U};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {13U, 0U};



static void Always_44_0(char *t0)
{
    char t7[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 3488U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 3808);
    *((int *)t2) = 1;
    t3 = (t0 + 3520);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(45, ng0);
    t4 = (t0 + 1688U);
    t5 = *((char **)t4);

LAB5:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 1, t4, 1);
    if (t6 == 1)
        goto LAB6;

LAB7:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 1, t2, 1);
    if (t6 == 1)
        goto LAB8;

LAB9:
LAB11:
LAB10:    xsi_set_current_line(48, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2568);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 19);

LAB12:    goto LAB2;

LAB6:    xsi_set_current_line(46, ng0);
    t8 = (t0 + 1368U);
    t9 = *((char **)t8);
    t8 = ((char*)((ng2)));
    xsi_vlogtype_concat(t7, 19, 19, 2U, t8, 4, t9, 15);
    t10 = (t0 + 2568);
    xsi_vlogvar_assign_value(t10, t7, 0, 0, 19);
    goto LAB12;

LAB8:    xsi_set_current_line(47, ng0);
    t3 = (t0 + 1528U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng4)));
    xsi_vlogtype_concat(t7, 19, 19, 2U, t3, 4, t4, 15);
    t8 = (t0 + 2568);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 19);
    goto LAB12;

}


extern void work_m_00000000003765809160_1519390022_init()
{
	static char *pe[] = {(void *)Always_44_0};
	xsi_register_didat("work_m_00000000003765809160_1519390022", "isim/downCounter_test_isim_beh.exe.sim/work/m_00000000003765809160_1519390022.didat");
	xsi_register_executes(pe);
}
