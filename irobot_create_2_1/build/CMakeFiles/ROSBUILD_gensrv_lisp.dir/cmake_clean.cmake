FILE(REMOVE_RECURSE
  "../msg_gen"
  "../srv_gen"
  "../msg_gen"
  "../srv_gen"
  "../src/irobot_create_2_1/msg"
  "../src/irobot_create_2_1/srv"
  "CMakeFiles/ROSBUILD_gensrv_lisp"
  "../srv_gen/lisp/Demo.lisp"
  "../srv_gen/lisp/_package.lisp"
  "../srv_gen/lisp/_package_Demo.lisp"
  "../srv_gen/lisp/Turn.lisp"
  "../srv_gen/lisp/_package.lisp"
  "../srv_gen/lisp/_package_Turn.lisp"
  "../srv_gen/lisp/Leds.lisp"
  "../srv_gen/lisp/_package.lisp"
  "../srv_gen/lisp/_package_Leds.lisp"
  "../srv_gen/lisp/Circle.lisp"
  "../srv_gen/lisp/_package.lisp"
  "../srv_gen/lisp/_package_Circle.lisp"
  "../srv_gen/lisp/Tank.lisp"
  "../srv_gen/lisp/_package.lisp"
  "../srv_gen/lisp/_package_Tank.lisp"
  "../srv_gen/lisp/Brake.lisp"
  "../srv_gen/lisp/_package.lisp"
  "../srv_gen/lisp/_package_Brake.lisp"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_gensrv_lisp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
