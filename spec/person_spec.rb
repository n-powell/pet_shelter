require "person.rb"
require "rspec"
require "pry"
require "pg"
require "spec_helper"

describe("Person") do
  describe(".all") do
    it("starts off with no people") do
      expect(Person.all()).to(eq([]))
    end
  end
end
