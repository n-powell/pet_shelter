
class Person
  attr_accessor(:id, :name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    returned_persons = DB.exec("SELECT * FROM people;")
    people = []
    returned_persons.each() do |person|
      name = person.fetch("name")
      id = person.fetch("id").to_i()
      persons.push(Person.new({:name => name, :id => id}))
    end
    people
  end

  define_method(:==) do |another_person|
    self.name().==(another_person.name()).&(self.id().==(another_person.id()))
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO people (name, person_id) VALUES ('#{@name}', '#{@person_id}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:find) do |id|
    found_person = nil
    Person.all().each() do |person|
      if person.id().==(id)
        found_person = person
      end
    end
    found_person
  end


end
