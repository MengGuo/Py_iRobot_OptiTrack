/* Auto-generated by genmsg_cpp for file /home/dukerama/sandbox/irobot_create_2_1/srv/Leds.srv */
#ifndef IROBOT_CREATE_2_1_SERVICE_LEDS_H
#define IROBOT_CREATE_2_1_SERVICE_LEDS_H
#include <string>
#include <vector>
#include <map>
#include <ostream>
#include "ros/serialization.h"
#include "ros/builtin_message_traits.h"
#include "ros/message_operations.h"
#include "ros/time.h"

#include "ros/macros.h"

#include "ros/assert.h"

#include "ros/service_traits.h"




namespace irobot_create_2_1
{
template <class ContainerAllocator>
struct LedsRequest_ {
  typedef LedsRequest_<ContainerAllocator> Type;

  LedsRequest_()
  : advance(false)
  , play(false)
  , color(0)
  , intensity(0)
  {
  }

  LedsRequest_(const ContainerAllocator& _alloc)
  : advance(false)
  , play(false)
  , color(0)
  , intensity(0)
  {
  }

  typedef uint8_t _advance_type;
  uint8_t advance;

  typedef uint8_t _play_type;
  uint8_t play;

  typedef uint8_t _color_type;
  uint8_t color;

  typedef uint8_t _intensity_type;
  uint8_t intensity;


  typedef boost::shared_ptr< ::irobot_create_2_1::LedsRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::irobot_create_2_1::LedsRequest_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct LedsRequest
typedef  ::irobot_create_2_1::LedsRequest_<std::allocator<void> > LedsRequest;

typedef boost::shared_ptr< ::irobot_create_2_1::LedsRequest> LedsRequestPtr;
typedef boost::shared_ptr< ::irobot_create_2_1::LedsRequest const> LedsRequestConstPtr;



template <class ContainerAllocator>
struct LedsResponse_ {
  typedef LedsResponse_<ContainerAllocator> Type;

  LedsResponse_()
  : success(false)
  {
  }

  LedsResponse_(const ContainerAllocator& _alloc)
  : success(false)
  {
  }

  typedef uint8_t _success_type;
  uint8_t success;


  typedef boost::shared_ptr< ::irobot_create_2_1::LedsResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::irobot_create_2_1::LedsResponse_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct LedsResponse
typedef  ::irobot_create_2_1::LedsResponse_<std::allocator<void> > LedsResponse;

typedef boost::shared_ptr< ::irobot_create_2_1::LedsResponse> LedsResponsePtr;
typedef boost::shared_ptr< ::irobot_create_2_1::LedsResponse const> LedsResponseConstPtr;


struct Leds
{

typedef LedsRequest Request;
typedef LedsResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;
}; // struct Leds
} // namespace irobot_create_2_1

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::irobot_create_2_1::LedsRequest_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::irobot_create_2_1::LedsRequest_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::irobot_create_2_1::LedsRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "df36903a5aadf6b7eb388fa7522028da";
  }

  static const char* value(const  ::irobot_create_2_1::LedsRequest_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0xdf36903a5aadf6b7ULL;
  static const uint64_t static_value2 = 0xeb388fa7522028daULL;
};

template<class ContainerAllocator>
struct DataType< ::irobot_create_2_1::LedsRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "irobot_create_2_1/LedsRequest";
  }

  static const char* value(const  ::irobot_create_2_1::LedsRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::irobot_create_2_1::LedsRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "bool advance\n\
bool play\n\
uint8 color\n\
uint8 intensity\n\
\n\
";
  }

  static const char* value(const  ::irobot_create_2_1::LedsRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator> struct IsFixedSize< ::irobot_create_2_1::LedsRequest_<ContainerAllocator> > : public TrueType {};
} // namespace message_traits
} // namespace ros


namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::irobot_create_2_1::LedsResponse_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::irobot_create_2_1::LedsResponse_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::irobot_create_2_1::LedsResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "358e233cde0c8a8bcfea4ce193f8fc15";
  }

  static const char* value(const  ::irobot_create_2_1::LedsResponse_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0x358e233cde0c8a8bULL;
  static const uint64_t static_value2 = 0xcfea4ce193f8fc15ULL;
};

template<class ContainerAllocator>
struct DataType< ::irobot_create_2_1::LedsResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "irobot_create_2_1/LedsResponse";
  }

  static const char* value(const  ::irobot_create_2_1::LedsResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::irobot_create_2_1::LedsResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "bool success\n\
\n\
\n\
";
  }

  static const char* value(const  ::irobot_create_2_1::LedsResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator> struct IsFixedSize< ::irobot_create_2_1::LedsResponse_<ContainerAllocator> > : public TrueType {};
} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::irobot_create_2_1::LedsRequest_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.advance);
    stream.next(m.play);
    stream.next(m.color);
    stream.next(m.intensity);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct LedsRequest_
} // namespace serialization
} // namespace ros


namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::irobot_create_2_1::LedsResponse_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.success);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct LedsResponse_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace service_traits
{
template<>
struct MD5Sum<irobot_create_2_1::Leds> {
  static const char* value() 
  {
    return "926a8fe91d451f4d4bb099ec9e86ff14";
  }

  static const char* value(const irobot_create_2_1::Leds&) { return value(); } 
};

template<>
struct DataType<irobot_create_2_1::Leds> {
  static const char* value() 
  {
    return "irobot_create_2_1/Leds";
  }

  static const char* value(const irobot_create_2_1::Leds&) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<irobot_create_2_1::LedsRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "926a8fe91d451f4d4bb099ec9e86ff14";
  }

  static const char* value(const irobot_create_2_1::LedsRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<irobot_create_2_1::LedsRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "irobot_create_2_1/Leds";
  }

  static const char* value(const irobot_create_2_1::LedsRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<irobot_create_2_1::LedsResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "926a8fe91d451f4d4bb099ec9e86ff14";
  }

  static const char* value(const irobot_create_2_1::LedsResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<irobot_create_2_1::LedsResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "irobot_create_2_1/Leds";
  }

  static const char* value(const irobot_create_2_1::LedsResponse_<ContainerAllocator> &) { return value(); } 
};

} // namespace service_traits
} // namespace ros

#endif // IROBOT_CREATE_2_1_SERVICE_LEDS_H

