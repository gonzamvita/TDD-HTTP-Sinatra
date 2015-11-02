require 'Pry'

class Board
  def initialize
    @grid = [
      [:bR, :bN, :bB, :bQ, :bK, :bB, :bN, :bR],
      [:bP, :bP, :bP, :bP, :bP, :bP, :bP, :bP],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [:wP, :wP, :wP, :wP, :wP, :wP, :wP, :wP],
      [:wR, :wN, :wB, :wQ, :wK, :wB, :wN, :wR]
    ]
    @pieces = {
      bR: Rook, wR: Rook,
      bN: Knight, wN: Knight,
      bB: Bishop, wB: Bishop,
      bQ: Queen, wQ: Queen,
      bK: King, wK: King,
      bP: Pawn, wP: Pawn
    }
    #binding.pry
  end

  def getFileMovements
    movArr = fileReader.readFileToArray
    translateToCoords(movArr)
  end

  def translateToCoords(movArr)
    movArr.each { |movement| movement }
  end

  def move(origin, destination)
    return false if origin == destination
    @pieces[@grid[origin[0]][origin[1]]].validate_move(origin, destination);
  end
end

class FileReader
  def initialize(file)
    @file = file
  end

  def readFileToArray
    content = File.open(@file).read

    content.each_line do |line|
      movements_array << line.split(" ")
    end
  end
end

class Rook
  def self.validate_move(origin, destination)
    origin[0] == destination[0] || origin [1] == destination [1]
  end
end


class Pawn
  def self.validate_move(origin, destination)
    return first_movement if (origin[0] - destination[0]) == 2
    (origin[0] - destination[0]) == 1 && (origin[1] == destination[1])
  end

  def first_movement
    (origin[0] - destination[0]) == 2 && (origin[1] == destination[1])
  end
end

class King
  def self.validate_move(origin, destination)
    origin[0] == destination[0] || origin [1] == destination [1]
  end
end

class Knight
  def self.validate_move(origin, destination)
    if (origin[0]-destination[0]).abs == 1
      (origin[1]-destination[1]).abs == 2
    else (origin[0]-destination[0]) == 2
      (origin[1]-destination[1]).abs == 1
    end
  end
end

class Bishop
  def self.validate_move(origin, destination)
    (origin[0]-destination[0]).abs == (origin[1]-destination[1]).abs
  end
end

class Queen
  def self.validate_move(origin, destination)
    if (origin[0]-destination[0]).abs == (origin[1]-destination[1]).abs
      true
    else
      origin[0] == destination[0] || origin [1] == destination [1]
    end
  end
end

RSpec.describe "Rook" do
  it "should return true for a Rook valid movement" do
    origin = [0,7]
    destination = [0,5]
    expect(Rook.validate_move(origin, destination)).to be true
  end

  it "should return false for a Rook invalid movement" do
    origin = [0,0]
    destination = [3,3]
    expect(Rook.validate_move(origin, destination)).to be false
  end
end
