#[cfg(feature = "serde")]
use serde::{Deserialize, Serialize};


#[link(name = "create_msgs__rosidl_typesupport_c")]
extern "C" {
    fn rosidl_typesupport_c__get_message_type_support_handle__create_msgs__msg__Bumper() -> *const std::ffi::c_void;
}

#[link(name = "create_msgs__rosidl_generator_c")]
extern "C" {
    fn create_msgs__msg__Bumper__init(msg: *mut Bumper) -> bool;
    fn create_msgs__msg__Bumper__Sequence__init(seq: *mut rosidl_runtime_rs::Sequence<Bumper>, size: usize) -> bool;
    fn create_msgs__msg__Bumper__Sequence__fini(seq: *mut rosidl_runtime_rs::Sequence<Bumper>);
    fn create_msgs__msg__Bumper__Sequence__copy(in_seq: &rosidl_runtime_rs::Sequence<Bumper>, out_seq: *mut rosidl_runtime_rs::Sequence<Bumper>) -> bool;
}

// Corresponds to create_msgs__msg__Bumper
#[cfg_attr(feature = "serde", derive(Deserialize, Serialize))]


// This struct is not documented.
#[allow(missing_docs)]

#[repr(C)]
#[derive(Clone, Debug, PartialEq, PartialOrd)]
pub struct Bumper {

    // This member is not documented.
    #[allow(missing_docs)]
    pub header: std_msgs::msg::rmw::Header,

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
    unsafe {
      let mut msg = std::mem::zeroed();
      if !create_msgs__msg__Bumper__init(&mut msg as *mut _) {
        panic!("Call to create_msgs__msg__Bumper__init() failed");
      }
      msg
    }
  }
}

impl rosidl_runtime_rs::SequenceAlloc for Bumper {
  fn sequence_init(seq: &mut rosidl_runtime_rs::Sequence<Self>, size: usize) -> bool {
    // SAFETY: This is safe since the pointer is guaranteed to be valid/initialized.
    unsafe { create_msgs__msg__Bumper__Sequence__init(seq as *mut _, size) }
  }
  fn sequence_fini(seq: &mut rosidl_runtime_rs::Sequence<Self>) {
    // SAFETY: This is safe since the pointer is guaranteed to be valid/initialized.
    unsafe { create_msgs__msg__Bumper__Sequence__fini(seq as *mut _) }
  }
  fn sequence_copy(in_seq: &rosidl_runtime_rs::Sequence<Self>, out_seq: &mut rosidl_runtime_rs::Sequence<Self>) -> bool {
    // SAFETY: This is safe since the pointer is guaranteed to be valid/initialized.
    unsafe { create_msgs__msg__Bumper__Sequence__copy(in_seq, out_seq as *mut _) }
  }
}

impl rosidl_runtime_rs::Message for Bumper {
  type RmwMsg = Self;
  fn into_rmw_message(msg_cow: std::borrow::Cow<'_, Self>) -> std::borrow::Cow<'_, Self::RmwMsg> { msg_cow }
  fn from_rmw_message(msg: Self::RmwMsg) -> Self { msg }
}

impl rosidl_runtime_rs::RmwMessage for Bumper where Self: Sized {
  const TYPE_NAME: &'static str = "create_msgs/msg/Bumper";
  fn get_type_support() -> *const std::ffi::c_void {
    // SAFETY: No preconditions for this function.
    unsafe { rosidl_typesupport_c__get_message_type_support_handle__create_msgs__msg__Bumper() }
  }
}


#[link(name = "create_msgs__rosidl_typesupport_c")]
extern "C" {
    fn rosidl_typesupport_c__get_message_type_support_handle__create_msgs__msg__ChargingState() -> *const std::ffi::c_void;
}

#[link(name = "create_msgs__rosidl_generator_c")]
extern "C" {
    fn create_msgs__msg__ChargingState__init(msg: *mut ChargingState) -> bool;
    fn create_msgs__msg__ChargingState__Sequence__init(seq: *mut rosidl_runtime_rs::Sequence<ChargingState>, size: usize) -> bool;
    fn create_msgs__msg__ChargingState__Sequence__fini(seq: *mut rosidl_runtime_rs::Sequence<ChargingState>);
    fn create_msgs__msg__ChargingState__Sequence__copy(in_seq: &rosidl_runtime_rs::Sequence<ChargingState>, out_seq: *mut rosidl_runtime_rs::Sequence<ChargingState>) -> bool;
}

// Corresponds to create_msgs__msg__ChargingState
#[cfg_attr(feature = "serde", derive(Deserialize, Serialize))]


// This struct is not documented.
#[allow(missing_docs)]

#[repr(C)]
#[derive(Clone, Debug, PartialEq, PartialOrd)]
pub struct ChargingState {

