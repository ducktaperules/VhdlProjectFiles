/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'cpu' in SOPC Builder design 'DE0_SOPC'
 * SOPC Builder design path: C:/Users/Queron/Documents/GitHub/VhdlProjectFiles/Altera_Systems_Labs/EDM_Standard/DE0_SOPC.sopcinfo
 *
 * Generated: Tue Mar 04 12:37:38 GMT 2014
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x2810820
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x0
#define ALT_CPU_CPU_IMPLEMENTATION "fast"
#define ALT_CPU_DATA_ADDR_WIDTH 0x1a
#define ALT_CPU_DCACHE_LINE_SIZE 32
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_DCACHE_SIZE 4096
#define ALT_CPU_EXCEPTION_ADDR 0x2808020
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 1
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 1
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_DIVISION_ERROR_EXCEPTION
#define ALT_CPU_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 32
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_ICACHE_SIZE 4096
#define ALT_CPU_INITDA_SUPPORTED
#define ALT_CPU_INST_ADDR_WIDTH 0x1a
#define ALT_CPU_NAME "cpu"
#define ALT_CPU_NUM_OF_SHADOW_REG_SETS 0
#define ALT_CPU_RESET_ADDR 0x2400000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x2810820
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x0
#define NIOS2_CPU_IMPLEMENTATION "fast"
#define NIOS2_DATA_ADDR_WIDTH 0x1a
#define NIOS2_DCACHE_LINE_SIZE 32
#define NIOS2_DCACHE_LINE_SIZE_LOG2 5
#define NIOS2_DCACHE_SIZE 4096
#define NIOS2_EXCEPTION_ADDR 0x2808020
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 1
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 1
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_DIVISION_ERROR_EXCEPTION
#define NIOS2_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_ICACHE_SIZE 4096
#define NIOS2_INITDA_SUPPORTED
#define NIOS2_INST_ADDR_WIDTH 0x1a
#define NIOS2_NUM_OF_SHADOW_REG_SETS 0
#define NIOS2_RESET_ADDR 0x2400000


/*
 * Custom instruction macros
 *
 */

#define ALT_CI_ALTERA_NIOS_CUSTOM_INSTR_FLOATING_POINT_INST(n,A,B) __builtin_custom_inii(ALT_CI_ALTERA_NIOS_CUSTOM_INSTR_FLOATING_POINT_INST_N+(n&ALT_CI_ALTERA_NIOS_CUSTOM_INSTR_FLOATING_POINT_INST_N_MASK),(A),(B))
#define ALT_CI_ALTERA_NIOS_CUSTOM_INSTR_FLOATING_POINT_INST_N 0xfc
#define ALT_CI_ALTERA_NIOS_CUSTOM_INSTR_FLOATING_POINT_INST_N_MASK ((1<<2)-1)


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_CFI_FLASH
#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_LCD_16207
#define __ALTERA_AVALON_NEW_SDRAM_CONTROLLER
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID
#define __ALTERA_AVALON_TIMER
#define __ALTERA_AVALON_UART
#define __ALTERA_NIOS2
#define __ALTERA_NIOS_CUSTOM_INSTR_FLOATING_POINT
#define __ALTPLL
#define __MY_PWM


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "CYCLONEIII"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart"
#define ALT_STDERR_BASE 0x2811010
#define ALT_STDERR_DEV jtag_uart
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart"
#define ALT_STDIN_BASE 0x2811010
#define ALT_STDIN_DEV jtag_uart
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart"
#define ALT_STDOUT_BASE 0x2811010
#define ALT_STDOUT_DEV jtag_uart
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "DE0_SOPC"


/*
 * altpll_0 configuration
 *
 */

#define ALTPLL_0_BASE 0x2811000
#define ALTPLL_0_IRQ -1
#define ALTPLL_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ALTPLL_0_NAME "/dev/altpll_0"
#define ALTPLL_0_SPAN 16
#define ALTPLL_0_TYPE "altpll"
#define ALT_MODULE_CLASS_altpll_0 altpll


/*
 * buttons configuration
 *
 */

