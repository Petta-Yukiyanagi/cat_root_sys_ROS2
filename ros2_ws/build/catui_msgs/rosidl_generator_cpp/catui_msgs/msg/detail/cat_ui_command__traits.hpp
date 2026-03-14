// generated from rosidl_generator_cpp/resource/idl__traits.hpp.em
// with input from catui_msgs:msg/CatUICommand.idl
// generated code does not contain a copyright notice

#ifndef CATUI_MSGS__MSG__DETAIL__CAT_UI_COMMAND__TRAITS_HPP_
#define CATUI_MSGS__MSG__DETAIL__CAT_UI_COMMAND__TRAITS_HPP_

#include <stdint.h>

#include <sstream>
#include <string>
#include <type_traits>

#include "catui_msgs/msg/detail/cat_ui_command__struct.hpp"
#include "rosidl_runtime_cpp/traits.hpp"

namespace catui_msgs
{

namespace msg
{

inline void to_flow_style_yaml(
  const CatUICommand & msg,
  std::ostream & out)
{
  out << "{";
  // member: face_id
  {
    out << "face_id: ";
    rosidl_generator_traits::value_to_yaml(msg.face_id, out);
    out << ", ";
  }

  // member: text
  {
    out << "text: ";
    rosidl_generator_traits::value_to_yaml(msg.text, out);
    out << ", ";
  }

  // member: reset_after
  {
    out << "reset_after: ";
    rosidl_generator_traits::value_to_yaml(msg.reset_after, out);
  }
  out << "}";
}  // NOLINT(readability/fn_size)

inline void to_block_style_yaml(
  const CatUICommand & msg,
  std::ostream & out, size_t indentation = 0)
{
  // member: face_id
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "face_id: ";
    rosidl_generator_traits::value_to_yaml(msg.face_id, out);
    out << "\n";
  }

  // member: text
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "text: ";
    rosidl_generator_traits::value_to_yaml(msg.text, out);
    out << "\n";
  }

  // member: reset_after
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "reset_after: ";
    rosidl_generator_traits::value_to_yaml(msg.reset_after, out);
    out << "\n";
  }
}  // NOLINT(readability/fn_size)

inline std::string to_yaml(const CatUICommand & msg, bool use_flow_style = false)
{
  std::ostringstream out;
  if (use_flow_style) {
    to_flow_style_yaml(msg, out);
  } else {
    to_block_style_yaml(msg, out);
  }
  return out.str();
}

}  // namespace msg

}  // namespace catui_msgs

namespace rosidl_generator_traits
{

[[deprecated("use catui_msgs::msg::to_block_style_yaml() instead")]]
inline void to_yaml(
  const catui_msgs::msg::CatUICommand & msg,
  std::ostream & out, size_t indentation = 0)
{
  catui_msgs::msg::to_block_style_yaml(msg, out, indentation);
}

[[deprecated("use catui_msgs::msg::to_yaml() instead")]]
inline std::string to_yaml(const catui_msgs::msg::CatUICommand & msg)
{
  return catui_msgs::msg::to_yaml(msg);
}

template<>
inline const char * data_type<catui_msgs::msg::CatUICommand>()
{
  return "catui_msgs::msg::CatUICommand";
}

template<>
inline const char * name<catui_msgs::msg::CatUICommand>()
{
  return "catui_msgs/msg/CatUICommand";
}

template<>
struct has_fixed_size<catui_msgs::msg::CatUICommand>
  : std::integral_constant<bool, false> {};

template<>
struct has_bounded_size<catui_msgs::msg::CatUICommand>
  : std::integral_constant<bool, false> {};

template<>
struct is_message<catui_msgs::msg::CatUICommand>
  : std::true_type {};

}  // namespace rosidl_generator_traits

#endif  // CATUI_MSGS__MSG__DETAIL__CAT_UI_COMMAND__TRAITS_HPP_