    // This member is not documented.
    #[allow(missing_docs)]
    pub header: std_msgs::msg::rmw::Header,


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
    unsafe {
      let mut msg = std::mem::zeroed();
      if !create_msgs__msg__ChargingState__init(&mut msg as *mut _) {
        panic!("Call to create_msgs__msg__ChargingState__init() failed");
      }
      msg
    }
  }
}

impl rosidl_runtime_rs::SequenceAlloc for ChargingState {
  fn sequence_init(seq: &mut rosidl_runtime_rs::Sequence<Self>, size: usize) -> bool {
    // SAFETY: This is safe since the pointer is guaranteed to be valid/initialized.
    unsafe { create_msgs__msg__ChargingState__Sequence__init(seq as *mut _, size) }
  }
  fn sequence_fini(seq: &mut rosidl_runtime_rs::Sequence<Self>) {
    // SAFETY: This is safe since the pointer is guaranteed to be valid/initialized.
    unsafe { create_msgs__msg__ChargingState__Sequence__fini(seq as *mut _) }
  }
  fn sequence_copy(in_seq: &rosidl_runtime_rs::Sequence<Self>, out_seq: &mut rosidl_runtime_rs::Sequence<Self>) -> bool {
    // SAFETY: This is safe since the pointer is guaranteed to be valid/initialized.
    unsafe { create_msgs__msg__ChargingState__Sequence__copy(in_seq, out_seq as *mut _) }
  }
}

impl rosidl_runtime_rs::Message for ChargingState {
  type RmwMsg = Self;
  fn into_rmw_message(msg_cow: std::borrow::Cow<'_, Self>) -> std::borrow::Cow<'_, Self::RmwMsg> { msg_cow }
  fn from_rmw_message(msg: Self::RmwMsg) -> Self { msg }
}

impl rosidl_runtime_rs::RmwMessage for ChargingState where Self: Sized {
  const TYPE_NAME: &'static str = "create_msgs/msg/ChargingState";
  fn get_type_support() -> *const std::ffi::c_void {
    // SAFETY: No preconditions for this function.
    unsafe { rosidl_typesupport_c__get_message_type_support_handle__create_msgs__msg__ChargingState() }
  }
}


#[link(name = "create_msgs__rosidl_typesupport_c")]
extern "C" {
    fn rosidl_typesupport_c__get_message_type_support_handle__create_msgs__msg__DefineSong() -> *const std::ffi::c_void;
}

#[link(name = "create_msgs__rosidl_generator_c")]
extern "C" {
    fn create_msgs__msg__DefineSong__init(msg: *mut DefineSong) -> bool;
    fn create_msgs__msg__DefineSong__Sequence__init(seq: *mut rosidl_runtime_rs::Sequence<DefineSong>, size: usize) -> bool;
    fn create_msgs__msg__DefineSong__Sequence__fini(seq: *mut rosidl_runtime_rs::Sequence<DefineSong>);
    fn create_msgs__msg__DefineSong__Sequence__copy(in_seq: &rosidl_runtime_rs::Sequence<DefineSong>, out_seq: *mut rosidl_runtime_rs::Sequence<DefineSong>) -> bool;
}

// Corresponds to create_msgs__msg__DefineSong
#[cfg_attr(feature = "serde", derive(Deserialize, Serialize))]


// This struct is not documented.
#[allow(missing_docs)]

#[repr(C)]
#[derive(Clone, Debug, PartialEq, PartialOrd)]
pub struct DefineSong {
    /// song number
    pub song: u8,

