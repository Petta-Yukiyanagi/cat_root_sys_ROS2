// generated from rosidl_generator_c/resource/idl__functions.c.em
// with input from catui_msgs:msg/CatUICommand.idl
// generated code does not contain a copyright notice
#include "catui_msgs/msg/detail/cat_ui_command__functions.h"

#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#include "rcutils/allocator.h"


// Include directives for member types
// Member `text`
#include "rosidl_runtime_c/string_functions.h"

bool
catui_msgs__msg__CatUICommand__init(catui_msgs__msg__CatUICommand * msg)
{
  if (!msg) {
    return false;
  }
  // face_id
  // text
  if (!rosidl_runtime_c__String__init(&msg->text)) {
    catui_msgs__msg__CatUICommand__fini(msg);
    return false;
  }
  // reset_after
  return true;
}

void
catui_msgs__msg__CatUICommand__fini(catui_msgs__msg__CatUICommand * msg)
{
  if (!msg) {
    return;
  }
  // face_id
  // text
  rosidl_runtime_c__String__fini(&msg->text);
  // reset_after
}

bool
catui_msgs__msg__CatUICommand__are_equal(const catui_msgs__msg__CatUICommand * lhs, const catui_msgs__msg__CatUICommand * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  // face_id
  if (lhs->face_id != rhs->face_id) {
    return false;
  }
  // text
  if (!rosidl_runtime_c__String__are_equal(
      &(lhs->text), &(rhs->text)))
  {
    return false;
  }
  // reset_after
  if (lhs->reset_after != rhs->reset_after) {
    return false;
  }
  return true;
}

bool
catui_msgs__msg__CatUICommand__copy(
  const catui_msgs__msg__CatUICommand * input,
  catui_msgs__msg__CatUICommand * output)
{
  if (!input || !output) {
    return false;
  }
  // face_id
  output->face_id = input->face_id;
  // text
  if (!rosidl_runtime_c__String__copy(
      &(input->text), &(output->text)))
  {
    return false;
  }
  // reset_after
  output->reset_after = input->reset_after;
  return true;
}

catui_msgs__msg__CatUICommand *
catui_msgs__msg__CatUICommand__create()
{
  rcutils_allocator_t allocator = rcutils_get_default_allocator();
  catui_msgs__msg__CatUICommand * msg = (catui_msgs__msg__CatUICommand *)allocator.allocate(sizeof(catui_msgs__msg__CatUICommand), allocator.state);
  if (!msg) {
    return NULL;
  }
  memset(msg, 0, sizeof(catui_msgs__msg__CatUICommand));
  bool success = catui_msgs__msg__CatUICommand__init(msg);
  if (!success) {
    allocator.deallocate(msg, allocator.state);
    return NULL;
  }
  return msg;
}

void
catui_msgs__msg__CatUICommand__destroy(catui_msgs__msg__CatUICommand * msg)
{
  rcutils_allocator_t allocator = rcutils_get_default_allocator();
  if (msg) {
    catui_msgs__msg__CatUICommand__fini(msg);
  }
  allocator.deallocate(msg, allocator.state);
}


bool
catui_msgs__msg__CatUICommand__Sequence__init(catui_msgs__msg__CatUICommand__Sequence * array, size_t size)
{
  if (!array) {
    return false;
  }
  rcutils_allocator_t allocator = rcutils_get_default_allocator();
  catui_msgs__msg__CatUICommand * data = NULL;

  if (size) {
    data = (catui_msgs__msg__CatUICommand *)allocator.zero_allocate(size, sizeof(catui_msgs__msg__CatUICommand), allocator.state);
    if (!data) {
      return false;
    }
    // initialize all array elements
    size_t i;
    for (i = 0; i < size; ++i) {
      bool success = catui_msgs__msg__CatUICommand__init(&data[i]);
      if (!success) {
        break;
      }
    }
    if (i < size) {
      // if initialization failed finalize the already initialized array elements
      for (; i > 0; --i) {
        catui_msgs__msg__CatUICommand__fini(&data[i - 1]);
      }
      allocator.deallocate(data, allocator.state);
      return false;
    }
  }
  array->data = data;
  array->size = size;
  array->capacity = size;
  return true;
}

