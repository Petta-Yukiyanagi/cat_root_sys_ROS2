// generated from rosidl_generator_py/resource/_idl_support.c.em
// with input from catui_msgs:msg/CatUICommand.idl
// generated code does not contain a copyright notice
#define NPY_NO_DEPRECATED_API NPY_1_7_API_VERSION
#include <Python.h>
#include <stdbool.h>
#ifndef _WIN32
# pragma GCC diagnostic push
# pragma GCC diagnostic ignored "-Wunused-function"
#endif
#include "numpy/ndarrayobject.h"
#ifndef _WIN32
# pragma GCC diagnostic pop
#endif
#include "rosidl_runtime_c/visibility_control.h"
#include "catui_msgs/msg/detail/cat_ui_command__struct.h"
#include "catui_msgs/msg/detail/cat_ui_command__functions.h"

#include "rosidl_runtime_c/string.h"
#include "rosidl_runtime_c/string_functions.h"


ROSIDL_GENERATOR_C_EXPORT
bool catui_msgs__msg__cat_ui_command__convert_from_py(PyObject * _pymsg, void * _ros_message)
{
  // check that the passed message is of the expected Python class
  {
    char full_classname_dest[44];
    {
      char * class_name = NULL;
      char * module_name = NULL;
      {
        PyObject * class_attr = PyObject_GetAttrString(_pymsg, "__class__");
        if (class_attr) {
          PyObject * name_attr = PyObject_GetAttrString(class_attr, "__name__");
          if (name_attr) {
            class_name = (char *)PyUnicode_1BYTE_DATA(name_attr);
            Py_DECREF(name_attr);
          }
          PyObject * module_attr = PyObject_GetAttrString(class_attr, "__module__");
          if (module_attr) {
            module_name = (char *)PyUnicode_1BYTE_DATA(module_attr);
            Py_DECREF(module_attr);
          }
          Py_DECREF(class_attr);
        }
      }
      if (!class_name || !module_name) {
        return false;
      }
      snprintf(full_classname_dest, sizeof(full_classname_dest), "%s.%s", module_name, class_name);
    }
    assert(strncmp("catui_msgs.msg._cat_ui_command.CatUICommand", full_classname_dest, 43) == 0);
  }
  catui_msgs__msg__CatUICommand * ros_message = _ros_message;
  {  // face_id
    PyObject * field = PyObject_GetAttrString(_pymsg, "face_id");
    if (!field) {
      return false;
    }
    assert(PyLong_Check(field));
    ros_message->face_id = (int32_t)PyLong_AsLong(field);
    Py_DECREF(field);
  }
  {  // text
    PyObject * field = PyObject_GetAttrString(_pymsg, "text");
    if (!field) {
      return false;
    }
    assert(PyUnicode_Check(field));
    PyObject * encoded_field = PyUnicode_AsUTF8String(field);
    if (!encoded_field) {
      Py_DECREF(field);
      return false;
    }
    rosidl_runtime_c__String__assign(&ros_message->text, PyBytes_AS_STRING(encoded_field));
    Py_DECREF(encoded_field);
    Py_DECREF(field);
  }
  {  // reset_after
    PyObject * field = PyObject_GetAttrString(_pymsg, "reset_after");
    if (!field) {
      return false;
    }
    assert(PyFloat_Check(field));
    ros_message->reset_after = (float)PyFloat_AS_DOUBLE(field);
    Py_DECREF(field);
  }

  return true;
}

ROSIDL_GENERATOR_C_EXPORT
PyObject * catui_msgs__msg__cat_ui_command__convert_to_py(void * raw_ros_message)
{
  /* NOTE(esteve): Call constructor of CatUICommand */
  PyObject * _pymessage = NULL;
  {
    PyObject * pymessage_module = PyImport_ImportModule("catui_msgs.msg._cat_ui_command");
    assert(pymessage_module);
    PyObject * pymessage_class = PyObject_GetAttrString(pymessage_module, "CatUICommand");
    assert(pymessage_class);
    Py_DECREF(pymessage_module);
    _pymessage = PyObject_CallObject(pymessage_class, NULL);
    Py_DECREF(pymessage_class);
    if (!_pymessage) {
      return NULL;
    }
  }
  catui_msgs__msg__CatUICommand * ros_message = (catui_msgs__msg__CatUICommand *)raw_ros_message;
  {  // face_id
    PyObject * field = NULL;
    field = PyLong_FromLong(ros_message->face_id);
    {
      int rc = PyObject_SetAttrString(_pymessage, "face_id", field);
      Py_DECREF(field);
      if (rc) {
        return NULL;
      }
    }
  }
  {  // text
    PyObject * field = NULL;
    field = PyUnicode_DecodeUTF8(
      ros_message->text.data,
      strlen(ros_message->text.data),
      "replace");
    if (!field) {
      return NULL;
    }
    {
      int rc = PyObject_SetAttrString(_pymessage, "text", field);
      Py_DECREF(field);
      if (rc) {
        return NULL;
      }
    }
  }
  {  // reset_after
    PyObject * field = NULL;
    field = PyFloat_FromDouble(ros_message->reset_after);
    {
      int rc = PyObject_SetAttrString(_pymessage, "reset_after", field);
      Py_DECREF(field);
      if (rc) {
        return NULL;
      }
    }
  }

  // ownership of _pymessage is transferred to the caller
  return _pymessage;
}