    /// song length
    pub length: u8,

    /// notes defined by the MIDI note numbering scheme. Notes outside the range of are rest notes.
    pub notes: rosidl_runtime_rs::Sequence<u8>,

    /// durations in seconds. Maximum duration is 255/64.
    pub durations: rosidl_runtime_rs::Sequence<f32>,

}



impl Default for DefineSong {
  fn default() -> Self {
    unsafe {
      let mut msg = std::mem::zeroed();
      if !create_msgs__msg__DefineSong__init(&mut msg as *mut _) {
        panic!("Call to create_msgs__msg__DefineSong__init() failed");
      }
      msg
    }
  }
}

impl rosidl_runtime_rs::SequenceAlloc for DefineSong {
  fn sequence_init(seq: &mut rosidl_runtime_rs::Sequence<Self>, size: usize) -> bool {
    // SAFETY: This is safe since the pointer is guaranteed to be valid/initialized.
    unsafe { create_msgs__msg__DefineSong__Sequence__init(seq as *mut _, size) }
  }
  fn sequence_fini(seq: &mut rosidl_runtime_rs::Sequence<Self>) {
    // SAFETY: This is safe since the pointer is guaranteed to be valid/initialized.
    unsafe { create_msgs__msg__DefineSong__Sequence__fini(seq as *mut _) }
  }
  fn sequence_copy(in_seq: &rosidl_runtime_rs::Sequence<Self>, out_seq: &mut rosidl_runtime_rs::Sequence<Self>) -> bool {
    // SAFETY: This is safe since the pointer is guaranteed to be valid/initialized.
    unsafe { create_msgs__msg__DefineSong__Sequence__copy(in_seq, out_seq as *mut _) }
  }
}

impl rosidl_runtime_rs::Message for DefineSong {
  type RmwMsg = Self;
  fn into_rmw_message(msg_cow: std::borrow::Cow<'_, Self>) -> std::borrow::Cow<'_, Self::RmwMsg> { msg_cow }
  fn from_rmw_message(msg: Self::RmwMsg) -> Self { msg }
}

impl rosidl_runtime_rs::RmwMessage for DefineSong where Self: Sized {
  const TYPE_NAME: &'static str = "create_msgs/msg/DefineSong";
  fn get_type_support() -> *const std::ffi::c_void {
    // SAFETY: No preconditions for this function.
    unsafe { rosidl_typesupport_c__get_message_type_support_handle__create_msgs__msg__DefineSong() }
  }
}


#[link(name = "create_msgs__rosidl_typesupport_c")]
extern "C" {
    fn rosidl_typesupport_c__get_message_type_support_handle__create_msgs__msg__Mode() -> *const std::ffi::c_void;
}

#[link(name = "create_msgs__rosidl_generator_c")]
extern "C" {
    fn create_msgs__msg__Mode__init(msg: *mut Mode) -> bool;
    fn create_msgs__msg__Mode__Sequence__init(seq: *mut rosidl_runtime_rs::Sequence<Mode>, size: usize) -> bool;
    fn create_msgs__msg__Mode__Sequence__fini(seq: *mut rosidl_runtime_rs::Sequence<Mode>);
    fn create_msgs__msg__Mode__Sequence__copy(in_seq: &rosidl_runtime_rs::Sequence<Mode>, out_seq: *mut rosidl_runtime_rs::Sequence<Mode>) -> bool;
}

// Corresponds to create_msgs__msg__Mode
#[cfg_attr(feature = "serde", derive(Deserialize, Serialize))]


// This struct is not documented.
#[allow(missing_docs)]

#[repr(C)]
#[derive(Clone, Debug, PartialEq, PartialOrd)]
pub struct Mode {