#define ALT_MODULE_CLASS_buttons altera_avalon_pio
#define BUTTONS_BASE 0x100
#define BUTTONS_BIT_CLEARING_EDGE_REGISTER 0
#define BUTTONS_BIT_MODIFYING_OUTPUT_REGISTER 0
#define BUTTONS_CAPTURE 1
#define BUTTONS_DATA_WIDTH 3
#define BUTTONS_DO_TEST_BENCH_WIRING 0
#define BUTTONS_DRIVEN_SIM_VALUE 0x0
#define BUTTONS_EDGE_TYPE "ANY"
#define BUTTONS_FREQ 10000000u
#define BUTTONS_HAS_IN 1
#define BUTTONS_HAS_OUT 0
#define BUTTONS_HAS_TRI 0
#define BUTTONS_IRQ 3
#define BUTTONS_IRQ_INTERRUPT_CONTROLLER_ID 0
#define BUTTONS_IRQ_TYPE "EDGE"
#define BUTTONS_NAME "/dev/buttons"
#define BUTTONS_RESET_VALUE 0x0
#define BUTTONS_SPAN 16
#define BUTTONS_TYPE "altera_avalon_pio"


/*
 * cfi_flash configuration
 *
 */

#define ALT_MODULE_CLASS_cfi_flash altera_avalon_cfi_flash
#define CFI_FLASH_BASE 0x2400000
#define CFI_FLASH_HOLD_VALUE 50
#define CFI_FLASH_IRQ -1
#define CFI_FLASH_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CFI_FLASH_NAME "/dev/cfi_flash"
#define CFI_FLASH_SETUP_VALUE 50
#define CFI_FLASH_SIZE 4194304u
#define CFI_FLASH_SPAN 4194304
#define CFI_FLASH_TIMING_UNITS "ns"
#define CFI_FLASH_TYPE "altera_avalon_cfi_flash"
#define CFI_FLASH_WAIT_VALUE 100


/*
 * hal configuration
 *
 */

#define ALT_INCLUDE_INSTRUCTION_RELATED_EXCEPTION_API
#define ALT_MAX_FD 32
#define ALT_SYS_CLK TIMER
#define ALT_TIMESTAMP_CLK PROFILE_TIMER


/*
 * jtag_uart configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart altera_avalon_jtag_uart
#define JTAG_UART_BASE 0x2811010
#define JTAG_UART_IRQ 0
#define JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_NAME "/dev/jtag_uart"
#define JTAG_UART_READ_DEPTH 64
#define JTAG_UART_READ_THRESHOLD 8
#define JTAG_UART_SPAN 8
#define JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_WRITE_DEPTH 64
#define JTAG_UART_WRITE_THRESHOLD 8


/*
 * key_out configuration
 *
 */

#define ALT_MODULE_CLASS_key_out altera_avalon_pio
#define KEY_OUT_BASE 0x180
#define KEY_OUT_BIT_CLEARING_EDGE_REGISTER 0
#define KEY_OUT_BIT_MODIFYING_OUTPUT_REGISTER 0
#define KEY_OUT_CAPTURE 0
#define KEY_OUT_DATA_WIDTH 4
#define KEY_OUT_DO_TEST_BENCH_WIRING 0
#define KEY_OUT_DRIVEN_SIM_VALUE 0x0
#define KEY_OUT_EDGE_TYPE "NONE"
#define KEY_OUT_FREQ 10000000u
#define KEY_OUT_HAS_IN 0
#define KEY_OUT_HAS_OUT 1
#define KEY_OUT_HAS_TRI 0
#define KEY_OUT_IRQ -1
#define KEY_OUT_IRQ_INTERRUPT_CONTROLLER_ID -1
#define KEY_OUT_IRQ_TYPE "NONE"
#define KEY_OUT_NAME "/dev/key_out"
#define KEY_OUT_RESET_VALUE 0x0
#define KEY_OUT_SPAN 16
#define KEY_OUT_TYPE "altera_avalon_pio"


/*
 * lcd configuration
 *
 */

#define ALT_MODULE_CLASS_lcd altera_avalon_lcd_16207
#define LCD_BASE 0x130
#define LCD_IRQ -1
#define LCD_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LCD_NAME "/dev/lcd"
#define LCD_SPAN 16
#define LCD_TYPE "altera_avalon_lcd_16207"


/*
 * lcd_light configuration
 *
 */

