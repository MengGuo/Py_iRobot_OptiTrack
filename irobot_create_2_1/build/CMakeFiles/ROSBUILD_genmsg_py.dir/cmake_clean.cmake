FILE(REMOVE_RECURSE
  "../msg_gen"
  "../srv_gen"
  "../msg_gen"
  "../srv_gen"
  "../src/irobot_create_2_1/msg"
  "../src/irobot_create_2_1/srv"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "../src/irobot_create_2_1/msg/__init__.py"
  "../src/irobot_create_2_1/msg/_SensorPacket.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