    // This member is not documented.
    #[allow(missing_docs)]
    pub header: std_msgs::msg::rmw::Header,


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
    unsafe {
      let mut msg = std::mem::zeroed();
      if !create_msgs__msg__Mode__init(&mut msg as *mut _) {
        panic!("Call to create_msgs__msg__Mode__init() failed");
      }
      msg
    }
  }
}

impl rosidl_runtime_rs::SequenceAlloc for Mode {
  fn sequence_init(seq: &mut rosidl_runtime_rs::Sequence<Self>, size: usize) -> bool {
    // SAFETY: This is safe since the pointer is guaranteed to be valid/initialized.
    unsafe { create_msgs__msg__Mode__Sequence__init(seq as *mut _, size) }
  }
  fn sequence_fini(seq: &mut rosidl_runtime_rs::Sequence<Self>) {
    // SAFETY: This is safe since the pointer is guaranteed to be valid/initialized.
    unsafe { create_msgs__msg__Mode__Sequence__fini(seq as *mut _) }
  }
  fn sequence_copy(in_seq: &rosidl_runtime_rs::Sequence<Self>, out_seq: &mut rosidl_runtime_rs::Sequence<Self>) -> bool {
    // SAFETY: This is safe since the pointer is guaranteed to be valid/initialized.
    unsafe { create_msgs__msg__Mode__Sequence__copy(in_seq, out_seq as *mut _) }
  }
}

impl rosidl_runtime_rs::Message for Mode {
  type RmwMsg = Self;
  fn into_rmw_message(msg_cow: std::borrow::Cow<'_, Self>) -> std::borrow::Cow<'_, Self::RmwMsg> { msg_cow }
  fn from_rmw_message(msg: Self::RmwMsg) -> Self { msg }
}

impl rosidl_runtime_rs::RmwMessage for Mode where Self: Sized {
  const TYPE_NAME: &'static str = "create_msgs/msg/Mode";
  fn get_type_support() -> *const std::ffi::c_void {
    // SAFETY: No preconditions for this function.
    unsafe { rosidl_typesupport_c__get_message_type_support_handle__create_msgs__msg__Mode() }
  }
}


#[link(name = "create_msgs__rosidl_typesupport_c")]
extern "C" {
    fn rosidl_typesupport_c__get_message_type_support_handle__create_msgs__msg__PlaySong() -> *const std::ffi::c_void;
}

#[link(name = "create_msgs__rosidl_generator_c")]
extern "C" {
    fn create_msgs__msg__PlaySong__init(msg: *mut PlaySong) -> bool;
    fn create_msgs__msg__PlaySong__Sequence__init(seq: *mut rosidl_runtime_rs::Sequence<PlaySong>, size: usize) -> bool;
    fn create_msgs__msg__PlaySong__Sequence__fini(seq: *mut rosidl_runtime_rs::Sequence<PlaySong>);
    fn create_msgs__msg__PlaySong__Sequence__copy(in_seq: &rosidl_runtime_rs::Sequence<PlaySong>, out_seq: *mut rosidl_runtime_rs::Sequence<PlaySong>) -> bool;
}

// Corresponds to create_msgs__msg__PlaySong
#[cfg_attr(feature = "serde", derive(Deserialize, Serialize))]


// This struct is not documented.
#[allow(missing_docs)]

#[repr(C)]
#[derive(Clone, Debug, PartialEq, PartialOrd)]
pub struct PlaySong {
    /// song number
    pub song: u8,

}



impl Default for PlaySong {
  fn default() -> Self {
    unsafe {
      let mut msg = std::mem::zeroed();
      if !create_msgs__msg__PlaySong__init(&mut msg as *mut _) {
        panic!("Call to create_msgs__msg__PlaySong__init() failed");
      }
      msg
    }
  }
}

impl rosidl_runtime_rs::SequenceAlloc for PlaySong {
  fn sequence_init(seq: &mut rosidl_runtime_rs::Sequence<Self>, size: usize) -> bool {
    // SAFETY: This is safe since the pointer is guaranteed to be valid/initialized.
    unsafe { create_msgs__msg__PlaySong__Sequence__init(seq as *mut _, size) }
  }
  fn sequence_fini(seq: &mut rosidl_runtime_rs::Sequence<Self>) {
    // SAFETY: This is safe since the pointer is guaranteed to be valid/initialized.
    unsafe { create_msgs__msg__PlaySong__Sequence__fini(seq as *mut _) }
  }
  fn sequence_copy(in_seq: &rosidl_runtime_rs::Sequence<Self>, out_seq: &mut rosidl_runtime_rs::Sequence<Self>) -> bool {
    // SAFETY: This is safe since the pointer is guaranteed to be valid/initialized.
    unsafe { create_msgs__msg__PlaySong__Sequence__copy(in_seq, out_seq as *mut _) }
  }
}

impl rosidl_runtime_rs::Message for PlaySong {
  type RmwMsg = Self;
  fn into_rmw_message(msg_cow: std::borrow::Cow<'_, Self>) -> std::borrow::Cow<'_, Self::RmwMsg> { msg_cow }
  fn from_rmw_message(msg: Self::RmwMsg) -> Self { msg }
}

impl rosidl_runtime_rs::RmwMessage for PlaySong where Self: Sized {
  const TYPE_NAME: &'static str = "create_msgs/msg/PlaySong";
  fn get_type_support() -> *const std::ffi::c_void {
    // SAFETY: No preconditions for this function.
    unsafe { rosidl_typesupport_c__get_message_type_support_handle__create_msgs__msg__PlaySong() }
  }
}


#[link(name = "create_msgs__rosidl_typesupport_c")]
extern "C" {
    fn rosidl_typesupport_c__get_message_type_support_handle__create_msgs__msg__MotorSetpoint() -> *const std::ffi::c_void;
}

#[link(name = "create_msgs__rosidl_generator_c")]
extern "C" {
    fn create_msgs__msg__MotorSetpoint__init(msg: *mut MotorSetpoint) -> bool;
    fn create_msgs__msg__MotorSetpoint__Sequence__init(seq: *mut rosidl_runtime_rs::Sequence<MotorSetpoint>, size: usize) -> bool;
    fn create_msgs__msg__MotorSetpoint__Sequence__fini(seq: *mut rosidl_runtime_rs::Sequence<MotorSetpoint>);
    fn create_msgs__msg__MotorSetpoint__Sequence__copy(in_seq: &rosidl_runtime_rs::Sequence<MotorSetpoint>, out_seq: *mut rosidl_runtime_rs::Sequence<MotorSetpoint>) -> bool;
}

// Corresponds to create_msgs__msg__MotorSetpoint
#[cfg_attr(feature = "serde", derive(Deserialize, Serialize))]

/// For the main and side brush motors, provide a duty cycle in the range [-1, 1]
/// The range of acceptable values for the vacuum motor is [0, 1]

#[repr(C)]
#[derive(Clone, Debug, PartialEq, PartialOrd)]
pub struct MotorSetpoint {