#define ALT_MODULE_CLASS_lcd_light altera_avalon_pio
#define LCD_LIGHT_BASE 0x160
#define LCD_LIGHT_BIT_CLEARING_EDGE_REGISTER 0
#define LCD_LIGHT_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LCD_LIGHT_CAPTURE 0
#define LCD_LIGHT_DATA_WIDTH 1
#define LCD_LIGHT_DO_TEST_BENCH_WIRING 0
#define LCD_LIGHT_DRIVEN_SIM_VALUE 0x0
#define LCD_LIGHT_EDGE_TYPE "NONE"
#define LCD_LIGHT_FREQ 10000000u
#define LCD_LIGHT_HAS_IN 0
#define LCD_LIGHT_HAS_OUT 1
#define LCD_LIGHT_HAS_TRI 0
#define LCD_LIGHT_IRQ -1
#define LCD_LIGHT_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LCD_LIGHT_IRQ_TYPE "NONE"
#define LCD_LIGHT_NAME "/dev/lcd_light"
#define LCD_LIGHT_RESET_VALUE 0x0
#define LCD_LIGHT_SPAN 16
#define LCD_LIGHT_TYPE "altera_avalon_pio"


/*
 * leds configuration
 *
 */

#define ALT_MODULE_CLASS_leds altera_avalon_pio
#define LEDS_BASE 0xe0
#define LEDS_BIT_CLEARING_EDGE_REGISTER 0
#define LEDS_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LEDS_CAPTURE 0
#define LEDS_DATA_WIDTH 10
#define LEDS_DO_TEST_BENCH_WIRING 0
#define LEDS_DRIVEN_SIM_VALUE 0x0
#define LEDS_EDGE_TYPE "NONE"
#define LEDS_FREQ 10000000u
#define LEDS_HAS_IN 0
#define LEDS_HAS_OUT 1
#define LEDS_HAS_TRI 0
#define LEDS_IRQ -1
#define LEDS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LEDS_IRQ_TYPE "NONE"
#define LEDS_NAME "/dev/leds"
#define LEDS_RESET_VALUE 0x5
#define LEDS_SPAN 16
#define LEDS_TYPE "altera_avalon_pio"


/*
 * my_pwm_0 configuration
 *
 */

#define ALT_MODULE_CLASS_my_pwm_0 my_pwm
#define MY_PWM_0_BASE 0x190
#define MY_PWM_0_IRQ -1
#define MY_PWM_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define MY_PWM_0_NAME "/dev/my_pwm_0"
#define MY_PWM_0_SPAN 16
#define MY_PWM_0_TYPE "my_pwm"


/*
 * my_pwm_1 configuration
 *
 */

#define ALT_MODULE_CLASS_my_pwm_1 my_pwm
#define MY_PWM_1_BASE 0x1a0
#define MY_PWM_1_IRQ -1
#define MY_PWM_1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define MY_PWM_1_NAME "/dev/my_pwm_1"
#define MY_PWM_1_SPAN 16
#define MY_PWM_1_TYPE "my_pwm"


/*
 * my_pwm_2 configuration
 *
 */

#define ALT_MODULE_CLASS_my_pwm_2 my_pwm
#define MY_PWM_2_BASE 0x1b0
#define MY_PWM_2_IRQ -1
#define MY_PWM_2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define MY_PWM_2_NAME "/dev/my_pwm_2"
#define MY_PWM_2_SPAN 16
#define MY_PWM_2_TYPE "my_pwm"


/*
 * my_pwm_3 configuration
 *
 */

#define ALT_MODULE_CLASS_my_pwm_3 my_pwm
#define MY_PWM_3_BASE 0x1c0
#define MY_PWM_3_IRQ -1
#define MY_PWM_3_IRQ_INTERRUPT_CONTROLLER_ID -1
#define MY_PWM_3_NAME "/dev/my_pwm_3"
#define MY_PWM_3_SPAN 16
#define MY_PWM_3_TYPE "my_pwm"


/*
 * my_pwm_4 configuration
 *
 */

#define ALT_MODULE_CLASS_my_pwm_4 my_pwm
#define MY_PWM_4_BASE 0x1d0
#define MY_PWM_4_IRQ -1
#define MY_PWM_4_IRQ_INTERRUPT_CONTROLLER_ID -1
#define MY_PWM_4_NAME "/dev/my_pwm_4"
#define MY_PWM_4_SPAN 16
#define MY_PWM_4_TYPE "my_pwm"


