// generated from rosidl_typesupport_introspection_cpp/resource/idl__type_support.cpp.em
// with input from catui_msgs:msg/CatUICommand.idl
// generated code does not contain a copyright notice

#include "array"
#include "cstddef"
#include "string"
#include "vector"
#include "rosidl_runtime_c/message_type_support_struct.h"
#include "rosidl_typesupport_cpp/message_type_support.hpp"
#include "rosidl_typesupport_interface/macros.h"
#include "catui_msgs/msg/detail/cat_ui_command__struct.hpp"
#include "rosidl_typesupport_introspection_cpp/field_types.hpp"
#include "rosidl_typesupport_introspection_cpp/identifier.hpp"
#include "rosidl_typesupport_introspection_cpp/message_introspection.hpp"
#include "rosidl_typesupport_introspection_cpp/message_type_support_decl.hpp"
#include "rosidl_typesupport_introspection_cpp/visibility_control.h"

namespace catui_msgs
{

namespace msg
{

namespace rosidl_typesupport_introspection_cpp
{

void CatUICommand_init_function(
  void * message_memory, rosidl_runtime_cpp::MessageInitialization _init)
{
  new (message_memory) catui_msgs::msg::CatUICommand(_init);
}

void CatUICommand_fini_function(void * message_memory)
{
  auto typed_message = static_cast<catui_msgs::msg::CatUICommand *>(message_memory);
  typed_message->~CatUICommand();
}

static const ::rosidl_typesupport_introspection_cpp::MessageMember CatUICommand_message_member_array[3] = {
  {
    "face_id",  // name
    ::rosidl_typesupport_introspection_cpp::ROS_TYPE_INT32,  // type
    0,  // upper bound of string
    nullptr,  // members of sub message
    false,  // is array
    0,  // array size
    false,  // is upper bound
    offsetof(catui_msgs::msg::CatUICommand, face_id),  // bytes offset in struct
    nullptr,  // default value
    nullptr,  // size() function pointer
    nullptr,  // get_const(index) function pointer
    nullptr,  // get(index) function pointer
    nullptr,  // fetch(index, &value) function pointer
    nullptr,  // assign(index, value) function pointer
    nullptr  // resize(index) function pointer
  },
  {
    "text",  // name
    ::rosidl_typesupport_introspection_cpp::ROS_TYPE_STRING,  // type
    0,  // upper bound of string
    nullptr,  // members of sub message
    false,  // is array
    0,  // array size
    false,  // is upper bound
    offsetof(catui_msgs::msg::CatUICommand, text),  // bytes offset in struct
    nullptr,  // default value
    nullptr,  // size() function pointer
    nullptr,  // get_const(index) function pointer
    nullptr,  // get(index) function pointer
    nullptr,  // fetch(index, &value) function pointer
    nullptr,  // assign(index, value) function pointer
    nullptr  // resize(index) function pointer
  },
  {
    "reset_after",  // name
    ::rosidl_typesupport_introspection_cpp::ROS_TYPE_FLOAT,  // type
    0,  // upper bound of string
    nullptr,  // members of sub message
    false,  // is array
    0,  // array size
    false,  // is upper bound
    offsetof(catui_msgs::msg::CatUICommand, reset_after),  // bytes offset in struct
    nullptr,  // default value
    nullptr,  // size() function pointer
    nullptr,  // get_const(index) function pointer
    nullptr,  // get(index) function pointer
    nullptr,  // fetch(index, &value) function pointer
    nullptr,  // assign(index, value) function pointer
    nullptr  // resize(index) function pointer
  }
};

static const ::rosidl_typesupport_introspection_cpp::MessageMembers CatUICommand_message_members = {
  "catui_msgs::msg",  // message namespace
  "CatUICommand",  // message name
  3,  // number of fields
  sizeof(catui_msgs::msg::CatUICommand),
  CatUICommand_message_member_array,  // message members
  CatUICommand_init_function,  // function to initialize message memory (memory has to be allocated)
  CatUICommand_fini_function  // function to terminate message instance (will not free memory)
};

static const rosidl_message_type_support_t CatUICommand_message_type_support_handle = {
  ::rosidl_typesupport_introspection_cpp::typesupport_identifier,
  &CatUICommand_message_members,
  get_message_typesupport_handle_function,
};

}  // namespace rosidl_typesupport_introspection_cpp

}  // namespace msg

}  // namespace catui_msgs


namespace rosidl_typesupport_introspection_cpp
{

template<>
ROSIDL_TYPESUPPORT_INTROSPECTION_CPP_PUBLIC
const rosidl_message_type_support_t *
get_message_type_support_handle<catui_msgs::msg::CatUICommand>()
{
  return &::catui_msgs::msg::rosidl_typesupport_introspection_cpp::CatUICommand_message_type_support_handle;
}

}  // namespace rosidl_typesupport_introspection_cpp

#ifdef __cplusplus
extern "C"
{
#endif

ROSIDL_TYPESUPPORT_INTROSPECTION_CPP_PUBLIC
const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_introspection_cpp, catui_msgs, msg, CatUICommand)() {
  return &::catui_msgs::msg::rosidl_typesupport_introspection_cpp::CatUICommand_message_type_support_handle;
}

#ifdef __cplusplus
}
#endif
