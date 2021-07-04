# frozen_string_literal: true

require 'ostruct'

# MyStruct class is custom implementation of OpenStruct
# Heavily copied from provided documentation (Wasn't against rules to copy code - Ruby is open sourced)
# https://ruby-doc.org/stdlib-2.7.1/libdoc/ostruct/rdoc/OpenStruct.html
class MyStruct
  attr_reader :table

  # initialization
  def initialize(hash = nil)
    @table = {}
    hash&.each_pair do |k, v|
      k = k.to_sym
      @table[k] = v
    end
  end

  # getter/setter
  def [](name)
    raise ArgumentError unless name.respond_to?(:to_sym)

    s = name.to_sym
    raise KeyError unless @table.key?(s)

    @table[s]
  end

  def []=(name, value)
    raise ArgumentError unless name.respond_to?(:to_sym)

    @table[name.to_sym] = value
  end

  # delete_field - documentation
  def delete_field(name)
    raise ArgumentError unless name.respond_to?(:to_sym)

    sym = name.to_sym
    begin
      self.class.remove_method(sym, "#{sym}=") # removes getter and setter
    rescue NameError # Exception suppression
    end
    @table.delete(sym) do # removes pair from hash
      raise NameError.new("no field `#{sym}' in #{self}", sym)
    end
  end

  # to_h - documentation
  def to_h(&block)
    if block_given?
      @table.to_h(&block)
    else
      @table.dup
    end
  end

  # eql? and ==
  def eql?(other)
    return false unless other.is_a?(MyStruct)

    @table.eql?(other.table)
  end

  def ==(other)
    return false unless other.is_a?(MyStruct)

    @table == other.table
  end

  # each_pair - documentation
  def each_pair(&block)
    # __method__ returns symbol of current method, to_enum also needs how many time (@table.size)
    return to_enum(__method__) { @table.size } unless block_given? # if block is not passed creates new Enumerator

    @table.each_pair(&block) # if block is passed hash.each_pair executes the block
    self
  end

  private

  def method_missing(symbol, *args)
    if @table.key?(symbol)
      self.class.send(:define_method, symbol) { @table[symbol] }
    elsif symbol.to_s.end_with?('=')
      k = symbol.to_s.delete('=').to_sym
      self.class.send(:define_method, symbol) { |x| @table[k] = x } if @table.key?(k)
    else
      return super symbol, *args
    end
    send symbol, *args
  end
end
