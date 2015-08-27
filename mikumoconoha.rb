# -*- coding: utf-8 -*-

Plugin.create(:mikumoconoha) do
end

module Plugin::MikumoConoHa
  def self.美雲このは
    Mikumizable
  end

  module Mikumizable
    def [](key)
      case key
      when :name
        '美雲このは'.freeze
      else
        super(key) end end
  end
end

class Message::MessageUser
  class << self
    alias 美雲このは_new new
    def new(user, raw)
      mikumized = raw.dup
      mikumized.delete(:name)
      美雲このは_new(user, mikumized) end
  end
end

class User
  prepend Plugin::MikumoConoHa::美雲このは
end
