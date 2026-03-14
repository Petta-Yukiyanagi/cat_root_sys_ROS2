#[cfg(feature = "serde")]
use serde::{Deserialize, Serialize};


#[link(name = "catui_msgs__rosidl_typesupport_c")]
extern "C" {
    fn rosidl_typesupport_c__get_message_type_support_handle__catui_msgs__msg__CatUICommand() -> *const std::ffi::c_void;
}

#[link(name = "catui_msgs__rosidl_generator_c")]
extern "C" {
    fn catui_msgs__msg__CatUICommand__init(msg: *mut CatUICommand) -> bool;
    fn catui_msgs__msg__CatUICommand__Sequence__init(seq: *mut rosidl_runtime_rs::Sequence<CatUICommand>, size: usize) -> bool;
    fn catui_msgs__msg__CatUICommand__Sequence__fini(seq: *mut rosidl_runtime_rs::Sequence<CatUICommand>);
    fn catui_msgs__msg__CatUICommand__Sequence__copy(in_seq: &rosidl_runtime_rs::Sequence<CatUICommand>, out_seq: *mut rosidl_runtime_rs::Sequence<CatUICommand>) -> bool;
}

// Corresponds to catui_msgs__msg__CatUICommand
#[cfg_attr(feature = "serde", derive(Deserialize, Serialize))]


// This struct is not documented.
#[allow(missing_docs)]

#[repr(C)]
#[derive(Clone, Debug, PartialEq, PartialOrd)]
pub struct CatUICommand {

    // This member is not documented.
    #[allow(missing_docs)]
    pub face_id: i32,


    // This member is not documented.
    #[allow(missing_docs)]
    pub text: rosidl_runtime_rs::String,


    // This member is not documented.
    #[allow(missing_docs)]
    pub reset_after: f32,

}



impl Default for CatUICommand {
  fn default() -> Self {
    unsafe {
      let mut msg = std::mem::zeroed();
      if !catui_msgs__msg__CatUICommand__init(&mut msg as *mut _) {
        panic!("Call to catui_msgs__msg__CatUICommand__init() failed");
      }
      msg
    }
  }
}

impl rosidl_runtime_rs::SequenceAlloc for CatUICommand {
  fn sequence_init(seq: &mut rosidl_runtime_rs::Sequence<Self>, size: usize) -> bool {
    // SAFETY: This is safe since the pointer is guaranteed to be valid/initialized.
    unsafe { catui_msgs__msg__CatUICommand__Sequence__init(seq as *mut _, size) }
  }
  fn sequence_fini(seq: &mut rosidl_runtime_rs::Sequence<Self>) {
    // SAFETY: This is safe since the pointer is guaranteed to be valid/initialized.
    unsafe { catui_msgs__msg__CatUICommand__Sequence__fini(seq as *mut _) }
  }
  fn sequence_copy(in_seq: &rosidl_runtime_rs::Sequence<Self>, out_seq: &mut rosidl_runtime_rs::Sequence<Self>) -> bool {
    // SAFETY: This is safe since the pointer is guaranteed to be valid/initialized.
    unsafe { catui_msgs__msg__CatUICommand__Sequence__copy(in_seq, out_seq as *mut _) }
  }
}

impl rosidl_runtime_rs::Message for CatUICommand {
  type RmwMsg = Self;
  fn into_rmw_message(msg_cow: std::borrow::Cow<'_, Self>) -> std::borrow::Cow<'_, Self::RmwMsg> { msg_cow }
  fn from_rmw_message(msg: Self::RmwMsg) -> Self { msg }
}

impl rosidl_runtime_rs::RmwMessage for CatUICommand where Self: Sized {
  const TYPE_NAME: &'static str = "catui_msgs/msg/CatUICommand";
  fn get_type_support() -> *const std::ffi::c_void {
    // SAFETY: No preconditions for this function.
    unsafe { rosidl_typesupport_c__get_message_type_support_handle__catui_msgs__msg__CatUICommand() }
  }
}