/*
 * my_pwm_5 configuration
 *
 */

#define ALT_MODULE_CLASS_my_pwm_5 my_pwm
#define MY_PWM_5_BASE 0x1e0
#define MY_PWM_5_IRQ -1
#define MY_PWM_5_IRQ_INTERRUPT_CONTROLLER_ID -1
#define MY_PWM_5_NAME "/dev/my_pwm_5"
#define MY_PWM_5_SPAN 16
#define MY_PWM_5_TYPE "my_pwm"


/*
 * onchip_mem configuration
 *
 */

#define ALT_MODULE_CLASS_onchip_mem altera_avalon_onchip_memory2
#define ONCHIP_MEM_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ONCHIP_MEM_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_MEM_BASE 0x2808000
#define ONCHIP_MEM_CONTENTS_INFO ""
#define ONCHIP_MEM_DUAL_PORT 0
#define ONCHIP_MEM_GUI_RAM_BLOCK_TYPE "Automatic"
#define ONCHIP_MEM_INIT_CONTENTS_FILE "onchip_mem"
#define ONCHIP_MEM_INIT_MEM_CONTENT 1
#define ONCHIP_MEM_INSTANCE_ID "NONE"
#define ONCHIP_MEM_IRQ -1
#define ONCHIP_MEM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ONCHIP_MEM_NAME "/dev/onchip_mem"
#define ONCHIP_MEM_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_MEM_RAM_BLOCK_TYPE "Auto"
#define ONCHIP_MEM_READ_DURING_WRITE_MODE "DONT_CARE"
#define ONCHIP_MEM_SINGLE_CLOCK_OP 0
#define ONCHIP_MEM_SIZE_MULTIPLE 1
#define ONCHIP_MEM_SIZE_VALUE 30720u
#define ONCHIP_MEM_SPAN 30720
#define ONCHIP_MEM_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_MEM_WRITABLE 1


/*
 * pio_0 configuration
 *
 */

#define ALT_MODULE_CLASS_pio_0 altera_avalon_pio
#define PIO_0_BASE 0xc0
#define PIO_0_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_0_BIT_MODIFYING_OUTPUT_REGISTER 1
#define PIO_0_CAPTURE 0
#define PIO_0_DATA_WIDTH 8
#define PIO_0_DO_TEST_BENCH_WIRING 0
#define PIO_0_DRIVEN_SIM_VALUE 0x0
#define PIO_0_EDGE_TYPE "NONE"
#define PIO_0_FREQ 10000000u
#define PIO_0_HAS_IN 0
#define PIO_0_HAS_OUT 0
#define PIO_0_HAS_TRI 1
#define PIO_0_IRQ -1
#define PIO_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_0_IRQ_TYPE "NONE"
#define PIO_0_NAME "/dev/pio_0"
#define PIO_0_RESET_VALUE 0x0
#define PIO_0_SPAN 32
#define PIO_0_TYPE "altera_avalon_pio"


/*
 * port_a configuration
 *
 */

#define ALT_MODULE_CLASS_port_a altera_avalon_pio
#define PORT_A_BASE 0xa0
#define PORT_A_BIT_CLEARING_EDGE_REGISTER 1
#define PORT_A_BIT_MODIFYING_OUTPUT_REGISTER 1
#define PORT_A_CAPTURE 1
#define PORT_A_DATA_WIDTH 4
#define PORT_A_DO_TEST_BENCH_WIRING 0
#define PORT_A_DRIVEN_SIM_VALUE 0x0
#define PORT_A_EDGE_TYPE "RISING"
#define PORT_A_FREQ 10000000u
#define PORT_A_HAS_IN 0
#define PORT_A_HAS_OUT 0
#define PORT_A_HAS_TRI 1
#define PORT_A_IRQ 7
#define PORT_A_IRQ_INTERRUPT_CONTROLLER_ID 0
#define PORT_A_IRQ_TYPE "EDGE"
#define PORT_A_NAME "/dev/port_a"
#define PORT_A_RESET_VALUE 0x0
#define PORT_A_SPAN 32
#define PORT_A_TYPE "altera_avalon_pio"


/*
 * profile_timer configuration
 *
 */

