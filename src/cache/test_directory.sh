#==============================================================================
#  _____         _     ____  _               _
# |_   _|__  ___| |_  |  _ \(_)_ __ ___  ___| |_ ___  _ __ _   _
#   | |/ _ \/ __| __| | | | | | '__/ _ \/ __| __/ _ \| '__| | | |
#   | |  __/\__ \ |_  | |_| | | | |  __/ (__| || (_) | |  | |_| |
#   |_|\___||___/\__| |____/|_|_|  \___|\___|\__\___/|_|   \__, |
#                                                          |___/
#==============================================================================
# TEST DIRECTORY
#==============================================================================

#==============================================================================
# For each test file a new temporary directory will be created. This directory
# can be used to generate test artifacts that are used in the file level or in
# the test case level, it depends on the user. After all test cases were
# executed in a given test file, this temporary directory will be deleted. That
# means each test file will have a clean environemnt to put test artifacts in,
# but it also means there is no way a test file to communication another test
# file.
#==============================================================================

# Variable thar holds the runtime path of the temp test directory. This
# variable should be used for writing or reading purposes. Its name is
# different to the usual cache variable, because it is intended to use inside
# the test cases.
DM_TEST__TMP_TEST_DIR="__INVALID__"

#==============================================================================
# Creates a temporary directory for the currently executing test file.
#------------------------------------------------------------------------------
# Globals:
#   None
# Arguments:
#   None
# STDIN:
#   None
#------------------------------------------------------------------------------
# Output variables:
#   DM_TEST__TMP_TEST_DIR
# STDOUT:
#   None
# STDERR:
#   None
# Status:
#   0 - Other status is not expected.
# Tools:
#   mkdir echo
#==============================================================================
dm_test__cache__create_temp_test_directory() {
  DM_TEST__TMP_TEST_DIR="$(dm_test__cache__create_temp_directory)"
}

#==============================================================================
# Deletes the previously created temporary directory.
#------------------------------------------------------------------------------
# Globals:
#   DM_TEST__TMP_TEST_DIR
# Arguments:
#   None
# STDIN:
#   None
#------------------------------------------------------------------------------
# Output variables:
#   None
# STDOUT:
#   None
# STDERR:
#   None
# Status:
#   0 - Other status is not expected.
# Tools:
#   rm
#==============================================================================
dm_test__cache__cleanup_temp_test_directory() {
  rm --recursive --force "$DM_TEST__TMP_TEST_DIR"
}
