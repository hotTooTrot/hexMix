require 'test_helper'

class HexTest < ActiveSupport::TestCase
  def setup
    @hexes = hexes(:one)
  end

  test 'fixture is valid' do
    assert @hexes.valid?
  end

  test 'invalid without all hexes filled' do
    @hexes.hex1 = nil
    refute @hexes.valid?
    assert @hexes.errors.keys.include?(:hex1)

    @hexes.hex2 = nil
    refute @hexes.valid?
    assert @hexes.errors.keys.include?(:hex2)

    @hexes.hex3 = nil
    refute @hexes.valid?
    assert @hexes.errors.keys.include?(:hex3)

    @hexes.hex4 = nil
    refute @hexes.valid?
    assert @hexes.errors.keys.include?(:hex4)

    @hexes.hex5 = nil
    refute @hexes.valid?
    assert @hexes.errors.keys.include?(:hex5)
  end

  test 'inputs must be atleast 3 in length' do
    @hexes = hexes(:one)
    assert @hexes.valid?

    @hexes.hex1 = '#f'
    refute @hexes.valid?
    assert @hexes.errors.keys.include?(:hex1)
  end
end
