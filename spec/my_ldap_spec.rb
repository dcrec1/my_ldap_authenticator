require File.expand_path(File.dirname(__FILE__) + "/../lib/my_ldap_authenticator")

describe MyLDAP do

  before :each do
    @host = "ad.host.com"
    @base = "DC=com,dc=host"
  end

  it "should init with a host and a base" do
    Net::LDAP.should_receive(:new).with(:host => @host, :base => @base)
    MyLDAP.new(@host, @base)
  end
  
  context "on authentication" do
  
    before :each do
      @ldap = mock(Net::LDAP, :auth => nil, :bind => false)
      Net::LDAP.stub!(:new).and_return(@ldap)
      @my_ldap = MyLDAP.new(nil, nil)
    end
  
    it "should do it with an user and password" do
      user = "me@myhost.com"
      password = "fsgfsdg"
      @ldap.should_receive(:auth).with(user, password)
      @my_ldap.authenticates?(user, password)
    end
    
    it "should validate a valid password" do
      @ldap.should_receive(:bind).and_return true
      @my_ldap.authenticates?("user", "password").should be_true
    end
    
    it "should invalidate a invalid password" do
      @ldap.should_receive(:bind).and_return false
      @my_ldap.authenticates?("user", "password").should be_false
    end
    
    it "should do it also as an order and not an asking" do
      user = "user"
      password = "password"
      @my_ldap.authenticate(user, password).should eql(@my_ldap.authenticates?(user, password))
    end
  
  end
  
  context "on finding" do
  
    before :each do
      @ldap = mock(Net::LDAP, :null_object => true)
      Net::LDAP.stub!(:new).and_return(@ldap)
      @my_ldap = MyLDAP.new("host", "base")
      @my_ldap.authenticate("fsfs", "pasdfasf")
    end
    
    it "should create a filter with a key and a value" do
      key = "key"
      value = "value"
      Net::LDAP::Filter.should_receive(:eq).with(key, value)
      @my_ldap.find(key, value)
    end
    
    it "should search in the LDAP" do
      filter = mock(Net::LDAP::Filter)
      Net::LDAP::Filter.stub!(:eq).and_return(filter)
      @ldap.should_receive(:search).with(:filter => filter)
      @my_ldap.find("key", "value")
    end
    
    it "should return the search result" do
      result = "fsgfsgfs"
      @ldap.stub!(:search).and_return(result)
      @my_ldap.find("key", "value").should eql(result)
    end
    
  end
  
end
