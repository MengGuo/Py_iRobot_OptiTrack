FILE(REMOVE_RECURSE
  "../msg_gen"
  "../srv_gen"
  "../msg_gen"
  "../srv_gen"
  "../src/irobot_create_2_1/msg"
  "../src/irobot_create_2_1/srv"
  "CMakeFiles/ROSBUILD_gensrv_cpp"
  "../srv_gen/cpp/include/irobot_create_2_1/Demo.h"
  "../srv_gen/cpp/include/irobot_create_2_1/Turn.h"
  "../srv_gen/cpp/include/irobot_create_2_1/Leds.h"
  "../srv_gen/cpp/include/irobot_create_2_1/Circle.h"
  "../srv_gen/cpp/include/irobot_create_2_1/Tank.h"
  "../srv_gen/cpp/include/irobot_create_2_1/Brake.h"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_gensrv_cpp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
