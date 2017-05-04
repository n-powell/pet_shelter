require "animal.rb"
require "rspec"
require "pry"
require "pg"
require "spec_helper"

describe("Animal") do
  describe(".all") do
    it("starts off with no animals") do
      expect(Animal.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("is the same the same animal if all things match") do
      animal1 = Animal.new({:name => "Toady", :id => 5, :person_id => 2})
      animal2 = Animal.new({:name => "Toady", :id => 5, :person_id => 2})
      expect(animal1==animal2).to(eq(true))
    end
  end

  describe("#name") do
  it("tells you the animals name") do
    animal = Animal.new({:name => "Bugsy", :id => nil, :person_id => 2})
    expect(animal.name()).to(eq("Bugsy"))
  end
end

end