#define ALT_MODULE_CLASS_profile_timer altera_avalon_timer
#define PROFILE_TIMER_ALWAYS_RUN 0
#define PROFILE_TIMER_BASE 0x0
#define PROFILE_TIMER_COUNTER_SIZE 64
#define PROFILE_TIMER_FIXED_PERIOD 0
#define PROFILE_TIMER_FREQ 10000000u
#define PROFILE_TIMER_IRQ 5
#define PROFILE_TIMER_IRQ_INTERRUPT_CONTROLLER_ID 0
#define PROFILE_TIMER_LOAD_VALUE 499ull
#define PROFILE_TIMER_MULT 1.0E-6
#define PROFILE_TIMER_NAME "/dev/profile_timer"
#define PROFILE_TIMER_PERIOD 50
#define PROFILE_TIMER_PERIOD_UNITS "us"
#define PROFILE_TIMER_RESET_OUTPUT 0
#define PROFILE_TIMER_SNAPSHOT 1
#define PROFILE_TIMER_SPAN 64
#define PROFILE_TIMER_TICKS_PER_SEC 20000u
#define PROFILE_TIMER_TIMEOUT_PULSE_OUTPUT 0
#define PROFILE_TIMER_TYPE "altera_avalon_timer"


/*
 * sd_clk configuration
 *
 */

#define ALT_MODULE_CLASS_sd_clk altera_avalon_pio
#define SD_CLK_BASE 0x140
#define SD_CLK_BIT_CLEARING_EDGE_REGISTER 0
#define SD_CLK_BIT_MODIFYING_OUTPUT_REGISTER 0
#define SD_CLK_CAPTURE 0
#define SD_CLK_DATA_WIDTH 1
#define SD_CLK_DO_TEST_BENCH_WIRING 0
#define SD_CLK_DRIVEN_SIM_VALUE 0x0
#define SD_CLK_EDGE_TYPE "NONE"
#define SD_CLK_FREQ 10000000u
#define SD_CLK_HAS_IN 0
#define SD_CLK_HAS_OUT 1
#define SD_CLK_HAS_TRI 0
#define SD_CLK_IRQ -1
#define SD_CLK_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SD_CLK_IRQ_TYPE "NONE"
#define SD_CLK_NAME "/dev/sd_clk"
#define SD_CLK_RESET_VALUE 0x0
#define SD_CLK_SPAN 16
#define SD_CLK_TYPE "altera_avalon_pio"


/*
 * sd_cmd configuration
 *
 */

#define ALT_MODULE_CLASS_sd_cmd altera_avalon_pio
#define SD_CMD_BASE 0x120
#define SD_CMD_BIT_CLEARING_EDGE_REGISTER 0
#define SD_CMD_BIT_MODIFYING_OUTPUT_REGISTER 0
#define SD_CMD_CAPTURE 0
#define SD_CMD_DATA_WIDTH 1
#define SD_CMD_DO_TEST_BENCH_WIRING 0
#define SD_CMD_DRIVEN_SIM_VALUE 0x0
#define SD_CMD_EDGE_TYPE "NONE"
#define SD_CMD_FREQ 10000000u
#define SD_CMD_HAS_IN 0
#define SD_CMD_HAS_OUT 0
#define SD_CMD_HAS_TRI 1
#define SD_CMD_IRQ -1
#define SD_CMD_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SD_CMD_IRQ_TYPE "NONE"
#define SD_CMD_NAME "/dev/sd_cmd"
#define SD_CMD_RESET_VALUE 0x0
#define SD_CMD_SPAN 16
#define SD_CMD_TYPE "altera_avalon_pio"


/*
 * sd_dat configuration
 *
 */

#define ALT_MODULE_CLASS_sd_dat altera_avalon_pio
#define SD_DAT_BASE 0x150
#define SD_DAT_BIT_CLEARING_EDGE_REGISTER 0
#define SD_DAT_BIT_MODIFYING_OUTPUT_REGISTER 0
#define SD_DAT_CAPTURE 0
#define SD_DAT_DATA_WIDTH 1
#define SD_DAT_DO_TEST_BENCH_WIRING 0
#define SD_DAT_DRIVEN_SIM_VALUE 0x0
#define SD_DAT_EDGE_TYPE "NONE"
#define SD_DAT_FREQ 10000000u
#define SD_DAT_HAS_IN 0
#define SD_DAT_HAS_OUT 0
#define SD_DAT_HAS_TRI 1
#define SD_DAT_IRQ -1
#define SD_DAT_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SD_DAT_IRQ_TYPE "NONE"
#define SD_DAT_NAME "/dev/sd_dat"
#define SD_DAT_RESET_VALUE 0x0
#define SD_DAT_SPAN 16
#define SD_DAT_TYPE "altera_avalon_pio"


