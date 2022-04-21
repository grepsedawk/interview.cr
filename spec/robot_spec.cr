require "./spec_helper"

Spectator.describe Interview::Robot do
  subject { Interview::Robot.new }

  it "starts at 0,0; facing north" do
    expect(subject.position).to eq [0, 0]
    expect(subject.direction).to eq "north"
  end

  it "can turn left" do
    subject.turn_left
    expect(subject.direction).to eq "west"
    subject.turn_left
    expect(subject.direction).to eq "south"
    subject.turn_left
    expect(subject.direction).to eq "east"
    subject.turn_left
    expect(subject.direction).to eq "north"
  end

  it "can turn right" do
    subject.turn_right
    expect(subject.direction).to eq "east"
    subject.turn_right
    expect(subject.direction).to eq "south"
    subject.turn_right
    expect(subject.direction).to eq "west"
    subject.turn_right
    expect(subject.direction).to eq "north"
  end

  it "can move with direction" do
    subject.move
    expect(subject.position).to eq [0, 1]
    subject.turn_left
    subject.move
    expect(subject.position).to eq [-1, 1]
    subject.move
    expect(subject.position).to eq [-2, 1]
    subject.turn_left
    subject.move
    expect(subject.position).to eq [-2, 0]
    subject.turn_right
    subject.turn_right
    subject.turn_right
    subject.move
    expect(subject.position).to eq [-1, 0]
  end

  it "cannot move into an obstacle" do
    subject.obstacles[[0, 1]] = true
    subject.move
    expect(subject.position).to eq [0, 0]
  end
end
