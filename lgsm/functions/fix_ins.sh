#!/bin/bash
# LGSM fix_ins.sh function
# Author: Daniel Gibbs
# Website: https://gameservermanagers.com
# Description: Resolves various issues with Insurgency.

local modulename="Fix"
local function_selfname="$(basename $(readlink -f "${BASH_SOURCE[0]}"))"

# Fixes: ./srcds_linux: error while loading shared libraries: libtier0.so: cannot open shared object file: No such file or directory.

export LD_LIBRARY_PATH=${filesdir}:${filesdir}/bin:${LD_LIBRARY_PATH}

# Fixes: issue #529 - gamemode not passed to debug or start.

if [ "${function_selfname}" == "command_debug.sh" ]; then
	defaultmap="\"${defaultmap}\""
else
	defaultmap="\\\"${defaultmap}\\\""
fi
