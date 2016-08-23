FILE(REMOVE_RECURSE
  "../msg_gen"
  "../srv_gen"
  "../msg_gen"
  "../srv_gen"
  "../src/irobot_create_2_1/msg"
  "../src/irobot_create_2_1/srv"
  "CMakeFiles/ROSBUILD_gensrv_py"
  "../src/irobot_create_2_1/srv/__init__.py"
  "../src/irobot_create_2_1/srv/_Demo.py"
  "../src/irobot_create_2_1/srv/_Turn.py"
  "../src/irobot_create_2_1/srv/_Leds.py"
  "../src/irobot_create_2_1/srv/_Circle.py"
  "../src/irobot_create_2_1/srv/_Tank.py"
  "../src/irobot_create_2_1/srv/_Brake.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_gensrv_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