    // This member is not documented.
    #[allow(missing_docs)]
    pub duty_cycle: f32,

}



impl Default for MotorSetpoint {
  fn default() -> Self {
    unsafe {
      let mut msg = std::mem::zeroed();
      if !create_msgs__msg__MotorSetpoint__init(&mut msg as *mut _) {
        panic!("Call to create_msgs__msg__MotorSetpoint__init() failed");
      }
      msg
    }
  }
}

impl rosidl_runtime_rs::SequenceAlloc for MotorSetpoint {
  fn sequence_init(seq: &mut rosidl_runtime_rs::Sequence<Self>, size: usize) -> bool {
    // SAFETY: This is safe since the pointer is guaranteed to be valid/initialized.
    unsafe { create_msgs__msg__MotorSetpoint__Sequence__init(seq as *mut _, size) }
  }
  fn sequence_fini(seq: &mut rosidl_runtime_rs::Sequence<Self>) {
    // SAFETY: This is safe since the pointer is guaranteed to be valid/initialized.
    unsafe { create_msgs__msg__MotorSetpoint__Sequence__fini(seq as *mut _) }
  }
  fn sequence_copy(in_seq: &rosidl_runtime_rs::Sequence<Self>, out_seq: &mut rosidl_runtime_rs::Sequence<Self>) -> bool {
    // SAFETY: This is safe since the pointer is guaranteed to be valid/initialized.
    unsafe { create_msgs__msg__MotorSetpoint__Sequence__copy(in_seq, out_seq as *mut _) }
  }
}

impl rosidl_runtime_rs::Message for MotorSetpoint {
  type RmwMsg = Self;
  fn into_rmw_message(msg_cow: std::borrow::Cow<'_, Self>) -> std::borrow::Cow<'_, Self::RmwMsg> { msg_cow }
  fn from_rmw_message(msg: Self::RmwMsg) -> Self { msg }
}

impl rosidl_runtime_rs::RmwMessage for MotorSetpoint where Self: Sized {
  const TYPE_NAME: &'static str = "create_msgs/msg/MotorSetpoint";
  fn get_type_support() -> *const std::ffi::c_void {
    // SAFETY: No preconditions for this function.
    unsafe { rosidl_typesupport_c__get_message_type_support_handle__create_msgs__msg__MotorSetpoint() }
  }
}


#[link(name = "create_msgs__rosidl_typesupport_c")]
extern "C" {
    fn rosidl_typesupport_c__get_message_type_support_handle__create_msgs__msg__Cliff() -> *const std::ffi::c_void;
}

#[link(name = "create_msgs__rosidl_generator_c")]
extern "C" {
    fn create_msgs__msg__Cliff__init(msg: *mut Cliff) -> bool;
    fn create_msgs__msg__Cliff__Sequence__init(seq: *mut rosidl_runtime_rs::Sequence<Cliff>, size: usize) -> bool;
    fn create_msgs__msg__Cliff__Sequence__fini(seq: *mut rosidl_runtime_rs::Sequence<Cliff>);
    fn create_msgs__msg__Cliff__Sequence__copy(in_seq: &rosidl_runtime_rs::Sequence<Cliff>, out_seq: *mut rosidl_runtime_rs::Sequence<Cliff>) -> bool;
}

// Corresponds to create_msgs__msg__Cliff
#[cfg_attr(feature = "serde", derive(Deserialize, Serialize))]


// This struct is not documented.
#[allow(missing_docs)]

#[repr(C)]
#[derive(Clone, Debug, PartialEq, PartialOrd)]
pub struct Cliff {

