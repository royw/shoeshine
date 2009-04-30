require 'spec_helper'

describe "DropDownMenuWidget" do
  before(:each) do
    @menu = DropDownMenuWidget.new(nil, nil, nil, nil)
  end

  it "should trigger on left button" do
    button = 1
    trigger = DropDownMenuWidget::LEFT_BUTTON
    @menu.send('trigger_fired?', button, trigger).should be_true
  end
  it "should trigger on middle button" do
    button = 2
    trigger = DropDownMenuWidget::MIDDLE_BUTTON
    @menu.send('trigger_fired?', button, trigger).should be_true
  end
  it "should trigger on right button" do
    button = 3
    trigger = DropDownMenuWidget::RIGHT_BUTTON
    @menu.send('trigger_fired?', button, trigger).should be_true
  end

  it "should not trigger on left button" do
    button = 1
    trigger = DropDownMenuWidget::MIDDLE_BUTTON | DropDownMenuWidget::RIGHT_BUTTON
    @menu.send('trigger_fired?', button, trigger).should be_false
  end
  it "should not trigger on middle button" do
    button = 2
    trigger = DropDownMenuWidget::LEFT_BUTTON | DropDownMenuWidget::RIGHT_BUTTON
    @menu.send('trigger_fired?', button, trigger).should be_false
  end
  it "should not trigger on right button" do
    button = 3
    trigger = DropDownMenuWidget::LEFT_BUTTON | DropDownMenuWidget::MIDDLE_BUTTON
    @menu.send('trigger_fired?', button, trigger).should be_false
  end

  it "should trigger on either left or middle but not right button" do
    trigger = DropDownMenuWidget::LEFT_BUTTON | DropDownMenuWidget::MIDDLE_BUTTON
    (@menu.send('trigger_fired?', 1, trigger).should be_true) &&
    (@menu.send('trigger_fired?', 2, trigger).should be_true) &&
    (@menu.send('trigger_fired?', 3, trigger).should be_false)
  end
  it "should trigger on either left or right but not middle button" do
    trigger = DropDownMenuWidget::LEFT_BUTTON | DropDownMenuWidget::RIGHT_BUTTON
    (@menu.send('trigger_fired?', 1, trigger).should be_true) &&
    (@menu.send('trigger_fired?', 2, trigger).should be_false) &&
    (@menu.send('trigger_fired?', 3, trigger).should be_true)
  end
  it "should trigger on either middle or right but not left button" do
    trigger = DropDownMenuWidget::MIDDLE_BUTTON | DropDownMenuWidget::RIGHT_BUTTON
    (@menu.send('trigger_fired?', 1, trigger).should be_false) &&
    (@menu.send('trigger_fired?', 2, trigger).should be_true) &&
    (@menu.send('trigger_fired?', 3, trigger).should be_true)
  end

  it "should trigger on left, middle or right" do
    trigger = DropDownMenuWidget::LEFT_BUTTON | DropDownMenuWidget::MIDDLE_BUTTON | DropDownMenuWidget::RIGHT_BUTTON
    (@menu.send('trigger_fired?', 1, trigger).should be_true) &&
    (@menu.send('trigger_fired?', 2, trigger).should be_true) &&
    (@menu.send('trigger_fired?', 3, trigger).should be_true)
  end

  it "should not trigger when button is out of range on left, middle or right" do
    trigger = DropDownMenuWidget::MIDDLE_BUTTON | DropDownMenuWidget::RIGHT_BUTTON
    (@menu.send('trigger_fired?', 0, trigger).should be_false) &&
    (@menu.send('trigger_fired?', 4, trigger).should be_false) &&
    (@menu.send('trigger_fired?', 8, trigger).should be_false)
  end
end
