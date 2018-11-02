require_relative '../src/dsl_evaluator'

describe DSLEvaluator do
  context "Declaring persons" do
    specify "I can declare persons" do
      entities = DSLEvaluator.evaluate do
        person "Viny" do
          email "viny@email.com"
          weight 50
        end

        person "Kevin" do
          email "kevin@email.com"
          weight 1773
        end
      end

      persons = entities["persons"]

      expect(persons.length).to eq(2)
      expect(persons["Kevin"].name).to eq("Kevin")
      expect(persons["Kevin"].email).to eq("kevin@email.com")
      expect(persons["Kevin"].weight).to eq(1773)


      expect(persons["Viny"].name).to eq("Viny")
      expect(persons["Viny"].email).to eq("viny@email.com")
      expect(persons["Viny"].weight).to eq(50)
    end

    specify "I can declare persons with parents" do
      entities = DSLEvaluator.evaluate do
        person "Viny" do
          email "viny@email.com"
          weight 50
          mother "Matilda"
          father "Gandalf"
        end

        person "Matilda" do
          email "mtilda@email.com"
          weight 40
        end

        person "Gandalf" do
          email "youfools@email.com"
          weight 20
        end
      end

      persons = entities["persons"]

      expect(persons["Viny"].mother).to eq(persons["Matilda"])
      expect(persons["Viny"].father).to eq(persons["Gandalf"])
    end

    specify "I can declare persons with states" do
      entities = DSLEvaluator.evaluate do
        person "Viny" do
          email "viny@email.com"
          weight 50
          state "DD"
        end

        state "DD" do
          name "de_dust"
          size_in_square_meters 350
        end
      end

      persons = entities["persons"]

      expect(persons["Viny"].state.name).to eq("de_dust")
      expect(persons["Viny"].state.abbreviation).to eq("DD")
    end

    specify "I can declare persons with pets" do
      entities = DSLEvaluator.evaluate do
        person "Viny" do
          email "viny@email.com"
          weight 50
          pet "Dracarys"
          pet 'Methapod'
        end

        pet "Dracarys" do
          type 'Dragon'
          weight 200
        end

        pet "Methapod" do
          type 'Butterfly'
          weight 1
        end

        pet "Snorlax" do
          type 'Big Cat'
          weight 9001
        end
      end

      persons = entities["persons"]

      expect(persons["Viny"].pets[0].name).to eq("Dracarys")
      expect(persons["Viny"].pets[1].name).to eq("Methapod")
    end
  end

  specify "I can declare states" do
    entities = DSLEvaluator.evaluate do

      state "SP" do
        name "São Paulo"
        size_in_square_meters 123
      end

      state "MG" do
        name "Minas Gerais"
        size_in_square_meters 129
      end
    end

    states = entities["states"]

    expect(states.length).to eq(2)
    expect(states["SP"].name).to eq("São Paulo")
    expect(states["SP"].abbreviation).to eq("SP")
    expect(states["SP"].size_in_square_meters).to eq(123)


    expect(states["MG"].name).to eq("Minas Gerais")
    expect(states["MG"].abbreviation).to eq("MG")
    expect(states["MG"].size_in_square_meters).to eq(129)
  end

  specify "I can declare pets" do
    entities = DSLEvaluator.evaluate do

      pet "Dracarys" do
        type 'Dragon'
        weight 200
      end

      pet "Methapod" do
        type 'Butterfly'
        weight 1
      end
    end

    pets = entities["pets"]

    expect(pets.length).to eq(2)
    expect(pets["Dracarys"].name).to eq("Dracarys")
    expect(pets["Dracarys"].type).to eq("Dragon")
    expect(pets["Dracarys"].weight).to eq(200)


    expect(pets["Methapod"].name).to eq("Methapod")
    expect(pets["Methapod"].type).to eq("Butterfly")
    expect(pets["Methapod"].weight).to eq(1)
  end
end
