#[cfg(feature = "serde")]
use serde::{Deserialize, Serialize};



// Corresponds to create_msgs__msg__Bumper

// This struct is not documented.
#[allow(missing_docs)]

#[cfg_attr(feature = "serde", derive(Deserialize, Serialize))]
#[derive(Clone, Debug, PartialEq, PartialOrd)]
pub struct Bumper {

    // This member is not documented.
    #[allow(missing_docs)]
    pub header: std_msgs::msg::Header,

    /// Contact sensors
    pub is_left_pressed: bool,


    // This member is not documented.
    #[allow(missing_docs)]
    pub is_right_pressed: bool,

    /// Bumper light sensors (Create 2 only) in order from left to right
    /// Value = true if an obstacle detected
    pub is_light_left: bool,


    // This member is not documented.
    #[allow(missing_docs)]
    pub is_light_front_left: bool,


    // This member is not documented.
    #[allow(missing_docs)]
    pub is_light_center_left: bool,


    // This member is not documented.
    #[allow(missing_docs)]
    pub is_light_center_right: bool,


    // This member is not documented.
    #[allow(missing_docs)]
    pub is_light_front_right: bool,


    // This member is not documented.
    #[allow(missing_docs)]
    pub is_light_right: bool,

    /// Raw light sensor signals
    /// Values in range [0, 4095]
    pub light_signal_left: u16,


    // This member is not documented.
    #[allow(missing_docs)]
    pub light_signal_front_left: u16,


    // This member is not documented.
    #[allow(missing_docs)]
    pub light_signal_center_left: u16,


    // This member is not documented.
    #[allow(missing_docs)]
    pub light_signal_center_right: u16,


    // This member is not documented.
    #[allow(missing_docs)]
    pub light_signal_front_right: u16,


    // This member is not documented.
    #[allow(missing_docs)]
    pub light_signal_right: u16,

}



impl Default for Bumper {
  fn default() -> Self {
    <Self as rosidl_runtime_rs::Message>::from_rmw_message(super::msg::rmw::Bumper::default())
  }
}

impl rosidl_runtime_rs::Message for Bumper {
  type RmwMsg = super::msg::rmw::Bumper;

  fn into_rmw_message(msg_cow: std::borrow::Cow<'_, Self>) -> std::borrow::Cow<'_, Self::RmwMsg> {
    match msg_cow {
      std::borrow::Cow::Owned(msg) => std::borrow::Cow::Owned(Self::RmwMsg {
        header: std_msgs::msg::Header::into_rmw_message(std::borrow::Cow::Owned(msg.header)).into_owned(),
        is_left_pressed: msg.is_left_pressed,
        is_right_pressed: msg.is_right_pressed,
        is_light_left: msg.is_light_left,
        is_light_front_left: msg.is_light_front_left,
        is_light_center_left: msg.is_light_center_left,
        is_light_center_right: msg.is_light_center_right,
        is_light_front_right: msg.is_light_front_right,
        is_light_right: msg.is_light_right,
        light_signal_left: msg.light_signal_left,
        light_signal_front_left: msg.light_signal_front_left,
        light_signal_center_left: msg.light_signal_center_left,
        light_signal_center_right: msg.light_signal_center_right,
        light_signal_front_right: msg.light_signal_front_right,
        light_signal_right: msg.light_signal_right,
      }),
      std::borrow::Cow::Borrowed(msg) => std::borrow::Cow::Owned(Self::RmwMsg {
        header: std_msgs::msg::Header::into_rmw_message(std::borrow::Cow::Borrowed(&msg.header)).into_owned(),
      is_left_pressed: msg.is_left_pressed,
      is_right_pressed: msg.is_right_pressed,
      is_light_left: msg.is_light_left,
      is_light_front_left: msg.is_light_front_left,
      is_light_center_left: msg.is_light_center_left,
      is_light_center_right: msg.is_light_center_right,
      is_light_front_right: msg.is_light_front_right,
      is_light_right: msg.is_light_right,
      light_signal_left: msg.light_signal_left,
      light_signal_front_left: msg.light_signal_front_left,
      light_signal_center_left: msg.light_signal_center_left,
      light_signal_center_right: msg.light_signal_center_right,
      light_signal_front_right: msg.light_signal_front_right,
      light_signal_right: msg.light_signal_right,
      })
    }
  }

  fn from_rmw_message(msg: Self::RmwMsg) -> Self {
    Self {
      header: std_msgs::msg::Header::from_rmw_message(msg.header),
      is_left_pressed: msg.is_left_pressed,
      is_right_pressed: msg.is_right_pressed,
      is_light_left: msg.is_light_left,
      is_light_front_left: msg.is_light_front_left,
      is_light_center_left: msg.is_light_center_left,
      is_light_center_right: msg.is_light_center_right,
      is_light_front_right: msg.is_light_front_right,
      is_light_right: msg.is_light_right,
      light_signal_left: msg.light_signal_left,
      light_signal_front_left: msg.light_signal_front_left,
      light_signal_center_left: msg.light_signal_center_left,
      light_signal_center_right: msg.light_signal_center_right,
      light_signal_front_right: msg.light_signal_front_right,
      light_signal_right: msg.light_signal_right,
    }
  }
}


// Corresponds to create_msgs__msg__ChargingState

// This struct is not documented.
#[allow(missing_docs)]

#[cfg_attr(feature = "serde", derive(Deserialize, Serialize))]
#[derive(Clone, Debug, PartialEq, PartialOrd)]
pub struct ChargingState {

