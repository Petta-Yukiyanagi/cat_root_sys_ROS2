# generated from rosidl_generator_py/resource/_idl.py.em
# with input from catui_msgs:msg/CatUICommand.idl
# generated code does not contain a copyright notice


# Import statements for member types

import builtins  # noqa: E402, I100

import math  # noqa: E402, I100

import rosidl_parser.definition  # noqa: E402, I100


class Metaclass_CatUICommand(type):
    """Metaclass of message 'CatUICommand'."""

    _CREATE_ROS_MESSAGE = None
    _CONVERT_FROM_PY = None
    _CONVERT_TO_PY = None
    _DESTROY_ROS_MESSAGE = None
    _TYPE_SUPPORT = None

    __constants = {
    }

    @classmethod
    def __import_type_support__(cls):
        try:
            from rosidl_generator_py import import_type_support
            module = import_type_support('catui_msgs')
        except ImportError:
            import logging
            import traceback
            logger = logging.getLogger(
                'catui_msgs.msg.CatUICommand')
            logger.debug(
                'Failed to import needed modules for type support:\n' +
                traceback.format_exc())
        else:
            cls._CREATE_ROS_MESSAGE = module.create_ros_message_msg__msg__cat_ui_command
            cls._CONVERT_FROM_PY = module.convert_from_py_msg__msg__cat_ui_command
            cls._CONVERT_TO_PY = module.convert_to_py_msg__msg__cat_ui_command
            cls._TYPE_SUPPORT = module.type_support_msg__msg__cat_ui_command
            cls._DESTROY_ROS_MESSAGE = module.destroy_ros_message_msg__msg__cat_ui_command

    @classmethod
    def __prepare__(cls, name, bases, **kwargs):
        # list constant names here so that they appear in the help text of
        # the message class under "Data and other attributes defined here:"
        # as well as populate each message instance
        return {
        }


class CatUICommand(metaclass=Metaclass_CatUICommand):
    """Message class 'CatUICommand'."""

    __slots__ = [
        '_face_id',
        '_text',
        '_reset_after',
    ]

    _fields_and_field_types = {
        'face_id': 'int32',
        'text': 'string',
        'reset_after': 'float',
    }

    SLOT_TYPES = (
        rosidl_parser.definition.BasicType('int32'),  # noqa: E501
        rosidl_parser.definition.UnboundedString(),  # noqa: E501
        rosidl_parser.definition.BasicType('float'),  # noqa: E501
    )

    def __init__(self, **kwargs):
        assert all('_' + key in self.__slots__ for key in kwargs.keys()), \
            'Invalid arguments passed to constructor: %s' % \
            ', '.join(sorted(k for k in kwargs.keys() if '_' + k not in self.__slots__))
        self.face_id = kwargs.get('face_id', int())
        self.text = kwargs.get('text', str())
        self.reset_after = kwargs.get('reset_after', float())

    def __repr__(self):
        typename = self.__class__.__module__.split('.')
        typename.pop()
        typename.append(self.__class__.__name__)
        args = []
        for s, t in zip(self.__slots__, self.SLOT_TYPES):
            field = getattr(self, s)
            fieldstr = repr(field)
            # We use Python array type for fields that can be directly stored
            # in them, and "normal" sequences for everything else.  If it is
            # a type that we store in an array, strip off the 'array' portion.
            if (
                isinstance(t, rosidl_parser.definition.AbstractSequence) and
                isinstance(t.value_type, rosidl_parser.definition.BasicType) and
                t.value_type.typename in ['float', 'double', 'int8', 'uint8', 'int16', 'uint16', 'int32', 'uint32', 'int64', 'uint64']
            ):
                if len(field) == 0:
                    fieldstr = '[]'
                else:
                    assert fieldstr.startswith('array(')
                    prefix = "array('X', "
                    suffix = ')'
                    fieldstr = fieldstr[len(prefix):-len(suffix)]
            args.append(s[1:] + '=' + fieldstr)
        return '%s(%s)' % ('.'.join(typename), ', '.join(args))

    def __eq__(self, other):
        if not isinstance(other, self.__class__):
            return False
        if self.face_id != other.face_id:
            return False
        if self.text != other.text:
            return False
        if self.reset_after != other.reset_after:
            return False
        return True

    @classmethod
    def get_fields_and_field_types(cls):
        from copy import copy
        return copy(cls._fields_and_field_types)

    @builtins.property
    def face_id(self):
        """Message field 'face_id'."""
        return self._face_id

    @face_id.setter
    def face_id(self, value):
        if __debug__:
            assert \
                isinstance(value, int), \
                "The 'face_id' field must be of type 'int'"
            assert value >= -2147483648 and value < 2147483648, \
                "The 'face_id' field must be an integer in [-2147483648, 2147483647]"
        self._face_id = value

    @builtins.property
    def text(self):
        """Message field 'text'."""
        return self._text

    @text.setter
    def text(self, value):
        if __debug__:
            assert \
                isinstance(value, str), \
                "The 'text' field must be of type 'str'"
        self._text = value

    @builtins.property
    def reset_after(self):
        """Message field 'reset_after'."""
        return self._reset_after

    @reset_after.setter
    def reset_after(self, value):
        if __debug__:
            assert \
                isinstance(value, float), \
                "The 'reset_after' field must be of type 'float'"
            assert not (value < -3.402823466e+38 or value > 3.402823466e+38) or math.isinf(value), \
                "The 'reset_after' field must be a float in [-3.402823466e+38, 3.402823466e+38]"
        self._reset_after = value
