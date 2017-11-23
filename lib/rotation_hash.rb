# frozen_string_literal: true

# A Hash descendant with elements count limit and rotation
#
# @example Create a new RotationHash with the limit
#   rh = RotationHash.new(3, 'default_value')
#   rh['one']      = 1
#   rh['two']      = 2
#   rh['three']    = 3
#   rh['whatever'] = '¯\_(ツ)_/¯'
#
#   p rh['inexistent'] # => "default_value"
#   p rh               # => {"two"=>2, "three"=>3, "whatever"=>"¯\_(ツ)_/¯"}
#
class RotationHash < Hash
  # Current library version
  VERSION = '0.1.0'

  # Create a new RotationHash
  # @param [Integer] rotation_limit the max possible elements count
  # @param [Array<Object>] args Any number of Objects to pass to the Hash
  #
  # @note The first argument used to set a limit all the others passed
  #       to the Hash as is.
  def initialize(rotation_limit, *args)
    @rotation_limit = rotation_limit
    super(*args)
  end

  # Overloaded Hash assignment method.
  # Adds elements and on reaching the limit automatically rotates the Hash
  #
  # @param [Object] key the key to assign the value to
  # @param [Object] value the value to set on the key
  #
  # @return [Object] the object that was assigned to the key
  def []=(key, value)
    shift if length + 1 > @rotation_limit
    super(key, value)
  end
end