    // This member is not documented.
    #[allow(missing_docs)]
    pub header: std_msgs::msg::Header,


    // This member is not documented.
    #[allow(missing_docs)]
    pub state: u8,

}

impl ChargingState {

    // This constant is not documented.
    #[allow(missing_docs)]
    pub const CHARGE_NONE: u8 = 0;


    // This constant is not documented.
    #[allow(missing_docs)]
    pub const CHARGE_RECONDITION: u8 = 1;


    // This constant is not documented.
    #[allow(missing_docs)]
    pub const CHARGE_FULL: u8 = 2;


    // This constant is not documented.
    #[allow(missing_docs)]
    pub const CHARGE_TRICKLE: u8 = 3;


    // This constant is not documented.
    #[allow(missing_docs)]
    pub const CHARGE_WAITING: u8 = 4;


    // This constant is not documented.
    #[allow(missing_docs)]
    pub const CHARGE_FAULT: u8 = 5;

}


impl Default for ChargingState {
  fn default() -> Self {
    <Self as rosidl_runtime_rs::Message>::from_rmw_message(super::msg::rmw::ChargingState::default())
  }
}

impl rosidl_runtime_rs::Message for ChargingState {
  type RmwMsg = super::msg::rmw::ChargingState;

  fn into_rmw_message(msg_cow: std::borrow::Cow<'_, Self>) -> std::borrow::Cow<'_, Self::RmwMsg> {
    match msg_cow {
      std::borrow::Cow::Owned(msg) => std::borrow::Cow::Owned(Self::RmwMsg {
        header: std_msgs::msg::Header::into_rmw_message(std::borrow::Cow::Owned(msg.header)).into_owned(),
        state: msg.state,
      }),
      std::borrow::Cow::Borrowed(msg) => std::borrow::Cow::Owned(Self::RmwMsg {
        header: std_msgs::msg::Header::into_rmw_message(std::borrow::Cow::Borrowed(&msg.header)).into_owned(),
      state: msg.state,
      })
    }
  }

  fn from_rmw_message(msg: Self::RmwMsg) -> Self {
    Self {
      header: std_msgs::msg::Header::from_rmw_message(msg.header),
      state: msg.state,
    }
  }
}


// Corresponds to create_msgs__msg__DefineSong

// This struct is not documented.
#[allow(missing_docs)]

#[cfg_attr(feature = "serde", derive(Deserialize, Serialize))]
#[derive(Clone, Debug, PartialEq, PartialOrd)]
pub struct DefineSong {
    /// song number
    pub song: u8,

    /// song length
    pub length: u8,

    /// notes defined by the MIDI note numbering scheme. Notes outside the range of are rest notes.
    pub notes: Vec<u8>,

    /// durations in seconds. Maximum duration is 255/64.
    pub durations: Vec<f32>,

}



impl Default for DefineSong {
  fn default() -> Self {
    <Self as rosidl_runtime_rs::Message>::from_rmw_message(super::msg::rmw::DefineSong::default())
  }
}

impl rosidl_runtime_rs::Message for DefineSong {
  type RmwMsg = super::msg::rmw::DefineSong;

