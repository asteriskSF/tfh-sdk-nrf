# SPDX-License-Identifier: Apache-2.0

zephyr_get(ARCMWDT_TOOLCHAIN_PATH)

if(NOT DEFINED ARCMWDT_TOOLCHAIN_PATH AND DEFINED ENV{METAWARE_ROOT})
  message(WARNING "ARCMWDT_TOOLCHAIN_PATH is not set, use default toolchain from METAWARE_ROOT")
  set(METAWARE_ROOT $ENV{METAWARE_ROOT})
  if(NOT EXISTS ${METAWARE_ROOT})
    message(FATAL_ERROR "Nothing found at METAWARE_ROOT: '${METAWARE_ROOT}'")
  endif()
  cmake_path(GET METAWARE_ROOT PARENT_PATH ARCMWDT_TOOLCHAIN_PATH)
endif()

assert(ARCMWDT_TOOLCHAIN_PATH "ARCMWDT_TOOLCHAIN_PATH is not set")

if(NOT EXISTS ${ARCMWDT_TOOLCHAIN_PATH})
  message(FATAL_ERROR "Nothing found at ARCMWDT_TOOLCHAIN_PATH: '${ARCMWDT_TOOLCHAIN_PATH}'")
endif()

set(TOOLCHAIN_HOME ${ARCMWDT_TOOLCHAIN_PATH}/MetaWare)

set(COMPILER arcmwdt)
set(LINKER arcmwdt)
set(BINTOOLS arcmwdt)

set(SYSROOT_TARGET arc)

set(CROSS_COMPILE ${TOOLCHAIN_HOME}/arc/bin/)
set(SYSROOT_DIR ${TOOLCHAIN_HOME}/${SYSROOT_TARGET})

set(TOOLCHAIN_HAS_NEWLIB OFF CACHE BOOL "True if toolchain supports newlib")