#==============================================================================
# CONTEXT ASSERTIONS - Require running the testable function  with the 'run'.
#==============================================================================

#==============================================================================
# ASSERT_STATUS
#------------------------------------------------------------------------------
# Asserts the status of the last function or command runned by the 'run'
# command.
#==============================================================================

test__assert_status() {
  dummy_function() {
    return 3
  }
  run dummy_function
  assert_status 3
}

x_test__assert_status() {
  echo 'Expected [assert_status] failure.'
  dummy_function() {
    return 3
  }
  run dummy_function
  assert_status 2
}

#==============================================================================
# ASSERT_OUTPUT
#------------------------------------------------------------------------------
# Asserts the whole captured output of the last function or command runned by
# the 'run' command.
#==============================================================================

test__assert_output() {
  dummy_function() {
    echo 'hello'
  }
  run dummy_function
  assert_output 'hello'
}

x_test__assert_output__mismatch() {
  echo 'Expected [assert_output] failure.'
  dummy_function() {
    echo 'hello'
  }
  run dummy_function
  assert_output 'bye'
}

x_test__assert_output__multiline_output_fails_assertion() {
  echo 'Expected [assert_output] failure.'
  dummy_function() {
    echo 'hello 1'
    echo 'hello 2'
  }
  run dummy_function
  assert_output 'hello 1\nhello 2'
}

#==============================================================================
# ASSERT_OUTPUT_LINE_COUNT
#------------------------------------------------------------------------------
# Asserts the line count of the output of the last function or command runned
# by the 'run' command.
#==============================================================================

test__assert_output_line_count() {
  dummy_function() {
    echo 'hello 1'
    echo 'hello 2'
    echo 'hello 3'
  }
  run dummy_function
  assert_output_line_count 3
}

x_test__assert_output_line_count() {
  echo 'Expected [assert_output_line_count] failure.'
  dummy_function() {
    echo 'hello'
  }
  run dummy_function
  assert_output_line_count 42
}

#==============================================================================
# ASSERT_LINE_AT_INDEX
#------------------------------------------------------------------------------
# Asserts the line indexed line of the output of the last function or command
# runned by the 'run' command. Lines are indexed from 1.
#==============================================================================

test__assert_line_at_index() {
  dummy_function() {
    echo 'hello 1'
    echo 'hello 2'
    echo 'hello 3'
  }
  run dummy_function
  assert_line_at_index 2 'hello 2'
}

x_test__assert_line_at_index__invalid_index() {
  echo 'Expected [assert_line_at_index] failure.'
  dummy_function() {
    echo 'hello'
  }
  run dummy_function
  assert_line_at_index 42 'invalid index'
}

x_test__assert_line_at_index__no_match() {
  echo 'Expected [assert_line_at_index] failure.'
  dummy_function() {
    echo 'hello 1'
    echo 'hello 2'
    echo 'hello 3'
  }
  run dummy_function
  # This assertion matches the whole line.
  assert_line_at_index 2 'hello'
}

#==============================================================================
# ASSERT_LINE_PARTIALLY_AT_INDEX
#------------------------------------------------------------------------------
# Asserts the line indexed line partially of the output of the last function or
# command runned by the 'run' command. Lines are indexed from 1.
#==============================================================================

test__assert_line_partially_at_index() {
  dummy_function() {
    echo 'hello 1'
    echo 'hello 2'
    echo 'hello 3'
  }
  run dummy_function
  assert_line_partially_at_index 2 'hello'
}

x_test__assert_line_partially_at_index__invalid_index() {
  echo 'Expected [assert_line_partially_at_index] failure.'
  dummy_function() {
    echo 'hello 1'
  }
  run dummy_function
  assert_line_partially_at_index 42 'hello'
}

x_test__assert_line_partially_at_index__no_match() {
  echo 'Expected [assert_line_partially_at_index] failure.'
  dummy_function() {
    echo 'hello 1'
    echo 'hello 2'
    echo 'hello 3'
  }
  run dummy_function
  assert_line_partially_at_index 2 'unrelated content'
}