// generated from rosidl_generator_c/resource/idl__functions.h.em
// with input from catui_msgs:msg/CatUICommand.idl
// generated code does not contain a copyright notice

#ifndef CATUI_MSGS__MSG__DETAIL__CAT_UI_COMMAND__FUNCTIONS_H_
#define CATUI_MSGS__MSG__DETAIL__CAT_UI_COMMAND__FUNCTIONS_H_

#ifdef __cplusplus
extern "C"
{
#endif

#include <stdbool.h>
#include <stdlib.h>

#include "rosidl_runtime_c/visibility_control.h"
#include "catui_msgs/msg/rosidl_generator_c__visibility_control.h"

#include "catui_msgs/msg/detail/cat_ui_command__struct.h"

/// Initialize msg/CatUICommand message.
/**
 * If the init function is called twice for the same message without
 * calling fini inbetween previously allocated memory will be leaked.
 * \param[in,out] msg The previously allocated message pointer.
 * Fields without a default value will not be initialized by this function.
 * You might want to call memset(msg, 0, sizeof(
 * catui_msgs__msg__CatUICommand
 * )) before or use
 * catui_msgs__msg__CatUICommand__create()
 * to allocate and initialize the message.
 * \return true if initialization was successful, otherwise false
 */
ROSIDL_GENERATOR_C_PUBLIC_catui_msgs
bool
catui_msgs__msg__CatUICommand__init(catui_msgs__msg__CatUICommand * msg);

/// Finalize msg/CatUICommand message.
/**
 * \param[in,out] msg The allocated message pointer.
 */
ROSIDL_GENERATOR_C_PUBLIC_catui_msgs
void
catui_msgs__msg__CatUICommand__fini(catui_msgs__msg__CatUICommand * msg);

/// Create msg/CatUICommand message.
/**
 * It allocates the memory for the message, sets the memory to zero, and
 * calls
 * catui_msgs__msg__CatUICommand__init().
 * \return The pointer to the initialized message if successful,
 * otherwise NULL
 */
ROSIDL_GENERATOR_C_PUBLIC_catui_msgs
catui_msgs__msg__CatUICommand *
catui_msgs__msg__CatUICommand__create();

/// Destroy msg/CatUICommand message.
/**
 * It calls
 * catui_msgs__msg__CatUICommand__fini()
 * and frees the memory of the message.
 * \param[in,out] msg The allocated message pointer.
 */
ROSIDL_GENERATOR_C_PUBLIC_catui_msgs
void
catui_msgs__msg__CatUICommand__destroy(catui_msgs__msg__CatUICommand * msg);

/// Check for msg/CatUICommand message equality.
/**
 * \param[in] lhs The message on the left hand size of the equality operator.
 * \param[in] rhs The message on the right hand size of the equality operator.
 * \return true if messages are equal, otherwise false.
 */
ROSIDL_GENERATOR_C_PUBLIC_catui_msgs
bool
catui_msgs__msg__CatUICommand__are_equal(const catui_msgs__msg__CatUICommand * lhs, const catui_msgs__msg__CatUICommand * rhs);

/// Copy a msg/CatUICommand message.
/**
 * This functions performs a deep copy, as opposed to the shallow copy that
 * plain assignment yields.
 *
 * \param[in] input The source message pointer.
 * \param[out] output The target message pointer, which must
 *   have been initialized before calling this function.
 * \return true if successful, or false if either pointer is null
 *   or memory allocation fails.
 */
ROSIDL_GENERATOR_C_PUBLIC_catui_msgs
bool
catui_msgs__msg__CatUICommand__copy(
  const catui_msgs__msg__CatUICommand * input,
  catui_msgs__msg__CatUICommand * output);

/// Initialize array of msg/CatUICommand messages.
/**
 * It allocates the memory for the number of elements and calls
 * catui_msgs__msg__CatUICommand__init()
 * for each element of the array.
 * \param[in,out] array The allocated array pointer.
 * \param[in] size The size / capacity of the array.
 * \return true if initialization was successful, otherwise false
 * If the array pointer is valid and the size is zero it is guaranteed
 # to return true.
 */
ROSIDL_GENERATOR_C_PUBLIC_catui_msgs
bool
catui_msgs__msg__CatUICommand__Sequence__init(catui_msgs__msg__CatUICommand__Sequence * array, size_t size);

/// Finalize array of msg/CatUICommand messages.
/**
 * It calls
 * catui_msgs__msg__CatUICommand__fini()
 * for each element of the array and frees the memory for the number of
 * elements.
 * \param[in,out] array The initialized array pointer.
 */
ROSIDL_GENERATOR_C_PUBLIC_catui_msgs
void
catui_msgs__msg__CatUICommand__Sequence__fini(catui_msgs__msg__CatUICommand__Sequence * array);

/// Create array of msg/CatUICommand messages.
/**
 * It allocates the memory for the array and calls
 * catui_msgs__msg__CatUICommand__Sequence__init().
 * \param[in] size The size / capacity of the array.
 * \return The pointer to the initialized array if successful, otherwise NULL
 */
ROSIDL_GENERATOR_C_PUBLIC_catui_msgs
catui_msgs__msg__CatUICommand__Sequence *
catui_msgs__msg__CatUICommand__Sequence__create(size_t size);

/// Destroy array of msg/CatUICommand messages.
/**
 * It calls
 * catui_msgs__msg__CatUICommand__Sequence__fini()
 * on the array,
 * and frees the memory of the array.
 * \param[in,out] array The initialized array pointer.
 */
ROSIDL_GENERATOR_C_PUBLIC_catui_msgs
void
catui_msgs__msg__CatUICommand__Sequence__destroy(catui_msgs__msg__CatUICommand__Sequence * array);

/// Check for msg/CatUICommand message array equality.
/**
 * \param[in] lhs The message array on the left hand size of the equality operator.
 * \param[in] rhs The message array on the right hand size of the equality operator.
 * \return true if message arrays are equal in size and content, otherwise false.
 */
ROSIDL_GENERATOR_C_PUBLIC_catui_msgs
bool
catui_msgs__msg__CatUICommand__Sequence__are_equal(const catui_msgs__msg__CatUICommand__Sequence * lhs, const catui_msgs__msg__CatUICommand__Sequence * rhs);

/// Copy an array of msg/CatUICommand messages.
/**
 * This functions performs a deep copy, as opposed to the shallow copy that
 * plain assignment yields.
 *
 * \param[in] input The source array pointer.
 * \param[out] output The target array pointer, which must
 *   have been initialized before calling this function.
 * \return true if successful, or false if either pointer
 *   is null or memory allocation fails.
 */
ROSIDL_GENERATOR_C_PUBLIC_catui_msgs
bool
catui_msgs__msg__CatUICommand__Sequence__copy(
  const catui_msgs__msg__CatUICommand__Sequence * input,
  catui_msgs__msg__CatUICommand__Sequence * output);

#ifdef __cplusplus
}
#endif

#endif  // CATUI_MSGS__MSG__DETAIL__CAT_UI_COMMAND__FUNCTIONS_H_
