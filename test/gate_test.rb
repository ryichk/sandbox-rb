require 'minitest/autorun'
require_relative '../lib/gate'
require_relative '../lib/ticket'

class GateTest < Minitest::Test
  def setup
    @ichinoe = Gate.new(:ichinoe)
    @hunabori = Gate.new(:hunabori)
    @higashiojima = Gate.new(:higashiojima)
  end

  def test_ichinoe_to_hunabori
    ticket = Ticket.new(160)
    @ichinoe.enter(ticket)
    assert @hunabori.exit(ticket)
  end

  def test_ichinoe_to_higashiojima_when_fare_is_not_enough
    ticket = Ticket.new(160)
    @ichinoe.enter(ticket)
    refute @higashiojima.exit(ticket)
  end

  def test_ichinoe_to_higashiojima_when_fare_is_enough
    ticket = Ticket.new(190)
    @ichinoe.enter(ticket)
    assert @higashiojima.exit(ticket)
  end

  def test_hunabori_to_higashiojima
    ticket = Ticket.new(160)
    @hunabori.enter(ticket)
    assert @higashiojima.exit(ticket)
  end
end