  fn into_rmw_message(msg_cow: std::borrow::Cow<'_, Self>) -> std::borrow::Cow<'_, Self::RmwMsg> {
    match msg_cow {
      std::borrow::Cow::Owned(msg) => std::borrow::Cow::Owned(Self::RmwMsg {
        song: msg.song,
        length: msg.length,
        notes: msg.notes.into(),
        durations: msg.durations.into(),
      }),
      std::borrow::Cow::Borrowed(msg) => std::borrow::Cow::Owned(Self::RmwMsg {
      song: msg.song,
      length: msg.length,
        notes: msg.notes.as_slice().into(),
        durations: msg.durations.as_slice().into(),
      })
    }
  }

  fn from_rmw_message(msg: Self::RmwMsg) -> Self {
    Self {
      song: msg.song,
      length: msg.length,
      notes: msg.notes
          .into_iter()
          .collect(),
      durations: msg.durations
          .into_iter()
          .collect(),
    }
  }
}


// Corresponds to create_msgs__msg__Mode

// This struct is not documented.
#[allow(missing_docs)]

#[cfg_attr(feature = "serde", derive(Deserialize, Serialize))]
#[derive(Clone, Debug, PartialEq, PartialOrd)]
pub struct Mode {

    // This member is not documented.
    #[allow(missing_docs)]
    pub header: std_msgs::msg::Header,


    // This member is not documented.
    #[allow(missing_docs)]
    pub mode: u8,

}

impl Mode {

    // This constant is not documented.
    #[allow(missing_docs)]
    pub const MODE_OFF: u8 = 0;


    // This constant is not documented.
    #[allow(missing_docs)]
    pub const MODE_PASSIVE: u8 = 1;


    // This constant is not documented.
    #[allow(missing_docs)]
    pub const MODE_SAFE: u8 = 2;


    // This constant is not documented.
    #[allow(missing_docs)]
    pub const MODE_FULL: u8 = 3;

}


impl Default for Mode {
  fn default() -> Self {
    <Self as rosidl_runtime_rs::Message>::from_rmw_message(super::msg::rmw::Mode::default())
  }
}

impl rosidl_runtime_rs::Message for Mode {
  type RmwMsg = super::msg::rmw::Mode;

  fn into_rmw_message(msg_cow: std::borrow::Cow<'_, Self>) -> std::borrow::Cow<'_, Self::RmwMsg> {
    match msg_cow {
      std::borrow::Cow::Owned(msg) => std::borrow::Cow::Owned(Self::RmwMsg {
        header: std_msgs::msg::Header::into_rmw_message(std::borrow::Cow::Owned(msg.header)).into_owned(),
        mode: msg.mode,
      }),
      std::borrow::Cow::Borrowed(msg) => std::borrow::Cow::Owned(Self::RmwMsg {
        header: std_msgs::msg::Header::into_rmw_message(std::borrow::Cow::Borrowed(&msg.header)).into_owned(),
      mode: msg.mode,
      })
    }
  }

  fn from_rmw_message(msg: Self::RmwMsg) -> Self {
    Self {
      header: std_msgs::msg::Header::from_rmw_message(msg.header),
      mode: msg.mode,
    }
  }
}


// Corresponds to create_msgs__msg__PlaySong

// This struct is not documented.
#[allow(missing_docs)]

#[cfg_attr(feature = "serde", derive(Deserialize, Serialize))]
#[derive(Clone, Debug, PartialEq, PartialOrd)]
pub struct PlaySong {
    /// song number
    pub song: u8,

}



impl Default for PlaySong {
  fn default() -> Self {
    <Self as rosidl_runtime_rs::Message>::from_rmw_message(super::msg::rmw::PlaySong::default())
  }
}

impl rosidl_runtime_rs::Message for PlaySong {
  type RmwMsg = super::msg::rmw::PlaySong;

