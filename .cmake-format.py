# -*- coding: utf-8 -*-
# CMake-Format configuration file

# Additional custom CMake commands with their flags and keyword arguments
additional_commands = {
    "foo": {
        "flags": ["BAR", "BAZ"],
        "kwargs": {
            "DEPENDS": "*",
            "HEADERS": "*",
            "SOURCES": "*",
        },
    },
}

# Formatting style options
bullet_char = "*"                     # Character to use for bullet lists
dangle_parens = False                 # Do not dangle closing parentheses
enum_char = "."                      # Character to use for enum lists
line_ending = "unix"                 # Use Unix-style line endings
line_width = 120                      # Maximum allowed line width
max_pargs_hwrap = 3                   # Max paragraph arguments for hanging wrap
separate_ctrl_name_with_space = False # No space between control keywords and names
separate_fn_name_with_space = False   # No space between function names and parentheses
tab_size = 2                          # Number of spaces per tab

# Markup settings
markup = {
    "enable_markup": False           # Disable markup parsing
}
