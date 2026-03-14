// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from catui_msgs:msg/CatUICommand.idl
// generated code does not contain a copyright notice

#ifndef CATUI_MSGS__MSG__DETAIL__CAT_UI_COMMAND__BUILDER_HPP_
#define CATUI_MSGS__MSG__DETAIL__CAT_UI_COMMAND__BUILDER_HPP_

#include <algorithm>
#include <utility>

#include "catui_msgs/msg/detail/cat_ui_command__struct.hpp"
#include "rosidl_runtime_cpp/message_initialization.hpp"


namespace catui_msgs
{

namespace msg
{

namespace builder
{

class Init_CatUICommand_reset_after
{
public:
  explicit Init_CatUICommand_reset_after(::catui_msgs::msg::CatUICommand & msg)
  : msg_(msg)
  {}
  ::catui_msgs::msg::CatUICommand reset_after(::catui_msgs::msg::CatUICommand::_reset_after_type arg)
  {
    msg_.reset_after = std::move(arg);
    return std::move(msg_);
  }

private:
  ::catui_msgs::msg::CatUICommand msg_;
};

class Init_CatUICommand_text
{
public:
  explicit Init_CatUICommand_text(::catui_msgs::msg::CatUICommand & msg)
  : msg_(msg)
  {}
  Init_CatUICommand_reset_after text(::catui_msgs::msg::CatUICommand::_text_type arg)
  {
    msg_.text = std::move(arg);
    return Init_CatUICommand_reset_after(msg_);
  }

private:
  ::catui_msgs::msg::CatUICommand msg_;
};

class Init_CatUICommand_face_id
{
public:
  Init_CatUICommand_face_id()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_CatUICommand_text face_id(::catui_msgs::msg::CatUICommand::_face_id_type arg)
  {
    msg_.face_id = std::move(arg);
    return Init_CatUICommand_text(msg_);
  }

private:
  ::catui_msgs::msg::CatUICommand msg_;
};

}  // namespace builder

}  // namespace msg

template<typename MessageType>
auto build();

template<>
inline
auto build<::catui_msgs::msg::CatUICommand>()
{
  return catui_msgs::msg::builder::Init_CatUICommand_face_id();
}

}  // namespace catui_msgs

#endif  // CATUI_MSGS__MSG__DETAIL__CAT_UI_COMMAND__BUILDER_HPP_