/*
 * sd_wp_n configuration
 *
 */

#define ALT_MODULE_CLASS_sd_wp_n altera_avalon_pio
#define SD_WP_N_BASE 0x110
#define SD_WP_N_BIT_CLEARING_EDGE_REGISTER 0
#define SD_WP_N_BIT_MODIFYING_OUTPUT_REGISTER 0
#define SD_WP_N_CAPTURE 0
#define SD_WP_N_DATA_WIDTH 1
#define SD_WP_N_DO_TEST_BENCH_WIRING 0
#define SD_WP_N_DRIVEN_SIM_VALUE 0x0
#define SD_WP_N_EDGE_TYPE "NONE"
#define SD_WP_N_FREQ 10000000u
#define SD_WP_N_HAS_IN 1
#define SD_WP_N_HAS_OUT 0
#define SD_WP_N_HAS_TRI 0
#define SD_WP_N_IRQ -1
#define SD_WP_N_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SD_WP_N_IRQ_TYPE "NONE"
#define SD_WP_N_NAME "/dev/sd_wp_n"
#define SD_WP_N_RESET_VALUE 0x0
#define SD_WP_N_SPAN 16
#define SD_WP_N_TYPE "altera_avalon_pio"


/*
 * sdram configuration
 *
 */

#define ALT_MODULE_CLASS_sdram altera_avalon_new_sdram_controller
#define SDRAM_BASE 0x1800000
#define SDRAM_CAS_LATENCY 3
#define SDRAM_CONTENTS_INFO ""
#define SDRAM_INIT_NOP_DELAY 0.0
#define SDRAM_INIT_REFRESH_COMMANDS 2
#define SDRAM_IRQ -1
#define SDRAM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SDRAM_IS_INITIALIZED 1
#define SDRAM_NAME "/dev/sdram"
#define SDRAM_POWERUP_DELAY 100.0
#define SDRAM_REFRESH_PERIOD 15.625
#define SDRAM_REGISTER_DATA_IN 1
#define SDRAM_SDRAM_ADDR_WIDTH 0x16
#define SDRAM_SDRAM_BANK_WIDTH 2
#define SDRAM_SDRAM_COL_WIDTH 8
#define SDRAM_SDRAM_DATA_WIDTH 16
#define SDRAM_SDRAM_NUM_BANKS 4
#define SDRAM_SDRAM_NUM_CHIPSELECTS 1
#define SDRAM_SDRAM_ROW_WIDTH 12
#define SDRAM_SHARED_DATA 0
#define SDRAM_SIM_MODEL_BASE 1
#define SDRAM_SPAN 8388608
#define SDRAM_STARVATION_INDICATOR 0
#define SDRAM_TRISTATE_BRIDGE_SLAVE ""
#define SDRAM_TYPE "altera_avalon_new_sdram_controller"
#define SDRAM_T_AC 5.5
#define SDRAM_T_MRD 3
#define SDRAM_T_RCD 20.0
#define SDRAM_T_RFC 70.0
#define SDRAM_T_RP 20.0
#define SDRAM_T_WR 14.0


/*
 * seg7 configuration
 *
 */

#define ALT_MODULE_CLASS_seg7 altera_avalon_pio
#define SEG7_BASE 0x170
#define SEG7_BIT_CLEARING_EDGE_REGISTER 0
#define SEG7_BIT_MODIFYING_OUTPUT_REGISTER 0
#define SEG7_CAPTURE 0
#define SEG7_DATA_WIDTH 32
#define SEG7_DO_TEST_BENCH_WIRING 0
#define SEG7_DRIVEN_SIM_VALUE 0x0
#define SEG7_EDGE_TYPE "NONE"
#define SEG7_FREQ 10000000u
#define SEG7_HAS_IN 0
#define SEG7_HAS_OUT 1
#define SEG7_HAS_TRI 0
#define SEG7_IRQ -1
#define SEG7_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SEG7_IRQ_TYPE "NONE"
#define SEG7_NAME "/dev/seg7"
#define SEG7_RESET_VALUE -923156334
#define SEG7_SPAN 16
#define SEG7_TYPE "altera_avalon_pio"


