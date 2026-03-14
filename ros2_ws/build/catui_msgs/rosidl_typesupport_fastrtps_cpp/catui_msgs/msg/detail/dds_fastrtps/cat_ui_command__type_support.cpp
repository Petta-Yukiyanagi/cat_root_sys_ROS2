// generated from rosidl_typesupport_fastrtps_cpp/resource/idl__type_support.cpp.em
// with input from catui_msgs:msg/CatUICommand.idl
// generated code does not contain a copyright notice
#include "catui_msgs/msg/detail/cat_ui_command__rosidl_typesupport_fastrtps_cpp.hpp"
#include "catui_msgs/msg/detail/cat_ui_command__struct.hpp"

#include <limits>
#include <stdexcept>
#include <string>
#include "rosidl_typesupport_cpp/message_type_support.hpp"
#include "rosidl_typesupport_fastrtps_cpp/identifier.hpp"
#include "rosidl_typesupport_fastrtps_cpp/message_type_support.h"
#include "rosidl_typesupport_fastrtps_cpp/message_type_support_decl.hpp"
#include "rosidl_typesupport_fastrtps_cpp/wstring_conversion.hpp"
#include "fastcdr/Cdr.h"


// forward declaration of message dependencies and their conversion functions

namespace catui_msgs
{

namespace msg
{

namespace typesupport_fastrtps_cpp
{

bool
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_catui_msgs
cdr_serialize(
  const catui_msgs::msg::CatUICommand & ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  // Member: face_id
  cdr << ros_message.face_id;
  // Member: text
  cdr << ros_message.text;
  // Member: reset_after
  cdr << ros_message.reset_after;
  return true;
}

bool
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_catui_msgs
cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  catui_msgs::msg::CatUICommand & ros_message)
{
  // Member: face_id
  cdr >> ros_message.face_id;

  // Member: text
  cdr >> ros_message.text;

  // Member: reset_after
  cdr >> ros_message.reset_after;

  return true;
}  // NOLINT(readability/fn_size)

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_catui_msgs
get_serialized_size(
  const catui_msgs::msg::CatUICommand & ros_message,
  size_t current_alignment)
{
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;

  // Member: face_id
  {
    size_t item_size = sizeof(ros_message.face_id);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: text
  current_alignment += padding +
    eprosima::fastcdr::Cdr::alignment(current_alignment, padding) +
    (ros_message.text.size() + 1);
  // Member: reset_after
  {
    size_t item_size = sizeof(ros_message.reset_after);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }

  return current_alignment - initial_alignment;
}

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_catui_msgs
max_serialized_size_CatUICommand(
  bool & full_bounded,
  bool & is_plain,
  size_t current_alignment)
{
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  size_t last_member_size = 0;
  (void)last_member_size;
  (void)padding;
  (void)wchar_size;

  full_bounded = true;
  is_plain = true;


  // Member: face_id
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: text
  {
    size_t array_size = 1;

    full_bounded = false;
    is_plain = false;
    for (size_t index = 0; index < array_size; ++index) {
      current_alignment += padding +
        eprosima::fastcdr::Cdr::alignment(current_alignment, padding) +
        1;
    }
  }

  // Member: reset_after
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  size_t ret_val = current_alignment - initial_alignment;
  if (is_plain) {
    // All members are plain, and type is not empty.
    // We still need to check that the in-memory alignment
    // is the same as the CDR mandated alignment.
    using DataType = catui_msgs::msg::CatUICommand;
    is_plain =
      (
      offsetof(DataType, reset_after) +
      last_member_size
      ) == ret_val;
  }

  return ret_val;
}

static bool _CatUICommand__cdr_serialize(
  const void * untyped_ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  auto typed_message =
    static_cast<const catui_msgs::msg::CatUICommand *>(
    untyped_ros_message);
  return cdr_serialize(*typed_message, cdr);
}

static bool _CatUICommand__cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  void * untyped_ros_message)
{
  auto typed_message =
    static_cast<catui_msgs::msg::CatUICommand *>(
    untyped_ros_message);
  return cdr_deserialize(cdr, *typed_message);
}

static uint32_t _CatUICommand__get_serialized_size(
  const void * untyped_ros_message)
{
  auto typed_message =
    static_cast<const catui_msgs::msg::CatUICommand *>(
    untyped_ros_message);
  return static_cast<uint32_t>(get_serialized_size(*typed_message, 0));
}

static size_t _CatUICommand__max_serialized_size(char & bounds_info)
{
  bool full_bounded;
  bool is_plain;
  size_t ret_val;

  ret_val = max_serialized_size_CatUICommand(full_bounded, is_plain, 0);

  bounds_info =
    is_plain ? ROSIDL_TYPESUPPORT_FASTRTPS_PLAIN_TYPE :
    full_bounded ? ROSIDL_TYPESUPPORT_FASTRTPS_BOUNDED_TYPE : ROSIDL_TYPESUPPORT_FASTRTPS_UNBOUNDED_TYPE;
  return ret_val;
}

static message_type_support_callbacks_t _CatUICommand__callbacks = {
  "catui_msgs::msg",
  "CatUICommand",
  _CatUICommand__cdr_serialize,
  _CatUICommand__cdr_deserialize,
  _CatUICommand__get_serialized_size,
  _CatUICommand__max_serialized_size
};

static rosidl_message_type_support_t _CatUICommand__handle = {
  rosidl_typesupport_fastrtps_cpp::typesupport_identifier,
  &_CatUICommand__callbacks,
  get_message_typesupport_handle_function,
};

}  // namespace typesupport_fastrtps_cpp

}  // namespace msg

}  // namespace catui_msgs

namespace rosidl_typesupport_fastrtps_cpp
{

template<>
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_EXPORT_catui_msgs
const rosidl_message_type_support_t *
get_message_type_support_handle<catui_msgs::msg::CatUICommand>()
{
  return &catui_msgs::msg::typesupport_fastrtps_cpp::_CatUICommand__handle;
}

}  // namespace rosidl_typesupport_fastrtps_cpp

#ifdef __cplusplus
extern "C"
{
#endif

const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_cpp, catui_msgs, msg, CatUICommand)() {
  return &catui_msgs::msg::typesupport_fastrtps_cpp::_CatUICommand__handle;
}

#ifdef __cplusplus
}
#endif
