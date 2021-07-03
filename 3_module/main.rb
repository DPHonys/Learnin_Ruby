# frozen_string_literal: true

require_relative 'robot'
require_relative 'arm'

robot = Robot.new('Robert')

robot.shout('aBc')
robot.whisper('aBc')
robot.secret('aBc')

arm1 = Arm.new(1, :poker)
arm2 = Arm.new(2, :slasher)
arm3 = Arm.new(3, :grabber)
arm4 = Arm.new(4, :poker)

robot.add_arms(arm1, arm2, arm3, arm4)

robot.introduce

# puts robot == robot # true
puts robot == Robot.new('test') # false
