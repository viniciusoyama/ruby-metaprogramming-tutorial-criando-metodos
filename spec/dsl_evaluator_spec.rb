require_relative '../src/dsl_evaluator'

describe DSLEvaluator do
  specify "I can declare persons" do
    persons = DSLEvaluator.evaluate do
      person "Viny" do
        email "viny@email.com"
        weight 50
      end

      person "Kevin" do
        email "kevin@email.com"
        weight 1773
      end
    end

    expect(persons.length).to eq(2)
    expect(persons["Kevin"].name).to eq("Kevin")
    expect(persons["Kevin"].email).to eq("kevin@email.com")
    expect(persons["Kevin"].weight).to eq(1773)


    expect(persons["Viny"].name).to eq("Viny")
    expect(persons["Viny"].email).to eq("viny@email.com")
    expect(persons["Viny"].weight).to eq(50)
  end

  specify "I can declare persons with relations" do
    persons = DSLEvaluator.evaluate do
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

    expect(persons["Viny"].mother).to eq(persons["Matilda"])
    expect(persons["Viny"].father).to eq(persons["Gandalf"])
  end
end
