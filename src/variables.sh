#==============================================================================
# __      __        _       _     _
# \ \    / /       (_)     | |   | |
#  \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___
#   \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
#    \  / (_| | |  | | (_| | |_) | |  __/\__ \
#     \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/
#
#==============================================================================

# As this file contains variables with default values without actually using
# them, we are disabling shellcheck variable unused warnings (SC2034) for the
# whole file.
# shellcheck disable=SC2034

#==============================================================================
# PRETTY COLORING
#==============================================================================

# Checking the availibility and usability of tput. If it is available and
# usable we can set the global coloring variables with it.
if command -v tput >/dev/null && tput init >/dev/null 2>&1
then
  RED="$(tput setaf 1)"
  GREEN="$(tput setaf 2)"
  RESET="$(tput sgr0)"
  BOLD="$(tput bold)"
  DIM="$(tput dim)"
else
  RED=""
  GREEN=""
  RESET=""
  BOLD=""
  DIM=""
fi

#==============================================================================
# GLOBAL CONTEXT VARIABLES
#==============================================================================

# Global execution related variables that is used to communicate the currently
# executed test file and test names to the test case running in a subshell.
# They are used in the error reporting section.

DM_TEST__FILE_UNDER_EXECUTION=""
DM_TEST__TEST_UNDER_EXECUTION=""

DM_TEST__TEST_RESULT__SUCCESS="0"
DM_TEST__TEST_RESULT__FAILURE="1"

#==============================================================================
# TEST STATISTICS
#==============================================================================

DM_TEST__STATISTICS__COUNT="0"
DM_TEST__STATISTICS__FAILED="0"
