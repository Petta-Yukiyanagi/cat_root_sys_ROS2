// generated from rosidl_generator_c/resource/idl__struct.h.em
// with input from catui_msgs:msg/CatUICommand.idl
// generated code does not contain a copyright notice

#ifndef CATUI_MSGS__MSG__DETAIL__CAT_UI_COMMAND__STRUCT_H_
#define CATUI_MSGS__MSG__DETAIL__CAT_UI_COMMAND__STRUCT_H_

#ifdef __cplusplus
extern "C"
{
#endif

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>


// Constants defined in the message

// Include directives for member types
// Member 'text'
#include "rosidl_runtime_c/string.h"

/// Struct defined in msg/CatUICommand in the package catui_msgs.
typedef struct catui_msgs__msg__CatUICommand
{
  int32_t face_id;
  rosidl_runtime_c__String text;
  float reset_after;
} catui_msgs__msg__CatUICommand;

// Struct for a sequence of catui_msgs__msg__CatUICommand.
typedef struct catui_msgs__msg__CatUICommand__Sequence
{
  catui_msgs__msg__CatUICommand * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} catui_msgs__msg__CatUICommand__Sequence;

#ifdef __cplusplus
}
#endif

#endif  // CATUI_MSGS__MSG__DETAIL__CAT_UI_COMMAND__STRUCT_H_
