#[cfg(feature = "serde")]
use serde::{Deserialize, Serialize};



// Corresponds to catui_msgs__msg__CatUICommand

// This struct is not documented.
#[allow(missing_docs)]

#[cfg_attr(feature = "serde", derive(Deserialize, Serialize))]
#[derive(Clone, Debug, PartialEq, PartialOrd)]
pub struct CatUICommand {

    // This member is not documented.
    #[allow(missing_docs)]
    pub face_id: i32,


    // This member is not documented.
    #[allow(missing_docs)]
    pub text: std::string::String,


    // This member is not documented.
    #[allow(missing_docs)]
    pub reset_after: f32,

}



impl Default for CatUICommand {
  fn default() -> Self {
    <Self as rosidl_runtime_rs::Message>::from_rmw_message(super::msg::rmw::CatUICommand::default())
  }
}

impl rosidl_runtime_rs::Message for CatUICommand {
  type RmwMsg = super::msg::rmw::CatUICommand;

  fn into_rmw_message(msg_cow: std::borrow::Cow<'_, Self>) -> std::borrow::Cow<'_, Self::RmwMsg> {
    match msg_cow {
      std::borrow::Cow::Owned(msg) => std::borrow::Cow::Owned(Self::RmwMsg {
        face_id: msg.face_id,
        text: msg.text.as_str().into(),
        reset_after: msg.reset_after,
      }),
      std::borrow::Cow::Borrowed(msg) => std::borrow::Cow::Owned(Self::RmwMsg {
      face_id: msg.face_id,
        text: msg.text.as_str().into(),
      reset_after: msg.reset_after,
      })
    }
  }

  fn from_rmw_message(msg: Self::RmwMsg) -> Self {
    Self {
      face_id: msg.face_id,
      text: msg.text.to_string(),
      reset_after: msg.reset_after,
    }
  }
}


