// generated from rosidl_generator_cpp/resource/idl__struct.hpp.em
// with input from catui_msgs:msg/CatUICommand.idl
// generated code does not contain a copyright notice

#ifndef CATUI_MSGS__MSG__DETAIL__CAT_UI_COMMAND__STRUCT_HPP_
#define CATUI_MSGS__MSG__DETAIL__CAT_UI_COMMAND__STRUCT_HPP_

#include <algorithm>
#include <array>
#include <cstdint>
#include <memory>
#include <string>
#include <vector>

#include "rosidl_runtime_cpp/bounded_vector.hpp"
#include "rosidl_runtime_cpp/message_initialization.hpp"


#ifndef _WIN32
# define DEPRECATED__catui_msgs__msg__CatUICommand __attribute__((deprecated))
#else
# define DEPRECATED__catui_msgs__msg__CatUICommand __declspec(deprecated)
#endif

namespace catui_msgs
{

namespace msg
{

// message struct
template<class ContainerAllocator>
struct CatUICommand_
{
  using Type = CatUICommand_<ContainerAllocator>;

  explicit CatUICommand_(rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->face_id = 0l;
      this->text = "";
      this->reset_after = 0.0f;
    }
  }

  explicit CatUICommand_(const ContainerAllocator & _alloc, rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : text(_alloc)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->face_id = 0l;
      this->text = "";
      this->reset_after = 0.0f;
    }
  }

  // field types and members
  using _face_id_type =
    int32_t;
  _face_id_type face_id;
  using _text_type =
    std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>;
  _text_type text;
  using _reset_after_type =
    float;
  _reset_after_type reset_after;

  // setters for named parameter idiom
  Type & set__face_id(
    const int32_t & _arg)
  {
    this->face_id = _arg;
    return *this;
  }
  Type & set__text(
    const std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> & _arg)
  {
    this->text = _arg;
    return *this;
  }
  Type & set__reset_after(
    const float & _arg)
  {
    this->reset_after = _arg;
    return *this;
  }

  // constant declarations

  // pointer types
  using RawPtr =
    catui_msgs::msg::CatUICommand_<ContainerAllocator> *;
  using ConstRawPtr =
    const catui_msgs::msg::CatUICommand_<ContainerAllocator> *;
  using SharedPtr =
    std::shared_ptr<catui_msgs::msg::CatUICommand_<ContainerAllocator>>;
  using ConstSharedPtr =
    std::shared_ptr<catui_msgs::msg::CatUICommand_<ContainerAllocator> const>;

  template<typename Deleter = std::default_delete<
      catui_msgs::msg::CatUICommand_<ContainerAllocator>>>
  using UniquePtrWithDeleter =
    std::unique_ptr<catui_msgs::msg::CatUICommand_<ContainerAllocator>, Deleter>;

  using UniquePtr = UniquePtrWithDeleter<>;

  template<typename Deleter = std::default_delete<
      catui_msgs::msg::CatUICommand_<ContainerAllocator>>>
  using ConstUniquePtrWithDeleter =
    std::unique_ptr<catui_msgs::msg::CatUICommand_<ContainerAllocator> const, Deleter>;
  using ConstUniquePtr = ConstUniquePtrWithDeleter<>;

  using WeakPtr =
    std::weak_ptr<catui_msgs::msg::CatUICommand_<ContainerAllocator>>;
  using ConstWeakPtr =
    std::weak_ptr<catui_msgs::msg::CatUICommand_<ContainerAllocator> const>;

  // pointer types similar to ROS 1, use SharedPtr / ConstSharedPtr instead
  // NOTE: Can't use 'using' here because GNU C++ can't parse attributes properly
  typedef DEPRECATED__catui_msgs__msg__CatUICommand
    std::shared_ptr<catui_msgs::msg::CatUICommand_<ContainerAllocator>>
    Ptr;
  typedef DEPRECATED__catui_msgs__msg__CatUICommand
    std::shared_ptr<catui_msgs::msg::CatUICommand_<ContainerAllocator> const>
    ConstPtr;

  // comparison operators
  bool operator==(const CatUICommand_ & other) const
  {
    if (this->face_id != other.face_id) {
      return false;
    }
    if (this->text != other.text) {
      return false;
    }
    if (this->reset_after != other.reset_after) {
      return false;
    }
    return true;
  }
  bool operator!=(const CatUICommand_ & other) const
  {
    return !this->operator==(other);
  }
};  // struct CatUICommand_

// alias to use template instance with default allocator
using CatUICommand =
  catui_msgs::msg::CatUICommand_<std::allocator<void>>;

// constant definitions

}  // namespace msg

}  // namespace catui_msgs

#endif  // CATUI_MSGS__MSG__DETAIL__CAT_UI_COMMAND__STRUCT_HPP_