/*
 * switches configuration
 *
 */

#define ALT_MODULE_CLASS_switches altera_avalon_pio
#define SWITCHES_BASE 0xf0
#define SWITCHES_BIT_CLEARING_EDGE_REGISTER 0
#define SWITCHES_BIT_MODIFYING_OUTPUT_REGISTER 0
#define SWITCHES_CAPTURE 1
#define SWITCHES_DATA_WIDTH 10
#define SWITCHES_DO_TEST_BENCH_WIRING 0
#define SWITCHES_DRIVEN_SIM_VALUE 0x0
#define SWITCHES_EDGE_TYPE "ANY"
#define SWITCHES_FREQ 10000000u
#define SWITCHES_HAS_IN 1
#define SWITCHES_HAS_OUT 0
#define SWITCHES_HAS_TRI 0
#define SWITCHES_IRQ 4
#define SWITCHES_IRQ_INTERRUPT_CONTROLLER_ID 0
#define SWITCHES_IRQ_TYPE "EDGE"
#define SWITCHES_NAME "/dev/switches"
#define SWITCHES_RESET_VALUE 0x0
#define SWITCHES_SPAN 16
#define SWITCHES_TYPE "altera_avalon_pio"


/*
 * sysid configuration
 *
 */

#define ALT_MODULE_CLASS_sysid altera_avalon_sysid
#define SYSID_BASE 0x200
#define SYSID_ID 0u
#define SYSID_IRQ -1
#define SYSID_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_NAME "/dev/sysid"
#define SYSID_SPAN 8
#define SYSID_TIMESTAMP 1392908957u
#define SYSID_TYPE "altera_avalon_sysid"


/*
 * timer configuration
 *
 */

#define ALT_MODULE_CLASS_timer altera_avalon_timer
#define TIMER_ALWAYS_RUN 0
#define TIMER_BASE 0x40
#define TIMER_COUNTER_SIZE 32
#define TIMER_FIXED_PERIOD 0
#define TIMER_FREQ 10000000u
#define TIMER_IRQ 2
#define TIMER_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_LOAD_VALUE 9999ull
#define TIMER_MULT 0.0010
#define TIMER_NAME "/dev/timer"
#define TIMER_PERIOD 1
#define TIMER_PERIOD_UNITS "ms"
#define TIMER_RESET_OUTPUT 0
#define TIMER_SNAPSHOT 1
#define TIMER_SPAN 32
#define TIMER_TICKS_PER_SEC 1000u
#define TIMER_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_TYPE "altera_avalon_timer"


/*
 * uart configuration
 *
 */

#define ALT_MODULE_CLASS_uart altera_avalon_uart
#define UART_BASE 0x60
#define UART_BAUD 115200
#define UART_DATA_BITS 8
#define UART_FIXED_BAUD 1
#define UART_FREQ 10000000u
#define UART_IRQ 1
#define UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define UART_NAME "/dev/uart"
#define UART_PARITY 'N'
#define UART_SIM_CHAR_STREAM ""
#define UART_SIM_TRUE_BAUD 0
#define UART_SPAN 32
#define UART_STOP_BITS 1
#define UART_SYNC_REG_DEPTH 2
#define UART_TYPE "altera_avalon_uart"
#define UART_USE_CTS_RTS 1
#define UART_USE_EOP_REGISTER 0


/*
 * ucosii configuration
 *
 */