    // This member is not documented.
    #[allow(missing_docs)]
    pub header: std_msgs::msg::rmw::Header,


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
    unsafe {
      let mut msg = std::mem::zeroed();
      if !create_msgs__msg__Cliff__init(&mut msg as *mut _) {
        panic!("Call to create_msgs__msg__Cliff__init() failed");
      }
      msg
    }
  }
}

impl rosidl_runtime_rs::SequenceAlloc for Cliff {
  fn sequence_init(seq: &mut rosidl_runtime_rs::Sequence<Self>, size: usize) -> bool {
    // SAFETY: This is safe since the pointer is guaranteed to be valid/initialized.
    unsafe { create_msgs__msg__Cliff__Sequence__init(seq as *mut _, size) }
  }
  fn sequence_fini(seq: &mut rosidl_runtime_rs::Sequence<Self>) {
    // SAFETY: This is safe since the pointer is guaranteed to be valid/initialized.
    unsafe { create_msgs__msg__Cliff__Sequence__fini(seq as *mut _) }
  }
  fn sequence_copy(in_seq: &rosidl_runtime_rs::Sequence<Self>, out_seq: &mut rosidl_runtime_rs::Sequence<Self>) -> bool {
    // SAFETY: This is safe since the pointer is guaranteed to be valid/initialized.
    unsafe { create_msgs__msg__Cliff__Sequence__copy(in_seq, out_seq as *mut _) }
  }
}

impl rosidl_runtime_rs::Message for Cliff {
  type RmwMsg = Self;
  fn into_rmw_message(msg_cow: std::borrow::Cow<'_, Self>) -> std::borrow::Cow<'_, Self::RmwMsg> { msg_cow }
  fn from_rmw_message(msg: Self::RmwMsg) -> Self { msg }
}

impl rosidl_runtime_rs::RmwMessage for Cliff where Self: Sized {
  const TYPE_NAME: &'static str = "create_msgs/msg/Cliff";
  fn get_type_support() -> *const std::ffi::c_void {
    // SAFETY: No preconditions for this function.
    unsafe { rosidl_typesupport_c__get_message_type_support_handle__create_msgs__msg__Cliff() }
  }
}