  fn into_rmw_message(msg_cow: std::borrow::Cow<'_, Self>) -> std::borrow::Cow<'_, Self::RmwMsg> {
    match msg_cow {
      std::borrow::Cow::Owned(msg) => std::borrow::Cow::Owned(Self::RmwMsg {
        song: msg.song,
      }),
      std::borrow::Cow::Borrowed(msg) => std::borrow::Cow::Owned(Self::RmwMsg {
      song: msg.song,
      })
    }
  }

  fn from_rmw_message(msg: Self::RmwMsg) -> Self {
    Self {
      song: msg.song,
    }
  }
}


// Corresponds to create_msgs__msg__MotorSetpoint
/// For the main and side brush motors, provide a duty cycle in the range [-1, 1]
/// The range of acceptable values for the vacuum motor is [0, 1]

#[cfg_attr(feature = "serde", derive(Deserialize, Serialize))]
#[derive(Clone, Debug, PartialEq, PartialOrd)]
pub struct MotorSetpoint {

    // This member is not documented.
    #[allow(missing_docs)]
    pub duty_cycle: f32,

}



impl Default for MotorSetpoint {
  fn default() -> Self {
    <Self as rosidl_runtime_rs::Message>::from_rmw_message(super::msg::rmw::MotorSetpoint::default())
  }
}

impl rosidl_runtime_rs::Message for MotorSetpoint {
  type RmwMsg = super::msg::rmw::MotorSetpoint;

  fn into_rmw_message(msg_cow: std::borrow::Cow<'_, Self>) -> std::borrow::Cow<'_, Self::RmwMsg> {
    match msg_cow {
      std::borrow::Cow::Owned(msg) => std::borrow::Cow::Owned(Self::RmwMsg {
        duty_cycle: msg.duty_cycle,
      }),
      std::borrow::Cow::Borrowed(msg) => std::borrow::Cow::Owned(Self::RmwMsg {
      duty_cycle: msg.duty_cycle,
      })
    }
  }

  fn from_rmw_message(msg: Self::RmwMsg) -> Self {
    Self {
      duty_cycle: msg.duty_cycle,
    }
  }
}


// Corresponds to create_msgs__msg__Cliff

// This struct is not documented.
#[allow(missing_docs)]

#[cfg_attr(feature = "serde", derive(Deserialize, Serialize))]
#[derive(Clone, Debug, PartialEq, PartialOrd)]
pub struct Cliff {

    // This member is not documented.
    #[allow(missing_docs)]
    pub header: std_msgs::msg::Header,


    // This member is not documented.
    #[allow(missing_docs)]
    pub is_cliff_left: bool,


    // This member is not documented.
    #[allow(missing_docs)]
    pub is_cliff_front_left: bool,


    // This member is not documented.
    #[allow(missing_docs)]
    pub is_cliff_right: bool,


    // This member is not documented.
    #[allow(missing_docs)]
    pub is_cliff_front_right: bool,

}



impl Default for Cliff {
  fn default() -> Self {
    <Self as rosidl_runtime_rs::Message>::from_rmw_message(super::msg::rmw::Cliff::default())
  }
}

impl rosidl_runtime_rs::Message for Cliff {
  type RmwMsg = super::msg::rmw::Cliff;

  fn into_rmw_message(msg_cow: std::borrow::Cow<'_, Self>) -> std::borrow::Cow<'_, Self::RmwMsg> {
    match msg_cow {
      std::borrow::Cow::Owned(msg) => std::borrow::Cow::Owned(Self::RmwMsg {
        header: std_msgs::msg::Header::into_rmw_message(std::borrow::Cow::Owned(msg.header)).into_owned(),
        is_cliff_left: msg.is_cliff_left,
        is_cliff_front_left: msg.is_cliff_front_left,
        is_cliff_right: msg.is_cliff_right,
        is_cliff_front_right: msg.is_cliff_front_right,
      }),
      std::borrow::Cow::Borrowed(msg) => std::borrow::Cow::Owned(Self::RmwMsg {
        header: std_msgs::msg::Header::into_rmw_message(std::borrow::Cow::Borrowed(&msg.header)).into_owned(),
      is_cliff_left: msg.is_cliff_left,
      is_cliff_front_left: msg.is_cliff_front_left,
      is_cliff_right: msg.is_cliff_right,
      is_cliff_front_right: msg.is_cliff_front_right,
      })
    }
  }

  fn from_rmw_message(msg: Self::RmwMsg) -> Self {
    Self {
      header: std_msgs::msg::Header::from_rmw_message(msg.header),
      is_cliff_left: msg.is_cliff_left,
      is_cliff_front_left: msg.is_cliff_front_left,
      is_cliff_right: msg.is_cliff_right,
      is_cliff_front_right: msg.is_cliff_front_right,
    }
  }
}