#define OS_ARG_CHK_EN 1
#define OS_CPU_HOOKS_EN 1
#define OS_DEBUG_EN 1
#define OS_EVENT_NAME_SIZE 32
#define OS_FLAGS_NBITS 16
#define OS_FLAG_ACCEPT_EN 1
#define OS_FLAG_DEL_EN 1
#define OS_FLAG_EN 1
#define OS_FLAG_NAME_SIZE 32
#define OS_FLAG_QUERY_EN 1
#define OS_FLAG_WAIT_CLR_EN 1
#define OS_LOWEST_PRIO 20
#define OS_MAX_EVENTS 60
#define OS_MAX_FLAGS 20
#define OS_MAX_MEM_PART 60
#define OS_MAX_QS 20
#define OS_MAX_TASKS 10
#define OS_MBOX_ACCEPT_EN 1
#define OS_MBOX_DEL_EN 1
#define OS_MBOX_EN 1
#define OS_MBOX_POST_EN 1
#define OS_MBOX_POST_OPT_EN 1
#define OS_MBOX_QUERY_EN 1
#define OS_MEM_EN 1
#define OS_MEM_NAME_SIZE 32
#define OS_MEM_QUERY_EN 1
#define OS_MUTEX_ACCEPT_EN 1
#define OS_MUTEX_DEL_EN 1
#define OS_MUTEX_EN 1
#define OS_MUTEX_QUERY_EN 1
#define OS_Q_ACCEPT_EN 1
#define OS_Q_DEL_EN 1
#define OS_Q_EN 1
#define OS_Q_FLUSH_EN 1
#define OS_Q_POST_EN 1
#define OS_Q_POST_FRONT_EN 1
#define OS_Q_POST_OPT_EN 1
#define OS_Q_QUERY_EN 1
#define OS_SCHED_LOCK_EN 1
#define OS_SEM_ACCEPT_EN 1
#define OS_SEM_DEL_EN 1
#define OS_SEM_EN 1
#define OS_SEM_QUERY_EN 1
#define OS_SEM_SET_EN 1
#define OS_TASK_CHANGE_PRIO_EN 1
#define OS_TASK_CREATE_EN 1
#define OS_TASK_CREATE_EXT_EN 1
#define OS_TASK_DEL_EN 1
#define OS_TASK_IDLE_STK_SIZE 512
#define OS_TASK_NAME_SIZE 32
#define OS_TASK_PROFILE_EN 1
#define OS_TASK_QUERY_EN 1
#define OS_TASK_STAT_EN 1
#define OS_TASK_STAT_STK_CHK_EN 1
#define OS_TASK_STAT_STK_SIZE 512
#define OS_TASK_SUSPEND_EN 1
#define OS_TASK_SW_HOOK_EN 1
#define OS_TASK_TMR_PRIO 0
#define OS_TASK_TMR_STK_SIZE 512
#define OS_THREAD_SAFE_NEWLIB 1
#define OS_TICKS_PER_SEC TIMER_TICKS_PER_SEC
#define OS_TICK_STEP_EN 1
#define OS_TIME_DLY_HMSM_EN 1
#define OS_TIME_DLY_RESUME_EN 1
#define OS_TIME_GET_SET_EN 1
#define OS_TIME_TICK_HOOK_EN 1
#define OS_TMR_CFG_MAX 16
#define OS_TMR_CFG_NAME_SIZE 16
#define OS_TMR_CFG_TICKS_PER_SEC 10
#define OS_TMR_CFG_WHEEL_SIZE 2
#define OS_TMR_EN 0


/*
 * user_timer configuration
 *
 */

#define ALT_MODULE_CLASS_user_timer altera_avalon_timer
#define USER_TIMER_ALWAYS_RUN 0
#define USER_TIMER_BASE 0x80
#define USER_TIMER_COUNTER_SIZE 32
#define USER_TIMER_FIXED_PERIOD 0
#define USER_TIMER_FREQ 10000000u
#define USER_TIMER_IRQ 6
#define USER_TIMER_IRQ_INTERRUPT_CONTROLLER_ID 0
#define USER_TIMER_LOAD_VALUE 9999999ull
#define USER_TIMER_MULT 0.0010
#define USER_TIMER_NAME "/dev/user_timer"
#define USER_TIMER_PERIOD 1000
#define USER_TIMER_PERIOD_UNITS "ms"
#define USER_TIMER_RESET_OUTPUT 0
#define USER_TIMER_SNAPSHOT 1
#define USER_TIMER_SPAN 32
#define USER_TIMER_TICKS_PER_SEC 1u
#define USER_TIMER_TIMEOUT_PULSE_OUTPUT 0
#define USER_TIMER_TYPE "altera_avalon_timer"

#endif /* __SYSTEM_H_ */
