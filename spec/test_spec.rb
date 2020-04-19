describe "methods" do
  around :each do |example|
    now = Time.now.to_i
    @key1 = "#{now}"
    @key2 = "#{now + 1000}"
    @key3 = "#{now + 2000}"
    @value1 = 'foo'
    @value2 = 'bar'
    @value3 = 'baz'
    @lease1 = 10
    @lease2 = 20

    @client = new_client

    example.run
  end

  it "creates", :type => :feature do
    @client.create @key1, @value1
  end

  it "reads", :type => :feature do
    @client.create @key1, @value1
    value = @client.read @key1
    expect(value).to eq(@value1)
  end
end
