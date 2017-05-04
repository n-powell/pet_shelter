
class Animal
  attr_accessor(:id, :name, :person_id)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @person_id = attributes.fetch(:person_id)
  end

  define_singleton_method(:all) do
    returned_animals = DB.exec("SELECT * FROM animals;")
    animals = []
    returned_animals.each() do |animal|
      name = animal.fetch("name")
      id = animal.fetch("id").to_i()
      person_id = animal.fetch("person_id")
      animals.push(Animal.new({:name => name, :id => id, :person_id => person_id}))
    end
    animals
  end

  define_method(:==) do |another_animal|
    self.name().==(another_animal.name()).&(self.id().==(another_animal.id()))
  end


end