void
catui_msgs__msg__CatUICommand__Sequence__fini(catui_msgs__msg__CatUICommand__Sequence * array)
{
  if (!array) {
    return;
  }
  rcutils_allocator_t allocator = rcutils_get_default_allocator();

  if (array->data) {
    // ensure that data and capacity values are consistent
    assert(array->capacity > 0);
    // finalize all array elements
    for (size_t i = 0; i < array->capacity; ++i) {
      catui_msgs__msg__CatUICommand__fini(&array->data[i]);
    }
    allocator.deallocate(array->data, allocator.state);
    array->data = NULL;
    array->size = 0;
    array->capacity = 0;
  } else {
    // ensure that data, size, and capacity values are consistent
    assert(0 == array->size);
    assert(0 == array->capacity);
  }
}

catui_msgs__msg__CatUICommand__Sequence *
catui_msgs__msg__CatUICommand__Sequence__create(size_t size)
{
  rcutils_allocator_t allocator = rcutils_get_default_allocator();
  catui_msgs__msg__CatUICommand__Sequence * array = (catui_msgs__msg__CatUICommand__Sequence *)allocator.allocate(sizeof(catui_msgs__msg__CatUICommand__Sequence), allocator.state);
  if (!array) {
    return NULL;
  }
  bool success = catui_msgs__msg__CatUICommand__Sequence__init(array, size);
  if (!success) {
    allocator.deallocate(array, allocator.state);
    return NULL;
  }
  return array;
}

void
catui_msgs__msg__CatUICommand__Sequence__destroy(catui_msgs__msg__CatUICommand__Sequence * array)
{
  rcutils_allocator_t allocator = rcutils_get_default_allocator();
  if (array) {
    catui_msgs__msg__CatUICommand__Sequence__fini(array);
  }
  allocator.deallocate(array, allocator.state);
}

bool
catui_msgs__msg__CatUICommand__Sequence__are_equal(const catui_msgs__msg__CatUICommand__Sequence * lhs, const catui_msgs__msg__CatUICommand__Sequence * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  if (lhs->size != rhs->size) {
    return false;
  }
  for (size_t i = 0; i < lhs->size; ++i) {
    if (!catui_msgs__msg__CatUICommand__are_equal(&(lhs->data[i]), &(rhs->data[i]))) {
      return false;
    }
  }
  return true;
}

bool
catui_msgs__msg__CatUICommand__Sequence__copy(
  const catui_msgs__msg__CatUICommand__Sequence * input,
  catui_msgs__msg__CatUICommand__Sequence * output)
{
  if (!input || !output) {
    return false;
  }
  if (output->capacity < input->size) {
    const size_t allocation_size =
      input->size * sizeof(catui_msgs__msg__CatUICommand);
    rcutils_allocator_t allocator = rcutils_get_default_allocator();
    catui_msgs__msg__CatUICommand * data =
      (catui_msgs__msg__CatUICommand *)allocator.reallocate(
      output->data, allocation_size, allocator.state);
    if (!data) {
      return false;
    }
    // If reallocation succeeded, memory may or may not have been moved
    // to fulfill the allocation request, invalidating output->data.
    output->data = data;
    for (size_t i = output->capacity; i < input->size; ++i) {
      if (!catui_msgs__msg__CatUICommand__init(&output->data[i])) {
        // If initialization of any new item fails, roll back
        // all previously initialized items. Existing items
        // in output are to be left unmodified.
        for (; i-- > output->capacity; ) {
          catui_msgs__msg__CatUICommand__fini(&output->data[i]);
        }
        return false;
      }
    }
    output->capacity = input->size;
  }
  output->size = input->size;
  for (size_t i = 0; i < input->size; ++i) {
    if (!catui_msgs__msg__CatUICommand__copy(
        &(input->data[i]), &(output->data[i])))
    {
      return false;
    }
  }
  return true;
}
